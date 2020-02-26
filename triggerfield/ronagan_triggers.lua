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

-- INSERT INTO triggerfields VALUES (916, 590, -3,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (916, 591, -3,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (900, 605, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (900, 606, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (900, 607, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (890, 597, -6,'triggerfield.ronagan_triggers');

--Triggerfield events in Ronagan Thieves Dungeon

local common = require("base.common")

local M = {}

function M.MoveToField( User )

    if User:getType() ~= Character.player then
        return
    end

    if math.random(1, 4) == 1 and User.pos == position(916, 590, -3) or User.pos == position(916, 591, -3) then -- inform
        common.InformNLS(User,"Als du die Halle hinunterblickst, siehst du, dass stolz von jeder der drei Städte ein Wappenschild ausgestellt ist.","As you look down the hall, you see a shield is proudly displayed from each realm. ")
    elseif math.random(1, 4) == 1 and User.pos == position(900, 605, -9) or User.pos == position(900, 606, -9) or User.pos == position(900, 607, -9) then -- inform
        common.InformNLS(User,"Du bemerkst vielleicht, dass die Luft sehr stickig und schal ist, als ob dieser Ort nicht oft besucht würde.","You possibly notice the air is musty and stale as if this place is not visited often.")
    elseif User.pos == position(890, 597, -6) then -- inform
        common.InformNLS(User,"Die Münze auf dem Tisch reflektiert den Feuerschein und zieht deinen Blick auf sich.","The coins on the table catch your eye as they reflect the firelight.")
    end

end

return M
