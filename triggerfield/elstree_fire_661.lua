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
-- INSERT INTO triggerfields VALUES (838,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (839,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (840,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (841,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (845,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (846,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (847,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (848,406,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,401,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,402,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,403,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,404,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,408,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,409,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,410,0,'triggerfield.elstree_fire_661');
-- INSERT INTO triggerfields VALUES (843,411,0,'triggerfield.elstree_fire_661');

local elementDrop = require("content.elementDrop")
local M = {}

function M.MoveToField(char)
    -- pure fire will be created
    elementDrop.chanceForElementDrop(char, {successItemID = 2553})
end

return M
