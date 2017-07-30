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
-- INSERT INTO triggerfields VALUES (498,201,0,'triggerfield.galmair_bridges2_660');
-- INSERT INTO triggerfields VALUES (497,201,0,'triggerfield.galmair_bridges2_660');
-- INSERT INTO triggerfields VALUES (496,207,0,'triggerfield.galmair_bridges2_660');

local galmairbridges = require("triggerfield.galmair_bridges_660")

local M = {}

local monsterPositions = {
position(499,197,0),
position(498,197,0),
position(497,197,0),
position(497,206,0),
position(499,204,0),
position(496,207,0) --don't remove this one, it triggers the next function
}
local ambushName = "ambushBlackwaterBridge"

function M.MoveFromField(char)
    if not galmairbridges.isAmbush(ambushName) then
        if galmairbridges.getTimeSinceLastAmbush(ambushName)>120 then
            local ambushed = galmairbridges.triggerAmbush(char, monsterPositions)
            if ambushed then
                galmairbridges.setAmbush(ambushName, true)
                galmairbridges.setLastAmbush(ambushName)
            end
        end
    else
        galmairbridges.fightAmbush(char)
        galmairbridges.setAmbush(ambushName, false)
    end
end

return M
