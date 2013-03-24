require("base.common")
require("base.money")
--THE EDITABLE PART FOR NEW TOWNS IS SOME LINES BELOW

-- NOTE: town IDs for:
--- Cadomyr: 1
--- Runewick: 2
--- Galmair: 3

module("base.factions", package.seeall)

function InitFactionLists()

	--Towns--
	TownList={};

	TownMainKey={};
	TownJailKey={};

	--A list with the ranks
	CadomyrRankListMale = { {gRank = "Höriger", eRank = "Serf"},        	--rank 1
					 {gRank = "Rekrut", eRank = "Recruit"},           	--rank 2	
					 {gRank = "Page", eRank = "Page"},           	--rank 3					 
					 {gRank = "Knappe", eRank = "Squire"},           	--rank 4
					 {gRank = "Ritter", eRank = "Knight"},       --rank 5
					 {gRank = "Freiherr", eRank = "Lord"},         --rank 6
					 {gRank = "Baron", eRank = "Baron"},        		--rank 7
					 {gRank = "Graf", eRank = "Count"},     			--rank 8
					 {gRank = "Fürst", eRank = "Earl"},           	--rank 9
					 {gRank = "Herzog", eRank = "Duke"},				--rank 10					 
					 {gRank = "König", eRank = "King"}};				--rank leader
	
	CadomyrRankListFemale = { {gRank = "Hörige", eRank = "Serf"},        	--rank 1
					 {gRank = "Dienerin", eRank = "Servant"},           	--rank 2	
					 {gRank = "Magd", eRank = "Maid"},           	--rank 3
					 {gRank = "Zofe", eRank = "Abigail"},       --rank 4			 
					 {gRank = "Hofdame", eRank = "Dame"},         --rank 5
					 {gRank = "Freifrau", eRank = "Lady"},        		--rank 6					 
					 {gRank = "Baronin", eRank = "Baroness"},        		--rank 7
					 {gRank = "Gräfin", eRank = "Countess"},     			--rank 8
					 {gRank = "Fürstin", eRank = "Earl"},           	--rank 9
					 {gRank = "Herzogin", eRank = "Duchess"},				--rank 10	
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

function AddTownMainKey(TownMID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(TownMainKey,TownMID, {KeyID,KeyQuality,KeyData});
end

function AddTownJailKey(TownJID,KeyID, KeyQuality,KeyData)
	if KeyQuality==nil then KeyQuality=333; end
	table.insert(TownJailKey,TownJID, {KeyID,KeyQuality,KeyData});
end]]

if not InitFaction then
	InitFactionLists();
	InitFaction = true;
    citizenRank = 1;
	highestRank = 7;
	specialRanks = {8,9,10};
    leaderRank = 11;

--==================================ADD NEW TOWNS HERE===============
--AddTown(TownID,TownName), IDs from 1-9
--AddAdditionalTownName(German Trigger, English Trigger)

AddTown(0,"None");
AddTown(1,"Cadomyr");
--AddTownMainKey(1,2121, 333, 5030);
--AddTownJailKey(12,2121, 333, 5031);
AddTown(2,"Runewick");
AddTown(3,"Galmair");


end
--==================================END OF THE EDITABLE PART====================

--[[
	returns the name of a town
	@param TownID - the id of the town the name is looked up for

	@return - name of town
]]
function getTownNameByID(TownID)
	for i=1, #(TownList) do
		if (TownList[i].townID == TownID) then
			return TownList[i].townName
		end
	end
  return "";
end

--[[
	returns the id of the town the char is a member of
	@player - characterStruct

	@return - Id of the town
]]
function getMembership(player)
	return player:getQuestProgress(199);
end

--[[
	returns the name of the town the char is a member of
	@player - characterStruct

	@return - name of the town
]]
function getMembershipByName(player)
	return getTownNameByID(player:getQuestProgress(199));
end

--[[
	returns the current rank of a char.
	@param player - characterStruct
	
	@return - name of the rank
]]
function getRank(player)
	local Faction = getFaction(player);
	if (townRanks[Faction.tid] == nil) then
		return "[ERROR: no ranks for " .. Faction.tid .. "]";
	end
	if (townRanks[Faction.tid][Faction.rankTown] == nil) then
		return "[ERROR: no rank " .. Faction.rankTown .. " in town " .. Faction.tid .. "]";
	end

	if (player:increaseAttrib("sex",0) == 0) then --male Ranks
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

