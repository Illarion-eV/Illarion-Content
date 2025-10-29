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

-- UPDATE items SET itm_script='item.id_335_lute' WHERE itm_id=335;

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

local wood = require("item.general.wood")
local music = require("item.base.music")

local M = {}

local function obsidimineQuest(user, lute)

    local questPos = position(701, 614, -6)

    local questProgress = user:getQuestProgress(510)

    if lute.pos == questPos and questProgress == 27 then
        user:setQuestProgress(510, 28)
        user:inform("Du greifst nach vorn, um vorsichtig eine goldene Saite von der Laute zu zupfen, um sie zu Obsidimine zurückzubringen.", "You reach forward to carefully pluck a golden string from the lute, to bring back to Obsidimine.")
    end

end

function M.UseItem(user, sourceItem, actionState)

    obsidimineQuest(user, sourceItem) --Dragon lair quest

    if actionState == Action.none then
        music.selectNote(user)
    else
        music.playTheInstrument(user, actionState)
    end

end

M.LookAtItem = wood.LookAtItem

return M

