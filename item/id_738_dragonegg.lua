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

local magicSphere = require("item.magicSphere")

local texts = magicSphere.puzzles

local M = {}


function M.MoveItemBeforeMove(User, SourceItem, TargetItem)

    if SourceItem:getData("spawnSpiders") == "true" then
        User:inform("Das schleimige Spinnenei rutscht dir aus der Hand.","The slimy spider egg slips from your hands.")
        return false
    end

    return true

end

function M.UseItem(user, sourceItem, actionState)

    if sourceItem.pos == position(704, 621, -6) or sourceItem.pos == position(704, 618, -6) then
        user:inform(texts.kelPuzzle.egg.german..texts.kelPuzzle.suffix.german, texts.kelPuzzle.egg.english..texts.kelPuzzle.suffix.english)
        user:setQuestProgress(242, 1)
    end

end

return M

