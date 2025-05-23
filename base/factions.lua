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

local M = {}

-- NOTE: town IDs for:
M.outlaw = 0
M.cadomyr = 1
M.runewick = 2
M.galmair = 3

M.ledgers = {
    {pos = position(947, 785, 1), town = "Runewick", tid = M.runewick},
    {pos = position(106, 554, 0), town = "Cadomyr", tid = M.cadomyr},
    {pos = position(404, 264, 1), town = "Galmair", tid = M.galmair},
}

M.townManagmentItemPos = {position(116, 527, 0), position(951, 786, 1), position(344, 223, 0)}

--Towns--
local TownList = {}

--A list with the ranks
M.CadomyrRankListMale = {
    {gRank = "Leibeigener", eRank = "Serf"},            --rank 1
    {gRank = "H�riger", eRank = "Bondsman"},               --rank 2
    {gRank = "Diener", eRank = "Servant"},               --rank 3
    {gRank = "Freisasse", eRank = "Yeoman"},               --rank 4
    {gRank = "Page", eRank = "Page"},       --rank 5
    {gRank = "Knappe", eRank = "Squire"},         --rank 6
    {gRank = "Ritter", eRank = "Knight"},                --rank 7
    {gRank = "Baron", eRank = "Baron"},                 --rank 8
    {gRank = "Graf", eRank = "Count"},               --rank 9
    {gRank = "Herzog", eRank = "Duke"},                --rank 10
    {gRank = "K�nig", eRank = "King"}};                --rank leader

local CadomyrRankListFemale = {
    {gRank = "Leibeigene", eRank = "Serf"},            --rank 1
    {gRank = "H�rige", eRank = "Bondswoman"},               --rank 2
    {gRank = "Dienerin", eRank = "Servant"},               --rank 3
    {gRank = "Freisassin", eRank = "Yeowoman"},       --rank 4
    {gRank = "Pagin", eRank = "Page"},         --rank 5
    {gRank = "Knappin", eRank = "Squire"},                --rank 6
    {gRank = "Ritterin", eRank = "Knight"},                --rank 7
    {gRank = "Baronin", eRank = "Baroness"},                 --rank 8
    {gRank = "Gr�fin", eRank = "Countess"},               --rank 9
    {gRank = "Herzogin", eRank = "Duchess"},                --rank 10
    {gRank = "K�nigin", eRank = "Queen"}};                --rank leader

M.RunewickRankListMale = {
    {gRank = "Novize", eRank = "Novice"},            --rank 1
    {gRank = "Anw�rter", eRank = "Apprentice"},           --rank 2
    {gRank = "Student", eRank = "Student"},             --rank 3
    {gRank = "Gelehrter", eRank = "Scholar"},           --rank 4
    {gRank = "Magister", eRank = "Master"},              --rank 5
    {gRank = "Doktor", eRank = "Doctor"},                 --rank 6
    {gRank = "Dozent", eRank = "Docent"},                 --rank 7
    {gRank = "Professor", eRank = "Professor"},        --rank 8
    {gRank = "Dekan", eRank = "Dean"},                    --rank 9
    {gRank = "Rektor", eRank = "Rector"},                --rank 10
    {gRank = "Erzmagier", eRank = "Archmage"}};        --rank leader

local RunewickRankListFemale = {
    {gRank = "Novizin", eRank = "Novice"},            --rank 1
    {gRank = "Anw�rterin", eRank = "Apprentice"},           --rank 2
    {gRank = "Studentin", eRank = "Student"},             --rank 3
    {gRank = "Gelehrte", eRank = "Scholar"},           --rank 4
    {gRank = "Magister", eRank = "Master"},              --rank 5
    {gRank = "Doktorin", eRank = "Doctor"},                 --rank 6
    {gRank = "Dozentin", eRank = "Docent"},                 --rank 7
    {gRank = "Professorin", eRank = "Professor"},        --rank 8
    {gRank = "Dekanin", eRank = "Dean"},                    --rank 9
    {gRank = "Rektorin", eRank = "Rector"},                --rank 10
    {gRank = "Erzmagierin", eRank = "Archmage"}};        --rank leader

