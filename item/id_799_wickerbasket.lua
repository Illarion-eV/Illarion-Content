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

local bagScript = require("item.id_97_leatherbag")

local M = {}

function M.MoveItemBeforeMove(user, source, target)

    if bagScript.isInDepot(user, source.inside) or bagScript.isInBackpack(user, source.inside) or bagScript.isInDepot(user, target.inside) or bagScript.isInBackpack(user, target.inside) and bagScript.isBackPackSlot(user, source, target) then
        return bagScript.rectCheck(user, source, target, 1, true)
    end

    return bagScript.rectCheck(user, source, target, 0, true)

end

return M
