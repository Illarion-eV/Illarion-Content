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

-- Called upon every 10 seconds

local propertyList = require("housing.propertyList")
local utility = require("housing.utility")

local M = {}

M.queuedDemolishments = {}

local function addPropertyToBeDemolishedToListAndRemoveWarps(propertyName)

    local deed = utility.getPropertyDeed(propertyName)

    if deed:getData("demolish") ~= "true" then -- This is a string because item data can not be a boolean
        return -- Not scheduled for demolishment!
    end

    deed:setData("demolish", "false") --We no longer need to know if it is to be demolished, so we remove this for the next time it gets checked
    deed:setData("demolishmentInProgress", "true") -- Value used after initiation of demolishment to prevent building new items, particularly stairs that could lead to warps without stairs
    world:changeItem(deed)

    local propertyInfo = {
        time = 3000, -- The time it should take in total to demolish any property. It is set here instead of statically as it gets used as a countdown value.
        name = propertyName,
        layers = {
            roof = {
                items = {},
                tiles = {}
            },
            upper = {
                items = {},
                tiles = {}
            },
            ground = {
                items = {}
            },
            basement = {
                items = {}
            }
        }
    }

    for _, propertyToCheck in pairs(propertyList.properties) do
        if propertyToCheck.name == propertyName then
            if propertyToCheck.lower.z ~= -21 then -- Basement done separately as it can have different coords
                for x = propertyToCheck.lower.x, propertyToCheck.upper.x do -- Check each x coord
                    for y = propertyToCheck.lower.y, propertyToCheck.upper.y do --Check each y coord for each x coord

                        local theFieldGround = world:getField(position(x, y, 0))
                        local theFieldUpper = world:getField(position(x, y, 1))
                        local theFieldRoof = world:getField(position(x, y, 2))

                        if theFieldGround:isWarp() then
                            theFieldGround:removeWarp()
                        end

                        if theFieldUpper:isWarp() then
                            theFieldUpper:removeWarp()
                        end

                        if theFieldRoof:isWarp() then
                            theFieldRoof:removeWarp()
                        end

                        local tileIdRoof = theFieldRoof:tile()
                        local tileIdUpper = theFieldUpper:tile()

                        if theFieldRoof:countItems() > 0 then
                            table.insert(propertyInfo.layers.roof.items, {amount = theFieldRoof:countItems(), pos = position(x, y, 2)})
                        end

                        if theFieldUpper:countItems() > 0 then
                            table.insert(propertyInfo.layers.upper.items, {amount = theFieldUpper:countItems(), pos = position(x, y, 1)})
                        end

                        if theFieldGround:countItems() > 0 then
                            table.insert(propertyInfo.layers.ground.items, {amount = theFieldGround:countItems(), pos = position(x, y, 0)})
                        end

                        if tileIdRoof ~= 34 then
                            table.insert(propertyInfo.layers.roof.tiles, {field = theFieldRoof, pos = position(x, y, 2)})
                        end

                        if tileIdUpper ~= 34 then
                            table.insert(propertyInfo.layers.upper.tiles, {field = theFieldUpper, pos = position(x, y, 1)})
                        end
                    end
                end
            elseif propertyToCheck.lower.z == -21 then
                for x = propertyToCheck.lower.x, propertyToCheck.upper.x do -- Check each x coord
                    for y = propertyToCheck.lower.y, propertyToCheck.upper.y do --Check each y coord for each x coord
                        local theField = world:getField(position(x, y, -21))
                        local itemsOnField = theField:countItems()

                        if theField:isWarp() then
                            theField:removeWarp()
                        end

                        if itemsOnField > 0 then
                            table.insert(propertyInfo.layers.basement.items, {amount = itemsOnField, pos = position(x, y, -21)})
                        end
                    end
                end
            end
        end
    end

    table.insert(M.queuedDemolishments, propertyInfo)
end

local function deleteBasementItems(property)

    if #property.layers.basement.items < 0 then
        return
    end

    for index , basementItem in pairs(property.layers.basement.items) do

        for i = 1, basementItem.amount do
            if world:isItemOnField(basementItem.pos) then
                local theItem = world:getItemOnField(basementItem.pos)
                world:erase(theItem, theItem.number)
            end
        end

        table.remove(property.layers.basement.items, index)
    end

end

local function gfxSfxOnLocation(location)

    local rand = math.random()

    if rand > 0.90 then -- 10% chance
        world:gfx(12, location) -- Cloud smoke
    end

    if rand < 0.10 then -- 10% chance
        world:makeSound(6, location) -- Chopping sound
    end

    if rand > 0.10 and rand < 0.20 then -- 10% chance
        world:makeSound(18, location) -- Mining sound
    end
end

