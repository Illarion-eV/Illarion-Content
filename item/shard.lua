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

local oldShardNameListing =
{{"Anemo", "Pyr", "Hydor", "Chous", "Dendron", "Nomizo", "Hieros"},
{"gwynt", "tan", "ilyn", "daear", "coeden", "ysbryd", "dwyfol"}}

local function convertOldShardToNew(user, shard)

    local shardLevel = tonumber(shard:getData("shardLevel"))    -- Old value that was used to determine the type of shard

    if common.IsNilOrEmpty(shardLevel) then
        return  --No old shard value assigned, nothing to do here
    end


    local textParts = common.Split_number(shardLevel, 2)    -- The old shard number is split to determine which shard name combination should be used

    local shardName = oldShardNameListing[1][textParts[1] ] .. oldShardNameListing[2][textParts[2]] -- The shard names are combined to make for the name of the shard we actually want

    local shardItemId = Item[shardName:lower()] -- Using the shard name, the ID of the new shard item we want the old shard to transform into is fetched via the Item.name functionality

    shard.id = shardItemId -- Changing the shard to its new ID

    shard:setData("shardLevel", "") -- remove the old shardlevel value, allowing it to stack with the new ones unless it has other custom data not set by the old glyph script

    world:changeItem(shard) -- Tells the world to save the changes made to the item so they will actually take effect

end

local oldShards = {3493, 3494, 3495, 3496, 3497}

function M.UseItem(user, theShard)

    for _, shard in pairs(oldShards) do
        if shard == theShard.id then
            return  -- The old shards need no informs and will only be useable if spawned in by a GM to begin with
        end
    end

    local isMage = user:getMagicType() == 0 and user:getMagicFlags(0) > 0 or user:getMagicType() == 0 and user:getQuestProgress(37) ~= 0

    local informTextGerman = "Es scheint sich um ein Stück eines zerbrochenen magischen Artefakts zu handeln."
    local informTextEnglish = "The shard looks like a piece of a broken magical artifact."

    if isMage then
        informTextEnglish = informTextEnglish.." Maybe you can put it together again?"
        informTextGerman = informTextGerman.." Vielleicht kann man es wieder zusammensetzen?"
    else
        informTextEnglish = informTextEnglish.." Perhaps you can find someone with the required magical prowess to make use of this?"
        informTextGerman = informTextGerman.." Vielleicht kannst du einen Kundigen in den magischen Künsten finden, der damit etwas anfangen kann?"
    end

    user:inform(informTextGerman, informTextEnglish)

end

function M.LookAtItem(user, theShard)

    local lookAt = lookat.GenerateLookAt(user, theShard)

    for _, shard in pairs(oldShards) do
        if shard == theShard.id then

            convertOldShardToNew(user, theShard)

            --[[ As the above function will turn any old shards into their new equivalent upon lookat,
                the below descriptions are only relevant if the shard was spawned in by GM via item ID
                with no attached shardLevel datavalue meaning it has no equivalent shard to be transformed
                into and might be a GM quest item. Of course a GM will likely have added a custom description
                to replace the one below, if that is the case.
            ]]
            lookAt.description = common.GetNLS(user, "Obsolete Glyphenscherbe.", "Relict glyph shard.")
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
