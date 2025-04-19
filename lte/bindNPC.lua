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

M.storedNPCBond = {}

function M.addEffect(effect, user)

    local foundX, x = effect:findValue("x")
    local foundY, y = effect:findValue("y")
    local foundZ, z = effect:findValue("z")

    if not foundX or not foundY or not foundZ then
        return
    end

    local npc = world:getCharacterOnField(position(x, y, z))

    if not npc or npc:getType() ~= Character.npc then
        return
    end

    M.storedNPCBond[user.id] = npc

    M.callEffect(effect, user)
end



function M.callEffect(effect, user)

    local npc = M.storedNPCBond[user.id]


    if not npc or npc:getType() ~= Character.npc then
        return false
    end

    if (npc.pos.z ~= user.pos.z) --If on a different layer or more than 5 tiles apart, we warp instead of walk
        or (npc.pos.x-user.pos.x >= 6 or npc.pos.x-user.pos.x <= -6)
        or (npc.pos.y-user.pos.y >= 6 or npc.pos.y-user.pos.y <= -6) then
        npc:forceWarp(user.pos)
    elseif user.pos ~= npc.pos then  --The npc walks normally to the direction of the GM character
        local direction = common.GetDirection(npc.pos, user.pos)
        npc:move(direction, true)
    end

    effect.nextCalled = 1 --Called every decisecond
    return true

end

function M.removeEffect(effect, user)

    local npc = M.storedNPCBond[user.id]

    if not npc or npc:getType() ~= Character.npc then
        return
    end

    user:inform("You are no longer bound to "..npc.name..".")
end

function M.loadEffect(effect, user)

end

return M
