--[[
Script for the arena managers. Purpose: money sink, fame and glory

Players can buy monsters to fight against. Depending on the monster strength, the price rises.
For every defeated monster the player gets points (corresponding to the monsters strength). 
Monsters drop no loot. It is all only for the sake of fame and glory.

The arena manager holds a list of the top ten players. Players from other factions can fight too, to
piss the other faction off. 

author: Lillian

]]
require("base.money")

module("base.arena", package.seeall)

--[[
Level 1: Annoying monsters award 1 point
Level 2: Very easy monsters for noobs award 2 points
Level 3: Easy monsters award 3 points
Level 4: Semistrong monsters award 5 points
Level 5: Strong monster award 8 points
Level 6: Really strong monsters award 13 points
Level 7: Monsters for really, really good fighters 'heroes' award 20 points
]]
monsterIDsByLevel = {
	{monsters = {991, 271, 1051, 582, 1071}, points = 1},
	{monsters = {101, 196, 273, 602, 881}, points = 2},
	{monsters = {311, 394, 551, 882, 1011}, points = 3},
	{monsters = {141, 501, 552, 791, 872}, points = 5},
	{monsters = {191, 492, 531, 411, 851}, points = 8},
	{monsters = {121, 202, 491, 525, 852}, points = 13},
	{monsters = {534, 124, 562, 661, 853}, points = 20}
}

arenaInformations = {{playerPos=nil, monsterPos=position(255,668,0), newPlayerPos=nil, npcName="Dale Daeon", town="Cadomyr", quest=801}, 
					{playerPos=position(0,0,0), monsterPos=position(0,0,0), newPlayerPos=position(0,0,0), npcName="Test", town="Runewick", quest=802}, 
					{playerPos=position(0,0,0), monsterPos=position(0,0,0), newPlayerPos=position(0,0,0), npcName="Test", town="Galmair", quest=803}}
					
priceBase = 10000;

function requestMonster(User, NPC) 
	local cbChooseLevel = function (dialog)
		if (not dialog:getSuccess()) then
			return;
        end
		local index = dialog:getSelectedIndex()+1;
		local arena = getArena(User, NPC);
		local paid = payforMonster(User, index, NPC)
		local priceInCP;
		local germanMoney, englishMoney;
		
		if paid then
			if arenaInformations[arena].playerPos ~= nil then
				User:warp(arenaInformations[arena].playerPos);
			end
			--add the effect to keep track of the monster
			arenaEffect=LongTimeEffect(18,1);
			arenaEffect:addValue("arenaID",arena);
			arenaEffect:addValue("level",index);
			if isValidChar(User) then
				User.effects:addEffect(arenaEffect);
			end
		else
			return;
		end
	end
	if User:getPlayerLanguage() == 0 then
		sdMonster = SelectionDialog("Monsterstärke", "Wählt wie stark das Monster sein soll, gegen das Ihr kämpfen möchtet:", cbChooseLevel);
		sdMonster:setCloseOnMove();
		for i=1, #(monsterIDsByLevel) do
			priceInCP = i * priceBase;
			germanMoney, englishMoney = base.money.MoneyToString(priceInCP);
			sdMonster:addOption(0,"Stärke "..i.." Monster ("..monsterIDsByLevel[i].points.." Punkte) -"..germanMoney);
		end
	else
		sdMonster = SelectionDialog("Monster strength", "Please choose how strong the monster you wish to fight against should be:", cbChooseLevel);
		sdMonster:setCloseOnMove();
		for i=1, #(monsterIDsByLevel) do
			priceInCP = i * priceBase;
			germanMoney, englishMoney = base.money.MoneyToString(priceInCP);
			sdMonster:addOption(0,"Level "..i.." Monster ("..monsterIDsByLevel[i].points.." points) -"..englishMoney);
		end
	end	
	User:requestSelectionDialog(sdMonster);
end

function payforMonster(User, MonsterLevel, NPC)
	local priceInCP = MonsterLevel * priceBase;
	local germanMoney, englishMoney = base.money.MoneyToString(priceInCP);
	
	if not base.money.CharHasMoney(User,priceInCP) then --not enough money!
		gText="Ihr habt nicht genug Geld dabei! Ihr benötigt"..germanMoney..".";
		eText="You don't have enough money with you! You'll need"..englishMoney..".";
		outText=base.common.GetNLS(User,gText,eText);
        NPC:talk(Character.say, outText);
		return false;
	end
	base.money.TakeMoneyFromChar(User,priceInCP); --take money
	User:inform("Ihr habt Euch ein Monster für"..germanMoney.." gekauft. Viel Erfolg!", "You bought a monster at the price of"..englishMoney..". Good luck!");
	return true;
end

arenaMonster = {}

function spawnMonster(User, MonsterLevel, arena)
    if not arenaMonster[User.id] then
		arenaMonster[User.id] = {};
    end
	
    local monster;
	world:gfx(31,arenaInformations[arena].monsterPos);
	monster = world:createMonster(getRandomMonster(MonsterLevel),arenaInformations[arena].monsterPos,0);
	if isValidChar(monster) then
		table.insert( arenaMonster[User.id], monster );
    end
end

function checkMonster(User)
	if not arenaMonster[User.id] then
		return true;
    end

	for i,monster in pairs(arenaMonster[User.id]) do
		if isValidChar(monster) then
			if monster:increaseAttrib("hitpoints",0) > 0 then
				return false;
			end
		end
	end
    arenaMonster[User.id] = nil;
    return true;
