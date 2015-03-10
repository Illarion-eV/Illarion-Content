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

-- UPDATE items SET itm_script='item.vase' WHERE itm_id IN (75,292,315);

local common = require("base.common")

local M = {}

local lakeOfLifeVasePos = {
    position(660, 239, -9),
    position(744, 204, -9),
    position(777, 187, -9),
    position(705, 263, -9),
    position(725, 287, -9),
    position(763, 263, -9),
    position(777, 284, -9),
    position(759, 304, -9)
}

function M.UseItem(User, SourceItem)

    for i = 1, #lakeOfLifeVasePos do
        if (SourceItem.pos == lakeOfLifeVasePos[i]) and User:getQuestProgress(508) == 1 then
            world:gfx(53, User.pos) -- nice GFX
            world:makeSound(13, User.pos) -- nice SFX
            common.InformNLS(User, "Das Pulver legt sich auf deine feuchte Haut und du beginnst zu glitzern.", "The powder settles on your damp body and you begin to sparkle.")
            User:setQuestProgress(508, 0)
            User:setQuestProgress(509, 0)
        elseif (SourceItem.pos == lakeOfLifeVasePos[i]) and User:getQuestProgress(508) == 0 then
            common.InformNLS(User, "Du musst dich für diese Arbeit erst reinigen.", "You must cleanse first for this to work.")
        end
    end
end

return M
