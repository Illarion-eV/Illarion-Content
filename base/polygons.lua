-- basic handling for polygonal areas on the map

require("base.class");

module("base.polygons",package.seeall);

--- representation of a line. All positions have z=0.
-- @param posStruct Start point
-- @param posStruct End point
-- @return LineStruct
Line = base.class.class(
	function(obj, startPoint, endPoint)
		obj.startPoint = position(startPoint.x, startPoint.y, 0);
		obj.endPoint = position(endPoint.x, endPoint.y, 0);
	end
);

--- representation of a polygon, requires at least 3 points. All positions have z=0.
-- @field lineList list(LineStruct)
-- @field min posStruct minimum position, i.e. the upper left most corner of the bounding box
-- @field max posStruct maximum position, i.e. the lower right most corner of the bounding box
-- @field zList list(int) list with valid z values for PIP test
-- @param list(posStruct) List of points, neighbours are connected, aswell as first and last point of the list
-- @return PolygonStruct
Polygon = base.class.class(
	function(obj, positionList, zList)
		if table.getn(positionList) < 3 then
			debug("A polygon must have at least 3 points");
			return;
		end
		obj.lineList = {};
		local s = positionList[1];
		obj.min = position(s.x,s.y,0);
		obj.max = position(s.x,s.y,0);
		table.insert(positionList, positionList[1]); -- add first point, so there is an edge between first and last point
		for i=2,table.getn(positionList) do
			table.insert(obj.lineList, Line(s, positionList[i]));
			s = positionList[i];
			obj.min.x = math.min(obj.min.x, s.x);
			obj.min.y = math.min(obj.min.y, s.y);
			obj.max.x = math.max(obj.max.x, s.x);
			obj.max.y = math.max(obj.max.y, s.y);
		end;
		if zList==nil then
			obj.zList = {0};
		else
			obj.zList = zList;
		end
	end
);

--- tests intersection of two lines (actually line segments)
-- @param LineStruct The otherLine for which intersection with current Line is tested
-- @return boolean True if the two lines intersect
-- @return boolean True if the two lines are coincident, i.e. infinite intersection points
function Line:intersectsLine(otherLine)
	-- solve for p1, p2 i.e. the fraction on the two lines from the start point to the intersection point
	local denominator = (otherLine.endPoint.y - otherLine.startPoint.y)*(self.endPoint.x - self.startPoint.x) - (otherLine.endPoint.x - otherLine.startPoint.x)*(self.endPoint.y - self.startPoint.y);
	local nominator1 = (otherLine.endPoint.x - otherLine.startPoint.x)*(self.startPoint.y - otherLine.startPoint.y) - (otherLine.endPoint.y - otherLine.startPoint.y)*(self.startPoint.x - otherLine.startPoint.x);
	local nominator2 = (self.endPoint.x - self.startPoint.x)*(self.startPoint.y - otherLine.startPoint.y) - (self.endPoint.y - self.startPoint.y)*(self.startPoint.x - otherLine.startPoint.x);
	debug("d=" .. denominator .. "; n1=" .. nominator1 .. "; n2=" .. nominator2);
	if denominator == 0 then
		if nominator1 == 0 and nominator2 == 0 then
			return true,true;
		end
		return false,false;
	end
	local p1 = nominator1 / denominator;
	local p2 = nominator2 / denominator;
	debug("p1=" .. p1 .. "; p2=" .. p2);
	-- intersection point is only on both line segments if 0 <= p1,p2 <= 1
	-- otherwise intersection point is on the line, but not on the segments
	if (0<p1) and (p1<=1) and (0<p2) and (p2<=1) then
		return true,false;
	end
	return false, false;
end

--- Point-In-Polygon test
-- @param posStruct The point to be tested if inside the Polygon
-- @return boolean True if point is in Polygon
function Polygon:pip(point)
	-- valid z level?
	local zValid = false;
	for _,level in pairs(self.zList) do
		if (point.z == level) then
			zValid = true;
			break;
		end
	end
	if not zValid then
		return false;
	end
	-- point in bounding box?
	if not ( self.min.x <= point.x and self.min.y <= point.y and point.x <= self.max.x and point.y <= self.max.y) then
		return false;
	end
	-- create a test line from the point to the right most boundary
	local testLine = Line(point, position(self.max.x+1, point.y, 0));
	local count = 0;
	for _,curLine in pairs(self.lineList) do
		if testLine:intersectsLine(curLine) then
			count = count + 1;
		end
	end
	return (count%2 == 1);
end