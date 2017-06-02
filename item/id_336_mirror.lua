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
-- UPDATE items SET itm_script='item.id_336_mirror' WHERE itm_id = 336;

local playerlookat = require("server.playerlookat")
local jewel = require("item.general.jewel")

local M = {}

M.LookAtItem = jewel.LookAtItem

function M.UseItem(User, SourceItem)
    local output = playerlookat.getCharDescription( User, User, 2);
    -- 2 means mode mirror 
    User:inform(output);
end

return M

