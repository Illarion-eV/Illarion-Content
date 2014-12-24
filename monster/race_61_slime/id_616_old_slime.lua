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
--ID 616, Old Splime, Level: 0, Quest Monster - Slime feeding quest in Runewick

local base = require("monster.base.base")
local slimes = require("monster.race_61_slime.base")
local slimeFeeding = require("triggerfield.slimeFeeding")

local M = slimes.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, hue = 0, saturation = 0, value = 0.2, alpha = 180}
end

local DELETED = false
function M.abortRoute(monster)
    if monster.pos == slimeFeeding.WARP_TO_SLIME_POSITION then
        if world:isItemOnField(slimeFeeding.WARP_TO_SLIME_POSITION) and not DELETED then
            monster:talk(Character.say, "#mes schleimige Masse gleitet über das Futter und absorbiert es. Sein Körper wabbelt kurz ein Objekt tritt aus diesem raus, welches über die Ansperrung kataplutiert.",
                "#me's slimy mass flows over the feed and absorbs it. Its body wobbles for a short period of time and an object emerges from it, which is catapulted over the boundary.")
            local feeding = world:getItemOnField(slimeFeeding.WARP_TO_SLIME_POSITION)
            world:erase(feeding,feeding.number)
            local myItemList = slimeFeeding.REWARD_LIST[Random.uniform(1,#slimeFeeding.REWARD_LIST)]
            world:createItemFromId(myItemList.itemId, myItemList.amount, slimeFeeding.REWARD_POSITION, true, myItemList.quality, myItemList.data)
            DELETED = true
            monster.movepoints = monster.movepoints -50
        end
        monster.waypoints:addWaypoint(slimeFeeding.SLIME_CAVE_POSITION)
        monster:setOnRoute(true)

    elseif monster.pos == slimeFeeding.SLIME_CAVE_POSITION then
        monster:talk(Character.say, "#me fließt in die Höhlennische zurück.", "#me flows back into the small hole.")
        monster:increaseAttrib("hitpoints", -10000)
        slimeFeeding.FEEDING_IN_PROGRESS = false
        DELETED = false
    end
end

return M