M.GalmairRankListMale = {
    {gRank = "Rumtreiber", eRank = "Tramp"},          --rank 1
    {gRank = "Gehilfe", eRank = "Assistant"},          --rank 2
    {gRank = "Hausierer", eRank = "Pedlar"},             --rank 3
    {gRank = "Kr�mer", eRank = "Grocer"},               --rank 4
    {gRank = "Kaufmann", eRank = "Merchant"},          --rank 5
    {gRank = "Finanzier", eRank = "Financier"},        --rank 6
    {gRank = "Patrizier", eRank = "Patrician"},         --rank 7
    {gRank = "Mogul", eRank = "Mogul"},                   --rank 8
    {gRank = "Magnat", eRank = "Magnate"},                --rank 9
    {gRank = "Tycoon", eRank = "Tycoon"},                --rank 10
    {gRank = "Don", eRank = "Don"}};                    --rank leader

local GalmairRankListFemale = {
    {gRank = "Rumtreiberin", eRank = "Tramp"},          --rank 1
    {gRank = "Gehilfin", eRank = "Assistant"},          --rank 2
    {gRank = "Hausiererin", eRank = "Pedlar"},             --rank 3
    {gRank = "Kr�merin", eRank = "Grocer"},               --rank 4
    {gRank = "Kauffrau", eRank = "Merchant"},          --rank 5
    {gRank = "Finanzier", eRank = "Financier"},        --rank 6
    {gRank = "Patrizierin", eRank = "Patrician"},         --rank 7
    {gRank = "Mogulin", eRank = "Mogul"},                   --rank 8
    {gRank = "Magnatin", eRank = "Magnate"},                --rank 9
    {gRank = "Tycoon", eRank = "Tycoon"},                --rank 10
    {gRank = "Don", eRank = "Don"}};                    --rank leader

local NoneRankList ={};
NoneRankList[0] = {gRank = "Ge�chteter", eRank = "Outcast"};

local function addOrOverwriteEntry(user, book, entryNumber)

    local rankNumber = M.getRankAsNumber(user)

    book:setData("entry"..entryNumber.."ID", tostring(user.id))
    book:setData("entry"..entryNumber.."name", tostring(user.name))
    book:setData("entry"..entryNumber.."rank", tostring(rankNumber))
    world:changeItem(book)
end

function M.deleteEntry(user, tid)

    for _, ledger in pairs(M.ledgers) do

        local bookPosition = ledger.pos
        local book = world:getItemOnField(bookPosition)
        if not book or book.id ~= 1060 then
            debug("Error, failed to find book at "..tostring(bookPosition))
            return
        end

        local entries = book:getData("ledgerEntries")

        if not common.IsNilOrEmpty(entries) and tonumber(entries) > 0 then
            for i = 1, entries do
                if tonumber(book:getData("entry"..i.."ID")) == user.id and ledger.tid ~= tid then -- Entry for character in a town they dont belong in found
                    book:setData("entry"..i.."ID", tostring(1))
                    book:setData("entry"..i.."name", "Gibberish12134134hf") --We set it to gibberish and id of 1 so it wont match and therefore gets cleaned up next time someone accesses the ledger as if it were a deleted character
                    world:changeItem(book)
                end
            end
        end
    end
end

function M.updateEntry(user)

    local tid = user:getQuestProgress(199)

    M.deleteEntry(user, tid) --Deletes entries for character if it is a town they do not belong in

    if tid == M.outlaw then
        return --No setting new entry if outlawed
    end

    local bookPosition

    for _, ledger in pairs(M.ledgers) do
        if ledger.tid == tid then
            bookPosition = ledger.pos
        end
    end

    if not bookPosition then
        debug("Error: Failed to find book position")
        return
    end

    local book = world:getItemOnField(bookPosition)

    if book.id ~= 1060 then
        debug("Error: Book not found")
        return
    end

    local entries = tonumber(book:getData("ledgerEntries"))

    if common.IsNilOrEmpty(entries) then --First time it is ever used it will be empty, so we just add this first entry
        book:setData("ledgerEntries", tostring(1))
        addOrOverwriteEntry(user, book, 1)
        return
    end

    for i = 1, entries do
        if tonumber(book:getData("entry"..i.."ID")) == user.id then -- We check if an entry exists already for the person
            addOrOverwriteEntry(user, book, i)
            return
        end
    end

    book:setData("ledgerEntries", tostring(entries+1)) -- No entry exists for the person so we add a new one
    addOrOverwriteEntry(user, book, entries+1)

