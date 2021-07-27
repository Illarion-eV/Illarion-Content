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

-- UPDATE items SET itm_script = 'gm.items.id_3643_crashserver' WHERE itm_id = 3643;

-- To crash the server for debugging purposes:
-- 1. use the item
-- 2. look at the item

function M.UseItem(user, item, actionState)
    log("setting pos")
    M.pos = user.pos
    log("pos set")
end

function M.LookAtItem(user, item)
    log("reading pos")
    log("pos is: " .. M.pos) -- crash
    log("pos has been read")
end

return M
