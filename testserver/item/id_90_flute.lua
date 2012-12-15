-- I_90 Floete spielen

-- UPDATE common SET com_script='item.id_90_flute' WHERE com_itemid=90;

require("item.base.music")
require("item.general.wood")

module("item.id_90_flute", package.seeall)

skill = Character.flute

item.base.music.addTalkText("#me produces some squeaking sounds on the flute.","#me macht einige quietschende Geräusche auf der Flöte.", skill);
item.base.music.addTalkText("#me plays a horribly out of tune melody.","#me spielt eine fürchterlich verstimmte Melodie auf der Flöte.", skill);
item.base.music.addTalkText("#me plays an out of tune melody.","#me spielt eine verstimmte Melodie auf der Flöte.", skill);
item.base.music.addTalkText("#me plays an airy tune on the flute.","#me spielt eine leichte Melodie auf der Flöte.", skill);
item.base.music.addTalkText("#me plays a wild tune on the flute.","#me spielt eine wilde Melodie auf der Flöte.", skill);

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	item.base.music.PlayInstrument(User,SourceItem,skill);
	
	--Testing fireball, only activates if flute's data key name is used -Dyluck
	local targetPos
	local targetChar
	local extraPos
	local graphicNum
	local xoff
	local yoff
	local mylist
	local last
	
	graphicNum = tonumber(SourceItem:getData("spell"));
	if ( graphicNum ~= nil ) then
		User:talk(Character.say, "#me casts Fireball ");
		--User facing direction to determine offset numbers for target area
		if ( User:getFaceTo() == 0) then --north
			xoff = 0;
			yoff = -1;
		elseif ( User:getFaceTo() == 1) then --northeast
			xoff = 1;
			yoff = -1;
		elseif ( User:getFaceTo() == 2) then --east
			xoff = 1;
			yoff = 0;
		elseif ( User:getFaceTo() == 3) then --southeast
			xoff = 1;
			yoff = 1;
		elseif ( User:getFaceTo() == 4) then --south
			xoff = 0;
			yoff = 1;
		elseif ( User:getFaceTo() == 5) then --southwest
			xoff = -1;
			yoff = 1;
		elseif ( User:getFaceTo() == 6) then --west
			xoff = -1;
			yoff = 0;
		elseif ( User:getFaceTo() == 7) then --northwest
			xoff = -1;
			yoff = -1;
		end
		
		targetPos = position(User.pos.x + 3 * xoff, User.pos.y + 3 * yoff, User.pos.z);
		
		mylist = world:LoS(User.pos, targetPos);
		last = table.getn(mylist);
		if (mylist[1] == nil) then
			User:talk(Character.say, "option 1");
			world:gfx(graphicNum, targetPos);
			world:makeSound(5, targetPos);
			if world:isCharacterOnField(targetPos) then
				world:makeSound(1, targetPos);
				targetChar = world:getCharacterOnField(targetPos);
				targetChar:increaseAttrib("hitpoints", -2000);
			end			
		else
			User:talk(Character.say, "option 2");
			for key, listEntry in pairs(mylist) do
				User:inform("Item with the ID: "..listEntry.OBJECT.id);
			end
			User:inform("Array size is: "..last);
			world:gfx(graphicNum, mylist[last].OBJECT.pos);
			world:makeSound(5, mylist[last].OBJECT.pos);
			if (mylist[last].TYPE == "CHARACTER") then
				User:inform("hit something live");
				world:makeSound(1, mylist[last].OBJECT.pos);
				mylist[last].OBJECT:increaseAttrib("hitpoints", -2000);
			end
		end
			
		--[[
		for i = 0, 2, 1 do
			for j = 0, 2, 1 do
				extraPos = position(targetPos.x -1 +i, targetPos.y -1 +j, targetPos.z);
				if (graphicNum ~= nil) then
					world:gfx(graphicNum, extraPos);
				else
					User:talk(Character.say, "No graphic for this number");
				end
				if world:isCharacterOnField(extraPos) then --if there's a target char on target position
					targetChar = world:getCharacterOnField(extraPos); --find the char
					targetChar:increaseAttrib("hitpoints", -2000);
					world:makeSound(1, extraPos);
				end
			end
		end]]--
	end	--End Test -Dyluck
end

LookAtItem = item.general.wood.LookAtItem
