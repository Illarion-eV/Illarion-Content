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

-- This script contains the scripts closely related to the treasure items. The scripts for maps and to dig up treasures
-- are here.

local character = require("base.character")
local common = require("base.common")
local content = require("content.treasure")
local money = require("base.money")
local monsterHooks = require("monster.base.hooks")
local scheduledFunction = require("scheduled.scheduledFunction")

local M = {}

local treasureFoundLocations = {}

local function _isTable(value)
    return type(value) == "table"
end

local function _isNumber(value)
    return type(value) == "number"
end

local function _isString(value)
    return type(value) == "string"
end

local function _isBoolean(value)
    return type(value) == "boolean"
end

-- Search for a valid place to spawn a treasure.
local function findPosition()
    if content.treasureLocations == nil or content.treasureTiles == nil then
        return nil
    end

    -- Perform 100 tries to find a location.
    for cnt = 1, 100 do
        local listTry = Random.uniform()
        local selectedArea
        for _, area in pairs(content.treasureLocations) do
            if area.chance >= listTry then
                selectedArea = area
                break
            end
            listTry = listTry - area.chance
        end

        if selectedArea ~= nil then
            local pos = position(
                Random.uniform(selectedArea.x[1], selectedArea.x[2]),
                Random.uniform(selectedArea.y[1], selectedArea.y[2]),
                Random.uniform(selectedArea.z[1], selectedArea.z[2]))

            local field = world:getField(pos)
            if field ~= nil then
                local tileId = field:tile();
                for _, validTileId in pairs(content.treasureTiles) do
                    if tileId == validTileId then
                        if not world:isItemOnField(pos) then
                            return pos
                        end
                        break
                    end
                end
            end
        end
    end
    return nil
end

local function getRandomMapLevel()
    return 10 - math.floor(math.sqrt(Random.uniform(1, 99)))
end

local function getModifiedPosition(player, realPosition)
    local perception = player:increaseAttrib("perception", 0);
    math.randomseed(player.id)

    local diff = math.ceil(-0.007342 * perception * perception - 0.676 * perception + 15.1336)
    diff = math.min(15, math.max(0, diff))
    local modBy = math.random(0, diff)
    local rad = math.random() * 2 * math.pi

    local newPos = position(
        realPosition.x + (modBy * math.sin(rad)),
        realPosition.y + (modBy * math.cos(rad)),
        realPosition.z)

    if player:isInRangeToPosition(newPos, diff) then
        return false;
    else
        return newPos;
    end
end

local function getTextForDistance(distance)
    if distance < 20 then
        return "sehr nah", "very close"
    elseif distance < 60 then
        return "nah", "close"
    elseif distance < 200 then
        return "fern", "far"
    elseif distance < 500 then
        return "sehr fern", "very far"
    else
        return "äußerst fern", "extremely far"
    end
end

local function getTextForDirection(direction)
    if direction == Character.dir_north then
        return "Norden", "north"
    elseif direction == Character.dir_northeast then
        return "Nordosten", "northeast"
    elseif direction == Character.dir_east then
        return "Osten", "east"
    elseif direction == Character.dir_southeast then
        return c"Südosten", "southeast"
    elseif direction == Character.dir_south then
        return "Süden", "south"
    elseif direction == Character.dir_southwest then
        return "Südwesten", "southwest"
    elseif direction == Character.dir_northwest then
        return "Westen", "west"
    elseif direction == Character.dir_northwest then
        return "Nordwesten", "northwest"
    else
        return false, false
    end
end

local function getTreasureMapForLocation(player, requiredItemId, requiredLocation)
    local items = player:getItemList(requiredItemId)
    for _, treasureMap in pairs(items) do
        local x = tonumber(treasureMap:getData("MapPosX"))
        local y = tonumber(treasureMap:getData("MapPosX"))
        local z = tonumber(treasureMap:getData("MapPosX"))
        if x ~= nil and y ~= nil and z ~= nil then
            local mapPosition = common.DataToPosition({x, y, z})
            if mapPosition == requiredLocation then
                return treasureMap
            end
        end
    end
    return nil
end

