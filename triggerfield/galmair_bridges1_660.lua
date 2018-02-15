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
-- INSERT INTO triggerfields VALUES (479,250,0,'triggerfield.galmair_bridges1_660');
-- INSERT INTO triggerfields VALUES (479,249,0,'triggerfield.galmair_bridges1_660');
-- INSERT INTO triggerfields VALUES (474,247,0,'triggerfield.galmair_bridges1_660');

local galmairbridges = require("triggerfield.galmair_bridges_660")

local M = {}

local monsterPositions = {
position(482,248,0),
position(483,249,0),
position(483,249,0),
position(483,250,0),
position(474,249,0),
position(474,247,0) --don't remove this one, it triggers the next function
}
local ambushName = "ambushCopperBridge"

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
