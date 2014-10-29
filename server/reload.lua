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
-- called after every !rd command and !fr command
-- note that !rd is a !fr without npc and spawn reloading
-- note further that reload_tables will be called after this if and only if the !rd was successful and the !rd was issued by a !fr

local alchemy = require("alchemy.base.alchemy")
local areas = require("content.areas")
local lever = require("item.lever")

local M = {}

function M.onReload()

    alchemy.InitAlchemy();
    areas.Init();
    lever.init();
 
    return true;
end

return M