local function getRandomMonsterId(level)
    if content.guardianMonsters == nil then
        return -1
    end

    local count = #(content.guardianMonsters[level])
    if count == 0 then
        return -1
    end

    local selectedIndex = Random.uniform(1, count)
    return content.guardianMonsters[level][selectedIndex]
end

local function removeMonsterFromList(monsterId)
    for level = 1, #content.guardianMonsters do
        for i = #content.guardianMonsters[level], 1, -1  do
            if content.guardianMonsters[level][i] == monsterId then
                table.remove(content.guardianMonsters[level], i)
            end
        end
    end
end

local function spawnMonster(treasurePosition, level)
    local spawnPosition = common.getFreePos(treasurePosition, 5);
    while true do
        local monsterId = getRandomMonsterId(level)
        if monsterId == -1 then
            return nil
        end

        local monster = world:createMonster(monsterId, spawnPosition, 10)
        if monster == nil then
            removeMonsterFromList(monsterId)
            debug(string.format("Treasure: Failed to spawn monster with ID %d. The monster is removed from the lists",
                                monsterId))
        else
            return monster
        end
    end
end

local function killMonsters(monsterList)
    for _, monster in pairs(monsterList) do
        if monster ~= nil and isValidChar(monster) then
            monsterHooks.setNoDrop(monster)
            character.Kill(monster)
        end
    end
end

local function spawnMonsters(treasurePosition, treasureLevel)
    local createdMonsters = {}
    table.insert(createdMonsters, spawnMonster(treasurePosition, treasureLevel))
    table.insert(createdMonsters, spawnMonster(treasurePosition, treasureLevel))
    table.insert(createdMonsters, spawnMonster(treasurePosition, math.max(1, treasureLevel - 1)))
    table.insert(createdMonsters, spawnMonster(treasurePosition, math.max(1, treasureLevel - 1)))
    table.insert(createdMonsters, spawnMonster(treasurePosition, math.max(1, treasureLevel - 2)))
    table.insert(createdMonsters, spawnMonster(treasurePosition, math.max(1, treasureLevel - 2)))

    -- check if the creation of any monster failed
    for _, monster in pairs(createdMonsters) do
        if monster == nil then
            killMonsters(createdMonsters)
            return nil
        end
    end

    return createdMonsters
end

local function getRandomItem(level)
    if content.treasureContents == nil then
        return nil
    end

    local count = #(content.treasureContents[level])
    if count == 0 then
        return nil
    end

    local selectedIndex = Random.uniform(1, count)
    return content.treasureContents[level][selectedIndex]
end

local function removeItemFromList(itemId)
    for level = 1, #content.treasureContents do
        for i = #content.treasureContents[level], 1, -1  do
            if content.treasureContents[level][i].itemId == itemId then
                table.remove(content.treasureContents[level], i)
            end
        end
    end
end

local function dropTreasureItem(treasureLocation, level)
    local quality = Random.uniform(6,9) * 100 + Random.uniform(50,99);
    while true do
        local itemData = getRandomItem(level)
        if itemData == nil then
            return false
        end

        local amount = 1
        if itemData.amount > 1 then
            amount = Random.uniform(1, itemData.amount)
        end

        local item = world:createItemFromId(itemData.itemId, amount, treasureLocation, true, quality, itemData.data)
        if item == nil then
            removeMonsterFromList(itemData.itemId)
            debug(string.format("Treasure: Failed to create item with ID %d. The item is removed from the lists.",
                itemData.itemId))
        else
            return true
        end
    end
end

function M.createMapData()
    local location = findPosition();
    if location == nil then
        return nil;
    end

    return common.PositionToData(location)
end

function M.createMap(player, mapLevel)
    local data = M.createMapData()
    if data == nil then
        return false
    end

    if mapLevel == nil or mapLevel < 1 or mapLevel > 9 then
        mapLevel = getRandomMapLevel()
    end
    local quality = mapLevel * 100 + 99

    if player:createItem(505, 1, quality, data) ~= 0 then
        world:createItemFromId(505, 1, player.pos, true, quality, data)
        common.InformNLS(player,
            "Du kannst nichts mehr tragen.",
            "You can't carry any more.")
    end
    return true
end

