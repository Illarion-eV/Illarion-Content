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
-- INSERT INTO triggerfields VALUES (247, 782, 1,'triggerfield.letma_triggered_spawns');
-- INSERT INTO triggerfields VALUES (225, 770, 1,'triggerfield.letma_triggered_spawns');
-- INSERT INTO triggerfields VALUES (269, 791, 1,'triggerfield.letma_triggered_spawns');
-- INSERT INTO triggerfields VALUES (248, 811, 1,'triggerfield.letma_triggered_spawns');
-- INSERT INTO triggerfields VALUES (248, 809, 1,'triggerfield.letma_triggered_spawns');
-- INSERT INTO triggerfields VALUES (239, 818, 1,'triggerfield.letma_triggered_spawns');

local common = require("base.common")

local M = {}

--This script handles scripted events on "Letma" map
--Various events and fields are handled here for a better overview

local waypoint={} --a list with positions of the event triggers
waypoint[1] = position(247, 782, 1) -- bettles or wasps
waypoint[2] = position(225, 770, 1)
waypoint[3] = position(269, 791, 1)
waypoint[4] = position(248, 811, 1)
waypoint[5] = position(248, 809, 1)
waypoint[6] = position(239, 818, 1)

local messageG = {} --German informs
messageG[1] = "Als du über den Baumstamm steigst störst Du etwas was darunter verborgen war."

local messageE = {} --English informs
messageE[1] = "As you step over the log, you disturb something that was hiding under it."

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

        -- skip if already tripped in the last 10 minutes
        if (world:isItemOnField(User.pos) == true) then
            local fallenlog = world:getItemOnField(User.pos)
            
            if fallenlog.id ~= 2169 or fallenlog.id ~= 2170 then
                return
            end
            
            local serverTime = world:getTime("unix")
            local trippingTime = fallenlog:getData("tripping_time")

            if (trippingTime ~= "" and ((tonumber(trippingTime) + 600) > serverTime)) then
                return
            end
            -- safe tripping time
            fallenlog:setData("tripping_time", serverTime)
            world:changeItem(fallenlog)
        else
            return
        end

        if theWaypoint >= 1 and theWaypoint <= 6 then -- beetles and wasp spawns

            common.InformNLS(User, messageG[1], messageE[1]) --sending a message

            local monList = {592, 982, 271, 272, 273} -- beetles and wasp
            for i = 1, math.random(1, 3) do -- random count
                local monPos = common.getFreePos(waypoint[theWaypoint], 2) -- radius 2 around triggerfile
                world:createMonster(monList[math.random(#monList)], monPos, -20) -- random monsters from list
                world:gfx(41, monPos) -- swirly
            end
        end --all events handled

    end --triggerfield

end

return M

