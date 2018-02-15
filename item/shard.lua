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
local glyphs = require("base.glyphs")
local lookat = require("base.lookat")

local M = {}

-- UPDATE items SET itm_script='item.shard',itm_weight=20, itm_agingspeed=5, itm_brightness=1, itm_worth=10000, itm_maxstack=1000, itm_name_german='Splitter', itm_name_english='Shard',itm_rareness=2 WHERE itm_id IN (3493, 3494, 3495,3496,3497);

local function estimateMonsterLevel(monster)
    --hack used, see http://illarion.org/mantis/view.php?id=9619
    local attributeNames = {
    "agility",
    "constitution",
    "dexterity",
    "essence",
    "intelligence",
    "perception",
    "strength",
    "willpower"
}
    local attributeLimits = {1,3,5,9,13,19,25,33,41,999}
    local maxAttrib = 0
    local thisAttrib
    for i=1, #attributeNames do
        thisAttrib = tonumber(monster:getBaseAttribute(attributeNames[i]))
        if thisAttrib ~= nil then
            if thisAttrib > maxAttrib then
                maxAttrib = thisAttrib
            end
        end
    end
    for i=1,#attributeLimits do
        if maxAttrib <= attributeLimits[i] then
            return i
        end
    end
    return 1
end

function M.UseItem(user, item)
        user:inform(
            "Es scheint sich um ein Stück eines zerbrochenen magischen Artefakts zu handeln. Vielleicht kann man es wieder zusammensetzen?",
            "The shard looks like a pice of a broken magical artifact. Maybe you can put it together again?")
end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)

    lookAt.name = glyphs.getShardName(item)
    lookAt.rareness = 2

    return lookAt
end

function M.createShardOnUser(user)
    local shardLevel = glyphs.getRandomShardLevel()
    local shardId = tonumber(glyphs.getShardId(shardLevel))
    common.CreateItem(user, shardId, 1, 999, {[glyphs.SHARD_LEVEL_DATA_KEY] = shardLevel})
end

function M.createShardWithLevelOnUser(user, shardLevel)
    local shardId = tonumber(glyphs.getShardId(shardLevel))
    common.CreateItem(user, shardId, 1, 999, {[glyphs.SHARD_LEVEL_DATA_KEY] = shardLevel})
end

function M.createShardOnPosition(pos)
    local shardLevel = glyphs.getRandomShardLevel()
    local shardId = tonumber(glyphs.getShardId(shardLevel))
    world:createItemFromId(shardId,1,pos,false,999,{[glyphs.SHARD_LEVEL_DATA_KEY] = shardLevel})
end

function M.dropShardByChance(treasureLocation,treasureLevel)
    if treasureLevel >=1 and treasureLevel <= 5 then
        local singleProb = 1 / (3 + tonumber(treasureLevel) / 2)
        for i=1, treasureLevel do
            if math.random() < singleProb then
                M.createShardOnPosition(treasureLocation)
            end
        end
    end
end

function M.dropShardByMonster(monster)
    --hack used, see http://illarion.org/mantis/view.php?id=9619
    local monsterLevel = estimateMonsterLevel(monster)
    local singleProb = 1 / (100 - 10 * tonumber(monsterLevel))
    if math.random() < singleProb then
        M.createShardOnPosition(monster.pos)
    end
    
end

function M.shardInInvertory(user,shardLevel)
    local itemId = glyphs.getShardId(shardLevel)
    local dataValues = {}
    dataValues[1] = {glyphs.SHARD_LEVEL_DATA_KEY,shardLevel}
    return common.GetItemInInventory(user, itemId, dataValues)
end

function M.removeShardsForItem(user,targetItem)
    local ringOrAmulet = glyphs.getGlyphRingOrAmulet(targetItem)
    local level = glyphs.getGlyphLevel(targetItem)
    local shardLevel
    local sucess = true
    local shardItem

    for i=1, 7 do
        if ringOrAmulet == glyphs.RING then
            shardLevel = level*10+i
        else
            shardLevel = i*10+level
        end
        shardItem = M.shardInInvertory(user,shardLevel)
        if shardItem == nil then
            sucess = false
        else
             world:erase(shardItem,1)
        end
    end
    return sucess
end

return M
