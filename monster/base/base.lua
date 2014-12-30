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
local quests = require("monster.base.quests")
local hooks = require("monster.base.hooks")
local treasure = require("base.treasure")
local arena = require("base.arena")

local M = {}

local noDropList = {}
local killers = {}

local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

local function _isRange(value)
    if not _isTable(value) then
        return false
    end

    if _isNumber(value.min) and _isNumber(value.max) then
        return true
    elseif _isNumber(value[1]) and _isNumber(value[2]) then
        return true
    else
        return false
    end
end

local function _getValueFromRange(value)
    if not _isRange(value) then
        error("This function requires a range.")
    end

    local min = value.min or value[1]
    local max = value.max or value[2]

    if min > max then
        error("The minimal value of the range is larger then the maximal value.")
    end

    return Random.uniform() * (max - min) + min
end

local function performRandomTalk(monster, msgs)
    local langSkill = monster:getSkill(Character.commonLanguage)
    if langSkill < 100 then
        monster:increaseSkill(Character.commonLanguage, 100 - langSkill)
    end

    local germanMessage, englishMessage = msgs:getRandomMessage() --choses a random message
    common.TalkNLS(monster, Character.say, germanMessage, englishMessage ) --does the talking in both languages
end

local function performRegeneration(monster)
    if (Random.uniform() < 0.3) and (monster:increaseAttrib("hitpoints", 0) < 10000) then
        local con = monster:increaseAttrib("constitution", 0)
        local healAmount = 2 * con
        monster:increaseAttrib("hitpoints", healAmount)
    end
end

local function reportAttack(monster, enemy)
    killers[monster.id] = enemy
end

local function cleanupMonster(monster)
    killers[monster.id] = nil
    noDropList[monster.id] = nil
    hooks.cleanHooks(monster)
end

local function reportMonsterDeath(monster)
    local killer = killers[monster.id]
    if killer ~= nil and (not isValidChar(killer) or not killer:isInRange(monster, 12)) then
        killer = nil
    end

    if killer ~= nil and not arena.isArenaMonster(monster) then
        quests.checkQuest(killer, monster)
    end
    hooks.executeOnDeath(monster, killer)
end

local function copyMergeTables(table1, table2)
    local dataCopy = {}
    for key, value in pairs(table1) do
        dataCopy[key] = value
    end
    for key, value in pairs(table2) do
        dataCopy[key] = value
    end
    return dataCopy
end

local function dropLootItem(monster, lootItemData)
    local amount = Random.uniform(lootItemData.minAmount, lootItemData.maxAmount)
    local quality = Random.uniform(lootItemData.minQuality, lootItemData.maxQuality)
    local durability = Random.uniform(lootItemData.minDurability, lootItemData.maxDurability)

    local data = lootItemData.data
    if lootItemData.itemId == 505 then
        -- It's a treasure map! Populate it with a valid location.
        local mapData = treasure.createMapData()
        if _isTable(mapData) then
            data = copyMergeTables(data, mapData)
        end
    end

    world:createItemFromId(lootItemData.itemId, amount, monster.pos, true, quality * 100 + durability, data)
end

local function dropLootCategory(monster, lootData)
    local randomTry = Random.uniform()
    for _, itemInfo in pairs(lootData) do
        if itemInfo.probability >= randomTry then
            dropLootItem(monster, itemInfo)
            return
        else
            randomTry = randomTry - itemInfo.probability
        end
    end
end

local function performDrop(monster)
    if not arena.isArenaMonster(monster) and not noDropList[monster.id] then
        local loot = monster:getLoot()

        for _, category in pairs(loot) do
            dropLootCategory(monster, category)
        end
    end
end

function M.generateCallbacks(msgs)
    local t = {}

    function t.enemyNear(monster, _)
        if Random.uniform() < 3e-4 then --once each 5 minutes (3e-4) in average a message is spoken (is called very often)
            performRandomTalk(monster, msgs)
        end
        return false
    end

    function t.enemyOnSight(monster, _)
        performRegeneration(monster)
        if Random.uniform() < 3e-3 then --once each 5 minutes (3e-3) in average a message is spoken
            performRandomTalk(monster, msgs)
        end
        return false
    end

    t.onAttacked = reportAttack
    t.onCasted = reportAttack

    function t.onDeath(monster)
        performDrop(monster)
        reportMonsterDeath(monster)
        cleanupMonster(monster)
    end

    return t
