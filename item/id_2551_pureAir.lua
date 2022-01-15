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
-- UPDATE items SET itm_script='item.id_738_dragonegg' WHERE itm_id IN (738);

local texts = require("magic.arcane.base.texts")

local M = {}

function M.UseItem(user, sourceItem, actionState)

    if sourceItem.pos == position(697, 627, -6) then
        user:inform(texts.kelPuzzle.air.german, texts.kelPuzzle.air.english)
        user:setQuestProgress(7017, 0)
    end

end

return M
