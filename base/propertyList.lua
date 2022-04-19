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
local common = require("base.common")
local notice = require("item.notice")
local itemList = require("craft.base.itemList")
local M = {}
M.properties = {}
--Cadomyr houses
table.insert(M.properties, {name = "Villa Annabeth", lower = position(93,610,0), upper = position(104,619,1)})
table.insert(M.properties, {name = "Villa Annabeth", lower = position(119, 625, -7), upper = position(131, 643, -7)})
table.insert(M.properties, {name = "Villa Edward", lower = position(85,597,0), upper = position(97,606,1)})
table.insert(M.properties, {name = "Villa Reginald", lower = position(89,552,0), upper = position(97,561,0)})
table.insert(M.properties, {name = "Flat Faith and Obedience", lower = position(138,602,0), upper = position(144,605,0)})
table.insert(M.properties, {name = "Flat Honour and Lineage", lower = position(139,601,1), upper = position(145,605,1)})
table.insert(M.properties, {name = "Flat Truth and Justice", lower = position(137,606,0), upper = position(144,611,0)})
table.insert(M.properties, {name = "Flat Courage", lower = position(139,606,1), upper = position(145,611,1)})
table.insert(M.properties, {name = "Flat Patriarchy", lower = position(136,612,0), upper = position(146,617,0)})
table.insert(M.properties, {name = "Flat Property", lower = position(137,613,1), upper = position(147,618,1)})
--Runewick houses
table.insert(M.properties, {name = "First Fire Apartment", lower = position(946,748,0), upper = position(950,754,0)})
table.insert(M.properties, {name = "Second Fire Apartment", lower = position(951,748,0), upper = position(955,754,0)})
table.insert(M.properties, {name = "Third Fire Apartment", lower = position(960,748,0), upper = position(965,758,0)})
table.insert(M.properties, {name = "Third Fire Apartment", lower = position(956,748,0), upper = position(960,753,0)})
table.insert(M.properties, {name = "Fourth Fire Apartment", lower = position(955,748,1), upper = position(965,759,1)})
table.insert(M.properties, {name = "Fourth Fire Apartment", lower = position(950,748,1), upper = position(965,755,1)})
table.insert(M.properties, {name = "First Air Apartment", lower = position(959,835,1), upper = position(963,844,1)})
table.insert(M.properties, {name = "First Air Apartment", lower = position(956,841,11), upper = position(963,844,1)})
table.insert(M.properties, {name = "Second Air Apartment", lower = position(954,828,1), upper = position(961,833,1)})
table.insert(M.properties, {name = "First Earth Apartment", lower = position(901,757,1), upper = position(909,762,1)})
table.insert(M.properties, {name = "Second Earth Apartment", lower = position(901,763,1), upper = position(909,768,1)})
table.insert(M.properties, {name = "Third Earth Apartment", lower = position(901,758,-3), upper = position(907,762,-3)})
table.insert(M.properties, {name = "Third Earth Apartment", lower = position(903,758,-3), upper = position(907,766,-3)})
table.insert(M.properties, {name = "Fourth Earth Apartment", lower = position(901,767,-3), upper = position(907,770,-3)})
table.insert(M.properties, {name = "Fifth Earth Apartment", lower = position(893,766,-3), upper = position(897,773,-3)})
table.insert(M.properties, {name = "Sixth Earth Apartment", lower = position(893,758,-3), upper = position(897,765,-3)})
table.insert(M.properties, {name = "Cottage", "Landhaus", lower = position(785,795,0), upper = position(792,789,0)})
table.insert(M.properties, {name = "Quadruped Red Bird", lower = position(740,795,0), upper = position(755,803,0)})
table.insert(M.properties, {name = "Quadruped Red Bird", lower = position(741,795,1), upper = position(745,799,1)})
table.insert(M.properties, {name = "Quadruped Red Bird", lower = position(741,796,2), upper = position(744,799,2)})
--Galmair houses
table.insert(M.properties, {name = "House of Malachite", lower = position(367,309,0), upper = position(377,323,0)})
table.insert(M.properties, {name = "Villa Goldvein", lower = position(294,269,0), upper = position(309,281,0)})
table.insert(M.properties, {name = "Flat Irmorom", lower = position(372,207,-6), upper = position(384,214,-6)})
table.insert(M.properties, {name = "Flat Elara", lower = position(386,217,-6), upper = position(396,223,-6)})
table.insert(M.properties, {name = "Flat Adron", lower = position(384,224,-6), upper = position(395,233,-6)})
table.insert(M.properties, {name = "Flat Malachin", lower = position(383,234,-6), upper = position(395,242,-6)})
table.insert(M.properties, {name = "Flat Oldra", lower = position(369,224,-6), upper = position(376,236,-6)})
table.insert(M.properties, {name = "Flat Nargun", lower = position(385,234,-5), upper = position(395,243,-5)})
table.insert(M.properties, {name = "Flat Ronagan", lower = position(386,224,-5), upper = position(395,232,-5)})
table.insert(M.properties, {name = "Flat Sirani", lower = position(387,214,-5), upper = position(396,223,-5)})
table.insert(M.properties, {name = "Flat Zhambra", lower = position(371,206,-5), upper = position(386,213,-5)})
table.insert(M.properties, {name = "Lucky Copper", lower = position(409,289,1), upper = position(414,300,1)})
table.insert(M.properties, {name = "Silver Profit", lower = position(415,296,1), upper = position(426,300,1)})
table.insert(M.properties, {name = "Golden Deal", lower = position(420,286,1), upper = position(426,295,1)})
table.insert(M.properties, {name = "Golden Deal", lower = position(420,286,2), upper = position(426,292,2)})
table.insert(M.properties, {name = "Flat Sapphire", lower = position(394,212,1), upper = position(404,222,1)})
table.insert(M.properties, {name = "Flat Diamond", lower = position(405,206,1), upper = position(415,222,1)})
table.insert(M.properties, {name = "Flat Obsidian", lower = position(420,206,1), upper = position(432,220,1)})
--Estates, Galmair
table.insert(M.properties, {name = "Galmair Harbour Estate", lower = position(448,124,0), upper = position(458,135,2), estate = true})
table.insert(M.properties, {name = "Galmair Harbour Estate", lower = position(448,124,-21), upper = position(458,135,-21), estate = true})
table.insert(M.properties, {name = "Galmair Roadside Estate", lower = position(461,169,0), upper = position(473,181,2), estate = true})
table.insert(M.properties, {name = "Galmair Roadside Estate", lower = position(461,169,-21), upper = position(473,181,-21), estate = true})
table.insert(M.properties, {name = "Galmair Mountainside Estate", lower = position(566,157,0), upper = position(577,166,2), estate = true})
table.insert(M.properties, {name = "Galmair Mountainside Estate", lower = position(566,157,-21), upper = position(577,166,-21), estate = true})
--Cadomyr
table.insert(M.properties, {name = "Cadomyr Harbour Estate", lower = position(97,760,0), upper = position(107,767,2), estate = true})
table.insert(M.properties, {name = "Cadomyr Harbour Estate", lower = position(97,760,-21), upper = position(107,767,-21), estate = true})
table.insert(M.properties, {name = "Cadomyr Riverside Estate", lower = position(175,673,0), upper = position(182,682,2), estate = true})
table.insert(M.properties, {name = "Cadomyr Riverside Estate", lower = position(175,673,-21), upper = position(182,682,-21), estate = true})
table.insert(M.properties, {name = "Cadomyr Seaside Estate", lower = position(51,657,0), upper = position(60,663,2), estate = true})
table.insert(M.properties, {name = "Cadomyr Seaside Estate", lower = position(51,657,-21), upper = position(60,663,-21), estate = true})
--Runewick
table.insert(M.properties, {name = "Runewick Harbour Estate", lower = position(760,778,0), upper = position(767,785,2), estate = true})
table.insert(M.properties, {name = "Runewick Harbour Estate", lower = position(760,778,-21), upper = position(767,785,-21), estate = true})
table.insert(M.properties, {name = "Runewick Forest Estate", lower = position(863,882,0), upper = position(872,888,2), estate = true})
table.insert(M.properties, {name = "Runewick Forest Estate", lower = position(863,882,-21), upper = position(872,888,-21), estate = true})
table.insert(M.properties, {name = "Runewick Roadside Estate", lower = position(828,718,0), upper = position(834,726,2), estate = true})
table.insert(M.properties, {name = "Runewick Roadside Estate", lower = position(823,722,0), upper = position(834,726,2), estate = true})
table.insert(M.properties, {name = "Runewick Roadside Estate", lower = position(823,718,-21), upper = position(834,726,-21), estate = true})
--Outlaw
table.insert(M.properties, {name = "Outlaw Base One", lower = position(967,343,0), upper = position(983,362,2), estate = true, outlaw = true})
table.insert(M.properties, {name = "Outlaw Base One", lower = position(967,343,-21), upper = position(983,362,-21), estate = true, outlaw = true})


