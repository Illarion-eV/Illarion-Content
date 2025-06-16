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

function M.passesCheck(user, tool)

    if not common.isInRect(user.pos, tool.pos, 1) then
        log("Player "..user.name.." just tried to use a GM tool that was not in range.")
        return false
    end

    if not user:isAdmin() then
        log("Player "..user.name.."("..user.id..") just used a GM tool despite not being a GM.")
    end

    return true
end

return M
