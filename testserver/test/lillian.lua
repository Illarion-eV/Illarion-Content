require("base.common")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697 ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)
	local splitTable = {}
	if (User.lastSpokenText == "request") then
		requestMonster(User,User); 
	end
end

monsterIDsByLevel = {
	{monsters = {252, 271, 382, 582, 592}, points = 1},
	{monsters = {101, 196, 381, 602, 881}, points = 2},
	{monsters = {311, 394, 551, 882, 1011}, points = 3},
	{monsters = {141, 501, 552, 791, 872}, points = 5},
	{monsters = {191, 492, 531, 411, 851}, points = 8},
	{monsters = {121, 202, 491, 525, 852}, points = 13},
	{monsters = {534, 124, 562, 661, 853}, points = 20}
}

arenaInformations = {{playerPos=position(0,0,0), monsterPos=position(0,1,0), npcName="Alsaya", town="Cadomyr"}, 
					{playerPos=position(0,0,0), monsterPos=position(0,1,0), npcName="Alsaya", town="Runewick"}, 
					{playerPos=position(0,0,0), monsterPos=position(0,1,0), npcName="Alsaya", town="Galmair"}}

function requestMonster(User, NPC) 
	local cbChooseLevel = function (dialog)
		if (not dialog:getSuccess()) then
			return;
        end
		local index = dialog:getSelectedIndex()+1;
		local arena = getArena(User, NPC);
		User:warp(arenaInformations[arena].playerPos);
		monster = world:createMonster(getRandomMonster(index),arenaInformations[arena].monsterPos,0);
	end
	if User:getPlayerLanguage() == 0 then
		sdMonster = SelectionDialog("Monsterlevel", "Wählt ein Monsterlevel gegen das Ihr kämpfen möchtet:", cbChooseLevel);
		for i=1, #(monsterIDsByLevel) do
			sdMonster:addOption(0,"Level "..i.." Monster ("..monsterIDsByLevel[i].points.." Punkt(e))");
		end
	else
		sdMonster = SelectionDialog("Monsterlevel", "Plaese choose a monsterlevel you wish to fight against:", cbChooseLevel);
		for i=1, #(monsterIDsByLevel) do
			sdMonster:addOption(0,"Level "..i.." Monster ("..monsterIDsByLevel[i].points.." point(s))");
		end
	end	
	User:requestSelectionDialog(sdMonster);
end

function getArena(User, NPC)
	User:inform("NPC Name: "..NPC.name)
	for i=1, #(arenaInformations) do
		if arenaInformations[i].npcName == NPC.name then
			User:inform("Index: "..i)
			return i;
		else
			return "";
		end
	end
end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end