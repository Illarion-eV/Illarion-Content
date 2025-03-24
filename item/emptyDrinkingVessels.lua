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
local lookat = require("base.lookat")

local M = {}

function M.LookAtItem(user, sourceItem)

    local lookAt = lookat.GenerateLookAt(user, sourceItem)
    local rareness = sourceItem:getData("rareness")
    local crafted = sourceItem:getData("craftedRare")
    if not common.IsNilOrEmpty(rareness) and tonumber(rareness) >= 2 and crafted == "true" then
        local descriptions = {}
        local commonItem = world:getItemStatsFromId(sourceItem.id)
        descriptions[2] = {english = "An uncommonly well made "..commonItem.English..", sure to make any beverage taste better.", german = "Ein ungewöhnlich gut gefertigtes "..commonItem.German..", das sicher jedes Getränk besser schmecken lässt."}
        descriptions[3] = {english = "A "..commonItem.English.." so well made it is a rarity, sure to make any beverage taste better.", german = "Ein "..commonItem.German..", das so gut gefertigt ist, dass es eine Seltenheit darstellt und sicher jedes Getränk besser schmecken lässt."}
        descriptions[4] = {english = "The "..commonItem.English.." is so uniquely well made it could be called a masterpiece. Certainly anything drank from it will taste far better than usual.", german = "Das "..commonItem.German.." ist so einzigartig gut gefertigt, dass man es als Meisterwerk bezeichnen könnte. Alles, was daraus getrunken wird, schmeckt mit Sicherheit weit besser als gewöhnlich."}
        lookAt.description = common.GetNLS(user, descriptions[tonumber(rareness)].german, descriptions[tonumber(rareness)].english)
    end


    return lookAt
end

return M
