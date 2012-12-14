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
	
		--Testing fireball, only activates if flute's data key name=fireball -Dyluck
	local pos1
	local targetChar
	
	
	if ( SourceItem:getData("name") == "fireball" ) then
		User:talk(Character.say, "#me casts Fireball ");

		if ( User:getFaceTo() == 0) then --if facing north
			pos1 = position(User.pos.x, User.pos.y - 3, User.pos.z);
			pos2 = position(pos1.pos.x +1, pos1.pos.y, pos1.pos.z);
			pos3 = position(pos1.pos.x -1, pos1.pos.y, pos1.pos.z);
			pos4 = position(pos1.pos.x, pos1.pos.y +1, pos1.pos.z);
			pos5 = position(pos1.pos.x, pos1.pos.y -1, pos1.pos.z);
			pos6 = position(pos1.pos.x +1, pos1.pos.y -1, pos1.pos.z);
			pos7 = position(pos1.pos.x +1, pos1.pos.y +1, pos1.pos.z);
			pos8 = position(pos1.pos.x -1, pos1.pos.y -1, pos1.pos.z);
			pos9 = position(pos1.pos.x -1, pos1.pos.y +1, pos1.pos.z);
			
			world:gfx(9, pos1);
			User:talk(Character.say, "got here? ");
			--[[
			world:gfx(9, pos2);
			world:gfx(9, pos3);
			world:gfx(9, pos4);
			world:gfx(9, pos5);
			world:gfx(9, pos6);
			world:gfx(9, pos7);
			world:gfx(9, pos8);
			world:gfx(9, pos9);
			world:makeSound(5, pos1);
			]]--
			if world:isCharacterOnField(pos1) then --if there's a target char on target position
				targetChar = world:getCharacterOnField(pos1); --find the char
				target:increaseAttrib("hitpoints", -1000);
				world:makeSound(1, pos1);
			end
		end
	end			
	--End Test
	
end

LookAtItem = item.general.wood.LookAtItem
