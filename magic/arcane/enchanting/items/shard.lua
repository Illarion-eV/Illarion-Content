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

local lookat = require("base.lookat")
local oldShard = require("magic.arcane.enchanting.core.handling_of_old_shards")

local M = {}

function M.UseItem(user, theShard)

    local isOldShard = oldShard.checkShard(user, theShard)

    if isOldShard then
        return
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

    local isOldShard = oldShard.checkShard(user, theShard, lookAt)

    if isOldShard then
        lookAt.description = isOldShard
    end

    return lookAt
end



return M
