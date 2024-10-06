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

local M = {}

local oldShards = {3493, 3494, 3495, 3496, 3497}

local oldShardNames = {
    {"Anemo", "Pyr", "Hydor", "Chous", "Dendron", "Nomizo", "Hieros"},
    {"gwynt", "tan", "ilyn", "daear", "coeden", "ysbryd", "dwyfol"}
}

local function convertOldShardToNew(shard)

    local shardLevel = tonumber(shard:getData("shardLevel"))    -- Old value that was used to determine the type of shard

    if common.IsNilOrEmpty(shardLevel) then
        return  --No old shard value assigned, nothing to do here
    end


    local textParts = common.Split_number(shardLevel, 2)    -- The old shard number is split to determine which shard name combination should be used

    local shardName = oldShardNames[1][textParts[1] ] .. oldShardNames[2][textParts[2]] -- The shard names are combined to make for the name of the shard we actually want

    local shardItemId = Item[shardName:lower()] -- Using the shard name, the ID of the new shard item we want the old shard to transform into is fetched via the Item.name functionality

    shard.id = shardItemId -- Changing the shard to its new ID

    shard:setData("shardLevel", "") -- remove the old shardlevel value, allowing it to stack with the new ones unless it has other custom data not set by the old glyph script

    world:changeItem(shard) -- Tells the world to save the changes made to the item so they will actually take effect

end

function M.checkShard(user, shard)

    for _, selectedShard in pairs(oldShards) do
        if selectedShard == shard.id then

            convertOldShardToNew(shard)

            return common.GetNLS(user, "Obsolete Glyphenscherbe.", "Relict glyph shard.")
        end
    end

    return false
end

return M
