require("base.common")
require("base.factions")
require("npc.base.repeatable_quests")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)

	User:inform("Used!")
	
	if(User.lastSpokenText == "del") then
		ScriptVars:set("explorerRanklist", "")
	end

	if(User.lastSpokenText == "time") then
		npc.base.repeatable_quests.checkIfTimesExpired(User, 1234, 0, 1, 0);
	end

end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end


