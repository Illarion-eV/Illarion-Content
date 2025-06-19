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
local depotList = require("base.depotList")

local M = {}

M.depots = depotList.depots

function M.getDepotDescription(user, depotId)

    for _, depot in pairs(M.depots) do
        if depotId == depot.itemData then
            return common.GetNLS(user, depot.realm.german, depot.realm.english)
        end
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

