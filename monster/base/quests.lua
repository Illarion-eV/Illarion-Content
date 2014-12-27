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
--Generic 'Kill X monsters' quests by Estralis Seborian

local common = require("base.common")

local M = {}

--TEMPLATE TO ADD A QUEST TO function iniQuests()

--local id=NUMBER; --ID of the quest
--germanTitle[id]="GERMAN TITLE"; --Title of the quest in german
--englishTitle[id]="ENGLISH TITLE"; --Title of the quest in english
--NPCName[id]="Miggs"; --This is the name of the NPC who gives out the quest
--statusId[id]=NUMBER; --the queststatus as used by the NPC
--germanRace[id]="stinkige Gullimumien"; --free description of the foes in german
--englishRace[id]="smelly sewer mummies"; --free description of the foes in english
--table.insert(questList[MONSTERID],id); --Insert the quest into the quest list of the monster race that has to be slain. You can add multiple monsters this way.
--minimumQueststatus[id]=NUMBER1; --quest is only active with this queststatus and above. Each monster slain adds +1. Use a value > 0!
--maximumQueststatus[id]=NUMBER2; --quest is finished if this queststatus is reached, no kill are counted anymore. Difference between NUMBER1 and NUMBER2 is the number of monsters that have to be slain
--questLocation[id]=position(X,Y,Z); --a position around which the monsters have to be slain, e.g. centre of a dungeon or forest
--radius[id]=RADIUS; --in this radius around the questlocation, kills are counted valid

--Comment: If you want an NPC to give out multiple quests, you can do it like this:

--Quest 1: To accept quest 1, set queststatus to 1 with the NPC. Use queststatus 1->11 to count 10 monsters. If the quest is finished, set queststatus to 12 with the NPC.
--Quest 2: To accept quest 2, set queststatus to 13 with the NPC. Use queststatus 13->18 to count 5 monsters. If the quest is finished, set queststatus to 19 with the NPC.
--Quest 3: To accept quest 3, set queststatus to 20 with the NPC. Use queststatus 20->21 to count 1 monster. If the quest is finished, set queststatus to 22 with the NPC.

local quests = {}
local questsByMonsterId = {}
local questsByMonsterGroupId = {}
local questsByRaceId = {}

local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

local function _isFunction(value)
    return type(value) == "function"
end

local function _isString(value)
    return type(value) == "string"
end

local function registerQuest(quest, monsterIds, groupIds, raceIds)
    if not _isTable(quest) then
        error("Tried to insert a illegal structure as quest: Not a table")
    end

    if not _isFunction(quest.check) or not _isFunction(quest.execute) then
        error("Tried to insert a illegal structure as quest: Required check and execute functions not present")
    end

    table.insert(quests, quest)
    local index = #quests

    if monsterIds ~= nil then
        if _isTable(monsterIds) then
            for _, id in pairs(monsterIds) do
                local numberId = tonumber(id)
                if questsByMonsterId[numberId] == nil then
                    questsByMonsterId[numberId] = {}
                end
                table.insert(questsByMonsterId[numberId], index)
            end
        else
            error("The list of monster IDs is expected to be a table of IDs.")
        end
    end

    if groupIds ~= nil then
        if _isTable(groupIds) then
            for _, id in pairs(groupIds) do
                local numberId = tonumber(id)
                if questsByMonsterGroupId[numberId] == nil then
                    questsByMonsterGroupId[numberId] = {}
                end
                table.insert(questsByMonsterGroupId[numberId], index)
            end
        else
            error("The list of group IDs is expected to be a table of IDs.")
        end
    end

    if raceIds ~= nil then
        if _isTable(raceIds) then
            for _, id in pairs(raceIds) do
                local numberId = tonumber(id)
                if questsByRaceId[numberId] == nil then
                    questsByRaceId[numberId] = {}
                end
                table.insert(questsByRaceId[numberId], index)
            end
        else
            error("The list of race IDs is expected to be a table of IDs.")
        end
    end
end

