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

-- A list for use in other scripts that access _all_ depots via user:getDepot() to check for items
M.depots = {100,101,102,103,200,201,202} -- For some reason user:getDepot() uses a number lower than the depotId, hence Runewick depotId 102 is actually 101 in this list and so on

function M.getDepotDescription(user, depotId)

    if depotId == 101 then
        return "Cadomyr"
    elseif depotId == 102 then
        return "Runewick"
    elseif depotId == 103 then
        return "Galmair"
    elseif depotId == 104 then
        return common.GetNLS(user, "Gasthof zur Hanfschlinge", "The Hemp Necktie Inn")
    elseif depotId == 201 then
        return common.GetNLS(user, "Staatsschatz von Cadomyr", "Cadomyr Treasury")
    elseif depotId == 202 then
        return common.GetNLS(user, "Staatsschatz von Runewick", "Runewick Treasury")
    elseif depotId == 203 then
        return common.GetNLS(user, "Staatsschatz von Galmair", "Galmair Treasury")
    end

    return common.GetNLS(user, "Unbekanntes Depot", "Unknown depot")

end

function M.LookAtItem(user, Item)
    local lookAt = lookat.GenerateLookAt(user, Item)
    local depotId = tonumber(Item:getData("depot"))

    lookAt.description = M.getDepotDescription(user, depotId)

    return lookAt
end

return M