end

function killMonster(User)
    if not arenaMonster[User.id] then
		return true;
    end

	for i,monster in pairs(arenaMonster[User.id]) do
		if isValidChar(monster) then
			if monster:increaseAttrib("hitpoints",0) > 0 then
				monster:increaseAttrib("hitpoints",-10000);
			end
		end
	end
	arenaMonster[User.id] = nil;

	return true;
end

function getRandomMonster(level) 
	local randomNumber = base.common.NormalRnd2(1, table.getn(monsterIDsByLevel[level].monsters), 10);
	return monsterIDsByLevel[level].monsters[randomNumber];
end

function getArena(User, NPC)
	for i=1, #(arenaInformations) do
		if arenaInformations[i].npcName == NPC.name then
			return i;
		else
			return "";
		end
	end
end

--[[
gets the top 5 of the arena. Each ranklist entry contains the
name of the character and the points. 
The scriptVar is converted to a table for better handling and then shown
in a messageDialog.

ArenaList<town> format - "<name1>;<points1>;<name2>;<point2>..."
message = true: displays a messagebox with the ranklist
message = false: returns the ranklist table
]]

function getRanklist(User, arena, message)
	local town = arenaInformations[arena].town;
	local found = false;
	local arenaEntry;
	local arenaList = {};
	local list = " ";
	local place = 2;
	local arenaListName = "ArenaList"..town;
	  
	found, arenaEntry = ScriptVars:find(arenaListName); -- get the top 5
	if found then
		arenaList = sortTable(base.common.split(arenaEntry, ";"));
	elseif found == false then
		User:inform(base.common.GetNLS(User, "Niemand hat hier bisher gekämpft.","No one fought here yet."));
		return;
	end
	

	if message then
		if arenaList ~= {} then
			local mdList = function(dialog)
				if (not dialog:getSuccess()) then
					return;
				end
			end
			if User:getPlayerLanguage() == 0 then
				list = "Platz 1: "..arenaList[1].." mit "..arenaList[2].." Punkten.\n";
				for i=3,#(arenaList),2 do
					list = list.."Platz "..place.." : "..arenaList[i].." mit "..arenaList[i+1].." Punkten.\n";
					place = place +1;
				end
				mdList = MessageDialog("Top Fünf Kämpfer des Reiches", list, nil);			
			else
				list = "Place 1: "..arenaList[1].." with "..arenaList[2].." points.\n";
				for i=3, #(arenaList),2 do
					list = list.."Place "..place.." : "..arenaList[i].." with "..arenaList[i+1].." points.\n";
					place = place +1;
				end
				mdList = MessageDialog("Top five fighters of the realm", list, nil);
			end
			User:requestMessageDialog(mdList);
		else
			return;
		end
	else
		return arenaList;
	end
end

--[[
Saves the points of the player and if he reached the 
top five, also saves the new top five.
]]
function setRanklist(User, arena, points) 
	local ranklist = getRanklist(User, arena, false)
	local town = arenaInformations[arena].town;
	local quest = arenaInformations[arena].quest;
	local newRanklist = {};
	local arenaListName = "ArenaList"..town;
	local userInList, position = isUserInList(User, ranklist);

	if ranklist ~= {} then
		if tonumber(ranklist[table.getn(ranklist)]) > points then
			return;
		else
			for i=2, #(ranklist), 2 do
				if tonumber(ranklist[i]) < points then
					if not userInList then
						table.insert(ranklist, i-1, points);
						table.insert(ranklist, i-1, User.name);
						table.remove(ranklist, table.getn(ranklist));
						table.remove(ranklist, table.getn(ranklist));
						break;
					else
						table.remove(ranklist, position);
						table.remove(ranklist, position);
						table.insert(ranklist, i-1, points);
						table.insert(ranklist, i-1, User.name);
						break;
					end
				end
			end
			stringList = base.common.join(ranklist, ";");
			ScriptVars:set(arenaListName, stringList)
		end
	else
		stringList = User.name..";"..points
		ScriptVars:set(arenaListName, stringList)
	end
end

function isUserInList(User, ranklist)
	for i=1, #(ranklist), 2 do
		if ranklist[i] == User.name then
			return true, i;
		end
	end	
	return false, 0;
end

-- Returns the points of a present arena, which the player has earned so far
function getArenastats(User, NPC)
	local arena = getArena(User, NPC);
	local quest = arenaInformations[arena].quest;
	local points = User:getQuestProgress(quest);
	
	gText="Ihr habt bereits "..points.." gesammelt. Weiter so!";
	eText="You have already earnt "..points.." points. Keep it up!";
	outText=base.common.GetNLS(User,gText,eText);
    NPC:talk(Character.say, outText);
end

function setArenastats(User, arena, points)
	local quest = arenaInformations[arena].quest;
	local oldPoints = User:getQuestProgress(quest);
	
	points = points + oldPoints;
	User:setQuestProgress(quest, points);
end

--Sorts a table deceanding by the value of every second entry
function sortTable(inputTable)
	local numberTable = {}
	local sortedTable = {}
	for i=2, #(inputTable), 2 do
		table.insert(numberTable, inputTable[i]);
	end	
	table.sort(numberTable);
	for i= 1, #(numberTable) do
		for j=2, #(inputTable), 2 do
			if inputTable[j] == numberTable[i] then
				table.insert(sortedTable, 1, inputTable[j]);
				table.insert(sortedTable, 1, inputTable[j-1]);
			end
		end
	end
	return sortedTable;
end