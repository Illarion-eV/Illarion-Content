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

function M.isDruid(user)

    local isDruid = user:getMagicType() == 3

    local hasAttribs = (user:increaseAttrib("perception",0) + user:increaseAttrib("essence",0) + user:increaseAttrib("intelligence",0)) >= 30

    if not isDruid or not hasAttribs then
        user:inform("Du musst ein Druide sein und den Verstand, gute Augen sowie ein ausreichendes Gespür für die Welt der feinen Materie besitzen, um dies zu nutzen.", "You must be a druid and have the mind, good eyes and a a sufficient feeling for the world of fine matter to use this.")
        return false
    end

    return true
end

return M
