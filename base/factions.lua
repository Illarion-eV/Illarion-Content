--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local common = require("base.common")
local money = require("base.money")
local character = require("base.character")
--THE EDITABLE PART FOR NEW TOWNS IS SOME LINES BELOW

local M = {}

-- NOTE: town IDs for:
M.cadomyr = 1
M.runewick = 2
M.galmair = 3

function InitFactionLists()

	--Towns--
	TownList={};

	TownMainKey={};
	TownJailKey={};

	--A list with the ranks
	CadomyrRankListMale = { {gRank = "Leibeigener", eRank = "Serf"},        	--rank 1
					 {gRank = "Höriger", eRank = "Bondsman"},           	--rank 2	
					 {gRank = "Diener", eRank = "Servant"},           	--rank 3					 
					 {gRank = "Freisasse", eRank = "Yeoman"},           	--rank 4
					 {gRank = "Page", eRank = "Page"},       --rank 5
					 {gRank = "Knappe", eRank = "Squire"},         --rank 6
					 {gRank = "Ritter", eRank = "Knight"},        		--rank 7
					 {gRank = "Baron", eRank = "Baron"},     			--rank 8
					 {gRank = "Graf", eRank = "Count"},           	--rank 9
					 {gRank = "Herzog", eRank = "Duke"},				--rank 10					 
					 {gRank = "König", eRank = "King"}};				--rank leader
	
	CadomyrRankListFemale = { {gRank = "Leibeigene", eRank = "Serf"},        	--rank 1
					 {gRank = "Hörige", eRank = "Bondswoman"},           	--rank 2	
					 {gRank = "Dienerin", eRank = "Servant"},           	--rank 3
					 {gRank = "Freisassin", eRank = "Yeowoman"},       --rank 4			 
					 {gRank = "Pagin", eRank = "Page"},         --rank 5
					 {gRank = "Knappin", eRank = "Squire"},        		--rank 6					 
					 {gRank = "Ritterin", eRank = "Knight"},        		--rank 7
					 {gRank = "Baroin", eRank = "Baroness"},     			--rank 8
					 {gRank = "Gräfin", eRank = "Countess"},           	--rank 9
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

	M.townRanks = {CadomyrRankListMale, RunewickRankListMale, GalmairRankListMale, CadomyrRankListFemale, RunewickRankListFemale, GalmairRankListFemale}
	M.townRanks[0] = NoneRankList;
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
	M.highestRank = 7;
	specialRanks = {8,9,10};
    leaderRank = 11;

--==================================ADD NEW TOWNS HERE===============
--AddTown(TownID,TownName), IDs from 1-9
--AddAdditionalTownName(German Trigger, English Trigger)

AddTown(0,"None");
AddTown(M.cadomyr,"Cadomyr");
--AddTownMainKey(1,2121, 333, 5030);
--AddTownJailKey(12,2121, 333, 5031);
AddTown(M.runewick,"Runewick");
AddTown(M.galmair,"Galmair");


end
--==================================END OF THE EDITABLE PART====================

--[[
	returns the name of a town
	@param TownID - the id of the town the name is looked up for

	@return - name of town
]]
function M.getTownNameByID(TownID)
	for i=1, #(TownList) do
		if (TownList[i].townID == TownID) then
			return TownList[i].townName
		end
	end
  return "";
end

function M.getTownIdByName(name)
	for i=1, #(TownList) do
		if (TownList[i].townName == name) then
			return TownList[i].townID
		end
	end
	return 0;
end

--[[
	returns the id of the town the char is a member of
	@player - characterStruct

	@return - Id of the town
]]
function M.getMembership(player)
	return player:getQuestProgress(199);
end

function M.isCadomyrCitizen(player)
    return M.getMembership(player) == M.cadomyr
end

function M.isGalmairCitizen(player)
    return M.getMembership(player) == M.galmair
end

function M.isRunewickCitizen(player)
    return M.getMembership(player) == M.runewick
end

--[[
	returns the name of the town the char is a member of
	@player - characterStruct

	@return - name of the town
]]
function M.getMembershipByName(player)
	return M.getTownNameByID(player:getQuestProgress(199));
end

--[[
	returns the current rank of a char.
	@param player - characterStruct
	
	@return - name of the rank
]]
function M.getRank(player, bothFlag)
	local Faction = M.getFaction(player);
	if (M.townRanks[Faction.tid] == nil) then
		return "[ERROR: no ranks for " .. Faction.tid .. "]";
	end
	if (M.townRanks[Faction.tid][Faction.rankTown] == nil) then
		return "[ERROR: no rank " .. Faction.rankTown .. " in town " .. Faction.tid .. "]";
	end

	if (player:increaseAttrib("sex",0) == 0) then --male Ranks
		if not bothFlag then
			if player:getPlayerLanguage() == 0 then
				return M.townRanks[Faction.tid][Faction.rankTown].gRank;
			else
				return M.townRanks[Faction.tid][Faction.rankTown].eRank;
			end
		else
			local gerRank = M.townRanks[Faction.tid][Faction.rankTown].gRank;
			local enRank = M.townRanks[Faction.tid][Faction.rankTown].eRank
			return gerRank, enRank;
		end
	else
		if not bothFlag then
			if player:getPlayerLanguage() == 0 then
				return M.townRanks[tonumber(Faction.tid)+3][Faction.rankTown].gRank;
			else
				return M.townRanks[tonumber(Faction.tid)+3][Faction.rankTown].eRank;
			end
		else
			local gerRank = M.townRanks[Faction.tid+3][Faction.rankTown].gRank;
			local enRank = M.townRanks[Faction.tid+3][Faction.rankTown].eRank;
			return gerRank, enRank;
		end
	end
end

--[[
	returns the ranknumber of a players rank
	@ player - characterStruct
	
	@return - number of the rank
]]
function M.getRankAsNumber(player)
	local rankTown;
	local rankpoints;

	if getSpecialRank(player) ~= 0 then
		rankTown = getSpecialRank(player);
	else
		rankpoints = M.getRankpoints(player);
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
function M.getRankName(player, ranknumber)
	local Faction = M.getFaction(player);
	
	if ranknumber > leaderRank then
		return;
	end
	
	if (player:increaseAttrib("sex",0) == 0) then --male Ranks
		if player:getPlayerLanguage() == 0 then
			return M.townRanks[Faction.tid][ranknumber].gRank;
		else
			return M.townRanks[Faction.tid][ranknumber].eRank;
		end
	else
		if player:getPlayerLanguage() == 0 then
			return M.townRanks[tonumber(Faction.tid)+3][ranknumber].gRank;
		else
			return M.townRanks[tonumber(Faction.tid)+3][ranknumber].eRank;
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
function M.getFaction(originator)
	local rankTown;

	--check for special rank
	if getSpecialRank(originator) ~= 0 then
		rankTown = getSpecialRank(originator);
	else
		rankTown = M.getRankAsNumber(originator);
	end
	
	local factionMembership = originator:getQuestProgress(199);
	local towncnt = originator:getQuestProgress(201);
	local rankpoints = M.getRankpoints(originator);
	local specialRank = getSpecialRank(originator);

	return { towncnt = towncnt, tid = factionMembership, rankTown = rankTown, rankpoints = rankpoints};
end

--[[
    getRankpoints
	Looks up how much Rankpoints a Character has
    @param originator -- the CharacterStruct

    @return qpg - rankpoints in realm
]]
function M.getRankpoints(originator)
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
function M.setFaction(originator,Faction)
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
function M.setSpecialRank(player, rank) 
	local Faction = M.getFaction(player);
	local rankpoints = Faction.rankpoints;
	local inform;
	
	if (rank > M.highestRank and rank < leaderRank) or rank == 0  then
		if rankpoints >= (M.highestRank-1)*100 then
			player:setQuestProgress(200, tonumber(rank));
			if rank == 0 then
				inform = common.GetNLS(player,"Ihr wurdet degradiert und habt nun keinen spziellen Rang mehr.","You have been demoted and have no special rank anymore.")
			else
				inform = common.GetNLS(player,"Ihr wurdet befördert und seid nun "..M.getRank(player)..".","You have been promoted and are now "..M.getRank(player)..".");
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
	if newRank > rank and newRank <= M.highestRank then
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
function M.setRankpoints(originator, rankpoints)
	local Faction = M.getFaction(originator);
	local rank = Faction.rankTown;

	if Faction.tid == 0 then --outlaw
		return;
	end

	if rankpoints < 0 then
		rankpoints = 0;
	elseif rankpoints > ((M.highestRank-1)*100)+99 then
		rankpoints = ((M.highestRank-1)*100)+99;
	end

	-- determine if player got a new rank
	if rank <= M.highestRank then
		Faction.rankTown = checkForRankChange(rankpoints,rank);	
	end

	-- Factionleaders always have the leaderrank 11 and 1000 rankpoints (just to keep it consistent)
	if originator.name == "Valerio Guilianni" or originator.name == "Rosaline Edwards" or originator.name == "Elvaine Morgan" then
		rankpoints = (leaderRank-1)*100;
		Faction.rankTown = leaderRank;
	end
	
	if rankpoints < M.getRankpoints(originator) then
		playerText = {"sinkt.","decline"};
		informPlayerAboutRankpointchange(originator, playerText);
		if getSpecialRank(originator) ~= 0 then
			M.setSpecialRank(originator, 0);
		end
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
	@param factionValues - array of M.getFaction(player)
]]
function informPlayerAboutRankchange(player, factionValues, rankHigher)
	-- collect all data needed for rankchange inform
	local townName = M.getTownNameByID(factionValues.tid)
	
	if (player:increaseAttrib("sex",0) == 0) then --male Ranks
		rankName = M.townRanks[factionValues.tid][factionValues.rankTown]
	else --female Ranks
		rankName = M.townRanks[tonumber(factionValues.tid)+3][factionValues.rankTown]
	end
	
	-- Inform about rankchange
	if rankHigher == true then
		common.InformNLS( player, "Du hast soeben einen neuen Rang in "..townName.." erreicht. Du bist nun "..rankName.gRank..".",
			"You reached a new town rank in "..townName..". You are now "..rankName.eRank..".");
	else
		common.InformNLS( player, "Durch deine ständigen Konflikte mit dem Gesetz ist dein Rang in "..townName.." um eine Stufe gesunken. Du bist nun "..rankName.gRank..".",
			"Because of your permanent conflicts with the law your rank sinks for a degree in "..townName..". You are now "..rankName.eRank.."." );
	end