local handrail = 3601

local function checkPositionForStake(selectedPosition)
    local field = world:getField(selectedPosition)
    local itemsOnField = field:countItems()
    if itemsOnField >= 1 then
        local theStake = field:getStackItem(itemsOnField - 1 )
        if theStake.id == handrail then
            local stakeName = theStake:getData("nameEn")
            if stakeName == "Property Lot Stake" then
                return true
            end
        end
    end

    return false

end

local function clearStakePosition(selectedPosition)
    local field = world:getField(selectedPosition)
    local itemsOnField = field:countItems()
    while itemsOnField >= 1 do
        local chosenItem = field:getStackItem(itemsOnField - 1 )
        world:erase(chosenItem, chosenItem.number)
        itemsOnField = field:countItems()
    end
end

local function placeStakeOnPosition(selectedPosition)
    clearStakePosition(selectedPosition)
    local name = {english = "Property Lot Stake", german = "GERMAN TRANSLATION HERE!"}
    local description = {english = "A stake marking the corner of the boundary for a property lot.", german = "GERMAN TRANSLATION HERE!"}
    local theStake = world:createItemFromId(handrail, 1, selectedPosition, true, 999, {nameEn = name.english, nameDe = name.german, descriptionEn = description.english, descriptionDe = description.german})
    theStake.wear = 255
    world:changeItem(theStake)
