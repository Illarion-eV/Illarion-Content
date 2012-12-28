-- base script for waypoints

module("npc.base.waypoints", package.seeall)

-------------------------
-- *** DEFINITIONS *** --
-------------------------

MAX_DISTANCE = 9999999999;

------------------------------
-- *** INITIALIZE LISTS *** --
------------------------------

WaypointList = {};

AreaList = {};


----------------------------
-- *** WAYPOINT CLASS *** --
----------------------------

Waypoint = {
	pos = nil;
	area = nil;
	neighbours = nil;
	data = nil;
};

--[[
Waypoint constructor
You can add code by defining a function
Waypoint WaypointConstructor(Waypoint this)
with the current WP as parameter and the changed WP as return value.

  @param posStruct  the Waypoint's position
  @param int  the area id of this waypoint
  @param list(waypoint)  list of neighbour waypoints
  @param list(mixed)  additional data
  @return Waypoint  self
  
  data can contain e.g.:
    bridge = { toArea = int, toWaypoint = Waypoint, warp = boolean }
		* NOTE: toWaypoint contains at first the position of the wp. After initializing all wps the right wp will be set (see below)
	door = { pos = posStruct, toPos = posStruct } --pos=position of the door; toPos=position of the waypoint to which the door could block the way.
]]
function Waypoint:new(pos,area,neighbours,data)
	local this = setmetatable({	pos = pos or position(0,0,0),
								area = area or 0,
								neighbours = neighbours or {},
								data = data or {} }, Waypoint);
	pos = this.pos;
	area = this.area;
	data = this.data;
	if not WaypointList[area] then
		WaypointList[area] = {};
	end
	WaypointList[area][PosToIndex(pos)] = this;
	if data.waiting then
		if not WaitingList[area] then
			WaitingList[area] = {};
		end
		WaitingList[area][PosToIndex(pos)] = this;
	end
	if not AreaList[area] then
		AreaList[area] = {};
	end
	if data.bridge then
		if not AreaList[area][data.bridge.toArea] then
			AreaList[area][data.bridge.toArea] = { metric = 1, bridges = {} }
		end
		table.insert(AreaList[area][data.bridge.toArea].bridges,this)
	end
	if WaypointConstructor then
		this = WaypointConstructor(this);
	end
	return this;
end

Waypoint.__index = Waypoint; -- redirect index queries to Waypoint class

-- check if two waypoints are in the same area
function Waypoint:sameArea(that)
	if that then
		return (self.area == that.area);
	end
	return false;
end

--[[
  @return Waypoint  or nil
  @return boolean  true if warping is necessary
]]
function Waypoint:getNextWaypoint(dest,last)
	if dest==nil then
		return nil,false;
	end
	if self:sameArea(dest) then
		local curMin,nextW,tmp;
		curMin = MAX_DISTANCE;
		if last then
			nextW = last;
		end
		for _,curW in pairs(self.neighbours) do
			tmp = curW:getDistance(dest);
			if tmp<curMin then
				nextW = curW;
				curMin = tmp;
			end
		end
		return nextW,false;
	else
		if self.data.bridge then
			if self.data.bridge.toArea == dest.area then
				return self.data.bridge.toWaypoint,self.data.bridge.warp;
			end
		end
		local curMin,nextW,tmp;
		curMin = MAX_DISTANCE;
		for _,curW in pairs(AreaList[self.area][dest.area].bridges) do
			tmp = self:getDistance(curW);
			if tmp<curMin then
				nextW = curW;
				curMin = tmp;
			end
		end
		if nextW then
			if nextW == self and self.data.bridge then
				return self.data.bridge.toWaypoint,self.data.bridge.warp;
			end
			return self:getNextWaypoint(nextW,last);
		end
	end
	return nil,false;
end

--[[
calculate the direct linear distance using x and y coordinates
if dest==nil or not in the same area, return MAX_DISTANCE
if ignore is set, then same area is ignored
]]
function Waypoint:getDistance(dest,ignore)
	if dest==nil then
		return MAX_DISTANCE;
	end
	if not ignore and not self:sameArea(dest) then
		return MAX_DISTANCE;
	end
	return math.sqrt( (self.pos.x-dest.pos.x)^2 + (self.pos.y-dest.pos.y)^2 );
end

--[[
This function should be called after all waypoints have been set.
It connects the waypoints as neighbourhoods and bridges and the areas using a Dijkstra algorhithm.
]]
function Init()
	for _,area in pairs(WaypointList) do
		for _,this in pairs(area) do
			if this.data.bridge then
				local b = this.data.bridge;
				b.toWaypoint = WaypointList[b.toArea][PosToIndex(b.toWaypoint)];
			end
			for _,that in pairs(area) do
				if this:getDistance(that)<12 then
					table.insert(this.neighbours,that);
				end
			end
		end
	end
	for f,from in pairs(AreaList) do
		local done = false;
		while not done do
			done = true;
			for o,over in pairs(from) do
				for t,to in pairs(AreaList[o]) do
					if t~=f then
						if not from[t] then
							from[t] = { metric = MAX_DISTANCE, bridges = {} };
						end
						if from[t].metric>over.metric+to.metric then
							from[t] = { metric = over.metric+to.metric, bridges = over.bridges };
							done = false;
						end
					end
				end
			end
		end
	end
end

-- calculate a distinct index for the given position
function PosToIndex(pos)
	local index = 0;
	if pos.x<0 then
		index = index + 100000000000000;
	end
	if pos.y<0 then
		index = index + 1000000000;
	end
	if pos.z<0 then
		index = index + 10000;
	end
	index = index + math.abs(pos.x)*10000000000 + math.abs(pos.y)*100000 + math.abs(pos.z);
	return index;
end

-- recalculate the distinct index and return the posStruct 
function IndexToPos(index)
	local x,y,z;
	x = math.floor(math.mod(index,100000000000000)/10000000000);
	if index>=100000000000000 then
		x = -1 * x;
	end
	index = math.mod(index,10000000000);
	y = math.floor(math.mod(index,10000000000)/100000);
	if index>=10000000000 then
		y = -1 * y;
	end
	index = math.mod(index,100000);
	z = math.mod(index,10000);
	if index>=100000 then
		z = -1 * z;
	end
	return position(x,y,z);
end