end

--[[
	informs the player about a rankpointchange
	@param player - characterStruct
	@modifierTextarray - Textarray with the info if the rankpoints were raised/ declined
]]
function informPlayerAboutRankpointchange(player, modifierTextarray)
	local faction = M.getMembership(player);
	local factionLeadersDE = {"Königin Rosaline Edwards", "Erzmagier Elvaine Morgan", "Don Valerio Guilianni"};
	local factionLeadersEN = {"Queen Rosaline Edwards", "Archmage Elvaine Morgan", "Don Valerio Guilianni"};

	if faction ~= 0 then
		common.InformNLS(player, "Dein Ansehen bei "..factionLeadersDE[faction].." "..modifierTextarray[1], "You "..modifierTextarray[2].." in "..factionLeadersEN[faction].."'s favour.");
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
function M.makeCharMemberOfTown(originator,thisNPC,fv,theRank,theTown)
	if theRank==leaderRank then --make char to leader of this town
		fv.tid = theTown; --make him member of this town
		fv.rankTown = leaderRank; --give him the leader rank
		fv = M.setFaction(originator,fv);
		return;
	elseif theRank == 0 or theTown == 0 then --becoming an outlaw
		leaveFaction(originator, fv, thisNPC)
	elseif theRank~=leaderRank then --make char to citizen
		if (fv.tid == theTown) then --already citizen
			return;
		end

		local amountToPay = 1000*(2^fv.towncnt) -- amount in coppercoins
		local GAmount, SAmount,CAmount = money.MoneyToCoins(amountToPay);
		local germanMoney, englishMoney = money.MoneyToString(amountToPay);
		
		if not money.CharHasMoney(originator,amountToPay) then --not enough money!
		 	gText="Ihr habt nicht genug Geld dabei! Ihr benötigt"..germanMoney..".";
			eText="You don't have enough money with you! You'll need"..englishMoney..".";
			outText=common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
			return;
		end

		originator:inform("Das Wechseln der Stadt hat"..germanMoney.." gekostet.", "It costs"..englishMoney.." to change the faction.");
		
		fv.rankpoints = 0 -- set default value for rankpoints
		fv.tid = theTown; --set new Town ID
		fv.rankTown = theRank -- set the rank of the town

		if (fv.towncnt<99) then fv.towncnt = fv.towncnt+1; end; -- raise the town counter
		M.setFaction(originator,fv); --write fv in Questprogress
		money.TakeMoneyFromChar(originator,amountToPay); --take money
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

	M.setFaction(originator,Faction); --write fv in Questprogress

	gText="Ihr gehört nun keinem Reich mehr an. Das bedeutet das Ihr frei, aber auf Euch selbst gestellt seid. Viel Glück.";
	eText="You're now not belonging to any realm. This means you're free but also on your own. Good luck.";
	outText=common.GetNLS(originator,gText,eText);
    thisNPC:talk(Character.say, outText);
