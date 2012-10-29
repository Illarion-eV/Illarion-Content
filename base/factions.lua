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
	CadomyrRankList = { {gRank = "Rekrut", eRank = "Recruit"},        	--rank 1
					 {gRank = "Knappe", eRank = "Squire"},           	--rank 2
					 {gRank = "Korporal", eRank = "Corporal"},         	--rank 3
					 {gRank = "Wachmeister", eRank = "Sergeant"},       --rank 4
					 {gRank = "Berittener", eRank = "Trooper"},         --rank 5
					 {gRank = "Lancier", eRank = "Lancer"},        		--rank 6
					 {gRank = "Ritter", eRank = "Knight"},     			--rank 7
					 {gRank = "Adliger", eRank = "Noble"},           	--rank 8
					 {gRank = "Baron", eRank = "Baron"},				--rank 9
					 {gRank = "Herzog", eRank = "Duke"},				--rank 10
					 {gRank = "Queen", eRank = "Königin"}};				--rank leader
					 
	CadomyrRankList[0] = {gRank="Geächteter", eRank="outcast"};         --rank 0
	
	RunewickRankList = { {gRank = "Neuling", eRank = "Novice"},    		--rank 1
					 {gRank = "Anwärter", eRank = "Apprentice"},       	--rank 2
					 {gRank = "Student", eRank = "Student"},         	--rank 3
					 {gRank = "Gelehrter", eRank = "Scholar"},       	--rank 4
					 {gRank = "Magister", eRank = "Master"},          	--rank 5
					 {gRank = "Doktor", eRank = "Doctor"},         		--rank 6
					 {gRank = "Dozent", eRank = "Docent"},     			--rank 7
					 {gRank = "Professor", eRank = "Professor"},        --rank 8
					 {gRank = "Dekan", eRank = "Dean"},    				--rank 9
					 {gRank = "Rektor", eRank = "Rector"},    			--rank 10
					 {gRank = "Erzmagier", eRank = "Archmage"}};		--rank leader
					 
	RunewickRankList[0] = {gRank="Geächteter", eRank="outcast"};        --rank 0
	
	GalmairRankList = { {gRank = "Rumtreiber", eRank = "Tramp"},      	--rank 1
					 {gRank = "Gehilfe", eRank = "Assistand"},          --rank 2
					 {gRank = "Hausierer", eRank = "Pedlar"},         	--rank 3
					 {gRank = "Krämer", eRank = "Grocer"},       		--rank 4
					 {gRank = "Kaufmann", eRank = "Merchant"},          --rank 5
					 {gRank = "Finanzier", eRank = "Financier"},        --rank 6
					 {gRank = "Patrizier", eRank = "Patrician"},     	--rank 7
					 {gRank = "Mogul", eRank = "Mogul"},           		--rank 8
					 {gRank = "Magnat", eRank = "Magnate"},    			--rank 9
					 {gRank = "Tycoon", eRank = "Tycoon"},				--rank 10
					 {gRank = "Don", eRank = "Don"}};					--rank leader
					 
	GalmairRankList[0] = {gRank="Geächteter", eRank="outcast"};         --rank 0
	
	townRanks = {CadomyrRankList, RunewickRankList, GalmairRankList}
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
    leaderRank = 11;

--==================================ADD NEW TOWNS AND GUILDS HERE===============
--AddTown(TownID,TownName), IDs from 1-9
--AddAdditionalTownName(German Trigger, English Trigger)
--AddTownMainKey(TownID, KeyID, KeyQuality, KeyData)

AddTown(0,"None");
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

function getMemberShip(player)
	return player:getQuestProgress(199);
end

function getMemberShipByName(player)
	return getTownNameByID(player:getQuestProgress(199));
end

function informPlayerAboutStatus(player)
	NPCList = world:getNPCSInRangeOf(player.pos, 3);
	for i = 1, #(NPCList) do
		for j=1, #(notaryNames) do
			if NPCList[i].name == notaryNames[j] then
				thisNPC = NPCList[i]
			end
		end
	end

	local Faction = getFaction(player)
	local townMember = getMemberShipByName(player)
	local rankName = townRanks[Faction.tid][Faction.rankTown]
	local rankpoints = getRankpoints(player)
	local missingPoints = (math.floor(tonumber(rankpoints)/100)+1)*100-tonumber(rankpoints) --calculates the missing points to advance a rank

	local gText = "Ihr seid Mitglied des Reiches "..townMember..". Dort habt ihr den Rang "..rankName.gRank.." und besitzt "..rankpoints.." Rangpunkte. Ihr benötigt noch "..missingPoints.." Rangpunkte um einen Rang aufzusteigen."
	local eText = "You are member of the realm "..townMember..". You have the rank "..rankName.eRank.." and possess "..rankpoints.." rankpoints. You still need "..missingPoints.." rankpoints to advance a rank."
	outText=base.common.GetNLS(player,gText,eText);
    thisNPC:talk(Character.say, outText);
