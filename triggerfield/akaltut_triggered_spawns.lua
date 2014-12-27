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
-- INSERT INTO triggerfields VALUES (464, 824, -9,'triggerfield.akaltut_triggered_spawns');
-- INSERT INTO triggerfields VALUES (467, 824, -9,'triggerfield.akaltut_triggered_spawns');
-- INSERT INTO triggerfields VALUES (460, 828, -9,'triggerfield.akaltut_triggered_spawns');
-- INSERT INTO triggerfields VALUES (461, 828, -9,'triggerfield.akaltut_triggered_spawns');
-- INSERT INTO triggerfields VALUES (476, 898, -9,'triggerfield.akaltut_triggered_spawns');
-- INSERT INTO triggerfields VALUES (505, 915, -9,'triggerfield.akaltut_triggered_spawns');
-- INSERT INTO triggerfields VALUES (479, 932, -9,'triggerfield.akaltut_triggered_spawns');
-- INSERT INTO triggerfields VALUES (464, 915, -9,'triggerfield.akaltut_triggered_spawns');


local common = require("base.common")

local M = {}

--This script handles scripted events on "Akaltuts Chambers -9" quest map
--Various events and fields are handled here for a better overview

local waypoint={} --a list with positions of the event triggers
waypoint[1] = position(464, 824, -9) -- one skeleton spawn
waypoint[2] = position(467, 824, -9)
waypoint[3] = position(460, 828, -9)
waypoint[4] = position(461, 828, -9)
waypoint[5] = position(476, 898, -9)
waypoint[6] = position(505, 915, -9)
waypoint[7] = position(479, 932, -9)
waypoint[8] = position(464, 915, -9)

local messageG = {} --German informs
messageG[1] = "Die Knochen unter deinen Füßen beginnen sich zu bewegen und sich wieder zusammensetzen!"


local messageE = {} --English informs
messageE[1] = "As you walk, the bones beneath your feet begin to move and reassemble themselves!"



function M.MoveToField(User)

    if User:getType() ~= Character.player then
        return
    end

    if math.random(1, 4) == 1 then --only player characters trigger the triggerfield at a chance of 20%

        local theWaypoint
        for i = 1, #waypoint do
            if User.pos == waypoint[i] then
                theWaypoint = i
                break
            end
        end

        -- skip if already tripped in the last 5 minutes
        if (world:isItemOnField(User.pos) == true) then
            local skele = world:getItemOnField(User.pos)
            local serverTime = world:getTime("unix")
            local trippingTime = skele:getData("tripping_time")

            if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
                return
            end
            -- safe tripping time
            skele:setData("tripping_time", serverTime)
            world:changeItem(skele)
        end

		if theWaypoint >= 1 and theWaypoint <= 8 then -- one skeleton

            common.InformNLS(User, messageG[2], messageE[2]) --sending a message

            local monList = {783, 784, 205} -- Golden Magnus, Golden Archer, Liche
            local monPos = common.getFreePos(waypoint[theWaypoint], 2) -- radius 2 around triggerfield
            world:createMonster(monList[math.random(1, #monList)], monPos, -20) -- 1 random skeleton of our list
            world:gfx(41, monPos) -- swirly

        end --all events handled

    end --triggerfield

end

return M