end

local ticksPerRank = {
    -- The last number in the ticks calculation is what is actually necessary to rank up, the rest is just what you've accumulated from former ranks
    -- I opted to keep them like this just for easier readability rather than adding them up.
    {rank = 1, ticks = 0}, -- You start at this rank when joining a town
    {rank = 2, ticks = 54}, -- 4.5 hours. New player quests in town reward up to 39 ticks, allowing you to get from rank 1 to rank 2.
    {rank = 3, ticks = 54+108}, -- previous accumulation + 9 hours
    {rank = 4, ticks = 54+108+216}, -- previous accumulation + 18 hours
    {rank = 5, ticks = 54+108+216+432}, -- previous accumulation + 36 hours
    {rank = 6, ticks = 54+108+216+432+864}, -- previous accumulation + 72 hours
    {rank = 7, ticks = 54+108+216+432+864+1728}, -- previous accumulation + 144 hours

    -- In total you need to RP with other players from your realm for 283.5 hours which is just below the time it takes to get two skills to level 100
    -- 279 hours if you do the new player quests in the realm.
}

M.ticksPerRank = ticksPerRank

--[[
    Uses the accumulated rank ticks to find what rank a character is

    @param rankTicks - The amount of 5 min ticks of accumulated RP with other people of the characters own realm that has been accumulated

    @return - number of the rank

]]

M.rankTrackerQuestID = 394

local transferTrackerQuestID = 395


function M.oneTimeConversionOfReputationPointsToRankPoints(player)
    -- First log in after the update reputation and rank points will be identical, for old players that had reputation points before the social rank points were made a thing.
    -- After this first log in, these two values will be tracked separately once more with reputation points gained from interacting with any other player and rank points only by interacting with fellow citizen.

    local transferHappened = player:getQuestProgress(transferTrackerQuestID)

    if transferHappened == 1 then
        return
    end

    player:setQuestProgress(transferTrackerQuestID, 1)

    local reputationPoints = player:getQuestProgress(393) --393 is the reputation tracking quest ID

    player:setQuestProgress(M.rankTrackerQuestID, reputationPoints)

    if reputationPoints > 0 then

        log("One time conversion of reputation points to rank points took place for player "..player.name.."("..player.id.."). New value for both: "..reputationPoints)
    end

end

function M.convertTicksToRankNumber(rankTicks)

    local currentRank = 0

    for _, rank in pairs(ticksPerRank) do
        if rank.ticks <= rankTicks and rank.rank > currentRank then -- the user has qualified for this rank or higher
            currentRank = rank.rank
        end
    end

    return currentRank

end

function M.sendRankUpmessage(user, totalRankTime)

    local faction = M.getMembership(user)
    local factionLeadersDE = {"K�nigin Rosaline Edwards", "Erzmagier Elvaine Morgan", "Don Valerio Guilianni"}
    local factionLeadersEN = {"Queen Rosaline Edwards", "Archmage Elvaine Morgan", "Don Valerio Guilianni"}

    if M.isOutlaw(user) then
        return
    end

    local rankNumber = M.convertTicksToRankNumber(totalRankTime)

    local rankNameDe, rankNameEn = M.getRankName(user, rankNumber, true)

    user:inform("W�hrend du dir unter deinen Mitb�rgern einen Namen machst, hat "..factionLeadersDE[faction].." Notiz von dir genommen. Du wurdest zum/zur "..rankNameDe.." bef�rdert.", "As you make a name for yourself among your fellow citizen, "..factionLeadersEN[faction].." has taken notice. You have been promoted to "..rankNameEn..".")

    M.updateEntry(user)

    --send a message taht they ranked up to the totalRankTime rank
end

--[[
    Returns the special rank for a player
    @param player - characterStruct

    @return specialRank - special rank of player
]]
local function getSpecialRank(player)
    local specialRank = player:getQuestProgress(200)
    return specialRank
end

