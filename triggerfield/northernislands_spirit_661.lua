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
-- INSERT INTO triggerfields VALUES (389,35,0,'triggerfield.northernislands_spirit_661');
-- INSERT INTO triggerfields VALUES (390,35,0,'triggerfield.northernislands_spirit_661');
-- INSERT INTO triggerfields VALUES (389,36,0,'triggerfield.northernislands_spirit_661');
-- INSERT INTO triggerfields VALUES (390,36,0,'triggerfield.northernislands_spirit_661');

local elementDrop = require("content.elementDrop")
local M = {}

function M.MoveFromField(char)
    -- pure spirit will be created
    elementDrop.chanceForElementDrop(char, {successItemID = 3607, failItemID = 467, failGfxID = 16})
end

return M
