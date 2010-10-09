-- I_2786_ast.lua
-- TESTSCRIPT FOR PHARSE!!!!!!!111
--

-- UPDATE common SET com_script = 'test.pharse' WHERE com_itemid = 2786;

require("base.common")
require("npc.base.patrol");
require("base.doors")
require("gm.items.id_382_ceilingtrowel");

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
	if counter==1 then
		local target = getTargetItem(User, SourceItem);
		if target then
			gm.items.id_382_ceilingtrowel.UseItem(User, SourceItem, target, counter, param, ltstate);
		else
			User:inform("no target found. Put both items in your hand.");
		end
	elseif counter==2 then
		local target = base.common.GetFrontCharacter(User);
		if not target then
			target = User;
		end
		gm.items.id_382_ceilingtrowel.UseItem(User, SourceItem, target, counter, param, ltstate);
	elseif counter==3 then
		User:inform("create npc");
		local created = world:createDynamicNPC("Guard",0,base.common.GetFrontPosition(User),0,"npc.lightmaster");
		if created then
			User:inform("npc created");
		end
	elseif counter==4 then
		dowp = true;
		User:inform("do wp! The counter will set the area.");
	elseif counter==5 then
		local found, mode = ScriptVars:find("BG_Mode_0");
		if found then
			User:inform("mode: ".. mode);
		else
			User:inform("not found");
		end
	end
end

function getTargetItem(character, source)
	if source:getType() == 4 then
		local ipos = source.itempos;
		local tpos;
		if ipos == 5 then
			tpos = 6;
		elseif ipos == 6 then
			tpos = 5;
		else
			return nil;
		end
		local target = character:getItemAt(tpos);
		if target.id == 0 then
			return nil;
		else
			return target;
		end
	end
	return nil;
end

function errorFunc(User)
	local a = nil;
	User:inform("test: ".. a);
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
