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
local safeZones = require("scheduled.safe_zones")
local propertyList = require("housing.propertyList")
local blueprints = require("base.blueprints")

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
        local listTry = math.random()
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
                math.random(selectedArea.x[1], selectedArea.x[2]),
                math.random(selectedArea.y[1], selectedArea.y[2]),
                math.random(selectedArea.z[1], selectedArea.z[2]))

            local field = world:getField(pos)
            if field ~= nil then
                local tileId = field:tile();
                for _, validTileId in pairs(content.treasureTiles) do
                    if tileId == validTileId then
                        if not world:isItemOnField(pos) and field:isPassable() then
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

--[[
    Some locations end up with treasures spawned in inaccessible areas, but have areas surrounding them in all
    directions which makes it inconvenient to just shorten the treasure location above.
    There are also a lot of existing maps players already obtained that lead to such locations.
    As such the list below, along with the list of estate coordinates in housing, is added to a script that
    checks the location when hovering over a treasure map for the first time and replaces it with new coordinates
    if they are on an illegitimate tile, which means no more having to throw away bad treasure maps
    (or having a GM fix it each time) and also future proofs it in regards to new housing estate locations we
    might add on later. To avoid lag, a version number is added to the item data so it only checks the treasure maps
    one time each time we change the list of locations.
]]

local version = 2 --Update this to one number higher each time something is added to the list.

local bannedLocations = {
    {x = {from = 213, to = 300}, y = {from = 756, to = 830}, z = 0}, --Mount letma, inaccessible
    {x = {from = 656, to = 708}, y = {from = 277, to = 329}, z = 0}, --Troll's Haven, safe zone script interfers with treasure.
    {x = {from = 641, to = 661}, y = {from = 312, to = 332}, z = 0}, --Troll's Haven.
    {x = {from = 685, to = 739}, y = {from = 276, to = 330}, z = 0}, --Troll's Haven.
    {x = {from = 656, to = 700}, y = {from = 302, to = 336}, z = 0} --Troll's Haven.
}

function M.fetchPropertyName(user, pos)

    local direct

    if user then
        direct = user:getFaceTo()
    end

    local d = 1

    local vX, vY

    if user then
        vX, vY = common.GetDirectionVector(direct)
    end

    local x
    local y
    local z

    if pos == nil then
        x = user.pos.x + vX * d
        y = user.pos.y + vY * d
        z = user.pos.z
    else
        x = pos.x
        y = pos.y
        z = pos.z
    end
    for _, property in ipairs(propertyList.properties) do
        if x >= property.lower.x
        and x <= property.upper.x
        and y >= property.lower.y
        and y <= property.upper.y
        and z >= property.lower.z
        and z <= property.upper.z then
            return property.name
        end
    end
    return nil
end

local function checkIfIllegalCoord(location)

    local propertyName = M.fetchPropertyName(nil, location)

    if propertyName then
        return true
    end

    for _, bannedLocation in pairs(bannedLocations) do
        if location.x >= bannedLocation.x.from and location.x <= bannedLocation.x.to
        and location.y >= bannedLocation.y.from and location.y <= bannedLocation.y.to
        and location.z == bannedLocation.z then
            return true
        end
    end
end

local function mapLocation(map)

    local x = tonumber(map:getData("MapPosX"))
    local y = tonumber(map:getData("MapPosY"))
    local z = tonumber(map:getData("MapPosZ"))

    if common.IsNilOrEmpty(x) or common.IsNilOrEmpty(y) or common.IsNilOrEmpty(z) then
        return false
    end

    return position(x, y, z)

end

local function updateMapCoord(map)


    local preventInfiniteLoop = 0

    repeat
        local newPos = findPosition()
        if not newPos or checkIfIllegalCoord(newPos) then
            preventInfiniteLoop = preventInfiniteLoop + 1
        else
            map:setData("MapPosX", newPos.x)
            map:setData("MapPosY", newPos.y)
            map:setData("MapPosZ", newPos.z)
            map:setData("checkedVersion", version)
            world:changeItem(map)
            break
        end
    until( preventInfiniteLoop > 10)
    -- If it takes more than 10 attempts we break the loop to prevent the server crashing due to getting stuck in a loop
    -- Realistically just one attempt should be plenty, but accounting for bad luck..

end

function M.checkMap(map)

    if tonumber(map:getData("checkedVersion")) == version then
        return
    end

    local location = mapLocation(map)

    if location and checkIfIllegalCoord(location) then -- It is not a child drawing and it has bad coords
        updateMapCoord(map)
    else
        map:setData("checkedVersion", version)
        world:changeItem(map)
    end
end

