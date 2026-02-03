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

-- The purpose of this tool is to provide a gm tool, that unlike the portable ones, can store information of events(This could also be done for the portable ones by using the database, but that causes lag)
-- The tool is positioned in the GM castle, and only admin characters can use it.

local M = {}

M.max_potions_logged = 100
M.pos = position(247, 97, 0)
local lecternId = 661
local theLectern

function M.getLectern()

    if theLectern and theLectern.id == lecternId then
        return theLectern
    end

    if not world:isPersistentAt(M.pos) then
        world:makePersistentAt(M.pos)
    end

    local field = world:getField(M.pos)
    local count = field:countItems()

    for i = 0, count do
        local theItem = field:getStackItem(i)
        if theItem.id == lecternId then
            theLectern = theItem
            return theItem
        end
    end

    local newLectern = world:createItemFromId(lecternId, 1, M.pos, true, 999, {["titleEn"] = "GM Lectern", ["titleDe"] = "GM Lesepult"})
    newLectern.wear = 255
    world:changeItem(newLectern)
    theLectern = newLectern
    return newLectern
end

function M.mainOverview(user, lectern)

    if not user:isAdmin() then
        return
    end

end

return M