end

local function checkIfPropertyHasTenant(propertyName)
    local foundOwner = ScriptVars:find("ownerof"..propertyName)
    if foundOwner then
        return true
    else
        return false
    end
end

function M.checkForAndPlaceMissingStakes()

    log("Check for and placing of missing stakes has been initiated.")
    for _, property in pairs(M.properties) do
        if not checkIfPropertyHasTenant(property.name) and property.lower.z == 0 and property.estate and not property.outlaw then
            local positions = {}
            positions[1] = property.lower
            positions[2] = position(property.upper.x, property.upper.y, property.lower.z)
            positions[3] = position(property.lower.x, property.upper.y, property.lower.z)
            positions[4] = position(property.upper.x, property.lower.y, property.lower.z)

            for _, selectedPosition in pairs(positions) do
                if not checkPositionForStake(selectedPosition) then
                    placeStakeOnPosition(selectedPosition)
                end
            end
        end
    end
end

function M.checkIfPlantOrTree(User, itemId)
    for _, item in pairs(itemList.items) do
        if item.category == "Plants" or item.category == "Trees" then
            if item.itemId == itemId then
                return true
            end
        end
    end
return false
end
function M.checkIfGardeningCriteriaMet(User, itemId)
local targetPosition = common.GetFrontPosition(User)
local targetField = world:getField(targetPosition)
local targetTileId = targetField:tile()
    for _, item in pairs(itemList.items) do
        if item.category == "Plants" or item.category == "Trees" then
            if item.itemId == itemId then
                local requiredSoil = item.criteria
                for _, gardenTile in pairs(itemList.gardening) do
                    if gardenTile.criteria == requiredSoil then
                        if gardenTile.tileId == targetTileId then
                            return true
                        end
                    end
                end
            end
        end
    end
return false
end
function M.setPersistenceForProperties()
    for _, property in pairs(M.properties) do
        for x = property.lower.x, property.upper.x do
            for y = property.lower.y, property.upper.y do
                for z = property.lower.z, property.upper.z do
                    world:makePersistentAt(position(x, y, z))
                end
            end
        end
    end
end
function M.checkIfEstate(User)
local propertyName = M.fetchPropertyName(User)
    for _, property in ipairs(M.properties) do
        if propertyName == property.name then
            if property.estate then
                return true
            end
        end
    end
