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
-- INSERT INTO triggerfields VALUES (801,449,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,450,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,451,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,452,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,453,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (805,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (806,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (807,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (808,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,462,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,463,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,464,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,465,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,466,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (795,461,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (795,462,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (794,462,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (794,463,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,463,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,464,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,464,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,465,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (794,456,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,456,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,455,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,455,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,454,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (791,454,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (790,454,0,'triggerfield.elstree_water_661');

local elementDrop = require("content.elementDrop")
local M = {}

function M.MoveToField(char)
    -- pure water will be created
    elementDrop.chanceForElementDrop(char, {successItemID = 2554})
end

return M
