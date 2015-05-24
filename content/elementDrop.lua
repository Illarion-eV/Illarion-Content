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

local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

local function fairyBlinkenlights(centerPos, counter, itemID, gfxID)

    local amount = math.random(3, 7)
    local radius = 15

    -- show a few fairy lights around
    for _ = 1, amount do
        local dropPos = common.getFreePos(centerPos, radius)
        world:gfx(gfxID, dropPos)
    end

    -- create a random item (i.e. flame)
    if itemID ~= nil then
        local dropPos = common.getFreePos(centerPos, radius)
        local item = world:createItemFromId(itemID, 1, dropPos, true, 333, nil)
        item.wear = 1
        world:changeItem(item)
    end

    -- repeat effect a few times
    counter = counter - 1
    if counter > 0 then
        scheduledFunction.registerFunction(math.random(2, 5), function() fairyBlinkenlights(centerPos, counter, itemID, gfxID) end)
    end
end

local function elementNoDrop(User, itemID, gfxID)
    -- player get informed s/he missed chance after a while
    scheduledFunction.registerFunction(math.random(5, 10), function() 
        -- check if character has already logged out
        if not isValidChar(User) then
            return
        end

        User:inform("Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.", "It does not look like as any fairy would drop an element today.")
    end)

    -- register effect
    local centerPos = position(User.pos.x, User.pos.y, User.pos.z) -- deep copy original position
    local counter =  math.random(10, 20)
    scheduledFunction.registerFunction(math.random(2, 5), function() fairyBlinkenlights(centerPos, counter, itemID, gfxID) end)
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

local function elementDrop(User, itemID, gfxID)
    local radius = 10
    local dropPos = common.getFreePos(User.pos, radius)

    -- drop item after a while and inform user
    scheduledFunction.registerFunction(math.random(1, 4), function()
        -- check if character has already logged out
        if not isValidChar(User) then
            return
        end

        world:createItemFromId(itemID, 1, dropPos, true, 333, nil)
        world:gfx(gfxID, dropPos)

        local directionTextDe, directionTextEn = getTextForDirection(common.GetDirection(User.pos, dropPos))
        User:inform(
            "Ah! Eine Fee hat " .. world:getItemName(itemID, Player.german) .. " " .. directionTextDe .. " verloren.",
            "Ah! A fairy lost " .. world:getItemName(itemID, Player.english) .. " " .. directionTextEn .. ".")
    end)
end

function M.chanceForElementDrop(User, params)

    if params ~= nil and not _isTable(params) then
        error("The function requires parameters as a table.")
    end

    -- chance check if quest cooled down and character is player
    if User:getType() ~= Character.player or User:getQuestProgress(661) ~= 0  then
        return
    end
    -- set cooldown
    User:setQuestProgress(661, math.random(60, 100))

    -- fill default parameters
    local probability
    local successItemID
    local successGfxID
    local failItemID
    local failGfxID

    if params.probability ~= nil then
        if _isNumber(params.probability) then
            probability = tonumber(params.probability)
            if (probability <= 0) or (probability > 1) then
                error("The probability is set to a illegal value.")
            end
        else
            error("The probability was set to something, but not to a number.")
        end
    else
        probability = 0.1 -- 10%
    end
    if params.successItemID ~= nil then
        if _isNumber(params.successItemID) then
            successItemID = tonumber(params.successItemID)
        else
            error("successItemID was set to something, but not to a number.")
        end
    else
        local elements = {2551, 2552, 2553, 2554, 3607}
        successItemID = elements[math.random(1, #elements)] -- random pure element
    end
    if params.successGfxID ~= nil then
        if _isNumber(params.successGfxID) then
            successGfxID = tonumber(params.successGfxID)
        else
            error("successGfxID was set to something, but not to a number.")
        end
    else
        successGfxID = 46  -- light (beam me up)
    end
    if params.failItemID ~= nil then
        if _isNumber(params.failItemID) then
            failItemID = tonumber(params.failItemID)
        else
            error("failItemID was set to something, but not to a number.")
        end
    else
       -- nothing
    end
    if params.failGfxID ~= nil then
        if _isNumber(params.failGfxID) then
            failGfxID = tonumber(params.failGfxID)
        else
            error("failGfxID was set to something, but not to a number.")
        end
    else
        failGfxID = 53  -- light (blue glitter)
    end

    -- chance to receive a nice item
    if math.random() <= probability then
        elementDrop(User, successItemID, successGfxID)
    else
        elementNoDrop(User, failItemID, failGfxID)
    end
end

return M