--[[
    returns the ranknumber of a players rank
    @ player - characterStruct

    @return - number of the rank
]]
function M.getRankAsNumber(player)

    if getSpecialRank(player) ~= 0 then
        return getSpecialRank(player)
    else
        local rankTicks = player:getQuestProgress(M.rankTrackerQuestID)
        return M.convertTicksToRankNumber(rankTicks)
    end

end

M.townRanks = {M.CadomyrRankListMale, M.RunewickRankListMale, M.GalmairRankListMale, CadomyrRankListFemale, RunewickRankListFemale, GalmairRankListFemale}
M.townRanks[0] = NoneRankList;

--[[
    AddTown
    Add a Town to the Faction System(be carefull, adding a new town needs further changes in the whole script!)
    @param TownID        - the ID of the town(1-9 allowed)
    @param TownName        - the Townname
]]
local function AddTown(TownID, TownName)
    table.insert(TownList,{townID=TownID, townName=TownName})
end

M.highestRank = 7
local leaderRank = 11

AddTown(0,"None")
AddTown(M.cadomyr,"Cadomyr")
AddTown(M.runewick,"Runewick")
AddTown(M.galmair,"Galmair")

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

    return ""
end

function M.getTownIdByName(name)

    for i=1, #(TownList) do
        if (TownList[i].townName == name) then
            return TownList[i].townID
        end
    end

    return 0
end

--[[
    returns the id of the town the char is a member of
    @player - characterStruct

    @return - Id of the town
]]
function M.getMembership(player)
    return player:getQuestProgress(199)
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

function M.isOutlaw(player)
    return M.getMembership(player) == M.outlaw
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

function M.getRankNamesWithoutPlayer(tid, ranknumber)

    if ranknumber > leaderRank then
        return
    end

    return M.townRanks[tid][ranknumber].gRank, M.townRanks[tid][ranknumber].eRank

end


--[[
    returns the name of a specific rank
    @player - characterStruct
    @ranknumber - number of the rank, the name is needed for

    @return - name of the rank
]]
function M.getRankName(player, ranknumber, bothFlag)
    local Faction = M.getFaction(player)

    if ranknumber > leaderRank then
        return
    end

    if (player:increaseAttrib("sex",0) == 0) then --male Ranks
        if bothFlag then
            return M.townRanks[Faction.tid][ranknumber].gRank, M.townRanks[Faction.tid][ranknumber].eRank
        elseif player:getPlayerLanguage() == 0 then
            return M.townRanks[Faction.tid][ranknumber].gRank
        else
            return M.townRanks[Faction.tid][ranknumber].eRank
        end
    else
        if bothFlag then
            return M.townRanks[tonumber(Faction.tid)+3][ranknumber].gRank, M.townRanks[tonumber(Faction.tid)+3][ranknumber].eRank
        elseif player:getPlayerLanguage() == 0 then
            return M.townRanks[tonumber(Faction.tid)+3][ranknumber].gRank
        else
            return M.townRanks[tonumber(Faction.tid)+3][ranknumber].eRank
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
    local rankTown

    --check for special rank
    if getSpecialRank(originator) ~= 0 then
        rankTown = getSpecialRank(originator)
    else
        rankTown = M.getRankAsNumber(originator)
    end

    local factionMembership = originator:getQuestProgress(199)
    local towncnt = originator:getQuestProgress(201)
    local rankpoints = M.getRankpoints(originator)

    return { towncnt = towncnt, tid = factionMembership, rankTown = rankTown, rankpoints = rankpoints}
end

--[[
    getRankpoints
    Looks up how much Rankpoints a Character has
    @param originator -- the CharacterStruct

    @return qpg - rankpoints in realm
]]
function M.getRankpoints(originator)
    local qpg = originator:getQuestProgress(M.rankTrackerQuestID) -- rankpoints
    return qpg
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
    originator:setQuestProgress(M.rankTrackerQuestID,tonumber(Faction.rankpoints));
end

--[[
    Sets a special rank if the rank given really is special
    @param player - characterStruct
    @param rank - new special rank (0 to take the specialness away)

    @return - special rank was set (true|false)
]]
function M.setSpecialRank(player, rank)

    local inform

    if (rank > M.highestRank and rank < leaderRank) or rank == 0  then
        player:setQuestProgress(200, tonumber(rank))
        if rank == 0 then
            inform = common.GetNLS(player,"Du wurdest degradiert und hast nun keinen speziellen Rang mehr.","You have been demoted and have no special rank anymore.")
        else
            inform = common.GetNLS(player,"Du wurdest bef�rdert und bist nun "..M.getRank(player)..".","You have been promoted and are now "..M.getRank(player)..".")
        end
        player:inform(inform)
        return true
    else
        return false
    end