function M.dropTreasureItems(treasureLocation, level)
    local itemSpawnResults = {}
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 1))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 1))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 2))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 2))

    money.GiveMoneyToPosition(content.getMoneyInTreasure(level))

    -- check if all items got spawned.
    for _, flag in pairs(itemSpawnResults) do
        if not flag then
            return false
        end
    end
    return true
end

function M.getTreasureLevel(item)
    return math.max(1, math.floor(item.quality / 100))
end

function M.getTargetInformation(player, mapItem)
    local dataValues = {mapItem:getData("MapPosX"), mapItem:getData("MapPosY"), mapItem:getData("MapPosZ")}
    local mapTarget = common.DataToPosition(dataValues)
    local usedTarget = getModifiedPosition(player, mapTarget)

    if not usedTarget then
        return false
    end

    local metricDistance = player:distanceMetricToPosition(usedTarget);
    local dir = common.GetDirection(player.pos, usedTarget);

    local result = {}
    result.direction = {}
    result.direction.de, result.direction.en = getTextForDirection(dir)
    result.distance = {}
    result.distance.de, result.distance.en = getTextForDistance(metricDistance)
    return result
end

function M.performDiggingForTreasure(treasureHunter, diggingLocation, additionalParams)
    -- Find a matching map in the inventory of the treasure hunter
    local treasureMapItemId = 505
    local maxLevel = math.huge
    local msgLevelTooHighDe, msgLevelTooHighEn
    if _isTable(additionalParams) then
        if _isNumber(additionalParams.treasureMapItemId) then
            treasureMapItemId = additionalParams.treasureMapItemId
        end
        if _isNumber(additionalParams.maximalLevel) then
            maxLevel = additionalParams.maximalLevel
        end
        if _isTable(additionalParams.msgLevelTooHigh) then
            if _isString(additionalParams.msgLevelTooHigh.de) then
                msgLevelTooHighDe = additionalParams.msgLevelTooHigh.de
            end
            if _isString(additionalParams.msgLevelTooHigh.en) then
                msgLevelTooHighEn = additionalParams.msgLevelTooHigh.en
            end
        end
    end

    local treasureMap = getTreasureMapForLocation(treasureHunter, treasureMapItemId, diggingLocation)
    if treasureMap == nil then
        return false
    end

    local treasureLevel = M.getTreasureLevel(treasureMap)
    if treasureLevel > maxLevel then
        if msgLevelTooHighDe == nil or msgLevelTooHighEn == nil then
            msgLevelTooHighDe, msgLevelTooHighEn = content.msgTreasureLevelTooHigh:getRandomMessage()
        end
        treasureHunter:inform(msgLevelTooHighDe, msgLevelTooHighEn)
        return true
    end

    -- Prepare digging out the treasure
    local diggingOutStep = true
    local msgDiggingOutDe, msgDiggingOutEn
    if _isTable(additionalParams) then
        if _isBoolean(additionalParams.diggingOutStep) then
            diggingOutStep = additionalParams.diggingOutStep
        end
        if _isTable(additionalParams.msgDiggingOut) then
            if _isString(additionalParams.msgDiggingOut.de) then
                msgDiggingOutDe = additionalParams.msgDiggingOut.de
            end
            if _isString(additionalParams.msgDiggingOut.en) then
                msgDiggingOutEn = additionalParams.msgDiggingOut.en
            end
        end
    end

    local locationKey = string.format("%d %d %d", diggingLocation.x, diggingLocation.y, diggingLocation.z)
    if diggingOutStep and treasureFoundLocations[locationKey] == nil then
        if diggingOutStep and (msgLevelTooHighDe == nil or msgLevelTooHighEn == nil) then
            msgDiggingOutDe, msgDiggingOutEn = content.msgDiggingOut:getRandomMessage()
        end
        treasureHunter:inform(msgDiggingOutDe, msgDiggingOutEn)
        treasureFoundLocations[locationKey] = true
        return true
    end

    local msgFoundTreasureDe, msgFoundTreasureEn
    local msgGuardiansBeatenDe, msgGuardiansBeatenEn
    if _isTable(additionalParams) then
        if _isTable(additionalParams.msgFoundTreasure) then
            if _isString(additionalParams.msgFoundTreasure.de) then
                msgFoundTreasureDe = additionalParams.msgFoundTreasure.de
            end
            if _isString(additionalParams.msgFoundTreasure.en) then
                msgFoundTreasureEn = additionalParams.msgFoundTreasure.en
            end
        end

        if _isTable(additionalParams.msgGuardiansBeaten) then
            if _isString(additionalParams.msgGuardiansBeaten.de) then
                msgGuardiansBeatenDe = additionalParams.msgGuardiansBeaten.de
            end
            if _isString(additionalParams.msgGuardiansBeaten.en) then
                msgGuardiansBeatenEn = additionalParams.msgGuardiansBeaten.en
            end
        end
    end
    if msgFoundTreasureDe == nil or msgFoundTreasureEn == nil then
        msgFoundTreasureDe, msgFoundTreasureEn = content.msgFoundTreasure:getRandomMessage()
    end
    if msgGuardiansBeatenDe == nil or msgGuardiansBeatenEn == nil then
        msgGuardiansBeatenDe, msgGuardiansBeatenEn = content.msgBeatenGuardians:getRandomMessage()
    end

    treasureHunter:inform(msgFoundTreasureDe, msgFoundTreasureEn)

    local monsterList = spawnMonsters(diggingLocation, treasureLevel)
    if monsterList == nil then
        treasureHunter:inform(
            "[OOC] Das Script für die Schatzsuche hat einen Fehler festgestellt und die Ausführung abgebrochen. " ..
            "Der Schatz kann aktuell nicht behoben werden. " ..
            "Das Technische Team wurde von dem Problem in Kenntnis gesetzt.",
            "[OOC] The script for the treasure hunt detected an internal error and canceled the execution. " ..
            "The treasure can't be found right now. " ..
            "The development team was informed about the problem."
        )
        treasureFoundLocations[locationKey] = nil
        error("Treasure system malfunction. Spawning the monsters failed.")
    end

    local remainingMonsters = #monsterList

    local function handleMonsterDeath(monster)
        remainingMonsters = remainingMonsters - 1
        for index, monsterInList in pairs(monsterList) do
            if monsterInList.id == monster.id then
                monsterList[index] = nil
                break
            end
        end
        if remainingMonsters == 0 then
            local players = world:getPlayersInRangeOf(diggingLocation, 12)
            local treasureHunterIsInformed = false
            for _, player in pairs(players) do
                player:inform(msgGuardiansBeatenDe, msgGuardiansBeatenEn)
                if player.id == treasureHunter.id then
                    treasureHunterIsInformed = true
                end
            end
            if not treasureHunterIsInformed and isValidChar(treasureHunter) then
                treasureHunter:inform(msgGuardiansBeatenDe, msgGuardiansBeatenEn)
            end
            M.dropTreasureItems(diggingLocation, treasureLevel)
        end
    end

    for _, monster in pairs(monsterList) do
        monsterHooks.registerOnDeath(monster, handleMonsterDeath)
    end

    local checkTreasureHunters
    function checkTreasureHunters()
        local players = world:getPlayersInRangeOf(diggingLocation, 12)
        for _, player in pairs(players) do
            if player:increaseAttrib("hitpoints", 0) > 0 then
                -- found a player who seems to be still looking for the treasure. Let's keep it alive.
                scheduledFunction.registerFunction(100, checkTreasureHunters)
                return
            end
        end
        for _, monster in pairs(monsterList) do
            if monster ~= nil and isValidChar(monster) then
                -- only valid chars, else the monster is likely already dead.
                local playersAroundMonster = world:getPlayersInRangeOf(monster.pos, 12)
                for _, player in pairs(playersAroundMonster) do
                    if player:increaseAttrib("hitpoints", 0) > 0 then
                        -- found a player who seems to be still looking for the treasure. Let's keep it alive.
                        scheduledFunction.registerFunction(100, checkTreasureHunters)
                        return
                    end
                end
            end
        end

        -- no more active monsters. Let's end this.
        remainingMonsters = math.huge -- Ensuring that the treasure is not dropped when murdering the monsters
        killMonsters(monsterList)
    end

    scheduledFunction.registerFunction(100, checkTreasureHunters)
    return true
end

return M