end

--- Relations
--
-- The following functions allow checking and controlling the relations between factions.

-- The following constants define the different relations modes.
M.RELATION_SELF = -1;		    -- This is the constant returned in case the relation of a faction to itself is checked.
M.RELATION_FRIENDLY = 1;      -- The factions have a friendly relationship.
M.RELATION_NEUTRAL = 0;		-- The factions have a neutral relationship, guards will only process the members of this faction in case they appear hostile.
M.RELATION_HOSTILE = 2;		-- The factions have a hostile relationship. The guards will ensure that the members of this faction stay out of the home town.
M.RELATION_AGGRESSIVE = 3;	-- The factions have a aggressive relationship. The guards will engage the members of this faction on sight.
M.RELATION_ACCEPTED = 4;		-- This is a special relationship that only applies to individual players. It causes the total relationship to the town to be neutral, even if the relationship of the town and the player faction is hostile or aggressive

--- Get the relation of a town faction to a specific player. This functions takes both the relation of the town faction and the player faction and the
--- relation of the town faction to the individual player into consideration. Administrators are always considered to be friendly, because they are
--- very friendly persons in general.
--
-- @param player the player
-- @param townFaction the faction of the town
-- @return int the relationship constant for the relationship between the town faction and the player
function M.getPlayerRelation(player, townFaction)
	if player:isAdmin() then
		return M.RELATION_FRIENDLY;
	end
	
	local individualRelation = getIndividualPlayerRelation(player, townFaction);	
    local playerFaction = M.getFaction(player).tid;
	local factionRelation = getFactionRelation(townFaction, playerFaction);
	
	if (individualRelation == M.RELATION_ACCEPTED) then
		return (factionRelation == M.RELATION_FRIENDLY) and M.RELATION_FRIENDLY or M.RELATION_NEUTRAL;
	end
	
	if (factionRelation == M.RELATION_AGGRESSIVE) then
		return M.RELATION_AGGRESSIVE;
	elseif (factionRelation == M.RELATION_HOSTILE) then
		if (individualRelation == M.RELATION_AGGRESSIVE) then
			return M.RELATION_AGGRESSIVE;
		else
			return M.RELATION_HOSTILE;
		end
	elseif (factionRelation == M.RELATION_NEUTRAL) then
		if (individualRelation == M.RELATION_AGGRESSIVE) or (individualRelation == M.RELATION_HOSTILE) then
			return individualRelation;
		else
			return M.RELATION_NEUTRAL;
		end
	else
		return individualRelation;
	end