end



--[[
    inform the player about a rankchange
    @param rankHigher - true|false (true = player advanced a rank)
    @param factionValues - array of M.getFaction(player)
]]

local function informPlayerAboutRankchange(player, factionValues, rankHigher)
    -- collect all data needed for rankchange inform
    local townName = M.getTownNameByID(factionValues.tid)

    local rankName
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
        common.InformNLS( player, "Durch deine st�ndigen Konflikte mit dem Gesetz ist dein Rang in "..townName.." um eine Stufe gesunken. Du bist nun "..rankName.gRank..".",
            "Because of your permanent conflicts with the law your rank sinks for a degree in "..townName..". You are now "..rankName.eRank.."." );
    end
end

--[[
    informs the player about a rankpointchange
    @param player - characterStruct
    @modifierTextarray - Textarray with the info if the rankpoints were raised/ declined
]]
local function informPlayerAboutRankpointchange(player, modifierTextarray)
    local faction = M.getMembership(player);
    local factionLeadersDE = {"K�nigin Rosaline Edwards", "Erzmagier Elvaine Morgan", "Don Valerio Guilianni"}
    local factionLeadersEN = {"Queen Rosaline Edwards'", "Archmage Elvaine Morgan's", "Don Valerio Guilianni's"}

    if faction ~= 0 then
        common.InformNLS(player, "Dein Ansehen bei "..factionLeadersDE[faction].." "..modifierTextarray[1], "You "..modifierTextarray[2].." in "..factionLeadersEN[faction].." favour.");
    else
        return
    end
end

--[[
    setRankpoints
    Saves the Factionchanges of the Char//Guildchanges of the Char
    @param CharacterStruct - The character who gets the new Questprogress
    @param Rankpoints - the value Rankpoints

]]
function M.setRankpoints(originator, rankpoints)

    local Faction = M.getFaction(originator)
    local oldRank = M.getRankAsNumber(originator)
    local newRank = M.convertTicksToRankNumber(rankpoints)

    if Faction.tid == 0 then --outlaw
        return
    end

    if rankpoints < M.getRankpoints(originator) then
        local playerText = {"sinkt.","decline"}
        informPlayerAboutRankpointchange(originator, playerText)
        if rankpoints == 0 and getSpecialRank(originator) ~= 0 then -- It is a citizenship change so we remove the special rank, if not 0 then it would be a negative rank point quest
            M.setSpecialRank(originator, 0)
        end
    elseif rankpoints > M.getRankpoints(originator) then
        local playerText = {"steigt.","advance"}
        informPlayerAboutRankpointchange(originator, playerText)
    end

    ------save changes----------------
    originator:setQuestProgress(M.rankTrackerQuestID,rankpoints)

    Faction = M.getFaction(originator)

    -- Inform about rankchange
    if newRank>oldRank then
        informPlayerAboutRankchange(originator, Faction, true)
    elseif newRank<oldRank then
        informPlayerAboutRankchange(originator, Faction, false)
    end
end

