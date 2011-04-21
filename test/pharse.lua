-- I_2786_ast.lua
-- TESTSCRIPT FOR PHARSE!!!!!!!111
--

-- UPDATE common SET com_script = 'test.pharse' WHERE com_itemid = 2786;

require("base.common")
require("npc.base.patrol");
require("base.doors")
require("gm.items.id_382_ceilingtrowel");
require("base.polygons");

module("test.pharse", package.seeall)

wDoor = nil;
wBridge = nil;
wBridgeArea = 0;
wBridgeWarp = false;
wMirror = false;

testPos = position(0,0,0);

function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
	if dowp then
		if User.lastSpokenText == "nowp" then
			dowp = false;
			User:inform("no wp, back to normal.");
			return;
		end
		local wpFileName = "waypoints";
		local posFileName = "positions";
		local wpFile,errmsg = io.open("/home/pharse/waypoints/"..wpFileName,"a");
		local posFile,errmsg = io.open("/home/pharse/waypoints/"..posFileName,"a");
		if wpFile and posFile then
			if wMenu==nil then
				wMenu = MenuStruct();
				wMenu:addItem(505); -- treasure map => new waypoint
				wMenu:addItem(709); -- door => set door coords
				wMenu:addItem(602); -- bridge => set bridge coords, counter sets the area! if door is set, toPos is set.
				wMenu:addItem(10); -- portal => toggle warp boolean. default: false
				wMenu:addItem(336); -- mirror => add another inverted waypoint if bridge is set
				wMenu:addItem(228); -- occupied => reset all
			end
			if param==505 then				
				writeWaypoint(wpFile,posFile,User.pos,counter,wBridge,wBridgeArea,wBridgeWarp,wDoor);
				if wMirror then
					writeWaypoint(wpFile,posFile,wBridge,wBridgeArea,User.pos,counter,wBridgeWarp,wDoor);
				end
				wpFile:close();
				posFile:close();
				User:inform("waypoint added" .. (wMirror and " and mirror waypoint" or ""));
				wDoor = nil;
				wBridge = nil;
				wBridgeArea = 0;
				wBridgeWarp = false;
				wMirror = false;
			elseif param==709 then
				wDoor = base.common.CopyPosition(User.pos);
			elseif param==602 then
				wBridge = base.common.CopyPosition(User.pos);
				wBridgeArea = counter;
			elseif param==10 then
				wBridgeWarp = not wBridgeWarp;
			elseif param==336 then
				wMirror = not wMirror;
			elseif param==228 then
				wDoor = nil;
				wBridge = nil;
				wBridgeArea = 0;
				wBridgeWarp = false;
				wMirror = false;
			end
			local out = (wDoor~=nil and "Door, " or "--, ") .. (wBridge~=nil and "Bridge, Area=".. wBridgeArea or "--") .. ", Warp=".. (wBridgeWarp and "true" or "false") ..", Mirror=".. (wMirror and "true" or "false") ..";";
			User:inform(out);
			User:sendMenu(wMenu);
		else
			User:inform("files not found");
		end
		return;
	end
	
	if string.find(User.lastSpokenText, "polygon") then
		p = base.polygons.Polygon({position(0,0,0), position(2,1,0), position(2,2,0), position(1,2,0)},{0});
		if p:pip(position(0,0,0)) then
			debug("p1 inside");
		end
		if p:pip(position(2,1,0)) then
			debug("p2 inside");
		end
		if p:pip(position(2,2,0)) then
			debug("p3 inside");
		end
		if p:pip(position(1,2,0)) then
			debug("p4 inside");
		end
		if p:pip(position(0,1,0)) then
			debug("p5 inside");
		end
	else
		debug("no text found" .. true);
	end
end

function writeWaypoint(wpFile,posFile,wpPos,wpArea,bridgePos,bridgeArea,bridgeWarp,door)
	local text = "Waypoint:new(position("..wpPos.x ..","..wpPos.y ..","..wpPos.z .."),".. wpArea;
	if bridgePos then
		text = text ..",nil,{bridge={toArea=".. bridgeArea ..",toWaypoint=position("..bridgePos.x ..","..bridgePos.y ..","..bridgePos.z .."),warp=";
		text = text .. (bridgeWarp and "true" or "false") .."}";
		if door then
			text = text .. ",\n                                            door={pos=position("..door.x ..","..door.y ..","..door.z .."),";
			text = text .. "toPos=position("..bridgePos.x ..","..bridgePos.y ..","..bridgePos.z ..")}";
		end
		text = text .. "}";
	end
	text = text .. ");\n"
	wpFile:write(text);
	posFile:write("position("..wpPos.x ..","..wpPos.y ..","..wpPos.z .."),\n");
end

function printPosition(pos)
	return "x=" .. pos.x .. "|y=" .. pos.y .. "|z=" .. pos.z;
end