end

--- Get the relationship between two factions. The looking direction for the relationship is always from the town faction to the player faction.
--- So if the towns faction is hostile to the players faction and the players faction is neutral to the towns faction the returned result will be hostile.
--
-- @param townFaction the faction of the town that is checked
-- @param playerFaction the faction of the player that is checked
-- @return int the relationship constant for the relation of the towns faction to the player faction
function getFactionRelation(townFaction, playerFaction)
	if (townFaction == playerFaction) then
		return M.RELATION_SELF;
	end
	
	local found, relation = ScriptVars:find("Mode_"..tostring(townFaction));
	if not found then
		return M.RELATION_HOSTILE;
	end
	relation = relation % (10 ^ (playerFaction + 1));
	relation = math.floor(relation / (10 ^ playerFaction));
	
	if (relation ~= M.RELATION_FRIENDLY) and (relation ~= M.RELATION_NEUTRAL) and (relation ~= M.RELATION_AGGRESSIVE) then
		return M.RELATION_HOSTILE; 
	end
	return relation;
end

--- Set the relationship of a faction to another faction. The faction set is the faction from the town faction to the player faction.
--
-- @param townFaction the town faction
-- @param playerFaction the player faction
-- @param newRelation the new relationship (M.RELATION_FRIENDLY,M.RELATION_NEUTRAL,M.RELATION_HOSTILE,M.RELATION_AGGRESSIVE)
function setFactionRelation(townFaction, playerFaction, newRelation)
	if (newRelation ~= M.RELATION_FRIENDLY) and (newRelation ~= M.RELATION_NEUTRAL) and (newRelation ~= M.RELATION_HOSTILE) and (newRelation ~= M.RELATION_AGGRESSIVE) then
		debug("[Error] Applied illegal relationship mode: "..tostring(newRelation));
		return;
	end
	if (townFaction == playerFaction) then
		return;
	end
	
	-- get mode for all factions
	local found, relationships = ScriptVars:find("Mode_"..townFaction);
	local oldRelation = 0;
	if not found then
		ScriptVars:set("Mode_".. townFaction, 2222); -- hostile to everyone
		relationships = 2222;
		oldRelation = 2;
	else
		-- calculate the old mode for the player faction
		oldRelation = relationships % (10 ^ (playerFaction + 1));
		oldRelation = math.floor(oldRelation / (10 ^ playerFaction));
	end
	
	if (oldRelation == newRelation) then
		return;
	end;
	
	relationships = relationships - (oldRelation * (10 ^ playerFaction));
	relationships = relationships + (newRelation * (10 ^ playerFaction));
	
	relationships = math.max(0, math.min(9999, relationships)); -- must not be negative & exceed 9999 (3 towns + outcasts)
	ScriptVars:set("Mode_"..townFaction, relationships);
