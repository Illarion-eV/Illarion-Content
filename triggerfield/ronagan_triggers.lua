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
-- INSERT INTO triggerfields VALUES (900, 598, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (900, 599, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (900, 600, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (899, 594, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (897, 594, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (896, 594, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (895, 594, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (893, 594, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (892, 594, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (899, 591, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (897, 591, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (896, 591, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (895, 591, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (893, 591, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (892, 591, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (899, 588, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (897, 588, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (896, 588, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (895, 588, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (893, 588, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (892, 588, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (899, 585, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (897, 585, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (896, 585, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (895, 585, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (893, 585, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (892, 585, -9,'triggerfield.ronagan_triggers');
-- INSERT INTO triggerfields VALUES (890, 597, -6,'triggerfield.ronagan_triggers');

--Triggerfield events in Ronagan Thieves Dungeon

local common = require("base.common")

local M = {}

function M.MoveToField( User )

    if User:getType() ~= Character.player then
        return
    end

    if Random.uniform(1, 4) == 1 and User.pos == position(916, 590, -3) or User.pos == position(916, 591, -3) then -- inform
        common.InformNLS(User,"Als du die Halle hinunterblickst, siehst du, dass stolz von jeder der drei Städte ein Wappenschild ausgestellt ist.","As you look down the hall, you see a shield is proudly displayed from each realm. ")
    elseif Random.uniform(1, 4) == 1 and User.pos == position(900, 605, -9) or User.pos == position(900, 606, -9) or User.pos == position(900, 607, -9) then -- inform
        common.InformNLS(User,"Du bemerkst vielleicht, dass die Luft sehr stickig und schal ist, als ob dieser Ort nicht oft besucht würde.","You possibly notice the air is musty and stale as if this place is not visited often.")
    elseif User.pos == position(900, 598, -9) or User.pos == position(900, 599, -9)  or User.pos == position(900, 600, -9)  then -- light some camp fires.
        world:erase(world:getItemOnField(position(898, 600, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:erase(world:getItemOnField(position(898, 597, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:erase(world:getItemOnField(position(894, 600, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:erase(world:getItemOnField(position(894, 597, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:createItemFromId(12, 1, position(898, 600, -9), true, 500, nil) -- add lit camp fires
        world:createItemFromId(12, 1, position(898, 597, -9), true, 500, nil) -- add lit camp fires
        world:createItemFromId(12, 1, position(894, 600, -9), true, 500, nil) -- add lit camp fires
        world:createItemFromId(12, 1, position(894, 597, -9), true, 500, nil) -- add lit camp fires
    elseif User.pos == position(899, 594, -9) or User.pos == position(897, 594, -9)  or User.pos == position(896, 594, -9) or User.pos == position(895, 594, -9) or User.pos == position(893, 594, -9) or User.pos == position(892, 594, -9)  then -- light some camp fires.
        world:erase(world:getItemOnField(position(898, 594, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:erase(world:getItemOnField(position(894, 594, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:createItemFromId(12, 1, position(898, 594, -9), true, 500, nil) -- add lit camp fires
        world:createItemFromId(12, 1, position(894, 594, -9), true, 500, nil) -- add lit camp fires
    elseif User.pos == position(899, 591, -9) or User.pos == position(897, 591, -9)  or User.pos == position(896, 591, -9) or User.pos == position(895, 591, -9) or User.pos == position(893, 591, -9)  or User.pos == position(892, 591, -9)  then -- light some camp fires.
        world:erase(world:getItemOnField(position(898, 591, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:erase(world:getItemOnField(position(894, 591, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:createItemFromId(12, 1, position(898, 591, -9), true, 500, nil) -- add lit camp fires
        world:createItemFromId(12, 1, position(894, 591, -9), true, 500, nil) -- add lit camp fires
    elseif User.pos == position(899, 588, -9) or User.pos == position(897, 588, -9)  or User.pos == position(896, 588, -9) or User.pos == position(895, 588, -9) or User.pos == position(893, 588, -9)  or User.pos == position(892, 588, -9)  then -- light some camp fires.
        world:erase(world:getItemOnField(position(898, 588, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:erase(world:getItemOnField(position(894, 588, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:createItemFromId(12, 1, position(898, 588, -9), true, 500, nil) -- add lit camp fires
        world:createItemFromId(12, 1, position(894, 588, -9), true, 500, nil) -- add lit camp fires
    elseif User.pos == position(899, 585, -9) or User.pos == position(897, 585, -9)  or User.pos == position(896, 585, -9) or User.pos == position(895, 585, -9) or User.pos == position(893, 585, -9)  or User.pos == position(892, 585, -9)  then -- light some camp fires.
        world:erase(world:getItemOnField(position(898, 585, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:erase(world:getItemOnField(position(894, 585, -9)), 1) --remove unlit fire, scheduled/mapitemreset will clean up
        world:createItemFromId(12, 1, position(898, 585, -9), true, 500, nil) -- add lit camp fires
        world:createItemFromId(12, 1, position(894, 585, -9), true, 500, nil) -- add lit camp fires
    elseif User.pos == position(890, 597, -6) then -- inform
        common.InformNLS(User,"Die Münze auf dem Tisch zieht deinen Blick auf sich, als sie den Feuerschein reflektiert.","The coins on the table catch your eye as they reflect the firelight.")
    end

end

return M
