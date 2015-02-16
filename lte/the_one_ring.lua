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
local M = {}
function M.addEffect( theEffect, User )
    User.isinvisible = true
end

function M.callEffect(theEffect, User )
    theEffect.nextCalled = 10 --erneut in 1 sec
    local ringItemL = User:getItemAt( 7 )
    local ringItemR = User:getItemAt( 8 )
    --reduce the quality of the cloak
    if ( ringItemL.id == 235 and tonumber(ringItemL:getData("ringData")) == 100) then
        world:changeQuality( ringItemL, -1 )
    elseif ( ringItemR.id == 235 and tonumber(ringItemR:getData("ringData")) == 100) then
        world:changeQuality( ringItemR, -1 )
    end

    --check if the cloak is on the right place
    ringItemL = User:getItemAt( 7 )
    ringItemR = User:getItemAt( 8 )
    if ( ringItemL.id == 235  and tonumber(ringItemL:getData("ringData"))== 100) then
        return true
    elseif ( ringItemR.id == 235  and tonumber(ringItemR:getData("ringData")) == 100) then
        return true
    else
        return false
    end
end

function M.removeEffect( theEffect, User )
    User.isinvisible = false
end

function M.loadEffect( theEffect, User)
    User.isinvisible = true
end

return M