return false
end
function M.checkIfOutlaw(User)
local propertyName = M.fetchPropertyName(User)
    for _, property in ipairs(M.properties) do
        if propertyName == property.name then
            if property.outlaw then
                return true
            end
        end
    end
return false
end
function M.fetchPropertyName(User, pos)
local direct = User:getFaceTo()
local d = 1
local vX, vY = common.GetDirectionVector(direct)
local x
local y
local z
    if pos == nil then
        x = User.pos.x + vX * d
        y = User.pos.y + vY * d
        z = User.pos.z
    else
        x = pos.x
        y = pos.y
        z = pos.z
    end
    for _, property in ipairs(M.properties) do
        if x >= property.lower.x
        and x <= property.upper.x
        and y >= property.lower.y
        and y <= property.upper.y
        and z >= property.lower.z
        and z <= property.upper.z then
            return property.name
        end
    end
    return nil
end
function M.fetchBuildersPermission(User, pos)
local propertyName = M.fetchPropertyName(User, pos)
    if M.fetchPropertyName(User, pos) then
    local foundOwner, currentOwner = ScriptVars:find("ownerof"..propertyName)
        if foundOwner then
            if currentOwner == User.name and not notice.checkForPropertyDeed(User) and not M.checkIfEntrance(User) then
                return true
            end
        end
    for i = 1, notice.max_builder_number do
        local foundBuilder, currentBuilder = ScriptVars:find("builder"..i..propertyName)
            if foundBuilder then
                if currentBuilder == User.name and not notice.checkForPropertyDeed(User) and not M.checkIfEntrance(User) then
                    return true
                end
            end
        end
    end
return false
end
function M.checkIfEntrance(User)
    if M.checkIfEstate(User) then
        return false
    end
local targetItem
    if not common.GetFrontItem(User) then
        return false
    else
        targetItem = common.GetFrontItem(User)
    end
    for _, item in pairs(itemList.items) do
        if item.category == "Stairs" or item.category == "Doors" or item.category == "Trap Doors" then
            if item.itemId == targetItem.id then
                return true
            end
        end
    end
    for i = 1, #itemList.alternateDoors do
        if targetItem.id == itemList.alternateDoors[i] then
            return true
        end
    end
return false
end
function M.checkIfStairsOrTrapDoor(User, itemId)
    for _, item in pairs (itemList.items) do
        if item.category == "Stairs" or item.category == "Trap Doors" then
            if item.itemId == itemId then
                return true
            end
        end
    end
return false
end
function M.checkIfRoofOrRoofTile(User, itemId, tileBoolean, tileId, createOrErase)
local tileIdentifier
    if createOrErase == "create" then
        tileIdentifier = itemId
    else
        tileIdentifier = tileId
    end
    if not tileBoolean then
        for _, item in pairs (itemList.items) do
            if item.category == "Roof" then
                if item.itemId == itemId then
                    return true
                end
            end
        end
    else
        for _, tile in pairs (itemList.tiles) do
            if tile.category == "Roof Tiles" then
                if tile.tileId == tileIdentifier then
                    return true
                end
            end
        end
    end
return false
end
function M.roofAndRoofTiles(User, itemId, tileBoolean, createOrErase)
local direct = User:getFaceTo()
local d = 1
local vX, vY = common.GetDirectionVector(direct)
local targetPosition = position(User.pos.x + vX * d, User.pos.y + vY * d, User.pos.z + 1)
local targetItem = world:getItemOnField(targetPosition)
local targetId
local tileField = world:getField(targetPosition)
local tileId = tileField:tile()
    if createOrErase == "create" then
        targetId = itemId
    elseif createOrErase == "erase" then
        targetId = targetItem.id
    end
    if not M.checkIfRoofOrRoofTile(User, targetId, tileBoolean, tileId, createOrErase) or not M.fetchBuildersPermission(User, targetPosition) then
        return false
    end
    if not tileBoolean then
        if createOrErase == "create" then
            world:createItemFromId(itemId, 1, targetPosition, true, 999, nil)
        elseif createOrErase == "erase" then
            world:erase(targetItem, 1)
            User:inform(common.GetNLS(User,"","You destroy the roof object."))
        end
    else
        if createOrErase == "create" then
            world:changeTile(itemId, targetPosition)
        elseif createOrErase == "erase" then
            world:changeTile(34, targetPosition)
            User:inform(common.GetNLS(User,"","You destroy the roof tile."))
        end
    end
