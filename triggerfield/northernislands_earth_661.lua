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
-- INSERT INTO triggerfields VALUES (426,24,0,'triggerfield.northernislands_earth_661');
-- INSERT INTO triggerfields VALUES (427,24,0,'triggerfield.northernislands_earth_661');
-- INSERT INTO triggerfields VALUES (426,25,0,'triggerfield.northernislands_earth_661');
-- INSERT INTO triggerfields VALUES (427,25,0,'triggerfield.northernislands_earth_661');

local elementDrop = require("content.elementDrop")
local M = {}

function M.MoveFromField(char)
    -- pure earth will be created
    elementDrop.chanceForElementDrop(char, {successItemID = 2552, failItemID = 1246, failGfxID = 3})
end

return M