--[[
	returns the ranknumber of a players rank
	@ player - characterStruct
	
	@return - number of the rank
]]
function getRankAsNumber(player)
	local rankTown;
	local rankpoints;

	if getSpecialRank(player) ~= 0 then
		rankTown = getSpecialRank(player);
	else
		rankpoints = getRankpoints(player);
		rankTown = math.floor(rankpoints/100)+1;
	end
	return rankTown;
end

--[[
	returns the name of a specific rank
	@player - characterStruct
	@ranknumber - number of the rank, the name is needed for
	
	@return - name of the rank
]]
function getRankName(player, ranknumber)
	local Faction = getFaction(player);
	
	if ranknumber > leaderRank then
		return;
	end
	
	if (player:increaseAttrib("sex",0) == 0) then --male Ranks
		if player:getPlayerLanguage() == 0 then
			return townRanks[Faction.tid][ranknumber].gRank;
		else
			return townRanks[Faction.tid][ranknumber].eRank;
		end
	else
		if player:getPlayerLanguage() == 0 then
			return townRanks[tonumber(Faction.tid)+3][ranknumber].gRank;
		else
			return townRanks[tonumber(Faction.tid)+3][ranknumber].eRank;
		end
	end
end

--[[
    getFaction
	Looks up to which Faction a Character belongs and checks also his rank
    @param originator -- the CharacterStruct

    @return Array - 1. a counter how often a Char changed the town, 2.the Town he belongs to ,
					3-5 the Ranks/Reputation in the Towns Cadomyr, Runewick and Galmair
]]
function getFaction(originator)
	local rankTown;

	--check for special rank
	if getSpecialRank(originator) ~= 0 then
		rankTown = getSpecialRank(originator);
	else
		rankTown = getRankAsNumber(originator);
	end
	
	local factionMembership = originator:getQuestProgress(199);
	local towncnt = originator:getQuestProgress(201);
	local rankpoints = getRankpoints(originator);
	local specialRank = getSpecialRank(originator);

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
	return qpg;
end

--[[
	Returns the special rank for a player
	@param player - characterStruct
	
	@return specialRank - special rank of player
]]
function getSpecialRank(player)
	local specialRank = player:getQuestProgress(200);
	return specialRank;
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

--[[
	Sets a special rank if the rank given really is special
	@param player - characterStruct
	@param rank - new special rank (0 to take the specialness away)
	
	@return - special rank was set (true|false)
]]
function setSpecialRank(player, rank) 
	local Faction = getFaction(player);
	local rankpoints = Faction.rankpoints;
	local inform;
	
	if (rank > highestRank and rank < leaderRank) or rank == 0  then
		if rankpoints >= (highestRank-1)*100 then
			player:setQuestProgress(200, tonumber(rank));
			if rank == 0 then
				inform = base.common.GetNLS(player,"Ihr wurdet degradiert und habt nun keinen spziellen Rang mehr.","You have been demoted and have no special rank anymore.")
			else
				inform = base.common.GetNLS(player,"Ihr wurdet befördert und seid nun "..getRank(player)..".","You have been promoted and are now "..getRank(player)..".");
			end
			player:inform(inform)
			return true;
		else
			return false;
		end
	end
end