end

-- Saves a monster as one that should not drop
function M.setNoDrop(monster)
    noDropList[monster.id] = true
end

M.SKIN_COLOR = 0
M.HAIR_COLOR = 1

function M.white()
    return {255, 255, 255}
end

local reportedTransparencyIssue = false

function M.setColor(params)
    if not _isTable(params) then
        error("The parameter for the setColor function are not set.")
    end

    if params.monster == nil or not isValidChar(params.monster) then
        error("The referenced monster is not set or not valid.")
    end

    if not _isNumber(params.target) then
        error("The required target value is not set.")
    end

    local colorTarget = tonumber(params.target)

    if colorTarget ~= M.SKIN_COLOR and colorTarget ~= M.HAIR_COLOR then
        error("The required target is not set to a valid target.")
    end

    local red, green, blue, alpha
    if params.hue ~= nil and params.saturation ~= nil and params.value ~= nil then
        -- HSV Mode
        local hue, saturation, value
        if _isRange(params.hue) then
            hue = _getValueFromRange(params.hue)
        elseif _isNumber(params.hue) then
            hue = tonumber(params.hue)
        else
            error("Hue parameter contains a unexpected value.")
        end

        if _isRange(params.saturation) then
            saturation = _getValueFromRange(params.saturation)
        elseif _isNumber(params.saturation) then
            saturation = tonumber(params.saturation)
        else
            error("Saturation parameter contains a unexpected value.")
        end

        if _isRange(params.value) then
            value = _getValueFromRange(params.value)
        elseif _isNumber(params.value) then
            value = tonumber(params.value)
        else
            error("Value parameter contains a unexpected value.")
        end

        red, green, blue = common.HSVtoRGB(hue, saturation, value)
    elseif params.red ~= nil and params.green ~= nil and params.blue ~= nil then
        if _isRange(params.red) then
            red = _getValueFromRange(params.red)
        elseif _isNumber(params.red) then
            red = tonumber(params.red)
        else
            error("Red parameter contains a unexpected value.")
        end

        if _isRange(params.green) then
            green = _getValueFromRange(params.green)
        elseif _isNumber(params.green) then
            green = tonumber(params.green)
        else
            error("Green parameter contains a unexpected value.")
        end

        if _isRange(params.blue) then
            blue = _getValueFromRange(params.blue)
        elseif _isNumber(params.blue) then
            blue = tonumber(params.blue)
        else
            error("Blue parameter contains a unexpected value.")
        end
    elseif _isTable(params.color) then
        if _isNumber(params.color[1]) then
            red = tonumber(params.color[1])
        else
            error("Color parameter is not a valid color.")
        end

        if _isNumber(params.color[2]) then
            green = tonumber(params.color[2])
        else
            error("Color parameter is not a valid color.")
        end

        if _isNumber(params.color[3]) then
            blue = tonumber(params.color[3])
        else
            error("Color parameter is not a valid color.")
        end
    else
        error("No color was set.")
    end

    if params.alpha ~= nil then
        if _isRange(params.alpha) then
            alpha = _getValueFromRange(params.alpha)
        elseif _isNumber(params.alpha) then
            alpha = tonumber(params.alpha)
        else
            error("Alpha parameter contains a unexpected value.")
        end
    else
        alpha = 255
    end

    red = math.floor(red + 0.5)
    green = math.floor(green + 0.5)
    blue = math.floor(blue + 0.5)
    alpha = math.floor(alpha + 0.5)

    if colorTarget == M.SKIN_COLOR then
        if alpha == 255 then
            params.monster:setSkinColor(red, green, blue)
        else
            if not reportedTransparencyIssue then
                reportedTransparencyIssue = true
                debug("Setting the alpha value of the color is not yet supported. Once the server support works, fix this")
            end

            params.monster:setSkinColor(red, green, blue) -- ,alpha
        end
    else
        if alpha == 255 then
            params.monster:setHairColor(red, green, blue)
        else
            if not reportedTransparencyIssue then
                reportedTransparencyIssue = true
                debug("Setting the alpha value of the color is not yet supported. Once the server support works, fix this")
            end

            params.monster:setHairColor(red, green, blue) -- ,alpha
        end
    end
end

return M