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

function M.MoveItemBeforeMove(user, source, target)

    if not common.isInRect(source.pos, target.pos, 2) then
        user:inform(common.GetNLS(user, "Du kannst einen Korb nicht werfen.", "You can't throw a basket."))
        return false --unlike other items, bags and baskets can be moved further than they should when moved from tile to tile. This hotfixes this until a server change is made sometime in the future to fix the relevant script.
    end

    return true
end

return M
