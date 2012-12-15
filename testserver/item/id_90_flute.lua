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
	
	if ( SourceItem:getData("name") == "fireball" ) then
		User:talk(Character.say, "#me casts Fireball ");

		if ( User:getFaceTo() == 0) then --if facing north
			targetPos = position(User.pos.x, User.pos.y - 3, User.pos.z);
			world:makeSound(5, targetPos);
			graphicNum = SourceItem:getData("num");
			--[[
			targetPos2 = position(targetPos.x -1, targetPos.y, targetPos.z);
			targetPos3 = position(targetPos.x +1, targetPos.y, targetPos.z);
			world:gfx(9, targetPos);
			world:gfx(9, targetPos2);
			world:gfx(9, targetPos3);
			
			]]--
			for i = 0, 2, 1 do
				for j = 0, 2, 1 do
					extraPos = position(targetPos.x -1 +i, targetPos.y -1 +j, targetPos.z);
					if graphicNum ~= "" then
						world:gfx(graphicNum, extraPos);
					else
						world:gfx(graphicNum, extraPos);
					end
					if world:isCharacterOnField(extraPos) then --if there's a target char on target position
						targetChar = world:getCharacterOnField(extraPos); --find the char
						targetChar:increaseAttrib("hitpoints", -1000);
						world:makeSound(1, extraPos);
					end
				end
			end
				
				
			--[[
			if world:isCharacterOnField(targetPos) then --if there's a target char on target position
				targetChar = world:getCharacterOnField(targetPos); --find the char
				targetChar:increaseAttrib("hitpoints", -1000);
				world:makeSound(1, targetPos);
				
			end
			if world:isCharacterOnField(targetPos2) then --if there's a target char on target position
				targetChar = world:getCharacterOnField(targetPos2); --find the char
				targetChar:increaseAttrib("hitpoints", -1000);
				world:makeSound(1, targetPos);
				
			end
			if world:isCharacterOnField(targetPos3) then --if there's a target char on target position
				targetChar = world:getCharacterOnField(targetPos3); --find the char
				targetChar:increaseAttrib("hitpoints", -1000);
				world:makeSound(1, targetPos);
				
			end
			]]--
		end
	end		
	--End Test
end

LookAtItem = item.general.wood.LookAtItem