local function deleteItemsOnFloor(property, toDestroy, layer)

    local amountOfItems = #property.layers[layer].items

    if amountOfItems == 0 or toDestroy == 0 then --No items to destroy or none planned until next cycle of the script
        return toDestroy
    end

    local howManyToDestroy = math.min(amountOfItems, toDestroy) -- We choose whichever is smaller, the amount of items we want to destroy or the amount remaining

    local destroyed = 0

    for index, itemOnLayer in pairs(property.layers[layer].items) do

        for i = 1, itemOnLayer.amount do

            if howManyToDestroy == destroyed then
                return toDestroy
            end

            if world:isItemOnField(itemOnLayer.pos) then -- Double checks that item is still there
                local theItem = world:getItemOnField(itemOnLayer.pos)
                world:erase(theItem, theItem.number)
                destroyed = destroyed + 1
                gfxSfxOnLocation(itemOnLayer.pos)
                toDestroy = toDestroy - 1
            end

            table.remove(property.layers[layer].items, index)

        end
    end

    return toDestroy

end

local function deleteTilesOnFloor(property, toDestroy, layer)

    local amountOfTiles = #property.layers[layer].tiles

    if amountOfTiles == 0 or toDestroy == 0 then --No tiles to destroy or none planned until next cycle of the script
        return toDestroy
    end

    local howManyToDestroy = math.min(amountOfTiles, toDestroy) -- We choose whichever is smaller, the amount of items we want to destroy or the amount remaining

    local destroyed = 0

    for index, tileOnLayer in pairs(property.layers[layer].tiles) do

        if howManyToDestroy == destroyed then
            return toDestroy
        end

        local tileId = tileOnLayer.field:tile()

        if tileId ~= 0 then
            world:changeTile(0, tileOnLayer.pos)
            destroyed = destroyed + 1
            gfxSfxOnLocation(tileOnLayer.pos)
            toDestroy = toDestroy - 1
        end

        table.remove(property.layers[layer].tiles, index)

    end

    return toDestroy
end

function M.demolish()

    local pauldronDeed = utility.getPropertyDeed("Pauldron Estate") -- using the pauldron deed as a bit of a hack to store a variable instead of using the database, to avoid lag, since we are not allowed to use global variables

    if pauldronDeed:getData("newDemolishments") == "true" then -- Any new demolishments scheduled?

        for i = 1, #propertyList.propertyTable do --This table only lists each property once, so we use it to cycle through all the properties

            local propertyName = propertyList.propertyTable[i][1]

            addPropertyToBeDemolishedToListAndRemoveWarps(propertyName)
        end

        pauldronDeed = utility.getPropertyDeed("Pauldron Estate") -- refreshed in case it was set for demolishment above so we do not overwrite any of that

        pauldronDeed:setData("newDemolishments", "false") -- This ensures the script does not strain the server, only going through all properties if we know at least one is scheduled for demolishment

        world:changeItem(pauldronDeed)

    end

    for index, property in pairs(M.queuedDemolishments) do --Anything beyond this point only happens if an estate is actually scheduled for demolition

        deleteBasementItems(property)

        local timeLeft = property.time

        local totalDestructionLeft = #property.layers.roof.tiles + #property.layers.roof.items + #property.layers.upper.tiles + #property.layers.upper.items + #property.layers.ground.items

        if totalDestructionLeft == 0 then -- All done, remove it from the list
            table.remove(M.queuedDemolishments, index)
            local deed = utility.getPropertyDeed(property.name)
            deed:setData("demolishmentInProgress", "false")
            world:changeItem(deed)
            return
        end

        local toDestroy = totalDestructionLeft/timeLeft*10 -- The amount of objects to destroy divided by the time left and multiplied by the time it takes for how often this script triggers

        if toDestroy < 1 then -- At least one item destroyed each cycle
            toDestroy = 1
        else
            toDestroy = math.floor(toDestroy)
        end

        toDestroy = deleteItemsOnFloor(property, toDestroy, "roof")

        toDestroy = deleteTilesOnFloor(property, toDestroy, "roof")

        toDestroy = deleteItemsOnFloor(property, toDestroy, "upper")

        toDestroy = deleteTilesOnFloor(property, toDestroy, "upper")

        toDestroy = deleteItemsOnFloor(property, toDestroy,"ground")

        if toDestroy > 0 then --Something must have been removed by other means while destruction was ongoing, so we remove it from the schedule
            table.remove(M.queuedDemolishments, index)
            local deed = utility.getPropertyDeed(property.name)
            deed:setData("demolishmentInProgress", "false")
            world:changeItem(deed)
            return
        end

        property.time = property.time - 10

        M.queuedDemolishments[index] = property

    end
end


return M
