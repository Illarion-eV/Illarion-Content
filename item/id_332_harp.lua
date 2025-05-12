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

function M.UseItem(user, SourceItem, actionState)

    if actionState == Action.none then
        music.selectNote(user)
    elseif actionState == Action.success then
        music.playTheInstrument(user, actionState, true, false, "harp")
    elseif actionState == Action.abort then
        music.playTheInstrument(user, actionState, true, false, "harp")
    end

end

M.LookAtItem = wood.LookAtItem

return M

