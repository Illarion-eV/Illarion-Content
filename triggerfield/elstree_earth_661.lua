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
-- INSERT INTO triggerfields VALUES (823,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (822,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (821,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (820,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,486,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,487,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,488,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,489,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,490,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (832,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (833,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (834,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (835,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (836,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (837,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (838,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,471,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,472,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,473,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,474,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,475,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,476,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,477,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,478,0,'triggerfield.elstree_earth_661');

local elementDrop = require("content.elementDrop")
local M = {}

function M.MoveToField(char)
    -- pure earth will be created
    elementDrop.chanceForElementDrop(char, {successItemID = 2552})
end

return M
