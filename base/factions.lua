require("base.common")
require("base.money")
--THE EDITABLE PART FOR NEW TOWNS OR GUILDS IS SOME LINES BELOW

-- NOTE: town IDs for:
--- Cadomyr: 1
--- Runewick: 2
--- Galmair: 3

module("base.factions", package.seeall)



function InitFactionLists()
   
	notaryNames = {"Torina Scibrim"}
   
	--Lists for Functions--
	NpcLocation = {};   --holds the location(townID) of the NPC
	TextRepeatCnt={}; --a value/counter to allow text repeation(e.g.for questions)
	
	--Towns--
	TownList={};
    
	TownMainKey={};
	TownJailKey={};

	--A list with the Ranks, Rank 8 and Rank 9 can not be reached with faction points(e.g. npc quests), only with GM help, don't give any normal player rank 9!
	TownRankList = { {gRank = "Leibeigener", eRank = "serf"},        --rank 1
					 {gRank = "Bauer", eRank = "peasant"},           --rank 2
					 {gRank = "Arbeiter", eRank = "worker"},         --rank 3
					 {gRank = "Plebejer", eRank = "plebeian"},       --rank 4
					 {gRank = "Bürger", eRank = "citizen"},          --rank 5
					 {gRank = "Edelmann", eRank = "knight"},         --rank 6
					 {gRank = "Patrizier", eRank = "patrician"},     --rank 7
					 {gRank = "Adliger", eRank = "noble"},           --rank 8
					 {gRank = "Herrscher", eRank = "sovereign"}};    --rank 9
					 
	TownRankList[0] = {gRank="Geächteter", eRank="outcast"};         --rank 0
end

--[[
    AddTown
	Add a Town to the Faction System(be carefull, adding a new town needs further changes in the whole script!)
    @param TownID		- the ID of the town(1-9 allowed)
    @param TownName		- the Townname 
]]
function AddTown(TownID, TownName)
	table.insert(TownList,{townID=TownID, townName=TownName});
end

