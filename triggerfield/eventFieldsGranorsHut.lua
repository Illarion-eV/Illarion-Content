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
-- INSERT INTO triggerfields VALUES (13,691,1,'triggerfield.eventFieldsGranorsHut');



-- Triggerfields in Granor Bergenhieb's hut

local granorsHut = require("content.granorsHut")

local M = {}
debug("loaded")
function M.MoveFromField(user)
   debug("in MoveToField")
    if user.pos == position(13, 690, 0) then
        granorsHut.doorCheck(user)
    end

end

return M