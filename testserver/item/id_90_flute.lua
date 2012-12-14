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
	item.base.music.PlayInstrument(User,SourceItem,"flute");
	
	--Testing fireball, only activates if flute's data key name=fireball -Dyluck
	local targetPos
	local targetChar
	
	if ( SourceItem:getData("name") == "fireball" ) then
		User:talk(Character.say, "#me casts Fireball ");

		if ( User:getFaceTo() == 0) then --if facing north
			targetPos = position(User.pos.x, User.pos.y + 3, User.pos.z);
			world:gfx(9, targetPos);
			world:makeSound(5, targetPos);
			
			if world:isCharacterOnField(targetPos) then --if there's a target char on target position
				targetChar = world:getCharacterOnField(targetPos); --find the char
				target:increaseAttrib("hitpoints", -1000);
				world:makeSound(1, targetPos);
			end
		end
	end			
	--End Test
	
end