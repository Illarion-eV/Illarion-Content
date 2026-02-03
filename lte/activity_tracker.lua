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

-- Activity Tracker, effect id 84

local common = require("base.common")
local factions = require("base.factions")
local gems = require("base.gems")
local testing = require("base.testing")

local M = {}

M.reputationTrackerQuestID = 393

M.rankTrackerQuestID = factions.rankTrackerQuestID

M.diamondQuestID = 452

local reputationTrackerQuestID = M.reputationTrackerQuestID

local rankTrackerQuestID = M.rankTrackerQuestID

M.monthQuestIDs = {
    Elos = 377,
    Tanos = 378,
    Zhas = 379,
    Ushos = 380,
    Siros = 381,
    Ronas = 382,
    Bras = 383,
    Eldas = 384,
    Irmas = 385,
    Malas = 386,
    Findos = 387,
    Olos = 388,
    Adras = 389,
    Naras = 390,
    Chos = 391,
    Mas = 392
}

local monthQuestIDs = M.monthQuestIDs

local function isActive(effect)
    local foundResetRestTime, lastResetRestTime = effect:findValue("lastResetRestTime")
    local currentTime = world:getTime("unix")
    local difference = currentTime - lastResetRestTime

    if not foundResetRestTime or difference > 300 then --checks if player was active within the last 5 minutes
        return false
    end

    return true
end

local function isInteracting(effect)

    local foundLastInteractionTime, lastInteractionTime = effect:findValue("lastInteractionTime")
    local foundLastInteractionSkip, lastInteractionSkip = effect:findValue("firstInteractionSkip")
    local foundLastRealmInteractionTime, lastRealmInteractionTime = effect:findValue("lastRealmInteractionTime")
    local currentTime = world:getTime("unix")
    local difference = currentTime - lastInteractionTime
    local differenceRealm = currentTime - lastRealmInteractionTime

    if not foundLastInteractionTime or difference > 300 then --checks if player was speaking/emoting near other players within the last 5 minutes
        return false, false
    end

    if foundLastInteractionSkip and lastInteractionSkip == 1 then
        effect:addValue("firstInteractionSkip", 0) -- First interaction gets skipped for both parties in an attempt to help ensure actual dialogue is happening
        return false, false
    end

    if foundLastRealmInteractionTime and differenceRealm <= 300 then
        return true, true
    end

    return true, false
end

local function saveAndResetValues(effect, user, lastSessionMonth, lastSessionYear)

    local currentYear = world:getTime("year")

    local foundActiveTime, sessionActiveTime = effect:findValue("sessionActiveTime")

    local foundInteractionTime, sessionInteractionTime = effect:findValue("sessionInteractionTime")

    local foundRankTime, sessionRankTime = effect:findValue("sessionRankTime")

    if not foundInteractionTime then
        sessionInteractionTime = 0
    end

    if not foundActiveTime then
        sessionActiveTime = 0
    end

    if not foundRankTime then
        sessionRankTime = 0
    end

    local monthName = common.Month_To_String(lastSessionMonth)

    local questIDtoUse = monthQuestIDs[monthName]   -- The activity is tracked over an in game year, this checks what month to use based on when the data was recorded

    local preExistingValue = 0

    local currentMonth = world:getTime("month")

    if currentYear == lastSessionYear or (currentYear > lastSessionYear and lastSessionMonth > currentMonth) then  -- Checks if the data is too outdated (if a player has not logged in for 4+ IRL months)
        preExistingValue = user:getQuestProgress(questIDtoUse)
    end

    user:setQuestProgress(questIDtoUse, preExistingValue + sessionActiveTime)

    preExistingValue = user:getQuestProgress(reputationTrackerQuestID)

    local preExistingRankValue = user:getQuestProgress(rankTrackerQuestID)

    user:setQuestProgress(reputationTrackerQuestID, preExistingValue + sessionInteractionTime)

    user:setQuestProgress(rankTrackerQuestID, preExistingRankValue + sessionRankTime)

    effect:addValue("sessionActiveTime", 0)
    effect:addValue("sessionInteractionTime", 0)
    effect:addValue("sessionRankTime", 0)
    effect:addValue("sessionMonth", currentMonth)
    effect:addValue("sessionYear", currentYear)
    effect:addValue("sessionCalls", 0)
    M[user.id] = {}
end

function M.addEffect(effect, user)
    M.callEffect(effect, user)
end