--[[
    AddTownMainKey/ AddTownJailKey / AddGuildMainKey / AddGuildJailKey
	Add the Main Key/Jail Key of the town of a faction with the Faction ID (TownMID)
    @param TownMID                  - the ID of the town the key shall be added
    @param KeyID,KeyQuality,KeyData - the ID,Quality and Data of the Key
]]
function AddTownMainKey(TownMID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(TownMainKey,TownMID, {KeyID,KeyQuality,KeyData});
end

function AddTownJailKey(TownJID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(TownJailKey,TownJID, {KeyID,KeyQuality,KeyData});
end

if not InitFaction then
	InitFactionLists();
	InitFaction = true;
    citizenRank = 1;
    outcastRank = 0;
    leaderRank = 9;

--==================================ADD NEW TOWNS AND GUILDS HERE===============
--AddTown(TownID,TownName), IDs from 1-9
--AddAdditionalTownName(German Trigger, English Trigger)
--AddTownMainKey(TownID, KeyID, KeyQuality, KeyData)

AddTown(1,"Cadomyr");
AddTownMainKey(1,2121, 333, 5030);
AddTownJailKey(12,2121, 333, 5031);
AddTown(2,"Runewick");
AddTown(3,"Galmair");

--[[AddTown(12,"Silberbrand","Silverbrand", 1022, 102, 111);
AddTownMainKey(12,2121, 333, 5030);
AddTownJailKey(12,2121, 333, 5031);   ]]--


end
--==================================END OF THE EDITABLE PART====================


function getTownNameByID(TownID)
	for i=1, #(TownList) do
		if (TownList[i].townID == TownID) then
			return TownList[i].townName
		end
	end
end

--[[
    get_Faction
	Looks up to which Faction a Character belongs and checks also his rank
    @param originator -- the CharacterStruct

    @return Array - 1. a counter how often a Char changed the town, 2.the Town he belongs to ,
					3-5 the Ranks/Reputation in the Towns Cadomyr, Runewick and Galmair
]]
function get_Faction(originator)

	--format of questprogress 1. digit town id, 2. digit town rank
	local qpg = originator:getQuestProgress(200);
	local towncnt = originator:getQuestProgress(201)
	if qpg==nil then
		originator:setQuestProgress(200,00); --set the qpg to "zero"
	end

	local 	  tid = math.floor ((qpg/10);   -- the id of the town the char belongs to
	local rankTown = math.floor(qpg-tid*10);

	return { towncnt = towncnt, tid = tid, rankTown = rankTown};
end

--[[
    get_Rankpoints
	Looks up how much Rankpoints a Character has
    @param originator -- the CharacterStruct

    @return qpg - rankpoints in realm
]]
function get_Rankpoints(originator)

	local qpg = originator:getQuestProgress(202); -- digit 1&2 = rankpoints
	if qpg==nil or qpg == 0 then
		originator:setQuestProgress(202,20); --set the qpg to "zero"
	end

	return gpg;
end

--[[
    get
	Looks up to which Guild and Town a Character belongs to and his Rank
    @param originator -- the CharacterStruct

    @return Array - all values about Factionmembership, Guildmembership and Rankpoints
]]--
function getFactionInformations(originator)

	local Faction = get_Faction(originator);
	local Rankpoints = get_Rankpoints(originator);

	return {towncnt = Faction.towncnt, tid = Faction.tid, rankTown = Faction.rankTown,
			rankpoints = Rankpoints};
end

--[[
    put_Faction//Guild
	Saves the Factionchanges of the Char//Guildchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Faction//Guild - the Array which includes the values to be changed

]]
function put_Faction(originator,Faction)

	--------don't allow unknown ranks-----
	if Faction.rankTown>9 then Faction.rankTown = 9 elseif Faction.rankTown<0 then Faction.rankTown = 0; end
	-------------write changes------------
	
	local qpg=tonumber(Faction.tid..Faction.rankTown);
	originator:setQuestProgress(200,qpg);
	originator:setQuestProgress(201,tonumber(Faction.towncnt));
end

function IncreaseRank(rankpoints,rank)
	local overflow = 99;
	if (rankpoints-overflow) > 89 then rankpoints = overflow; else rankpoints = 10 + (rankpoints-99); end --max. number of rankpoints to add is 89!
	if rank<7 and rank>0 then
		rank = rank + 1;     --raise the Rank
	end
	return rankpoints,rank;
end

function DecreaseRank(rankpoints,rank)
	local underflow = 10;
	if (underflow - rankpoints>89) then rankpoints = underflow; else rankpoints = (99 + rankpoints) -10; end
	if rank<=8 and rank>0 then
		rank = rank - 1;     --sink the Rank
	end
	return rankpoints,rank;

end
--[[
    put_Rankpoints
	Saves the Factionchanges of the Char//Guildchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Rankpoints - the value Rankpoints

]]
function put_Rankpoints(originator, rankpoints)
	local Faction = getFactionInformations(originator);
	 ---increase rank ----
	if (Faction.rankpoints >99) then
		local rank = Faction.rankTown; 
		Faction.rankpoints, Faction.rankTown = IncreaseRank(Faction.rankpoints,Faction.rankTown);
		if Faction.rankTown>rank then  
			base.common.InformNLS( originator, "Du hast soeben einen neuen Rang in "..getTownNameByID(Faction.tid).." erreicht.", 
				"You reached a new town rank in "..getTownNameByID(Faction.tid) ) end
	end
	----lower rank----------
	if (Faction.rankpoints <10) then
		local rank = Faction.rankTown; 
		Faction.rankpoints,Faction.rankTown = DecreaseRank(Faction.rankpoints,Faction.rankTown);
		if Faction.rankTown<rank then  
			base.common.InformNLS( originator, "Durch deine ständigen Konflikte mit dem Gesetz ist dein Rang in "..getTownNameByID(Faction.tid).." um eine Stufe gesunken.", 
				"Because of your permanent conflicts with the law your rank sinks for a degree in "..getTownNameByID(Faction.tid) ) end
	end

	------save changes----------------
	put_Faction(originator,Faction);
	originator:setQuestProgress(202,rankpoints);
end
--[[
    put_
	Saves the Factionchanges of the Char//Guildchanges of the Char//Rankpoints
    @param CharacterStruct - The character who gets the new Questprogress
    @param Faction - the Array which includes the values Rankpoints//Guild Values//Town Values

]]
function setFactionInformations(originator,Factionvalues)
	--town
    put_Faction(originator,Factionvalues);
	--rankpoints town
	put_Rankpoints(originator,Factionvalues);
end

--[[
    makeCharMemberOfTown
	makes the char citizen of the town//or leader if the char is a gm
    @param originator -- the PlayerStruct
    @param Factionvalues -- the List with the Factionvalues of the Char
    @param theRank(number) -- the rank the char shall get in the town
]]
function makeCharMemberOfTown(originator,fv,theRank,theTown)
	NPCList = world:getNPCSInRangeOf(originator.pos, 3);
	for i = 1, #(NPCList) do
		for j=1, #(notaryNames) do
			if NPCList[i].name == notaryNames[j] then
				thisNPC = NPCList[i]
			end
		end
	end
	
	if theRank==leaderRank then --make char to leader of this town
		fv.tid = theTown; --make him member of this town
		fv.rankTown = leaderRank; --give him the leader rank
		fv = put_Faction(originator,fv);
		return;

	elseif theRank==citizenRank then --make char to citizen
		if (fv.tid == theTown) then --already citizen
		 	gText="Ihr seid bereits Bürger dieser Stadt!";
			eText="You're already citizen of this town!";
			outText=base.common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
		end
		
		local amountToPay = 1000*(2^fv.towncnt) -- amount in coppercoins
		if not base.money.CharHasMoney(originator,amountToPay) then --not enough money!
			local GAmount, SAmount,CAmount = base.money.MoneyToCoins(amountToPay);
		 	gText="Ihr habt nicht genug Geld dabei! Ihr benötigt "..GAmount.." Goldstücke, "..SAmount.." Silberstücke und "..CAmount.." Kupferstücke.";
			eText="You don't have enough money with you! You'll need "..GAmount.." goldcoins, "..SAmount.." silvercoins and "..CAmount.." coppercoins.";
			outText=base.common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
		end
		
		fv.rankpoints = 20 -- set default value for rankpoints
		fv.tid = theTown; --set new Town ID
				
		if (fv.towncnt<99) then fv.towncnt = fv.towncnt+1; end; -- raise the town counter
		put_Faction(originator,fv); --write fv in Questprogress
		base.money.TakeMoneyFromChar(originator,amountToPay); --take money

		gText="Ihr seid nun als Bürger dieser Stadt eingetragen.";
		eText="You're now registered as citizen of this town.";
		outText=base.common.GetNLS(originator,gText,eText);
        thisNPC:talk(Character.say, outText);
	end
	return;
end