end

--[[
    getFaction
	Looks up to which Faction a Character belongs and checks also his rank
    @param originator -- the CharacterStruct

    @return Array - 1. a counter how often a Char changed the town, 2.the Town he belongs to ,
					3-5 the Ranks/Reputation in the Towns Cadomyr, Runewick and Galmair
]]
function getFaction(originator)

	local rankTown = originator:getQuestProgress(200);
	local factionMembership = originator:getQuestProgress(199);
	local towncnt = originator:getQuestProgress(201);
	local rankpoints = originator:getQuestProgress(202);
	if rankTown==nil then
		originator:setQuestProgress(200,0);
		rankTown = 0;
	elseif factionMembership == nil then
		originator:setQuestProgress(199,0);
		factionMembership = 0;
	elseif towncnt == nil then
		originator:setQuestProgress(201,0);
		towncnt = 0;
	end

	return { towncnt = towncnt, tid = factionMembership, rankTown = rankTown, rankpoints = rankpoints};
end

--[[
    getRankpoints
	Looks up how much Rankpoints a Character has
    @param originator -- the CharacterStruct

    @return qpg - rankpoints in realm
]]
function getRankpoints(originator)

	local qpg = originator:getQuestProgress(202); -- rankpoints
	if qpg==nil or qpg == 0 then
		originator:setQuestProgress(202,20); --set the qpg to "zero"
		qpg = 20;
	end

	return qpg;
end

--[[
    get
	Looks up to which Guild and Town a Character belongs to and his Rank
    @param originator -- the CharacterStruct

    @return Array - all values about Factionmembership, Guildmembership and Rankpoints
]]--
function getFactionInformations(originator)

	local Faction = getFaction(originator);
	local Rankpoints = getRankpoints(originator);

	return {towncnt = Faction.towncnt, tid = Faction.tid, rankTown = Faction.rankTown,
			rankpoints = Rankpoints};
end

--[[
    setFaction
	Saves the Factionchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Faction - the Array which includes the values to be changed

]]
function setFaction(originator,Faction)

	--------don't allow unknown ranks-----
	if Faction.rankTown>11 then Faction.rankTown = 11 elseif Faction.rankTown<0 then Faction.rankTown = 0; end
	-------------write changes------------
	originator:setQuestProgress(199,tonumber(Faction.tid));
	originator:setQuestProgress(200,tonumber(Faction.rankTown));
	originator:setQuestProgress(201,tonumber(Faction.towncnt));
	originator:setQuestProgress(202,tonumber(Faction.rankpoints));
end

function checkForRankChange(rankpoints,rank)
	local newRank = math.floor(rankpoints/100)-1
	if newRank > rank and newRank <= 10 then
		return newRank;
	elseif newRank < rank and newRank >= 1 then
		return newRank;
	else
		return rank;
	end
end

--[[
    setRankpoints
	Saves the Factionchanges of the Char//Guildchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Rankpoints - the value Rankpoints

]]
function setRankpoints(originator, rankpoints)
	local Faction = getFactionInformations(originator);
	local rank = Faction.rankTown; 	
	
	if rankpoints < 0 then
		rankpoints = 0
	end
	
	Faction.rankTown = checkForRankChange(rankpoints,rank);
		
	local townName = getTownNameByID(Faction.tid)
	local rankName = townRanks[Faction.tid][Faction.rankTown]
	if Faction.rankTown>rank then  
		base.common.InformNLS( originator, "Du hast soeben einen neuen Rang in "..townName.." erreicht. Du bist nun "..rankName.gRank..".", 
			"You reached a new town rank in "..townName..". You are now "..rankName.eRank..".")
	elseif Faction.rankTown<rank then  
		base.common.InformNLS( originator, "Durch deine ständigen Konflikte mit dem Gesetz ist dein Rang in "..townName.." um eine Stufe gesunken. Du bist nun "..rankName.gRank..".", 
			"Because of your permanent conflicts with the law your rank sinks for a degree in "..townName..". You are now "..rankName.eRank.."." ) 
	end

	------save changes----------------
	setFaction(originator,Faction);
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
    setFaction(originator,Factionvalues);
	--rankpoints town
	setRankpoints(originator,Factionvalues);
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
		fv = setFaction(originator,fv);
		return;

	elseif theRank~=leaderRank then --make char to citizen
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
		fv.rankTown = theRank -- set the rank of the town
				
		if (fv.towncnt<99) then fv.towncnt = fv.towncnt+1; end; -- raise the town counter
		setFaction(originator,fv); --write fv in Questprogress
		base.money.TakeMoneyFromChar(originator,amountToPay); --take money

		gText="Ihr seid nun als Bürger dieser Stadt eingetragen.";
		eText="You're now registered as citizen of this town.";
		outText=base.common.GetNLS(originator,gText,eText);
        thisNPC:talk(Character.say, outText);
	end
	return;
end