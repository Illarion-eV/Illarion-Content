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

function M.isTutorialNPCnearby(user)

    local npc = position(656, 316, 0)
    local location = user.pos
    local distance = 15
    local layerCheck = location.z == npc.z
    local ycheck = location.y < npc.y + distance and location.y > npc.y - distance
    local xcheck = location.x < npc.x + distance and location.x > npc.x - distance

    if layerCheck and ycheck and xcheck then
        return true
    end

    return false
end


return M
