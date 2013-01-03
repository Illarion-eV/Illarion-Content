require("base.common")
require("base.money")
--THE EDITABLE PART FOR NEW TOWNS OR GUILDS IS SOME LINES BELOW

-- NOTE: town IDs for:
--- Cadomyr: 1
--- Runewick: 2
--- Galmair: 3

module("base.factions", package.seeall)



function InitFactionLists()

	--Lists for Functions--
	NpcLocation = {};   --holds the location(townID) of the NPC
	TextRepeatCnt={}; --a value/counter to allow text repeation(e.g.for questions)

	--Towns--
	TownList={};

	TownMainKey={};
	TownJailKey={};

	--A list with the Ranks, Rank 8 and Rank 9 can not be reached with faction points(e.g. npc quests), only with GM help, don't give any normal player rank 9!
	CadomyrRankListMale = { {gRank = "Rekrut", eRank = "Recruit"},        	--rank 1
					 {gRank = "Knappe", eRank = "Squire"},           	--rank 2
					 {gRank = "Herr", eRank = "Lord"},         	--rank 3
					 {gRank = "Ritter", eRank = "Knight"},       --rank 4
					 {gRank = "Vogt", eRank = "Reeve"},         --rank 5
					 {gRank = "Baron", eRank = "Baron"},        		--rank 6
					 {gRank = "Graf", eRank = "Count"},     			--rank 7
					 {gRank = "Fürst", eRank = "Earl"},           	--rank 8
					 {gRank = "Herzog", eRank = "Duke"},				--rank 9
					 {gRank = "Erzherzog", eRank = "Archduke"},				--rank 10
					 {gRank = "König", eRank = "King"}};				--rank leader
	
	CadomyrRankListFemale = { {gRank = "Rekrutin", eRank = "Recruit"},        	--rank 1
					 {gRank = "Magd", eRank = "Maid"},           	--rank 2
					 {gRank = "Herrin", eRank = "Lady"},         	--rank 3
					 {gRank = "Dame", eRank = "Dame"},       --rank 4
					 {gRank = "Vogtin", eRank = "Reeve"},         --rank 5
					 {gRank = "Baronin", eRank = "Baroness"},        		--rank 6
					 {gRank = "Gräfin", eRank = "Countess"},     			--rank 7
					 {gRank = "Fürstin", eRank = "Earl"},           	--rank 8
					 {gRank = "Herzogin", eRank = "Duchess"},				--rank 9
					 {gRank = "Erzherzogin", eRank = "Archduchess"},				--rank 10
					 {gRank = "Königin", eRank = "Queen"}};				--rank leader

	RunewickRankListMale = { {gRank = "Novize", eRank = "Novice"},    		--rank 1
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
	
	RunewickRankListFemale = { {gRank = "Novizin", eRank = "Novice"},    		--rank 1
					 {gRank = "Anwärterin", eRank = "Apprentice"},       	--rank 2
					 {gRank = "Studentin", eRank = "Student"},         	--rank 3
					 {gRank = "Gelehrte", eRank = "Scholar"},       	--rank 4
					 {gRank = "Magister", eRank = "Master"},          	--rank 5
					 {gRank = "Doktorin", eRank = "Doctor"},         		--rank 6
					 {gRank = "Dozentin", eRank = "Docent"},     			--rank 7
					 {gRank = "Professorin", eRank = "Professor"},        --rank 8
					 {gRank = "Dekanin", eRank = "Dean"},    				--rank 9
					 {gRank = "Rektorin", eRank = "Rector"},    			--rank 10
					 {gRank = "Erzmagierin", eRank = "Archmage"}};		--rank leader

	GalmairRankListMale = { {gRank = "Rumtreiber", eRank = "Tramp"},      	--rank 1
					 {gRank = "Gehilfe", eRank = "Assistant"},          --rank 2
					 {gRank = "Hausierer", eRank = "Pedlar"},         	--rank 3
					 {gRank = "Krämer", eRank = "Grocer"},       		--rank 4
					 {gRank = "Kaufmann", eRank = "Merchant"},          --rank 5
					 {gRank = "Finanzier", eRank = "Financier"},        --rank 6
					 {gRank = "Patrizier", eRank = "Patrician"},     	--rank 7
					 {gRank = "Mogul", eRank = "Mogul"},           		--rank 8
					 {gRank = "Magnat", eRank = "Magnate"},    			--rank 9
					 {gRank = "Tycoon", eRank = "Tycoon"},				--rank 10
					 {gRank = "Don", eRank = "Don"}};					--rank leader
	
	GalmairRankListFemale = { {gRank = "Rumtreiberin", eRank = "Tramp"},      	--rank 1
					 {gRank = "Gehilfin", eRank = "Assistant"},          --rank 2
					 {gRank = "Hausiererin", eRank = "Pedlar"},         	--rank 3
					 {gRank = "Krämerin", eRank = "Grocer"},       		--rank 4
					 {gRank = "Kauffrau", eRank = "Merchant"},          --rank 5
					 {gRank = "Finanzier", eRank = "Financier"},        --rank 6
					 {gRank = "Patrizierin", eRank = "Patrician"},     	--rank 7
					 {gRank = "Mogulin", eRank = "Mogul"},           		--rank 8
					 {gRank = "Magnatin", eRank = "Magnate"},    			--rank 9
					 {gRank = "Tycoon", eRank = "Tycoon"},				--rank 10
					 {gRank = "Don", eRank = "Don"}};					--rank leader

	NoneRankList ={};
	NoneRankList[0] = {gRank = "Geächteter", eRank = "Outcast"};

	townRanks = {CadomyrRankListMale, RunewickRankListMale, GalmairRankListMale, CadomyrRankListFemale, RunewickRankListFemale, GalmairRankListFemale}
	townRanks[0] = NoneRankList;
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
    AddTownMainKey/ AddTownJailKey
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
	highestRank = 10;
    leaderRank = 11;

--==================================ADD NEW TOWNS HERE===============
--AddTown(TownID,TownName), IDs from 1-9
--AddAdditionalTownName(German Trigger, English Trigger)
--AddTownMainKey(TownID, KeyID, KeyQuality, KeyData)

AddTown(0,"None");
AddTown(1,"Cadomyr");
AddTownMainKey(1,2121, 333, 5030);
AddTownJailKey(12,2121, 333, 5031);
AddTown(2,"Runewick");
AddTown(3,"Galmair");


end
--==================================END OF THE EDITABLE PART====================


function getTownNameByID(TownID)
	for i=1, #(TownList) do
		if (TownList[i].townID == TownID) then
			return TownList[i].townName
		end
	end
  return "";
end

function getMembership(player)
	return player:getQuestProgress(199);
end

function getMembershipByName(player)
	return getTownNameByID(player:getQuestProgress(199));
end

function getRank(player)
	local Faction = getFaction(player);
  if (townRanks[Faction.tid] == nil) then
    return "[ERROR: no ranks for " .. Faction.tid .. "]";
  end
  if (townRanks[Faction.tid][Faction.rankTown] == nil) then
    return "[ERROR: no rank " .. Faction.rankTown .. " in town " .. Faction.tid .. "]";
  end

	if (originator:increaseAttrib("sex",0) == 0) then --male Ranks
		if player:getPlayerLanguage() == 0 then
			return townRanks[Faction.tid][Faction.rankTown].gRank;
		else
			return townRanks[Faction.tid][Faction.rankTown].eRank;
		end
	else
		if player:getPlayerLanguage() == 0 then
			return townRanks[tonumber(Faction.tid)+3][Faction.rankTown].gRank;
		else
			return townRanks[tonumber(Faction.tid)+3][Faction.rankTown].eRank;
		end
	end
end

function getRankAsNumber(player)
	rankpoints = getRankpoints(player);
	return math.floor(rankpoints/100)+1;
end

--[[
    getFaction
	Looks up to which Faction a Character belongs and checks also his rank
    @param originator -- the CharacterStruct

    @return Array - 1. a counter how often a Char changed the town, 2.the Town he belongs to ,
					3-5 the Ranks/Reputation in the Towns Cadomyr, Runewick and Galmair
]]
function getFaction(originator)

	local rankTown = getRankAsNumber(originator);
	local factionMembership = originator:getQuestProgress(199);
	local towncnt = originator:getQuestProgress(201);
	local rankpoints = getRankpoints(originator);
	if factionMembership == nil then
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
	if qpg==nil then
		originator:setQuestProgress(202,0); --set the qpg to "zero"
		qpg = 0;
	end

	return qpg;
end

--[[
    setFaction
	Saves the Factionchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Faction - the Array which includes the values to be changed

]]
function setFaction(originator,Faction)
	-------------write changes------------
	originator:setQuestProgress(199,tonumber(Faction.tid));
	originator:setQuestProgress(201,tonumber(Faction.towncnt));
	originator:setQuestProgress(202,tonumber(Faction.rankpoints));
end

function checkForRankChange(rankpoints,rank)
	local newRank = math.floor(rankpoints/100)+1
	if newRank > rank and newRank <= highestRank then
		return newRank;
	elseif newRank < rank and newRank >= citizenRank then
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
	local Faction = getFaction(originator);
	local rank = Faction.rankTown;

	if Faction.tid == 0 then --outlaw
		return;
	end

	if rankpoints < 0 then
		rankpoints = 0;
	elseif rankpoints > (highestRank-1)*100 then
		rankpoints = (highestRank-1)*100;
	end

	Faction.rankTown = checkForRankChange(rankpoints,rank);
	
	-- Factionleaders always have the leaderrank 11 and 1000 rankpoints (just to keep it consistent)
	if originator.name == "Valerio Guilianni" or originator.name == "Rosaline Edwards" or originator.name == "Elvaine Morgan" or originator.name == "Lilli" then
		rankpoints = (leaderRank-1)*100;
		Faction.rankTown = leaderRank;
		debug("Sex of "..originator.name..": "..originator:increaseAttrib("sex",0))
	end

	local townName = getTownNameByID(Faction.tid)
	
	if (originator:increaseAttrib("sex",0) == 0) then --male Ranks
		rankName = townRanks[Faction.tid][Faction.rankTown]
	else --female Ranks
		rankName = townRanks[tonumber(Faction.tid)+3][Faction.rankTown]
	end
	
	debug("Rankname: "..rankName);
	
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
    makeCharMemberOfTown
	makes the char citizen of the town//or leader if the char is a gm
    @param originator -- the PlayerStruct
    @param Factionvalues -- the List with the Factionvalues of the Char
    @param theRank(number) -- the rank the char shall get in the town
]]
function makeCharMemberOfTown(originator,thisNPC,fv,theRank,theTown)
	if theRank==leaderRank then --make char to leader of this town
		fv.tid = theTown; --make him member of this town
		fv.rankTown = leaderRank; --give him the leader rank
		fv = setFaction(originator,fv);
		return;
	elseif theRank == 0 or theTown == 0 then --becoming an outlaw
		leaveFaction(originator, fv, thisNPC)
	elseif theRank~=leaderRank then --make char to citizen
		if (fv.tid == theTown) then --already citizen
			return;
		end

		local amountToPay = 1000*(2^fv.towncnt) -- amount in coppercoins
		local GAmount, SAmount,CAmount = base.money.MoneyToCoins(amountToPay);
		
		if not base.money.CharHasMoney(originator,amountToPay) then --not enough money!
		 	gText="Ihr habt nicht genug Geld dabei! Ihr benötigt "..GAmount.." Goldstücke, "..SAmount.." Silberstücke und "..CAmount.." Kupferstücke.";
			eText="You don't have enough money with you! You'll need "..GAmount.." goldcoins, "..SAmount.." silvercoins and "..CAmount.." coppercoins.";
			outText=base.common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
		end

		originator:inform("Das Wechseln der Stadt hat "..GAmount.." Goldstücke, "..SAmount.." Silberstücke und "..CAmount.." Kupferstücke gekostet.", "It costs "..GAmount.." goldcoins, "..SAmount.." silvercoins and "..CAmount.." coppercoins to change the faction.");
		
		fv.rankpoints = 0 -- set default value for rankpoints
		fv.tid = theTown; --set new Town ID
		fv.rankTown = theRank -- set the rank of the town

		if (fv.towncnt<99) then fv.towncnt = fv.towncnt+1; end; -- raise the town counter
		setFaction(originator,fv); --write fv in Questprogress
		base.money.TakeMoneyFromChar(originator,amountToPay); --take money
	end
	return;
end

--function to leave a faction and become an outlaw.
function leaveFaction(originator, Faction, thisNPC)
	Faction.rankpoints = 0;
	Faction.rankTown = 0;
	Faction.tid = 0;

	setFaction(originator,Faction); --write fv in Questprogress

	gText="Ihr gehört nun keinem Reich mehr an. Das bedeutet das Ihr frei, aber auf Euch selbst gestellt seid. Viel Glück.";
	eText="You're now not belonging to any realm. This means you're free but also on your own. Good luck.";
	outText=base.common.GetNLS(originator,gText,eText);
    thisNPC:talk(Character.say, outText);
end
