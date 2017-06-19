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
local playerLastSeen = {}

function M.addEffect(Effect, User)

end

function M.callEffect(Effect, User)

    if playerLastSeen[User.id] and world:getTime("unix") - playerLastSeen[User.id] > 300 then
        return false
    end
    
    common.CreateCircle(User.pos, 5, function(thePosition) world:gfx(1, thePosition) end)
    playerLastSeen[User.id] = world:getTime("unix")
    
    return true
end

function M.removeEffect(Effect,User)

end

function M.loadEffect(Effect,User)

end

return M