function M.addQuest(params)
    if not _isTable(params) then
        error("Quest data for the quest to add is missing.")
    end

    local questId
    if not _isNumber(params.questId) then
        error("The quest ID is required to be a number. It is the ID of the quest progress.")
    else
        questId = tonumber(params.questId)
    end

    local checkQuest
    if _isFunction(params.check) then
        checkQuest = params.check
    else
        local questLocations
        if _isTable(params.location) then
            questLocations = {params.location}
        elseif _isTable(params.locations) then
            questLocations = params.locations
        else
            error("One or multiple locations for the quests are required.")
        end

        for _, location in pairs(questLocations) do
            if not _isTable(location) then
                error("Location is not properly stored in a table.")
            end
            if location.position == nil or not _isNumber(location.radius) then
                error("Each location definition requires a position and a radius to be valid.")
            end
        end

        local minimalStatus, maximalStatus
        if _isTable(params.queststatus) then
            if _isNumber(params.queststatus.from) and _isNumber(params.queststatus.to) then
                minimalStatus = tonumber(params.queststatus.from)
                maximalStatus = tonumber(params.queststatus.to)
            elseif _isNumber(params.queststatus.min) and _isNumber(params.queststatus.max) then
                minimalStatus = tonumber(params.queststatus.min)
                maximalStatus = tonumber(params.queststatus.max)
            elseif _isNumber(params.queststatus[1]) and _isNumber(params.queststatus[2]) then
                minimalStatus = tonumber(params.queststatus[1])
                maximalStatus = tonumber(params.queststatus[2])
            else
                error("Failed to read the quest status range.")
            end
        elseif _isNumber(params.queststatus) then
            minimalStatus = tonumber(params.queststatus)
            maximalStatus = tonumber(params.queststatus)
        else
            error("Failed to read the required queststatus parameter.")
        end

        if minimalStatus > maximalStatus or minimalStatus < 0 then
            error("Quest status values are out of range.")
        end

        checkQuest = function(player, monster)
            if not player:isInRange(monster, 12) then
                -- Monster is too far away. Something went wrong
                return false
            end

            for _, location in pairs(questLocations) do
                if player:isInRangeToPosition(location.position, location.radius) then
                    local currentStatus = player:getQuestProgress(questId);
                    return currentStatus >= minimalStatus and currentStatus < maximalStatus
                end
            end
            return false
        end
    end

    local executeQuest
    if _isFunction(params.execute) then
        executeQuest = params.execute
    else
        executeQuest = function(player, monster)
            local currentStatus = player:getQuestProgress(questId);
            player:setQuestProgress(questId, currentStatus + 1)
        end
    end

    local reportQuest
    if _isFunction(params.report) then
        reportQuest = params.report
    else
        local minimalStatus, maximalStatus
        if _isTable(params.queststatus) then
            if _isNumber(params.queststatus.from) and _isNumber(params.queststatus.to) then
                minimalStatus = tonumber(params.queststatus.from)
                maximalStatus = tonumber(params.queststatus.to)
            elseif _isNumber(params.queststatus.min) and _isNumber(params.queststatus.max) then
                minimalStatus = tonumber(params.queststatus.min)
                maximalStatus = tonumber(params.queststatus.max)
            elseif _isNumber(params.queststatus[1]) and _isNumber(params.queststatus[2]) then
                minimalStatus = tonumber(params.queststatus[1])
                maximalStatus = tonumber(params.queststatus[2])
            else
                error("Failed to read the quest status range.")
            end
        elseif _isNumber(params.queststatus) then
            minimalStatus = tonumber(params.queststatus)
            maximalStatus = tonumber(params.queststatus)
        else
            error("Failed to read the required queststatus parameter.")
        end

        if minimalStatus > maximalStatus or minimalStatus < 0 then
            error("Quest status values are out of range.")
        end

        local titleGerman, titleEnglish
        if _isTable(params.questTitle) then
            if _isString(params.questTitle.german) and _isString(params.questTitle.english) then
                titleGerman = params.questTitle.german
                titleEnglish = params.questTitle.english
            elseif _isString(params.questTitle[Player.german]) and _isString(params.questTitle[Player.english]) then
                titleGerman = params.questTitle[Player.german]
                titleEnglish = params.questTitle[Player.english]
            end
        elseif _isString(params.questTitle) then
            titleGerman = params.questTitle
            titleEnglish = params.questTitle
        else
            error("Failed to read the required title of the quest.")
        end

        local monsterNameGerman, monsterNameEnglish
        if _isTable(params.monsterName) then
            local germanParams = params.monsterName.german or params.monsterName[Player.german]
            local englishParams = params.monsterName.english or params.monsterName[Player.english]
            if _isString(germanParams) then
                monsterNameGerman = germanParams
            else
                error("Failed to read the german part of the monster name.")
            end

            if _isString(englishParams) then
                monsterNameEnglish = englishParams
            else
                error("Failed to read the english part of the monster name.")
            end
        elseif _isString(params.monsterName) then
            monsterNameGerman = params.monsterName
            monsterNameEnglish = params.monsterName
        else
            error("Failed to read the required name of the monster.")
        end

        local npcName
        if _isString(params.npcName) then
            npcName = params.npcName
        else
            error("Failed to read the required NPC name.")
        end

        local totalCount = maximalStatus - minimalStatus
        reportQuest = function(player, monster)
            local currentStatus = player:getQuestProgress(questId);
            if currentStatus >= maximalStatus then --quest finished
                local germanFormat, englishFormat
                if maximalStatus == minimalStatus + 1 then -- only a single monster to beat
                    germanFormat = "[Queststatus] %s: Du hast %s besiegt. Kehre zu %s zurück, um deine Belohnung zu erhalten."
                    englishFormat = "[Quest status] %s: You have slain %s. Return to %s to claim your reward."
                else
                    germanFormat = "[Queststatus] %s: Du hast genug %s besiegt. Kehre zu %s zurück, um deine Belohnung zu erhalten."
                    englishFormat = "[Quest status] %s: You have slain enough %s. Return to %s to claim your reward."
                end

                common.InformNLS(player,
                    germanFormat:format(titleGerman, monsterNameGerman, npcName),
                    englishFormat:format(titleEnglish, monsterNameEnglish, npcName));
            else --quest not finished
                local germanFormat = "[Queststatus] %s: Du hast %d von %d %s besiegt."
                local englishFormat = "[Quest status] %s: You have slain %d of %d %s."

                local doneCount = currentStatus - minimalStatus

                common.InformNLS(player,
                    germanFormat:format(titleGerman, doneCount, totalCount, monsterNameGerman),
                    englishFormat:format(titleEnglish, doneCount, totalCount, monsterNameEnglish));
            end
        end
    end

    local quest = {}
    function quest.check(player, monster)
        return checkQuest(player, monster)
    end
    function quest.execute(player, monster)
        executeQuest(player, monster)
        reportQuest(player, monster)
    end
    registerQuest(quest, params.monsterIds, params.monsterGroupIds, params.raceIds)
end

function M.checkQuest(player, monster)
    local monsterId = monster:getMonsterType()
    local monsterGroupId = math.floor((monsterId - 1) / 10)
    local raceId = monster:getRace()

    local possibleQuests = {}
    if questsByMonsterId[monsterId] ~= nil then
        for _, questId in pairs(questsByMonsterId[monsterId]) do
            possibleQuests[questId] = true
        end
    end

    if questsByMonsterGroupId[monsterGroupId] ~= nil then
        for _, questId in pairs(questsByMonsterGroupId[monsterGroupId]) do
            possibleQuests[questId] = true
        end
    end

    if questsByRaceId[raceId] ~= nil then
        for _, questId in pairs(questsByRaceId[raceId]) do
            possibleQuests[questId] = true
        end
    end

    -- All candidates are assembled. Now check the ones that execute.
    local checkedQuests = {}
    for questId, _ in pairs(possibleQuests) do
        local quest = quests[questId]
        if quest.check(player, monster) then
            table.insert(checkedQuests, quest)
        end
    end

    for _, quest in pairs(checkedQuests) do
        quest.execute(player, monster)
    end
end

return M
