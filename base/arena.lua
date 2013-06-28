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
require("base.ranklist")

module("base.arena", package.seeall)

--[[
Level 1: Annoying monsters award 1 point
Level 2: Very easy monsters for noobs award 2 points
Level 3: Easy monsters award 3 points
Level 4: Semistrong monsters award 4 points
Level 5: Strong monster award 6 points
Level 6: Really strong monsters award 8 points
Level 7: Monsters for really, really good fighters 'heroes' award 13 points
Level 8: Monsters for group fights award 18 points 
Level 9: Unbelieavable strong monsters for 'groups' award 21 points
]]
monsterIDsByLevel = {
	{monsters = {991, 271, 1051, 582, 1071}, points = 1},
	{monsters = {101, 196, 273, 602, 881}, points = 2},
	{monsters = {311, 394, 551, 882, 1011}, points = 3},
	{monsters = {141, 501, 552, 791, 872}, points = 4},
	{monsters = {191, 492, 531, 411, 851}, points = 6},
	{monsters = {121, 201, 491, 525, 852}, points = 8},
	{monsters = {534, 124, 562, 661, 853}, points = 13},
	{monsters = {125, 132, 812, 195, 651}, points = 18},
	{monsters = {302, 631, 641, 911, 912}, points = 21}
}

arenaInformation = {{playerPos=nil, monsterPos=position(255,668,0), newPlayerPos=nil, npcName="Dale Daeon", town="Cadomyr", quest=801}, 
					{playerPos=nil, monsterPos=position(995,784,-3), newPlayerPos=nil, npcName="Manuel Salan", town="Runewick", quest=802}, 
					{playerPos=nil, monsterPos=position(334,160,-6), newPlayerPos=nil, npcName="Angelo Rothman", town="Galmair", quest=803}}
					
priceBase = 4000;

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
			if arenaInformation[arena].playerPos ~= nil then
				User:warp(arenaInformation[arena].playerPos);
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
	
	if not checkLte(User,NPC) then
		return
	end
	
	if User:getPlayerLanguage() == 0 then
		sdMonster = SelectionDialog("Monsterstärke", "Wählt wie stark das Monster sein soll, gegen das Ihr kämpfen möchtet:", cbChooseLevel);
		sdMonster:setCloseOnMove();
		for i=1, #(monsterIDsByLevel) do
			priceInCP = i*i*priceBase;
			germanMoney, englishMoney = base.money.MoneyToString(priceInCP);
			sdMonster:addOption(61,"Stärke "..i.." Monster ("..monsterIDsByLevel[i].points.." Punkte)\n Preis:"..germanMoney);
		end
	else
		sdMonster = SelectionDialog("Monster strength", "Please choose how strong the monster you wish to fight against should be:", cbChooseLevel);
		sdMonster:setCloseOnMove();
		for i=1, #(monsterIDsByLevel) do
			priceInCP = i*i * priceBase;
			germanMoney, englishMoney = base.money.MoneyToString(priceInCP);
			sdMonster:addOption(61,"Level "..i.." Monster ("..monsterIDsByLevel[i].points.." points)\n Price:"..englishMoney);
		end
	end	
	User:requestSelectionDialog(sdMonster);
end

function payforMonster(User, MonsterLevel, NPC)
	local priceInCP = MonsterLevel*MonsterLevel * priceBase;
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
	world:gfx(31,arenaInformation[arena].monsterPos);
	monster = world:createMonster(getRandomMonster(MonsterLevel),arenaInformation[arena].monsterPos,0);
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
	local randomNumber = math.random(1, table.getn(monsterIDsByLevel[level].monsters));
	return monsterIDsByLevel[level].monsters[randomNumber];
end

function getArena(User, NPC)
	for i=1, #(arenaInformation) do
		if arenaInformation[i].npcName == NPC.name then
			return i;
		end
	end
	return "";
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
	local quest = arenaInformation[arena].quest;
	local points = User:getQuestProgress(quest);
	
	gText="Ihr habt bereits "..points.." gesammelt. Weiter so!";
	eText="You have already earnt "..points.." points. Keep it up!";
	outText=base.common.GetNLS(User,gText,eText);
    NPC:talk(Character.say, outText);
end

function setArenastats(User, arena, points)
	local quest = arenaInformation[arena].quest;
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

function checkLte(User,NPC) 

	local foundEffect, myEffect = User.effects:find(18)
	if foundEffect then
		NPC:talk(Character.say,"Besiegt erstmal die erste Kreatur, bevor Ihr eine zweite verlangt!","Finish the first creature before you demand a second one!")
	    return false
	end
	return true
end