local function updateRank(effect, user)

    if not M[user.id] then
        M[user.id] = {}
    end

    if not M[user.id].questRankStatus then -- We save it here as checking the quest progress each time would result in some lag
        M[user.id].questRankStatus = user:getQuestProgress(M.rankTrackerQuestID) -- pre existing rank points
    end

    local foundRankTime, sessionRankTime = effect:findValue("sessionRankTime") --Current sessions rank points

    if not foundRankTime then
        return
    end

    local totalRankTime = sessionRankTime + M[user.id].questRankStatus

    if factions.convertTicksToRankNumber(M[user.id].questRankStatus) < factions.convertTicksToRankNumber(totalRankTime) then

        factions.sendRankUpmessage(user, totalRankTime)

        M[user.id].questRankStatus = totalRankTime

        user:setQuestProgress(M.rankTrackerQuestID, totalRankTime)

        effect:addValue("sessionRankTime", 0)
    end

    local foundInteractionTime, sessionInteractionTime = effect:findValue("sessionInteractionTime") --Current sessions interaction points

    if not foundInteractionTime then
        return
    end

    if not M[user.id].questDiamondStatus then -- We save it here as checking the quest progress each time would result in some lag
        M[user.id].questDiamondStatus = user:getQuestProgress(M.diamondQuestID) -- pre existing diamong quest status
    end

    if not M[user.id].questInteractionStatus then -- We save it here as checking the quest progress each time would result in some lag
        M[user.id].questInteractionStatus = user:getQuestProgress(M.reputationTrackerQuestID) -- pre existing interaction points
    end

    local totalInteractionTime = M[user.id].questInteractionStatus + sessionInteractionTime

    if totalInteractionTime >= 1200 + 1200*M[user.id].questDiamondStatus then -- 100 hours of RP for each diamond
        local gemData = gems.getMagicGemData(1, user.name)
        common.CreateItem(user, 3520, 1, 333, gemData)
        log("[Gems] "..user.name.."("..user.id..") just received a magical diamond gem for accumulating "..(100 + 100*M[user.id].questDiamondStatus).." hours of roleplayed time.")
        local newStatus = M[user.id].questDiamondStatus + 1
        user:setQuestProgress(M.diamondQuestID, newStatus)
        M[user.id].questDiamondStatus = newStatus
        user:inform("Wie neugierig! Du hast gerade einen magischen Diamanten in deiner Tasche gefunden! Könnte es das Werk der Götter sein, vielleicht Zhambra oder Adron, die dich für deine sozialen Errungenschaften preisen?", "How curious! You just found a magical diamond in your pocket! Could it be the works of the gods, perhaps Zhambra or Adron praising you for your social feats?")
    end
end

local function drinkEffectProcced(user)

    local foundEffect, myEffect = user.effects:find(404)

    if not foundEffect then
        return false
    end

    local foundCurrentInfluence, currentInfluence = myEffect:findValue("influence")

    if not foundCurrentInfluence then
        return false
    end

    if math.random() <= currentInfluence/100 then --Divided by 100 because it is stored at an integer representing the percentage chance, between 5-10% based on drink rarity
        return true
    end

    return false
end

function M.callEffect(effect, user)

    local potionToxinReduction = 0

    local foundCalls, sessionCalls = effect:findValue("sessionCalls")

    if not foundCalls then
        sessionCalls = 0
    end

    local foundActiveTime, sessionActiveTime = effect:findValue("sessionActiveTime")

    local foundInteractionTime, sessionInteractionTime = effect:findValue("sessionInteractionTime")

    local foundRankTime, sessionRankTime = effect:findValue("sessionRankTime")

    if not foundActiveTime then
        sessionActiveTime = 0
    end

    if not foundInteractionTime then
        sessionInteractionTime = 0
    end

    if not foundRankTime then
        sessionRankTime = 0
    end

    local foundMonth, sessionMonth = effect:findValue("sessionMonth")

    local foundYear, sessionYear = effect:findValue("sessionYear")

    local currentMonth = world:getTime("month")

    local currentYear = world:getTime("year")

    if not foundYear then
        sessionYear = currentYear
        effect:addValue("sessionYear", currentYear)
    end

    if not foundMonth then
        sessionMonth = currentMonth
        effect:addValue("sessionMonth", currentMonth)
    end

    if sessionMonth ~= currentMonth or currentYear ~= sessionYear then    --a month swap happened in the last 5 minutes the character was online
        saveAndResetValues(effect, user, sessionMonth, sessionYear)
    end

    if sessionCalls >= 1 then
        if isActive(effect) then
            potionToxinReduction = potionToxinReduction + 1
            effect:addValue("sessionActiveTime", sessionActiveTime + 1)
        end

        local interacting, withFellowCitizen = isInteracting(effect)

        local increase = 1
        if drinkEffectProcced(user) then
            increase = 2
        end

        if interacting then
            potionToxinReduction = potionToxinReduction + 1
            effect:addValue("sessionInteractionTime", sessionInteractionTime + increase)
            if withFellowCitizen then
                effect:addValue("sessionRankTime", sessionRankTime + increase)
            end
        end
    end

    local oldValue = user:getQuestProgress(690)

    if potionToxinReduction > 0 and oldValue > 0 then
        user:setQuestProgress(690, math.max(user:getQuestProgress(690)-1, user:getQuestProgress(690)-potionToxinReduction))

        if testing.active then
            user:inform("Poison toxins reduced from "..oldValue.." to "..user:getQuestProgress(690))
        end
    end

    updateRank(effect, user) --If the last sessionRankTime addition ranked you up, this gives an inform and updates the quest status early to save it while reseting sessionRankTime

    effect:addValue("sessionCalls", sessionCalls + 1)

    effect.nextCalled = 3000 --Called once every five minutes

    return true

end

function M.removeEffect(effect, user)

end

function M.loadEffect(effect, user)

    local foundMonth, sessionMonth = effect:findValue("sessionMonth")

    local foundYear, sessionYear = effect:findValue("sessionYear")

    if not foundYear or not foundMonth then --Should never be the case as calling the effect will set these values before a load ever happens
        debug("Something unexpected has happened!")
        return
    end

    saveAndResetValues(effect, user, sessionMonth, sessionYear)

    effect.nextCalled = 10
end

return M