end

--- Get the individual relationship of a player to a faction. These overwriting values are time limited. 
--
-- @param player the player who's relation is queried
-- @param townFaction the faction 
-- @return int the relationship constant for the relation of the faction to the individual player
function getIndividualPlayerRelation(player, townFaction) 
	local relationId = -1;
	local daysId = -1;
	if (townFaction == M.cadomyr) then
		relationId = 191;
		daysId = 192;
	elseif (townFaction == M.runewick) then
		relationId = 193;
		daysId = 194;
	elseif (townFaction == M.galmair) then
		relationId = 195;
		daysId = 196;
	end
	
	if (relationId < 0) or (daysId < 0) then
		return M.RELATION_NEUTRAL;
	end
	
    local relation = player:getQuestProgress(relationId);
	
	if (relation == M.RELATION_NEUTRAL) then
		return M.RELATION_NEUTRAL;
	end
	
	local days, setTime = player:getQuestProgress(daysId);
	
	if (relation ~= M.RELATION_FRIENDLY) and (relation ~= M.RELATION_NEUTRAL) and (relation ~= M.RELATION_AGGRESSIVE) and (relation ~= M.RELATION_ACCEPTED) and (relation ~= M.RELATION_HOSTILE) then
		debug("[Error] ".. character.LogText(player).." got illegal value for temporary faction relation. Resetting.");
		player:setQuestProgress(relationId, M.RELATION_NEUTRAL);
		return M.RELATION_NEUTRAL;
	end	
	
	if (days > 0) then 
	    local daysInSec = (days / 3) * 24 * 60 * 60;
	    if ((world:getTime("unix") - setTime) >= daysInSec) then
		    return M.RELATION_NEUTRAL;
		end	
	end	
	
	return relation;
end

--- Apply a individual relation of a town faction to a player.
--
-- @param player the player to receives the new relationship
-- @param townFaction the faction that is effected
-- @param newRelation the new relation value
-- @param the time limited in days for this change to wear off
function M.setIndividualPlayerRelation(player, townFaction, newRelation, timeLimitInDays) 
	if (newRelation ~= M.RELATION_FRIENDLY) and (newRelation ~= M.RELATION_NEUTRAL) and (newRelation ~= M.RELATION_HOSTILE) and (newRelation ~= M.RELATION_AGGRESSIVE) and (newRelation ~= M.RELATION_ACCEPTED) then
		debug("[Error] Applied illegal relationship mode: "..tostring(newRelation));
		return;
	end
	
	local relationId = -1;
	local daysId = -1;
	if (townFaction == M.cadomyr) then
		relationId = 191;
		daysId = 192;
	elseif (townFaction == M.runewick) then
		relationId = 193;
		daysId = 194;
	elseif (townFaction == M.galmair) then
		relationId = 195;
		daysId = 196;
	end
	if (relationId < 0) or (daysId < 0) then
		debug("[Error] Can't apply individual relationship for unknown town faction: "..tostring(townFaction));
		return;
	end
	
	player:setQuestProgress(relationId, newRelation);
	if (newRelation == M.RELATION_NEUTRAL) then
		player:setQuestProgress(daysId, 0);
	else
		player:setQuestProgress(daysId, timeLimitInDays);
	end
end

return M
