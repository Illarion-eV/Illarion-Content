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

-- INSERT INTO triggerfields VALUES (376, 476, 1,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (385, 460, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (434, 464, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (435, 464, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (436, 464, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (434, 463, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (435, 463, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (436, 463, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (434, 465, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (435, 465, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (436, 465, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (434, 466, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (435, 466, 2,'triggerfield.dragorog_cult_trigger');
-- INSERT INTO triggerfields VALUES (436, 466, 2,'triggerfield.dragorog_cult_trigger');

local common = require("base.common")

local M = {}

function M.MoveToField(char)
    if char:getType() ~= Character.player then
        return
    end

    if  char.pos == position(376, 476, 1) then -- warp up to Dragorog cult dungeon
        char:warp(position(385, 461, 2))
    
    elseif char.pos == position(385, 460, 2) then -- warp down from Dragorog cult dungeon
        char:warp(position(376, 471, 1))
        
    elseif char:isInRangeToPosition((position (435, 462, 2)), 2) and char:getQuestProgress(515) == 16 then -- Player found Milly
        char:setQuestProgress(515, 17)
        common.InformNLS(char, "Vor dem Altar liegt die übel zugerichtete Leiche einer Elfin. Der Beschreibung Aelfinns nach, handelt es sich hierbei wohl um seine entführte Geliebte. Du solltest zurückgehen und ihm von ihrem Schicksal berichten.", "In front of the altar lies a rather gruesome looking elven corpse. Judging by Aelfinn's description, this is probably his kidnapped lover. You should return to him and tell him about his girlfriend's fate.")
    end

end


return M