return true
end
function M.createWarpsAndExitObject(User, itemId, createOrErase)
local direct = User:getFaceTo()
local d = 1
local vX, vY = common.GetDirectionVector(direct)
local targetPosition = position(User.pos.x + vX * d, User.pos.y + vY * d, User.pos.z)
local v2X = 0
local v2Y = 0
local v2Z = 0
local positionTwo
local positionThree
local positionFour
local trapStair
    if M.checkIfStairsOrTrapDoor then
        for _, stair in pairs(itemList.Stairs) do
            if stair.Downstairs == itemId then --It's a stair item
                if User.pos.z == 0 or User.pos.z == 1 then
                    v2Z = 1
                elseif User.pos.z == -21 then
                    v2Z = 21
                end
                if stair.Direction == "north" then
                    v2Y = -1
                elseif stair.Direction == "east" then
                    v2X = 1
                end
                positionTwo = position(targetPosition.x + v2X * 2, targetPosition.y + v2Y * 2, targetPosition.z + v2Z)
                positionThree = position(targetPosition.x + v2X * 3, targetPosition.y + v2Y * 3, targetPosition.z + v2Z)
                positionFour = position(targetPosition.x + v2X * -1, targetPosition.y + v2Y * -1, targetPosition.z)
                trapStair = stair.Upstairs
                if not M.fetchBuildersPermission(User, positionTwo) or not M.fetchBuildersPermission(User, positionThree) or not M.fetchBuildersPermission(User, positionFour) then
                    return false
                end
                if createOrErase == "create" then
                    M.createStairTrap(User, targetPosition, positionTwo, positionThree, positionFour, trapStair)
                elseif createOrErase == "erase" then
                    M.eraseStairTrap(User, targetPosition, positionTwo)
                end
            elseif stair.Upstairs == itemId then --It's a trap door item
                if User.pos.z == 0 then
                    v2Z = -21
                elseif User.pos.z == 1 or User.pos.z == 2 then
                    v2Z = -1
                end
                if stair.Direction == "north" then
                    v2Y = 1
                elseif stair.Direction == "east" then
                    v2X = -1
                end
                positionTwo = position(targetPosition.x + v2X * 2, targetPosition.y + v2Y * 2, targetPosition.z + v2Z)
                positionThree = position(targetPosition.x + v2X * 3, targetPosition.y + v2Y * 3, targetPosition.z + v2Z)
                positionFour = position(targetPosition.x + v2X * -1, targetPosition.y + v2Y * -1, targetPosition.z)
                trapStair = stair.Downstairs
                if not M.fetchBuildersPermission(User, positionTwo) or not M.fetchBuildersPermission(User, positionThree) or not M.fetchBuildersPermission(User, positionFour) then
                    return false
                end
                if createOrErase == "create" then
                    M.createStairTrap(User, targetPosition, positionTwo, positionThree, positionFour, trapStair)
                elseif createOrErase == "erase" then
                    M.eraseStairTrap(User, targetPosition, positionTwo)
                end
            end
        end
    end
return true
end
function M.createStairTrap(User, positionOne, positionTwo, positionThree, positionFour, trapStair)
local warpOne = world:getField(positionOne)
local warpTwo = world:getField(positionTwo)
    world:changeTile(40, positionTwo)
    world:changeTile(40, positionThree)
    world:createItemFromId(trapStair, 1, positionTwo, true, 999, nil)
    warpOne:setWarp(positionThree)
    warpTwo:setWarp(positionFour)
end
function M.eraseStairTrap(User, positionOne, positionTwo)
local warpOne = world:getField(positionOne)
local warpTwo = world:getField(positionTwo)
local targetItem = world:getItemOnField(positionTwo)
    world:erase(targetItem,1)
    if warpOne:isWarp() then
        warpOne:removeWarp()
    end
    if warpTwo:isWarp() then
        warpTwo:removeWarp()
    end
end
return M
