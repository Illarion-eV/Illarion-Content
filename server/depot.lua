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
local factions = require("base.factions")
local depotScript = require("item.id_321_depot")

local M = {}

function M.onOpenDepot(User, Depot)

    -- depotScript.depots for a full list of depots

    common.TurnTo(User, Depot.pos) -- turn if necessary

    local depotId = tonumber(Depot:getData("depot"))

    if User:isAdmin() then --Admins have access to all depots

        return true

    end

    --treasury depots
    local rank = factions.getRankAsNumber(User)
    local town = factions.getMembershipByName(User)

    for _, depot in pairs(depotScript.depots) do
        if depotId == depot.itemData then
            if not depot.taxEvasion then
                return true
            elseif town == depot.town and rank > depot.rank then
                return true
            end
        end
    end

    --Default
    common.InformNLS(User,"Für dieses Depot hast du keinen Schlüssel.","You don't have the keys to this depot.")

    return false -- this function must return true or false. Default is false to prevent "rogue" depots

end

return M
