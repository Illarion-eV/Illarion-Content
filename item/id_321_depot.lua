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
-- Depots

-- UPDATE items SET itm_script='item.id_321_depot' WHERE itm_id=321;

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

function M.LookAtItem(User, Item)
    local lookAt = lookat.GenerateLookAt(User, Item)
    local depotId = tonumber(Item:getData("depot"))

    if depotId == 101 then
        lookAt.description = "Cadomyr"
    elseif depotId == 102 then
        lookAt.description = "Runewick"
    elseif depotId == 103 then
        lookAt.description = "Galmair"
    elseif depotId == 104 then
        lookAt.description = common.GetNLS(User, "Gasthof zur Hanfschlinge", "The Hemp Necktie Inn")
    end
    
    return lookAt
end

return M

