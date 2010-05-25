-- Chisel ( 737 )

-- raw stones  --> stone blocks + small stones
-- stone blocks --> small stones

-- Arbeitscyclus: 4s - 5s

-- UPDATE common SET com_script='I_737_chisel.lua' WHERE com_itemid IN (737);

--## AQUIRED BY PHARSE FOR TESTING PURPOSES ##--

require("base.common")

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	if check(User,"route test") then
		world:createDynamicNPC("Router",0,base.common.GetFrontPosition(User),0,"npc_lightmaster.lua");
	end
end

function UseItemWithCharacter(User,SourceItem,Character,Counter,Param,ltstate)
	if check(User,"delete NPC") then
		world:deleteNPC(Character.id);
	elseif check(User,"time") then
		User:inform("".. os.time());
	end
end

function check(User,text)
	return string.find(User.lastSpokenText,text);
end