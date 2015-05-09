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
-- INSERT INTO triggerfields VALUES (415,85,0,'triggerfield.northernislands_water_661');
-- INSERT INTO triggerfields VALUES (415,79,0,'triggerfield.northernislands_water_661');
-- INSERT INTO triggerfields VALUES (416,79,0,'triggerfield.northernislands_water_661');
-- INSERT INTO triggerfields VALUES (478,34,0,'triggerfield.northernislands_water_661');
-- INSERT INTO triggerfields VALUES (478,30,0,'triggerfield.northernislands_water_661');
-- INSERT INTO triggerfields VALUES (479,30,0,'triggerfield.northernislands_water_661');

local elementDrop = require("content.elementDrop")
local M = {}

local createNorthItemIDB={360}
local createNorthGfx={4}

function M.MoveFromField(char)
    -- pure water will be created
    elementDrop.chanceForElementDrop(char, 2554)
end

return M
