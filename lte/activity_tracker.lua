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

local M = {}

M.reputationTrackerQuestID = 393

local reputationTrackerQuestID = M.reputationTrackerQuestID

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
    local currentTime = world:getTime("unix")
    local difference = currentTime - lastInteractionTime

    if not foundLastInteractionTime or difference > 300 then --checks if player was speaking/emoting near other players within the last 5 minutes
        return false
    end

    return true
end

local function saveAndResetValues(effect, user, lastSessionMonth, lastSessionYear)

    local currentYear = common.getTime("year")

    local foundActiveTime, sessionActiveTime = effect:findValue("sessionActiveTime")

    local foundInteractionTime, sessionInteractionTime = effect:findValue("sessionInteractionTime")

    if not foundInteractionTime then
        sessionInteractionTime = 0
    end

    if not foundActiveTime then
        sessionActiveTime = 0
    end

    local monthName = common.Month_To_String(lastSessionMonth)

    local questIDtoUse = monthQuestIDs[monthName]   -- The activity is tracked over an in game year, this checks what month to use based on when the data was recorded

    local preExistingValue = 0

    local currentMonth = common.getTime("month")

    if currentYear == lastSessionYear or (currentYear > lastSessionYear and lastSessionMonth > currentMonth) then  -- Checks if the data is too outdated (if a player has not logged in for 4+ IRL months)
        preExistingValue = user:getQuestProgress(questIDtoUse)
    end

    user:setQuestProgress(questIDtoUse, preExistingValue + sessionActiveTime)

    preExistingValue = user:getQuestProgress(reputationTrackerQuestID)

    user:setQuestProgress(reputationTrackerQuestID, preExistingValue + sessionInteractionTime)

    effect:addValue("sessionActiveTime", 0)
    effect:addValue("sessionInteractionTime", 0)
    effect:addValue("sessionMonth", currentMonth)
    effect:addValue("sessionYear", currentYear)
    effect:addValue("sessionCalls", 0)
end

function M.addEffect(effect, user)
    M.callEffect(effect, user)
end

function M.callEffect(effect, user)

    local foundCalls, sessionCalls = effect:findValue("sessionCalls")

    if not foundCalls then
        sessionCalls = 0
    end

    local foundActiveTime, sessionActiveTime = effect:findValue("sessionActiveTime")

    local foundInteractionTime, sessionInteractionTime = effect:findValue("sessionInteractionTime")

    if not foundActiveTime then
        sessionActiveTime = 0
    end

    if not foundInteractionTime then
        sessionInteractionTime = 0
    end

    local foundMonth, sessionMonth = effect:findValue("sessionMonth")

    local foundYear, sessionYear = effect:findValue("sessionYear")

    local currentMonth = common.getTime("month")

    local currentYear = common.getTime("year")

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
            effect:addValue("sessionActiveTime", sessionActiveTime + 1)
        end

        if isInteracting(effect) then
            effect:addValue("sessionInteractionTime", sessionInteractionTime + 1)
        end
    end

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