local function getRandomMapLevel()
    return 10 - math.floor(math.sqrt(math.random(1, 99)))
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
        return "�u�erst fern", "extremely far"
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
        return "S�dosten", "southeast"
    elseif direction == Character.dir_south then
        return "S�den", "south"
    elseif direction == Character.dir_southwest then
        return "S�dwesten", "southwest"
    elseif direction == Character.dir_west then
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
        local y = tonumber(treasureMap:getData("MapPosY"))
        local z = tonumber(treasureMap:getData("MapPosZ"))
        if x ~= nil and y ~= nil and z ~= nil then
            local mapPosition = position(x, y, z)
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

    local selectedIndex = math.random(1, count)
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

local function spawnMonster(spawnPosition, level)
    local monsterId = getRandomMonsterId(level)
    if monsterId == -1 then
        return false
    end

    local monster = world:createMonster(monsterId, spawnPosition, 10)
    if monster == nil or not isValidChar(monster) then
        removeMonsterFromList(monsterId)
        debug(string.format("Treasure: Failed to spawn monster with ID %d. The monster is removed from the lists",
                            monsterId))
        return false
    else
        return monster
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
    local spawnPositions = common.GetFreePositions(treasurePosition, 5, true, true)
    local createdMonsters = {}

    local function nextFreePos()
        local pos = spawnPositions()
        if pos == nil then
            return treasurePosition
        end
        return pos
    end

    table.insert(createdMonsters, spawnMonster(nextFreePos(), treasureLevel))
    table.insert(createdMonsters, spawnMonster(nextFreePos(), treasureLevel))
    table.insert(createdMonsters, spawnMonster(nextFreePos(), math.max(1, treasureLevel - 1)))
    table.insert(createdMonsters, spawnMonster(nextFreePos(), math.max(1, treasureLevel - 1)))
    table.insert(createdMonsters, spawnMonster(nextFreePos(), math.max(1, treasureLevel - 2)))
    table.insert(createdMonsters, spawnMonster(nextFreePos(), math.max(1, treasureLevel - 2)))

    -- check if the creation of any monster failed
    for _, monster in pairs(createdMonsters) do
        if not monster then
            killMonsters(createdMonsters)
            return nil
        else
            -- Lets have all monsters look to the treasure in a very angry away
            common.TurnTo(monster, treasurePosition)
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

    local selectedIndex = math.random(1, count)
    return content.treasureContents[level][selectedIndex]
end

local function dropTreasureItem(treasureLocation, level)
    local quality = math.random(5,7) * 100 + math.random(50,99);
    while true do
        local itemData = getRandomItem(level)
        if itemData == nil then
            return false
        end

        local amount = 1
        if itemData.amount > 1 then
            amount = math.random(1, itemData.amount)
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

local function informAboutError(user)
    user:inform(
        "[OOC] Das Script f�r die Schatzsuche hat einen Fehler festgestellt und die Ausf�hrung abgebrochen. " ..
                "Der Schatz kann aktuell nicht behoben werden. " ..
                "Das Technische Team wurde von dem Problem in Kenntnis gesetzt.",
        "[OOC] The script for the treasure hunt detected an internal error and canceled the execution. " ..
                "The treasure can't be found right now. " ..
                "The development team was informed about the problem."
    )
end

function M.createMapData(name)
    local location = findPosition();
    if location == nil then
        return nil;
    end

    return {MapPosX = location.x, MapPosY = location.y, MapPosZ = location.z, foundBy = name}
end

function M.createMap(player, mapLevel)
    local data = M.createMapData(player.name)
    if data == nil then
        return false
    end

    if mapLevel == nil or mapLevel < 1 or mapLevel > 9 then
        mapLevel = getRandomMapLevel()
    end
    local quality = mapLevel * 100 + 99

    common.CreateItem(player, 505, 1, quality, data)
    return true
end

function M.createMapFromSkill(player, skill)
    local level
    level = 0 + math.floor(math.sqrt(math.random(0, skill)))
    level = common.Limit(level, 1, 9)
    return M.createMap(player, level)
end

