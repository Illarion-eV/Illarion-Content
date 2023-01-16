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

    local isMage = user:getMagicType() == 0 and user:getMagicFlags(0) > 0 or user:getMagicType() == 0 and user:getQuestProgress(37) ~= 0

    local informTextGerman = "Es scheint sich um ein Stück eines zerbrochenen magischen Artefakts zu handeln."
    local informTextEnglish = "The shard looks like a piece of a broken magical artifact."

    if isMage then
        informTextEnglish = informTextEnglish.." Maybe you can put it together again?"
        informTextGerman = informTextGerman.." Vielleicht kann man es wieder zusammensetzen?"
    else
        informTextEnglish = informTextEnglish.." Perhaps you can find someone with the required magical prowess to make use of this?"
        informTextGerman = informTextGerman.." GERMAN TRANSLATION"
    end

    user:inform(informTextGerman, informTextEnglish)

end

local oldShards = {3493, 3494, 3495,3496,3497}

function M.LookAtItem(user, item)

    local lookAt = lookat.GenerateLookAt(user, item)

    for _, shard in pairs(oldShards) do
        if shard == item.id then
            lookAt.description = common.GetNLS(user, "GERMAN TRANSLATION", "Relict glyph shard. Move it anywhere else in your inventory or on the ground to change it into the new updated shard item.")
        end
    end

    return lookAt
end

function M.createShardOnUser(user)

    local shardId = glyphs.getRandomShard()

    common.CreateItem(user, shardId, 1, 999)

end

function M.createShardOnPosition(pos)

    local shardId = glyphs.getRandomShard()

    world:createItemFromId(shardId, 1, pos, false, 999, nil)

end

return M
