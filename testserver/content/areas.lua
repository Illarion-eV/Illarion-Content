-- here, areas can be added

require("base.polygons");

module("content.areas", package.seeall);

function Init()
	if AreaList then
		return;
	end
	AreaList = {};
	
	--[[ Example: I want to add the area "test area", which comprises a triangle on level 0 and a rectangle on level 1 and 2.
	
	AddArea("test area", { 
		{{position(0,0,0),position(1,0,0),position(1,1,0)},{0}},
		{{position(0,0,0),position(3,0,0),position(3,2,0),position(0,2,0)},{1,2}} } );
	
	NOTE: 	The points form a line strip, so each neighbour is connected (and the last and first!). Any polygon is allowed.
			The z-coordinate in the positions does not matter, only the second entry of the tuple is important.
			Please use a uniform naming format for the areas, especially lower case letters. You may use spaces.
	]]
	-- ## ADD AREAS BELOW ##
  AddArea("cadomyr guard 1", {
    {{position(118,637,0),position(118,633,0),position(110,633,0),position(110,637,0)}, {0}}
  });
  AddArea("galmair guard 1", {
    {{position(416,247,0),position(413,247,0),position(413,252,0),position(416,252,0)}, {0}}
  });
  AddArea("runewick guard 1", {
    {{position(839,825,0),position(839,819,0),position(846,819,0),position(846,825,0)}, {0}}
  });
end

--- adds an area
-- @param string The name for the new area.
-- @param list({list(posStruct),list(int)}) A list of tuples, each tuple forms a polygon with 1. a list of positions and 2. a list of valid z levels
-- @return boolean False if entry already exists, true if adding the area worked.
function AddArea(name, aList)
	if AreaList[name] then
		debug("Area already exists.");
		return false; -- entry already exists
	end
	AreaList[name] = {};
	for _,poly in pairs(aList) do
		table.insert(AreaList[name], base.polygons.Polygon(poly[1],poly[2]));
	end
	return true;
end

--- Test if a point is in an area
-- @param posStruct The point to be tested
-- @param string The name of the area
-- @return boolean True if point is in area with areaName
function PointInArea(point, areaName)
	if not AreaList[areaName] then
		debug("Area does not exist.");
		return false;
	end
	for _,poly in pairs(AreaList[areaName]) do
		if poly:pip(point) then
			return true;
		end
	end
	return false;
end
