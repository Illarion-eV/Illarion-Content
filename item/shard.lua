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

-- UPDATE items SET itm_script='item.shard',itm_weight=20, itm_agingspeed=254, itm_brightness=1, itm_worth=10000, itm_maxstack=1000, itm_name_german='Splitter', itm_name_english='Shard',itm_rareness=2 WHERE itm_id IN (3493, 3494, 3495,3496,3497);

function M.UseItem(user, item)
        user:inform(
            "Es scheint sich um ein Stück eines zerbrochenen magischen Artefakts zu handeln. Vielleicht kann man es wieder zusammensetzen?",
            "The shard looks like a pice of a broken magical artifact. Maybe you can put it together again?")
end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)
    lookAt.description = common.GetNLS(user, "Glyphenscherbe", "Glyph shard")
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
    world:createItemFromId(shardId,1,pos,false,999,{[glyphs.SHARD_LEVEL_DATA_KEY] = shardLevel}, 5)
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
