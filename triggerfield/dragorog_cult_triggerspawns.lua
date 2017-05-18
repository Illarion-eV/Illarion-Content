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
-- INSERT INTO triggerfields VALUES (401, 436, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (396, 438, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (396, 442, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (393, 435, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (392, 441, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (391, 444, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (390, 439, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (390, 437, 2,'triggerfield.dragorog_cult_triggerspawns');
-- INSERT INTO triggerfields VALUES (388, 437, 2,'triggerfield.dragorog_cult_triggerspawns');


local common = require("base.common")

local M = {}

--This script handles scripted events on "Dragorog Cult" quest map
--Various events and fields are handled here for a better overview

local spiderEgg={} --a list with positions of the event triggers
spiderEgg[1] = position(401, 436, 2) -- spider queen
spiderEgg[2] = position(396, 438, 2)
spiderEgg[3] = position(396, 442, 2)
spiderEgg[4] = position(393, 435, 2)
spiderEgg[5] = position(392, 441, 2)
spiderEgg[6] = position(391, 444, 2)
spiderEgg[7] = position(390, 439, 2)
spiderEgg[8] = position(390, 437, 2)
spiderEgg[9] = position(388, 437, 2)

function M.MoveToField(User)

    if User:getType() ~= Character.player then
        return
    end

    if math.random(1, 10) == 1 then --only player characters trigger the triggerfield at a chance of 10%

        local thespiderEgg
        for i = 1, #spiderEgg do
            if User.pos == spiderEgg[i] then
                thespiderEgg = i
                break
            end
        end

        -- skip if already tripped in the last 10 minutes
        if (world:isItemOnField(User.pos) == true) then
            local egg = world:getItemOnField(User.pos)
            
            if egg.id ~= 1174 then
                return
            end
            
            local serverTime = world:getTime("unix")
            local trippingTime = egg:getData("tripping_time")

            if (trippingTime ~= "" and ((tonumber(trippingTime) + 600) > serverTime)) then
                return
            end
            -- safe tripping time
            egg:setData("tripping_time", serverTime)
            world:changeItem(egg)
        else
            return
        end

        if thespiderEgg then -- Chance of spider queen spawn

            common.InformNLS(User,"Du schreckst eine Spinne auf und wirst sofort angegriffen!", "You disturb a spider and are immediately attacked!") --sending a message

            local monPos = common.getFreePos(spiderEgg[thespiderEgg], 3) -- radius 3 around triggerfield
            world:createMonster(195, monPos, -20) -- the queen!
            world:gfx(41, monPos) -- swirly

        end --all events handled

    end --triggerfield

end

return M