--[[
    function to leave a faction and become an outlaw
    @param originator - characterStruct
    @param Faction - the List with the Factionvalues of the Char
    @param thisNPC - NPCStruct
]]
local function leaveFaction(originator, Faction, thisNPC)
    Faction.rankpoints = 0;
    Faction.rankTown = 0;
    Faction.tid = 0;

    M.setFaction(originator,Faction); --write fv in Questprogress

    originator:setQuestProgress(200, 0) -- Remove leadership special rank in case they were a leader of the town they are leaving

    M.updateEntry(originator)

    local gText="Du geh�rt nun keinem Reich mehr an. Das bedeutet, dass du frei, aber auf dich selbst gestellt seid. Viel Gl�ck.";
    local eText="You're now not belonging to any realm. This means you're free but also on your own. Good luck.";
    local outText=common.GetNLS(originator,gText,eText);
    thisNPC:talk(Character.say, outText);
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
        M.setFaction(originator,fv);
        return;
    elseif theRank == 0 or theTown == 0 then --becoming an outlaw
        leaveFaction(originator, fv, thisNPC)
    elseif theRank~=leaderRank then --make char to citizen
        if (fv.tid == theTown) then --already citizen
            return;
        end

        local amountToPay = 1000*(2^fv.towncnt) -- amount in copper coins
        local germanMoney, englishMoney = money.MoneyToString(amountToPay);

        if not money.CharHasMoney(originator,amountToPay) then --not enough money!
            local gText="Du hast nicht genug Geld dabei! Du ben�tigst"..germanMoney..".";
            local eText="You don't have enough money with you! You'll need"..englishMoney..".";
            local outText=common.GetNLS(originator,gText,eText);
            thisNPC:talk(Character.say, outText);
            return;
        end

        originator:inform("Das Wechseln der Stadt hat"..germanMoney.." gekostet.", "It costs"..englishMoney.." to change the faction.");

        fv.rankpoints = 0 -- set default value for rankpoints
        fv.tid = theTown; --set new Town ID
        fv.rankTown = theRank -- set the rank of the town

        if (fv.towncnt<99) then fv.towncnt = fv.towncnt+1; end; -- raise the town counter
        M.setFaction(originator,fv); --write fv in Questprogress
        originator:setQuestProgress(200, 0) -- Remove leadership special rank in case they were a leader of the town they are leaving
        M.updateEntry(originator) --set new entry for new town and delete old entry for old town
        money.TakeMoneyFromChar(originator,amountToPay); --take money
    end
    return;
end

--- Relations
--
-- The following functions allow checking and controlling the relations between factions.

-- The following constants define the different relations modes.
M.RELATION_SELF = -1;            -- This is the constant returned in case the relation of a faction to itself is checked.
M.RELATION_FRIENDLY = 1;      -- The factions have a friendly relationship.
M.RELATION_NEUTRAL = 0;        -- The factions have a neutral relationship, guards will only process the members of this faction in case they appear hostile.
M.RELATION_HOSTILE = 2;        -- The factions have a hostile relationship. The guards will ensure that the members of this faction stay out of the home town.
M.RELATION_AGGRESSIVE = 3;    -- The factions have a aggressive relationship. The guards will engage the members of this faction on sight.
M.RELATION_ACCEPTED = 4;        -- This is a special relationship that only applies to individual players. It causes the total relationship to the town to be neutral, even if the relationship of the town and the player faction is hostile or aggressive

--- Get the individual relationship of a player to a faction. These overwriting values are time limited.
--
-- @param player the player who's relation is queried
-- @param townFaction the faction
-- @return int the relationship constant for the relation of the faction to the individual player
local function getIndividualPlayerRelation(player, townFaction)
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
    local factionRelation = M.getFactionRelation(townFaction, playerFaction);

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

function M.isPlayerPermittedInTown(player, townFaction)
    local playerRelation = M.getPlayerRelation(player, townFaction)
    if playerRelation == M.RELATION_HOSTILE or playerRelation == M.RELATION_AGGRESSIVE then
        return false
    else
        return true
    end
end

--- Get the relationship between two factions. The looking direction for the relationship is always from the town faction to the player faction.
--- So if the towns faction is hostile to the players faction and the players faction is neutral to the towns faction the returned result will be hostile.
--
-- @param townFaction the faction of the town that is checked
-- @param playerFaction the faction of the player that is checked
-- @return int the relationship constant for the relation of the towns faction to the player faction
function M.getFactionRelation(townFaction, playerFaction)
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
function M.setFactionRelation(townFaction, playerFaction, newRelation)
    if (newRelation ~= M.RELATION_FRIENDLY) and (newRelation ~= M.RELATION_NEUTRAL) and (newRelation ~= M.RELATION_HOSTILE) and (newRelation ~= M.RELATION_AGGRESSIVE) then
        debug("[Error] Applied illegal relationship mode: "..tostring(newRelation));
        return;
    end
    if (townFaction == playerFaction) then
        return;
    end

    -- get mode for all factions
    local found, relationships = ScriptVars:find("Mode_"..townFaction);
    local oldRelation
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

return M
