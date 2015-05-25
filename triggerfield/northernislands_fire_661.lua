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
-- INSERT INTO triggerfields VALUES (363,52,0,'triggerfield.northernislands_fire_661');
-- INSERT INTO triggerfields VALUES (364,52,0,'triggerfield.northernislands_fire_661');
-- INSERT INTO triggerfields VALUES (363,53,0,'triggerfield.northernislands_fire_661');
-- INSERT INTO triggerfields VALUES (364,53,0,'triggerfield.northernislands_fire_661');

local elementDrop = require("content.elementDrop")
local M = {}

function M.MoveFromField(char)
    -- pure fire will be created
    elementDrop.chanceForElementDrop(char, {successItemID = 2553, failItemID = 359, failGfxID = 9})
end

return M
