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

local shared = require("magic.nature.shared")
local antiTroll = require("magic.base.antiTroll")
local common = require("base.common")

local M = {}

local function getWear(user, spellName)

    local baseWear = 2 -- 3-6 min, base cant be 1 as with bad luck it could be 0-3 min
    local wear = shared.scaleEffect(user, spellName, baseWear)

    local maxWear = 10 -- Max 27-30 minutes

    return math.min(maxWear, math.max(baseWear, wear))
end

local function getLimit(user, spellName)

    local base = 1 --Always allow spawning 1
    local limit = shared.scaleEffect(user, spellName, base)

    return limit
end

local function checkForPreExistingObject(myPosition)

    local field = world:getField(myPosition)
    local numberOfItems = field:countItems()

    if numberOfItems > 0 then
        for i = 1, numberOfItems do
            local theItem = field:getStackItem(i)
            if theItem:getData("druidSpell") ~= "" then
                return true
            end
        end
    end

    return false
end

local function clearSpace(user, objectLimit, objectId)

    local positionsToCheck = M.existingObjects[user.id][objectId]

    if #positionsToCheck < objectLimit then
        return --Still within the limit
    end

    local lowestWear
    local lowestWearIndex

    for index, thePosition in ipairs(positionsToCheck) do

        local theField = world:getField(thePosition)
        local itemFound = false

        for i = 1, theField:countItems() do
            local checkItem = theField:getStackItem(theField:countItems() - i )
            if objectId == checkItem.id then
                itemFound = checkItem
            end
        end

        if not itemFound then
            table.remove(positionsToCheck, index)
            return
        end

        local itemWear = itemFound.wear

        if itemFound and (not lowestWear or lowestWear > itemWear) then
            lowestWear = itemWear
            lowestWearIndex = index
        end

        if index == #positionsToCheck then
            common.DeleteItemFromStack(positionsToCheck[lowestWearIndex], {itemId = objectId})
            table.remove(positionsToCheck, lowestWearIndex)
        end
    end

end

function M.spawnStaticObject(user, spellName, thePosition, objectId)

    local wear = getWear(user, spellName)

    if not antiTroll.passesAntiTrollCheck(thePosition) then
        return
    end

    if checkForPreExistingObject(thePosition) then
        return
    end

    if not M.existingObjects then
        M.existingObjects = {}
    end

    if not M.existingObjects[user.id] then
        M.existingObjects[user.id] = {}
    end

    if not M.existingObjects[user.id][objectId] then
        M.existingObjects[user.id][objectId] = {}
    end

    local objectLimit = getLimit(user, spellName)

    clearSpace(user, objectLimit, objectId) -- If there are spawns beyond the limit, we check for despawns and clear space if not

    world:createItemFromId(objectId, 1, thePosition, true, 999, {["druidSpell"] = spellName})
    local item = world:getItemOnField(thePosition)
    item.wear = wear
    table.insert(M.existingObjects[user.id][objectId], thePosition)
    world:changeItem(item)
end

local function isSoil(location) -- A seedling needs suitable soil to be able to grow

    local suitableSoilList = {3, 4, 8, 9, 10, 11, 12, 14, 16, 74, 76}

    local theField = world:getField(location)

    local myFieldId = theField:tile()

    for _, soil in pairs(suitableSoilList) do
        if myFieldId == soil then
            return true
        end
    end

    return false

end

function M.effect(user, location, target)

    if not isSoil(location) then
        return
    end

    world:gfx(58, location)
    world:makeSound(13, location)
    M.spawnStaticObject(user, "Seegwynt", location, Item.druidicSeedling)
end

function M.checksToPass(user, location, target)

    if not isSoil(location) then
        user:inform("Selbst mit deiner Fähigkeit, die Fäden der Natur zu lenken, kannst selbst du keine Pflanze ohne Erde wachsen lassen.", "Even with your ability to manipulate the weaves of nature, even you can't grow a plant without soil.")
        return false
    end

    return true
end

return M