--[[
	Checks if the rank of a player has changed
	@param rankpoints - the new rankpoints
	@param rank - the current rank
]]
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
	elseif rankpoints > ((highestRank-1)*100)+99 then
		rankpoints = ((highestRank-1)*100)+99;
	end

	-- determine if player got a new rank
	if rank <= highestRank then
		Faction.rankTown = checkForRankChange(rankpoints,rank);	
	end

	-- Factionleaders always have the leaderrank 11 and 1000 rankpoints (just to keep it consistent)
	if originator.name == "Valerio Guilianni" or originator.name == "Rosaline Edwards" or originator.name == "Elvaine Morgan" then
		rankpoints = (leaderRank-1)*100;
		Faction.rankTown = leaderRank;
	end
	
	if rankpoints < base.factions.getRankpoints(originator) then
		playerText = {"sinkt.","decline"};
		informPlayerAboutRankpointchange(originator, playerText);
		setSpecialRank(originator, 0);
	else
		playerText = {"steigt.","advance"};
		informPlayerAboutRankpointchange(originator, playerText);
	end	

	-- Inform about rankchange
	if Faction.rankTown>rank then
		informPlayerAboutRankchange(originator, Faction, true)
	elseif Faction.rankTown<rank then
		informPlayerAboutRankchange(originator, Faction, false)
	end

	------save changes----------------
	originator:setQuestProgress(202,rankpoints);
end

--[[
	inform the player about a rankchange
	@param rankHigher - true|false (true = player advanced a rank)
	@param factionValues - array of getFaction(player)
]]
function informPlayerAboutRankchange(player, factionValues, rankHigher)
	-- collect all data needed for rankchange inform
	local townName = getTownNameByID(factionValues.tid)
	
	if (player:increaseAttrib("sex",0) == 0) then --male Ranks
		rankName = townRanks[factionValues.tid][factionValues.rankTown]
	else --female Ranks
		rankName = townRanks[tonumber(factionValues.tid)+3][factionValues.rankTown]
	end
	
	-- Inform about rankchange
	if rankHigher == true then
		base.common.InformNLS( player, "Du hast soeben einen neuen Rang in "..townName.." erreicht. Du bist nun "..rankName.gRank..".",
			"You reached a new town rank in "..townName..". You are now "..rankName.eRank..".");
	else
		base.common.InformNLS( player, "Durch deine ständigen Konflikte mit dem Gesetz ist dein Rang in "..townName.." um eine Stufe gesunken. Du bist nun "..rankName.gRank..".",
			"Because of your permanent conflicts with the law your rank sinks for a degree in "..townName..". You are now "..rankName.eRank.."." );
	end
end

--[[
	informs the player about a rankpointchange
	@param player - characterStruct
	@modifierTextarray - Textarray with the info if the rankpoints were raised/ declined
]]
function informPlayerAboutRankpointchange(player, modifierTextarray)
	local faction = base.factions.getMembership(player);
	local factionLeadersDE = {"Königin Rosaline Edwards", "Erzmagier Elvaine Morgan", "Don Valerio Guilianni"};
	local factionLeadersEN = {"Queen Rosaline Edwards", "Archmage Elvaine Morgan", "Don Valerio Guilianni"};

	if faction ~= 0 then
		base.common.InformNLS(player, "Dein Ansehen bei "..factionLeadersDE[faction].." "..modifierTextarray[1], "You "..modifierTextarray[2].." in "..factionLeadersEN[faction].."'s favour.");
	else
		return;
	end;
end

--[[
    makeCharMemberOfTown
	makes the char citizen of the town
    @param originator -- the characterStruct
    @param fv -- the List with the Factionvalues of the Char
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
		local germanMoney, englishMoney = base.money.MoneyToString(amountToPay);
		
		if not base.money.CharHasMoney(originator,amountToPay) then --not enough money!
		 	gText="Ihr habt nicht genug Geld dabei! Ihr benötigt"..germanMoney..".";
			eText="You don't have enough money with you! You'll need"..englishMoney..".";
			outText=base.common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
		end

		originator:inform("Das Wechseln der Stadt hat"..germanMoney.." gekostet.", "It costs"..englishMoney.." to change the faction.");
		
		fv.rankpoints = 0 -- set default value for rankpoints
		fv.tid = theTown; --set new Town ID
		fv.rankTown = theRank -- set the rank of the town

		if (fv.towncnt<99) then fv.towncnt = fv.towncnt+1; end; -- raise the town counter
		setFaction(originator,fv); --write fv in Questprogress
		base.money.TakeMoneyFromChar(originator,amountToPay); --take money
	end
	return;
end

--[[
	function to leave a faction and become an outlaw
	@param originator - characterStruct
	@param Faction - the List with the Factionvalues of the Char
	@param thisNPC - NPCStruct
]]
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
