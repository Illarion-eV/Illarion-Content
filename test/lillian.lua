require("base.common")
require("base.factions")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697 ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)

	User:inform("Used!")

	if(User.lastSpokenText == "del") then
		User:eraseItem(2,1)
	end
	
	if(User.lastSpokenText == "deldata1") then
		User:eraseItem(2,1, {"descriptionDE"="Gerstenmehl"})
	end

	if(User.lastSpokenText == "time") then
		local questState, questLastChanged = User:getQuestProgress(666);
		--base.time.getRLDateFromUnixTimestamp(questLastChanged)
	end

end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end


