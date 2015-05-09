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
-- INSERT INTO triggerfields VALUES (488,13,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (496,7,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (499,14,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (502,21,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (499,28,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (480,27,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (419,72,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (423,61,0,'triggerfield.northernislands_air_661');
-- INSERT INTO triggerfields VALUES (420,75,0,'triggerfield.northernislands_air_661');

local elementDrop = require("content.elementDrop")
local M = {}

local createNorthItemIDB={372}
local createNorthGfx={8}

function M.MoveFromField(char)
    -- pure air will be created
    elementDrop.chanceForElementDrop(char, 2551)
end

return M
