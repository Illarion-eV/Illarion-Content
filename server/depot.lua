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

local M = {}

function M.onOpenDepot(User, Depot)
   
    --101: Cadomyr
    --102: Runewick
    --103: Galmair
    --104: Hemp Necktie Inn
    --201: Cadomyr Treasury
    --202: Runewick Treasury
    --203: Galmair Treasury
  
    common.TurnTo(User, Depot.pos) -- turn if necessary
    
    local depotId = tonumber(Depot:getData("depot"))
    
    if User:isAdmin() then --Admins have access to all depots
    
        return true

    end 
            
    --public depots    
        
    if depotId == 101 or depotId == 102 or depotId == 103 or depotId == 104 then 
    
        return true
    
    end

    --treasury depots
    local rank = factions.getRankAsNumber(User)
    local town = factions.getMembershipByName(User)
    
    if depotId == 201 and rank > 7 and town == "Cadomyr" then
    
        return true
    
    elseif depotId == 202 and rank > 7 and town == "Runewick" then
    
        return true
        
    elseif depotId == 203 and rank > 7 and town == "Galmair" then
    
        return true
    
    end
    
    --Default     
    common.InformNLS(User,"Für dieses Depot hast du keinen Schlüssel.","You don't have the keys to this depot.")
    
    return false -- this function must return true or false. Default is false to prevent "rogue" depots
    
end

return M
