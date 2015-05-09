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

-- This script handles fairy events in Elstree Forest.
-- The functions are hooked in the various scripts with the actual entry points.

local common = require("base.common")
local scheduledFunction = require("scheduled.scheduledFunction")

local M = {}

local function fairyBlinkenlights(centerPos, counter)

    local amount = math.random(3, 7)
    local radius = 15

    -- show a few fairy lights around
    for _ = 1, amount do
        local posX = centerPos.x + math.random(-radius, radius)
        local posY = centerPos.y + math.random(-radius, radius)
        world:gfx(53, position(posX, posY, centerPos.z)) -- light (blue glitter)
    end

    -- repeat effect a few times
    counter = counter - 1
    if counter > 0 then
        scheduledFunction.registerFunction(math.random(2, 5), function() fairyBlinkenlights(centerPos, counter) end)
    end
end

local function elementNoDrop(User)
    -- player get informed s/he missed chance after a while
    scheduledFunction.registerFunction(math.random(5, 10), function()
        User:inform("Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.", "It does not look like as any fairy would drop an element today.")
    end)

    -- register effect
    local centerPos = position(User.pos.x, User.pos.y, User.pos.z) -- deep copy original position
    local counter =  math.random(10, 20)
    scheduledFunction.registerFunction(math.random(2, 5), function() fairyBlinkenlights(centerPos, counter) end)
end

local function getTextForDirection(direction)
    if direction == Character.dir_north then
        return "nördlich von dir", "north of you"
    elseif direction == Character.dir_northeast then
        return "nordöstlich von dir", "northeast of you"
    elseif direction == Character.dir_east then
        return "östlich von dir", "east of you"
    elseif direction == Character.dir_southeast then
        return "südöstlich von dir", "southeast of you"
    elseif direction == Character.dir_south then
        return "südlich von dir", "south of you"
    elseif direction == Character.dir_southwest then
        return "südwestlich von dir", "southwest of you"
    elseif direction == Character.dir_west then
        return "westlich von dir", "west of you"
    elseif direction == Character.dir_northwest then
        return "nordwestlich von dir", "northwest of you"
    else
        return "unter deinen Beinen", "underneath your feet"
    end
end

local function elementDrop(User, itemID)
    local radius = 10
    local dropPos = common.getFreePos(User.pos, radius)

    -- drop item after a while and inform user
    scheduledFunction.registerFunction(math.random(1, 4), function()
        world:createItemFromId(itemID, 1, dropPos, true, 333, nil)
        world:gfx(46, dropPos) -- light (beam me up)

        local directionTextDe, directionTextEn = getTextForDirection(common.GetDirection(User.pos, dropPos))
        User:inform(
            "Ah! Eine Fee hat " .. world:getItemName(itemID, Player.german) .. " " .. directionTextDe .. " verloren.",
            "Ah! A fairy lost " .. world:getItemName(itemID, Player.english) .. " " .. directionTextEn .. ".")
    end)
end

function M.chanceForElementDrop(User, itemID)
    -- chance check if quest cooled down and character is player
    if User:getType() ~= Character.player or User:getQuestProgress(661) ~= 0  then
        return
    end

    -- set cooldown
    User:setQuestProgress(661, math.random(60, 100))

    -- 10% chance to receive a nice item
    if math.random(1, 10) == 1 then
        elementDrop(User, itemID)
    else
        elementNoDrop(User)
    end
end

return M