local function dropBluePrints(treasureLocation, level)

    local chance = 0.05 -- 5% chance a blueprint drops from a treasure

    local rand = math.random()

    if rand > chance then
        return
    end

    local eligibleBlueprints = {}

    for _, blueprint in pairs(blueprints.blueprints) do

        if (level <= 2 and blueprint.treasure == "small")
        or (level > 2 and level <= 4 and blueprint.treasure == "average")
        or (level > 4 and level <= 7 and blueprint.treasure == "big")
        or (level > 7 and level <= 9 and blueprint.treasure == "giant") then
            table.insert(eligibleBlueprints, {id = blueprint.id, rareness = blueprint.rareness})
        end

    end

    if #eligibleBlueprints == 0 then
        return
    end

    local randomlySelectedBlueprint = eligibleBlueprints[math.random(1, #eligibleBlueprints)]

    local blueprint = world:createItemFromId(blueprints.itemIdBlueprint, 1, treasureLocation, true, 333, {["rareness"] = randomlySelectedBlueprint.rareness, ["blueprint"] = randomlySelectedBlueprint.id})

    if not blueprint then
        debug("Failed to spawn a blueprint when tasked to.")
    end

end

function M.dropTreasureItems(treasureLocation, level)
    local itemSpawnResults = {}
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 1))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 1))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 2))
    table.insert(itemSpawnResults, dropTreasureItem(treasureLocation, level + 2))

    dropBluePrints(treasureLocation, level)

    local minMoney, maxMoney = content.getMoneyInTreasure(level)
    money.GiveMoneyToPosition(treasureLocation, math.random(minMoney, maxMoney))

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
    local mapTargetX = tonumber(mapItem:getData("MapPosX"))
    local mapTargetY = tonumber(mapItem:getData("MapPosY"))
    local mapTargetZ = tonumber(mapItem:getData("MapPosZ"))
    if mapTargetX == nil or mapTargetY == nil or mapTargetZ == nil then
        return false
    end

    local mapTarget = position(mapTargetX, mapTargetY, mapTargetZ)
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

local function isAlivePlayerInRangeOf(pos, range)
    local players = world:getPlayersInRangeOf(pos, range)
    for _, player in pairs(players) do
        if not character.IsDead(player) then
            return true
        end
    end
    return false
end

local function notifyTreasureFoundStatistic(player)
    local lastValue = player:getQuestProgress(60)
    player:setQuestProgress(60, lastValue + 1)
end

local function logTreasureDig(treasureHunter, treasureMap)

    local foundBy = treasureMap:getData("foundBy")

    local finderIsHere = false

    if common.IsNilOrEmpty(foundBy) then -- It is an old map with no finder registered
        return
    end

    local playersNearby = world:getPlayersInRangeOf(treasureHunter.pos, 30)

    local text = "A treasure of tier "..math.floor(treasureMap.quality/100).." at pos "..tostring(treasureHunter.pos).." was dug by the following group, with the origin of the map("..foundBy..") not present: "

    for index, playerNearby in ipairs(playersNearby) do

        text = text..playerNearby.name.."("..playerNearby.id..")"

        if index < #playersNearby then
            text = text..", "
        else
            text = text.."."
        end

        if playerNearby.name == foundBy then
            finderIsHere = true
        end
    end

    if not finderIsHere then
        log(text)
    end

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

    treasureFoundLocations[locationKey] = nil

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

    logTreasureDig(treasureHunter, treasureMap)

    local monsterList = spawnMonsters(diggingLocation, treasureLevel)
    if monsterList == nil then
        informAboutError(treasureHunter)
        error("Treasure system malfunction. Spawning the monsters failed.")
    end

    -- Remove the treasure map
    if not world:erase(treasureMap, 1) then
        informAboutError(treasureHunter)
        killMonsters(monsterList)
        error("Treasure system malfunction. Removing the treasure map failed..")
    end

    local remainingMonsters = #monsterList

    local function handleMonsterDeath(monster)

        if safeZones.cheatingViaTrollshavenSafeZone(monster, diggingLocation, treasureHunter) then
            monsterList = {}    --reset monster list
            remainingMonsters = 0
            return
        end

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
                notifyTreasureFoundStatistic(player)
                if player.id == treasureHunter.id then
                    treasureHunterIsInformed = true
                end
            end
            if not treasureHunterIsInformed and isValidChar(treasureHunter) then
                treasureHunter:inform(msgGuardiansBeatenDe, msgGuardiansBeatenEn)
                notifyTreasureFoundStatistic(treasureHunter)
            end
            M.dropTreasureItems(diggingLocation, treasureLevel)
        end
    end

    for _, monster in pairs(monsterList) do
        monsterHooks.registerOnDeath(monster, handleMonsterDeath)
    end

    local function retrieveMonsters()
        -- First check monsters that wandered off and retrieve them
        local foundActiveMonster = false
        for _, monster in pairs(monsterList) do
            if monster ~= nil and isValidChar(monster) then
                foundActiveMonster = true
                if not monster:isInRangeToPosition(diggingLocation, 30) then
                    if not isAlivePlayerInRangeOf(monster.pos, 20) then
                        -- The monster is all alone
                        local targetPos = common.getFreePos(diggingLocation, 5)
                        monster:warp(targetPos)
                        world:gfx(41, targetPos)
                    end
                end
            end
        end

        if foundActiveMonster then
            -- Monsters left. Let's keep the hunt going.
            scheduledFunction.registerFunction(30, retrieveMonsters)
            return
        end
    end

    scheduledFunction.registerFunction(30, retrieveMonsters)
    return true
end

return M
