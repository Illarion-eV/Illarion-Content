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

local propertyList = require("housing.propertyList")
local itemList = require("housing.itemList")
local common = require("base.common")
local money = require("base.money")
local factions = require("base.factions")
local messenger = require("content.messenger")
local doors = require("base.doors")
local depotScript = require("item.id_321_depot")
local moreUtility = require("housing.moreUtility")

local M = {}

 -- Cadomyr, Runewick, Galmair
 M.townManagmentItemPos = factions.townManagmentItemPos
 M.max_guest_number = 20
 M.max_builder_number = 20

 local function informDoesntExist(user)
    user:inform("Dieser Name ist unbekannt. Hast du den Namen vielleicht falsch geschrieben?", "Nobody of that name is recognised here. Did you perhaps misspell the name?")
 end

 function M.isOutlawProperty(propertyName)

    for _, property in pairs(propertyList.properties) do
        if property.name == propertyName then
            return property.outlaw
        end
    end
end

M.checkOwner = moreUtility.checkOwner

function M.checkForCoTenants(deed, user)

    for i = 1, 10 do
        local cotenant = deed:getData("coTenantID"..i)

        if not common.IsNilOrEmpty(cotenant) and tonumber(cotenant) == user.id then
            return true
        end
    end
end



 function M.checkIfStairsOrTrapDoor(itemId)
    for _, item in pairs (itemList.items) do
        if item.category == "Stairs" and item.itemId == itemId then
            return true, "stairs"
        elseif item.category == "Trap Doors" and item.itemId == itemId then
            return true, "trapdoor"
        end
    end
    return false
end

function M.checkIfRoofOrRoofTile(theId, tileBoolean, above)

    if not tileBoolean then
        for _, item in pairs (itemList.items) do
            if item.category == "Roof(Above)" and item.itemId == theId and above == true then
                return true
            end
        end
    else
        for _, tile in pairs (itemList.tiles) do
            if theId == 0 then
                return false
            elseif tile.category == "Roof Tiles(Above)" and tile.tileId == theId and above == true then
                return true
            end
        end
    end
    return false
end

function M.getTilePreview(tileId)

    for _, tile in pairs(itemList.tiles) do
        if tileId == tile.tileId then
            return tile.displayId
        end
    end

    return false
end

M.fetchPropertyName = moreUtility.fetchPropertyName


function M.checkIfGardeningCriteriaMet(user, itemId)
    local targetPosition = common.GetFrontPosition(user)
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

local function isIvy(itemId)

    if itemId == 644 or itemId == 645 or itemId == 646 or itemId == 647 then
        return true
    end

    return false
end

local function isGrass(itemId)

    if itemId == 1782 or itemId == 1783 then
        return true
    end

    return false
end

function M.checkIfPlantOrTree(itemId)
    for _, item in pairs(itemList.items) do
        if item.category == "Plants" or item.category == "Trees" then
            if item.itemId == itemId and not isIvy(itemId) and not isGrass(itemId) then
                return true
            end
        end
    end
    return false
end

function M.checkIfBasementExclusive(itemId)
    for _, item in pairs(itemList.items) do
        if item.itemId == itemId and item.category == "Basement Exclusive" then
            return true
        end
    end
    return false
end

function M.checkRequiredFood(user, time)
    local neededFood = time*4 --One second of crafting takes 40 food points, same as in crafts

    if common.FitForHardWork(user, math.ceil(neededFood+time*0.1)) then --Each second, one spends one food point per default.
        return true, neededFood
    else
        return false, 0
    end
end

local function notPermittedToBuildOnEntrances(user)
    user:inform("Du kannst nicht auf Treppen oder Türen bauen.", "You're not permitted to build on stairs or doorways.")
end

local function cantBuildOnPropertyDeed(user)
    user:inform("Du kannst nicht auf dem Feld der Grundstücksurkunde bauen.", "The property deed is off limits for building.")
end

function M.checkIfPlayerKnowsSkillByName(user, skillName)

    if skillName == "misc" then
        return true
    end

    local skill = Character[skillName]

    local level = user:getSkill(skill)

    if level > 0 then
        return true
    end

    return false
end

function M.checkIfSkillOnlyHasEstateContents(skill)

    for _, indexedSkill in pairs(itemList.skills) do
        if indexedSkill.name == skill and indexedSkill.estate then
            return true
        end
    end

    return false

end

function M.checkIfSkillIsShown(user, skill)

    if not M.checkIfSkillOnlyHasEstateContents(skill) or M.checkIfEstate(user) then
        return true
    end

    return false

end

function M.isAutomaticRentEnabled(property)
    local propertyDeed = M.getPropertyDeed(property)
    local result = propertyDeed:getData("automaticRentExtension")

    if result ~= "" then
        if tonumber(result) == 1 then
            return true
        end
    end

    return false
end

function M.checkIfEstate(User)
    local propertyName = M.fetchPropertyName(User)
    for _, property in ipairs(propertyList.properties) do
        if propertyName == property.name then
            if property.estate then
                return true
            end
        end
    end
    return false
end

function M.checkIfEstateViaName(propertyName)
    for i = 1, #propertyList.propertyTable do
        if propertyName == propertyList.propertyTable[i][1] then
            if propertyList.propertyTable[i][11] then
                return true
            end
        end
    end

    return false

end

function M.checkIfEntrance(user, pos, tile)

    if M.checkIfEstate(user) then --Estates are allowed to build on entrances
        return false
    end

    if tile then
        return false -- You can build a tile under entrances
    end

    local targetItem

    if world:isItemOnField(pos) then
        targetItem = world:getItemOnField(pos)
    else
        return false
    end

    for _, item in pairs(itemList.items) do
        if item.category == "Stairs" or item.category == "Doors" or item.category == "Trap Doors" then
            if item.itemId == targetItem.id then
                notPermittedToBuildOnEntrances(user)
                return true
            end
        end
    end

    for i = 1, #itemList.alternateDoors do
        if targetItem.id == itemList.alternateDoors[i] then
            notPermittedToBuildOnEntrances(user)
            return true
        end
    end

    return false
end

function M.checkForPropertyDeed(user)
    local targetTile = common.GetFrontPosition(user)
        for i = 1, #propertyList.propertyTable do
            if targetTile == propertyList.propertyTable[i][3] then
                cantBuildOnPropertyDeed(user)
                return true
            end
        end
    return false
end

function M.checkIfOutlaw(User)
    local propertyName = M.fetchPropertyName(User)
    for _, property in ipairs(propertyList.properties) do
        if propertyName == property.name then
            if property.outlaw then
                return true
            end
        end
    end
    return false
end

function M.checkIfPropertyHasTenant(propertyName)
    local deed = M.getPropertyDeed(propertyName)
    local tenant = deed:getData("tenant")
    if tenant ~= "" then
        return true
    else
        return false
    end
end

M.getPropertyDeed = moreUtility.getPropertyDeed

function M.checkIfItemIsWallDeco(itemId)

    for _, item in pairs(itemList.items) do
        if item.itemId == itemId then
            if item.category == "Paintings"
            or item.category == "Flags and crests"
            or item.category == "Wall Decorations"
            or item.category == "Chimneys"
            or (item.category == "Sign Posts" and item.skill == "blacksmithing")
            then return true
            end
        end
    end

    return false
end

function M.wallWindowPermissions(user, pos, id, tile)

    if tile then --While items can not be built on walls in non-estate properties, you should still be able to change the tile under them
        return true
    end

    local suspectedWall

    if world:isItemOnField(pos) then
            suspectedWall = world:getItemOnField(pos)
        end

    if suspectedWall and not M.checkIfEstate(user) and M.checkIfWallOrWindow(user, suspectedWall) then
        if not M.checkIfItemIsWallDeco(id) then
            user:inform("Du kannst diesen Gegenstand nicht auf dem Feld einer Mauer bzw. eines Fensters bauen.", "You can't build that item on a wall/window.")
            return false
        end
    end

    return true
end

function M.checkPositionForStake(selectedPosition)
    local handrail = 3601
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

function M.checkIfWallOrWindow(user, suspectedWall)

    if not suspectedWall then
        return false
    end

    for _, item in pairs(itemList.items) do
        if item.category == "Walls" or item.category == "Windows" then
            if item.itemId == suspectedWall.id then
                return true
            end
        end
    end

    return false
end

function M.isBuilder(user)

    local frontPos = common.GetFrontPosition(user)

    local propertyName = M.fetchPropertyName(user, frontPos)

    local deed = M.getPropertyDeed(propertyName)

    for i = 1, M.max_builder_number do

        local builderID = deed:getData("builderID"..i)

        if builderID ~= "" and tonumber(builderID) == user.id then
            return true
        end
    end

    return false
end

function M.isTenant(user)

    local frontPos = common.GetFrontPosition(user)

    local propertyName = M.fetchPropertyName(user, frontPos)

    local deed = M.getPropertyDeed(propertyName)

    local tenantID = deed:getData("tenantID")

    if (tenantID ~= "" and tonumber(tenantID) == user.id) or M.checkForCoTenants(deed, user) then
        return true
    end

    return false
end



function M.allowBuilding(user, alternatePosition)

    local frontPos = common.GetFrontPosition(user)
        if alternatePosition then
            frontPos = alternatePosition
        end
    local propertyName = M.fetchPropertyName(user, frontPos)

    local deed = M.getPropertyDeed(propertyName)

    if not deed then
        return false
    end

    if deed:getData("demolishmentInProgress") == "true" then
        user:inform("Du kannst nicht auf einem Grundstück bauen, wo alles zum Abriss vorgesehen ist.", "You can not build at an estate that is being demolished.")
        return false, true
    end

    if M.fetchPropertyName(user, frontPos) then

        local tenantID = deed:getData("tenantID")

        if tenantID ~= "" and tonumber(tenantID) == user.id then
            return true
        end

        if M.checkForCoTenants(deed, user) then
            return true
        end

        for i = 1, M.max_builder_number do

            local builderID = deed:getData("builderID"..i)

            if builderID ~= "" and tonumber(builderID) == user.id then
                return true
            end
        end
    end

    return false

end

function M.itemIsLitLightSource(itemId)

    local litObjects = {392, 402, 404, 2851, 2852, 400, 397, 396, 394, 2855}

    for _, litObject in pairs(litObjects) do
        if litObject == itemId then
            return true
        end
    end

    return false

end

function M.isStaticPermitted(user, targetItem)

    if not M.allowBuilding(user) then
        return false
    end

    if M.itemIsLitLightSource(targetItem.id) then
        return false
    end

    for i = 1, #itemList.excludedFromStatic do
        if targetItem.id == itemList.excludedFromStatic[i] then
            return false
        end
    end

    return true

end

function M.checkIfDestroyingPermitted(user, targetItem)

    if not M.allowBuilding(user) then
        return
    end

    for _, item in pairs(itemList.items) do
        if item.itemId == targetItem.id then
            if item.typeOf == "Estate" then
                if M.checkIfEstate(user) then
                    return true
                end
            else
                return true
            end
        elseif M.checkIfEstate(user) then --Estates can destroy anything on the property, even things they can not build.
            return true
        end
    end

    return false
end

function M.checkIfIsInHand(user, sourceItem)
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == sourceItem.id and common.isBroken(sourceItem) == false then
        return true
    elseif rightTool.id == sourceItem.id and common.isBroken(sourceItem) == false then
        return true
    end

    user:inform("Die Baukelle muss noch intakt sein und du musst sie in einer Hand halten, um sie zu benutzen.", "The construction trowel must be intact and in one of your hands for you to use it.")
    return false
end

function M.roofAndRoofTiles(user, itemId, tileBoolean, createOrErase, above)
    local thePosition = common.GetFrontPosition(user)
    local targetPosition = position(thePosition.x, thePosition.y, thePosition.z + 1)
    local lowerPosition = position(targetPosition.x, targetPosition.y, targetPosition.z - 1)

    if not world:getField(targetPosition) then -- Check if a field even exists above
        targetPosition = lowerPosition
    end

    if not world:getField(lowerPosition) then -- Should never happen, but just in case
        return
    end

    local targetItem = world:getItemOnField(targetPosition)
    local targetId
    local tileField = world:getField(targetPosition)

    if user.pos.z < 0 then
        user:inform("You're underground. There's no roof for you to manage.")
        return
    end

    if createOrErase == "create" then
        targetId = itemId
    elseif createOrErase == "erase" then
        above = true --No need to differentiate the types for deletion
        targetId = targetItem.id
    end

    if tileBoolean and createOrErase == "erase" then
        above = true --No need to differentiate the types for deletion
        targetId = tileField:tile()
    end

    if not M.checkIfRoofOrRoofTile(targetId, tileBoolean, above) then
        return false
    end

    if not M.allowBuilding(user, targetPosition) then
        return false
    end

    if not tileBoolean then
        if createOrErase == "create" then
            M.ifNoTileAddOne(targetPosition)
            world:createItemFromId(itemId, 1, targetPosition, true, 999, nil)
        elseif createOrErase == "erase" then
            local itemDeleted = common.DeleteItemFromStack(targetPosition, {itemId = targetItem.id})
            M.removeElevation(targetPosition)
            if itemDeleted then
                user:inform(common.GetNLS(user,"Du zerstörst den Gegenstand auf dem Dach.","You destroy the roof object."))
            end
        end
    else
        if createOrErase == "create" then
            world:changeTile(itemId, targetPosition)
        elseif createOrErase == "erase" then
            world:changeTile(34, targetPosition)
            user:inform(common.GetNLS(user,"Du zerstörst das Dachfeld.","You destroy the roof tile."))
        end
    end
    return true
end

function M.getRealmPropertyBelongsTo(propertyName)

    for _, property in pairs(propertyList.propertyTable) do
        if property[1] == propertyName then
            return property[7]
        end
    end

end

function M.realmAllowsFarming(pos)

    local propertyName = M.getPropertyLocationIsPartOf(pos)
    local realm = M.getRealmPropertyBelongsTo(propertyName)

    if realm == "Cadomyr" then
        return false
    end

    return true

end

local staticTools = {
    {id = 119, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"pottery", "cookingAndBaking"}, purpose = "baking"}, --baking oven
    {id = 120, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"pottery", "cookingAndBaking"}, purpose = "baking"}, --baking oven
    {id = 305, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair", "Cadomyr"}, builderSkills = {"pottery", "cookingAndBaking"}, purpose = "grilling"}, --smoking oven
    {id = 304, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair", "Cadomyr"}, builderSkills = {"pottery", "cookingAndBaking"}, purpose = "grilling"}, --smoking oven
    {id = 3581, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"smithing", "cookingAndBaking"}, purpose = "cooking"}, --kettle
    {id = 250, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"mining", "farming"}, purpose = "milling"}, --millstone
    {id = 339, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "brewing"}, purpose = "brewing"}, --wine barrel
    {id = 1410, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "brewing"}, purpose = "brewing"}, --wine barrel
    {id = 1411, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "brewing"}, purpose = "brewing"}, --wine barrel
    {id = 321, value = 0, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair", "Cadomyr"}, builderSkills = {"carpentry", "smithing", "spatialMagic"}, purpose = "storage"}, --depot
    {id = 4817, value = 0, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair", "Cadomyr"}, builderSkills = {"carpentry", "smithing", "spatialMagic"}, purpose = "storage"}, --depot
    {id = 1008, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair", "Cadomyr"}, builderSkills = {"smithing", "alchemy"}, purpose = "alchemy"}, --cauldron
    {id = 428, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "husbandry"}, purpose = "candlemaking"}, --chandler table
    {id = 3830, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "mining"}, purpose = "stonecutting"}, --stoneworking table
    {id = 3831, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "mining"}, purpose = "stonecutting"}, --stoneworking table
    {id = 44, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "mining"}, purpose = "pressing"}, --press
    {id = 724, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "woodcutting"}, purpose = "carpentry"}, --carpentry workbench
    {id = 725, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "woodcutting"}, purpose = "carpentry"}, --carpentry workbench
    {id = 1204, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "woodcutting"}, purpose = "sawing"}, --sawing trestle
    {id = 1205, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "woodcutting"}, purpose = "sawing"}, --sawing trestle
    {id = 3869, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Galmair"}, builderSkills = {"pottery", "smithing"}, purpose = "smelting"}, --bloomery
    {id = 3870, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Galmair"}, builderSkills = {"pottery", "smithing"}, purpose = "smelting"}, --bloomery
    {id = 270, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Galmair"}, builderSkills = {"carpentry", "gemcutting"}, purpose = "gemcutting"}, --gem grinder
    {id = 172, value = 3, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Galmair"}, builderSkills = {"smithing", "mining"}, purpose = "smithing"}, --anvil, value of 3 as it supports 3 crafts unlike the others that support 1
    {id = 3502, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair", "Cadomyr"}, builderSkills = {"carpentry", "magic"}, purpose = "magic"}, --magic desk
    {id = 3503, value = 1, realms = {"Outlaw", "Runewick", "Troll's Haven", "Galmair", "Cadomyr"}, builderSkills = {"carpentry", "magic"}, purpose = "magic"}, --magic desk
    {id = 2052, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"carpentry", "tanningAndWeaving"}, purpose = "tanning"}, --stretcher
    {id = 1226, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"carpentry", "tanningAndWeaving"}, purpose = "dyeing"}, --dyeing barrel
    {id = 171, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"carpentry", "tanningAndWeaving"}, purpose = "spinning"}, --spinning wheel
    {id = 169, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"carpentry", "tanningAndWeaving"}, purpose = "weaving"}, --loom
    {id = 103, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"carpentry", "tailoring"}, purpose = "tailoring"}, --tailoring table
    {id = 102, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"carpentry", "tailoring"}, purpose = "tailoring"}, --tailoring table
    {id = 1240, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"pottery", "digging"}, purpose = "pottery"}, --kiln
    {id = 1241, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"pottery", "digging"}, purpose = "pottery"}, --kiln
    {id = 1242, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"pottery", "digging"}, purpose = "pottery"}, --kiln
    {id = 1243, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"pottery", "digging"}, purpose = "pottery"}, --kiln
    {id = 313, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"pottery", "glassBlowing"}, purpose = "glassblowing"}, --glass melting oven
    {id = 727, value = 1, realms = {"Outlaw", "Cadomyr", "Troll's Haven", "Runewick"}, builderSkills = {"smithing", "digging"}, purpose = "sifting"}, --sieve
    {id = 3879, value = 1, realms = {"Outlaw", "Galmair", "Troll's Haven", "Runewick"}, builderSkills = {"digging", "farming"}, purpose = "threshing"}, --threshing floor
    {id = 1387, value = 1, realms = {"Outlaw", "Galmair", "Troll's Haven", "Runewick", "Cadomyr"}, builderSkills = {"mining", "cookingAndBaking"}, purpose = "grilling"}, --grill
    {id = 1388, value = 1, realms = {"Outlaw", "Galmair", "Troll's Haven", "Runewick", "Cadomyr"}, builderSkills = {"mining", "cookingAndBaking"}, purpose = "grilling"}, --grill
    {id = 1389, value = 1, realms = {"Outlaw", "Galmair", "Troll's Haven", "Runewick", "Cadomyr"}, builderSkills = {"mining", "cookingAndBaking"}, purpose = "grilling"}, --grill
    {id = 1390, value = 1, realms = {"Outlaw", "Galmair", "Troll's Haven", "Runewick", "Cadomyr"}, builderSkills = {"mining", "cookingAndBaking"}, purpose = "grilling"}, --grill
    {id = 1386, value = 1, realms = {"Outlaw", "Galmair", "Troll's Haven", "Runewick"}, builderSkills = {"mining", "cookingAndBaking"}, purpose = "cooking"}, -- oven, kettle alternative
}

local function isStaticTool(productId)

    for _, staticTool in pairs(staticTools) do
        if staticTool.id == productId then
            return staticTool
        end
    end

    return false
end

local function getPlayersReadyToBuild(user, pos)

    local players = world:getPlayersInRangeOf(pos, 2)

    local playersReadyToBuild = {}

    local propertyName = M.getPropertyLocationIsPartOf(pos)

    local deed = M.getPropertyDeed(propertyName)

    local helperAmount = deed:getData("helperAmount")

    if common.IsNilOrEmpty(helperAmount) then
        helperAmount = 0
    end

    for i = 1, helperAmount do
        local helperFound = false
        local helper = deed:getData("helper"..i)
        if not common.IsNilOrEmpty(helper) then
            for _, player in pairs(players) do
                if player.id == tonumber(helper) then
                    table.insert(playersReadyToBuild, player)
                    helperFound = true
                end
            end
        end

        if not helperFound and not common.IsNilOrEmpty(helper)  then
            M.removeHelper(nil, deed, tonumber(helper)) --Clean up the helper in case they somehow managed to leave the area without the dialog closing properly, possibly via log out
        end
    end

    local playerIsInList = false

    for _, player in pairs(playersReadyToBuild) do --Just checking in case of cheats before adding the user
        if player == user then
            playerIsInList = true
        end
    end

    if not playerIsInList then
        table.insert(playersReadyToBuild, user)
    end

    --check and add to list if these players are waiting to build

    return playersReadyToBuild

end

local function getPlayerLevel(player, skill)

    local level = 0

    local magicSkills = {"fireMagic", "spiritMagic", "windMagic","earthMagic","waterMagic", "enchanting", "spatialMagic"}

    local smithingSkills = {"finesmithing", "blacksmithing", "armourer"}

    if skill == "magic" then
        for _, magicSkill in pairs(magicSkills) do
            local newLevel = player:getSkill(Character[magicSkill])
            if newLevel > level then
                level = newLevel
            end
        end

    elseif skill == "smithing" then
        for _, smithingSkill in pairs(smithingSkills) do
            local newLevel = player:getSkill(Character[smithingSkill])
            if newLevel > level then
                level = newLevel
            end
        end
    else
        level = player:getSkill(Character[skill])
    end

    return level

end

local function canAssignSkills(skills, skillList, assigned, skillIndex)
    if skillIndex > #skillList then
        return true -- All skills successfully assigned
    end

    local skill = skillList[skillIndex]

    for _, player in ipairs(skills[skill]) do
        if not assigned[player] then
            assigned[player] = true -- Assign player
            if canAssignSkills(skills, skillList, assigned, skillIndex + 1) then
                return true -- Found valid assignment
            end
            assigned[player] = nil -- Backtrack
        end
    end

    return false -- No valid assignment found
end

function M.buildersReady(user, productId, pos)

    local staticTool = isStaticTool(productId)

    if not staticTool then
        return true
    end

    local lackingExpertise = common.GetNLS(user,
        "Du benötigst die Expertise, einschließlich deiner eigenen, falls vorhanden, eines Großmeisters des ",
        "You need the expertise, your own included should you have it, of a grandmaster of ")

    for index, skill in ipairs(staticTool.builderSkills) do
        if index ~= 1 then
            lackingExpertise = lackingExpertise ..
                (index == #staticTool.builderSkills and common.GetNLS(user, " und ", " and ") or ", ")
            lackingExpertise = lackingExpertise ..
                common.GetNLS(user, " eines Großmeisters der ", " a grandmaster of ")
        end

        lackingExpertise = lackingExpertise ..
            (skill == "magic" and common.GetNLS(user, "Magie", "magic") or skill == "smithing" and
            common.GetNLS(user, "Schmiedekunst", "smithing") or user:getSkillName(Character[skill]))
    end

    lackingExpertise = lackingExpertise .. "."

    lackingExpertise = lackingExpertise..common.GetNLS(user, " Jeder Großmeister muss neben dem Ort stehen, an dem du das Objekt bauen möchtest, und kein Großmeister kann zwei Fertigkeiten gleichzeitig ausführen.", " Each grandmaster must stand next to where you want to build the object, and no grandmaster can handle two skills at once.")

    local readyPlayersNearPos = getPlayersReadyToBuild(user, pos)
    local skills = {}

    -- Collect players for each skill
    for _, skill in ipairs(staticTool.builderSkills) do
        skills[skill] = {}
        for _, player in ipairs(readyPlayersNearPos) do
            if getPlayerLevel(player, skill) == 100 then
                table.insert(skills[skill], player)
            end
        end
    end

    -- Backtracking to find a valid assignment
    if canAssignSkills(skills, staticTool.builderSkills, {}, 1) then
        return true
    end

    user:inform(lackingExpertise)
    return false
end

function M.supportedTool(productId, pos)

    if not isStaticTool(productId) then
        return true
    end

    local propertyName = M.getPropertyLocationIsPartOf(pos)
    local realm = M.getRealmPropertyBelongsTo(propertyName)

    for _, staticTool in pairs(staticTools) do
        if staticTool.id == productId then
            for _, realmName in pairs(staticTool.realms) do
                if realm == realmName then
                    return true
                end
            end
            break
        end
    end
    return false
end

local function checkFieldForStatictool(thePosition, staticToolsOnProperty)

    if not staticToolsOnProperty then
        staticToolsOnProperty = {}
    end

    local field = world:getField(thePosition)
    local itemsOnField = field:countItems()
    for i = 0, itemsOnField do
        local chosenItem = field:getStackItem(itemsOnField - i )
        for _, staticTool in pairs(staticTools) do
            if chosenItem.id == staticTool.id and chosenItem:getData("preview") ~= "true" then
                table.insert(staticToolsOnProperty, chosenItem.id)
            end
        end
    end

    return staticToolsOnProperty
end

function M.staticToolAlreadyOnField(user, productId, pos)

    if not isStaticTool(productId) then
        return false
    end

    local tools = checkFieldForStatictool(pos)

    if #tools > 0 then
        user:inform("Du kannst kein statisches Werkzeug auf einem Feld bauen, das bereits eines hat.", "You can't build a static tool on a field that already has one.")
        --We reuse a function that returns as a table, even though we only need to check for one tool
        return true
    end

    return false
end

function M.checkPropertyForStaticTools(frontPos)

    local staticToolsOnProperty = {}

    local propertyName = M.getPropertyLocationIsPartOf(frontPos)

    for _, property in pairs(propertyList.properties) do
        if property.name == propertyName then
            for x = property.lower.x, property.upper.x do
                for y = property.lower.y, property.upper.y do
                    for z = property.lower.z, property.upper.z do
                        local thePosition = position(x, y, z)
                        staticToolsOnProperty = checkFieldForStatictool(thePosition, staticToolsOnProperty)
                    end
                end
            end
        end
    end

    return staticToolsOnProperty
end

local function categoryAlreadyChecked(checkedCategories, purpose)

    for _, checkedCategory in pairs(checkedCategories) do
        if checkedCategory == purpose then
            return true
        end
    end

    return false
end

function M.tooManyTools(user, productId, frontPos)

    local productIsStaticTool = isStaticTool(productId)

    if not productIsStaticTool then
        return false
    end

    local listOfExistingTools = M.checkPropertyForStaticTools(frontPos)

    local totalValue = 0

    local productValue

    local checkedCategories = {}

    for _, existingTool in pairs(listOfExistingTools) do
        for _, staticTool in pairs(staticTools) do
            if existingTool == staticTool.id and not categoryAlreadyChecked(checkedCategories, staticTool.purpose) then
                table.insert(checkedCategories, staticTool.purpose)
                totalValue = totalValue + staticTool.value
            end
        end
    end

    for _, checkedCategory in pairs(checkedCategories) do
        for _, staticTool in pairs(staticTools) do
            if staticTool.purpose == checkedCategory then
                if staticTool.id == productId then
                    return false --You can build as many as you want of static tools that do the same as one you already have on the property, for aesthetic freedom
                end
            end
        end
    end

    for _, staticTool in pairs(staticTools) do
        if staticTool.id == productId then
            productValue = staticTool.value
        end
    end

    if productValue == 0 then
        return false
    end

    if totalValue == 0 then
        return false
    end

    local maxValue = 5 --This allows a full set, for instance, Tailoring: Tailoring table, loom, spinning wheel, empty dyeing barrel and stretcher.

    if totalValue >= maxValue then
        user:inform("Du hast bereits so viele statische Werkzeuge auf diesem Grundstück gebaut, wie es erlaubt ist.", "You've already built as many static tools on this property as is allowed.")
        return true
    end

    if totalValue < maxValue and totalValue+productValue > maxValue then
        user:inform("Während noch Platz für statische Werkzeuge für diese Eigenschaft vorhanden ist, nimmt dieses Werkzeug zu viel Platz ein. Du musst einige andere Werkzeuge löschen, wenn du dieses bauen möchtest.", "While there is allowance left for static tools for this property, this tool takes up too much. You will have to delete some other tools if you want to build this one.")
        return true
    end

    return false

end

function M.setPersistenceForProperties()
    for _, property in pairs(propertyList.properties) do
        for x = property.lower.x, property.upper.x do
            for y = property.lower.y, property.upper.y do
                for z = property.lower.z, property.upper.z do
                    if not world:isPersistentAt(position(x, y, z)) then
                        world:makePersistentAt(position(x, y, z))
                    end
                end
            end
        end
    end

    M.createEstateBasements() -- in case any estates are lacking basement tiles and walls, this function will fix that

    for i = 1, #propertyList.propertyTable do
        local location = propertyList.propertyTable[i][3]

        if not world:isPersistentAt(location) then
            world:makePersistentAt(location)
        end

        local field = world:getField(location)
        local itemsOnField = field:countItems()
        local propertyDeedFound = false
        for i2 = 0, itemsOnField do
            local chosenItem = field:getStackItem(itemsOnField - i2 )
            if chosenItem.id == 3772 or chosenItem.id == 3773 then --it is a notice
                propertyDeedFound = true
            end
        end

        if not propertyDeedFound then
            world:createItemFromId(3772, 1, location, true, 333, nil) --This will lead to some deeds that should be 3773 facing the wrong direction, but this is also only ever called if one is missing to begin with when a GM sets persistence
        end
    end
end


local trapDoors = {start = 3790, stop = 3809}
local stairs = {319, 1185, 1186, 1403, 1404, 28, 35, 1003}

M.stairs = stairs

function M.doorIsAStair(doorId)

    for _, stair in pairs(stairs) do
        if stair == doorId then
            return true
        end
    end

    return false
end

function M.doorIsATrapDoor(doorId)

    if doorId >= trapDoors.start and doorId <= trapDoors.stop then
        return true
    end

    return false
end

-- Check if there is a stair or trap door on the position and return the resulting item, nil for no item or false if not the wanted stair/trap door. Stairswanted is true if you want stairs, false if you want trapdoors.
function M.getStairsTrapDoor(pos, stairsWanted)

    local potentialStairTrapDoor

    if world:isItemOnField(pos) then
        potentialStairTrapDoor = world:getItemOnField(pos)
    end

    if potentialStairTrapDoor then

        if not stairsWanted then
            for trapID = trapDoors.start, trapDoors.stop do
                if trapID == potentialStairTrapDoor.id then
                    return potentialStairTrapDoor
                end
            end
        else
            for _, stairID in pairs(stairs) do
                if stairID == potentialStairTrapDoor.id then
                    return potentialStairTrapDoor
                end
            end
        end
    else
        return nil -- No item found
    end

    return false -- Item was not the wanted stair/trapdoor, stair/trapdoor could exist but something was placed ontop of it

end


local function createLockForStairTrapDoor(user, trapDoor, category, theId, propertyName, propertyNameDe)

    local stair

    if category == "Stairs" then
        stair = trapDoor
        trapDoor = nil
    end

    local thePosition =  M.getTrapDoorOrStairPosition(stair, trapDoor)

    local stairDoor = M.getStairsTrapDoor(thePosition, trapDoor)

    if not stairDoor then
        user:inform("Irgendetwas versperrt die Treppe oder die Falltür. Versuche es noch mal, nachdem du alle Gegenstände dort entfernt hast.", "Something is obstructing the stair or trap door. Make sure no items are on top of either, then try again.")
        return false
    end

    stairDoor:setData("lockId", theId)
    stairDoor:setData("descriptionEn",propertyName)
    stairDoor:setData("descriptionDe",propertyNameDe)
    world:changeItem(stairDoor)
    return true
end

function M.createLock(user)

    local propertyName = M.fetchPropertyName(user)
    local propertyNameDe

    for i = 1, #propertyList.propertyTable do
        if propertyName == propertyList.propertyTable[i][1] then
            propertyNameDe = propertyList.propertyTable[i][2]
        end
    end

    if M.allowBuilding(user) and M.checkIfLockable(user) then
        local TargetItem, category = M.checkIfLockable(user)

        if not common.IsNilOrEmpty(TargetItem:getData("lockId")) then
            user:inform("Hier ist schon ein Schloss.", "There's already a lock in place.")
            return
        end

        for i = 1, #propertyList.propertyTable do
            if propertyList.propertyTable[i][1] == propertyName then
                local doorId = propertyList.propertyTable[i][6]

                if category == "Stairs" or category == "Trap Doors" then
                    if not createLockForStairTrapDoor(user, TargetItem, category, doorId, propertyName, propertyNameDe) then
                        return
                    end
                end

                TargetItem:setData("lockId",doorId)
                TargetItem:setData("doorLock","unlocked")
                TargetItem:setData("descriptionEn",propertyName)
                TargetItem:setData("descriptionDe",propertyNameDe)
                world:changeItem(TargetItem)
                user:inform("Schloss eingebaut.","Lock created.")

            end
        end
    else
        user:inform("Du kannst nur auf deinem Grundstück Schlösser in Türen, Tore, Treppen und Falltüren einsetzen.","You can only create locks for doors, gates, stairs or trap doors that are on your property.")
    end
end

local function scheduleDemolishment(user, propertyName)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            local deed = M.getPropertyDeed(propertyName)
            deed:setData("demolish", "true") --Used to determine which property will be demolished when the scheduled script triggers

            -- Below is a little hack since we do not use global variables, to not have to check every single property each time if there are none scheduled at all

            local pauldronDeed = M.getPropertyDeed("Pauldron Estate") -- refresh in case the deed was changed above as one of the demolished properties

            if deed.pos == pauldronDeed.pos then
                deed:setData("newDemolishments", "true")
            else
                pauldronDeed:setData("newDemolishments", "true")
                world:changeItem(pauldronDeed)
            end

            -- end of the hack

            world:changeItem(deed)

            user:inform("Auf deine Bitte um einen Abriss hin tauchen ein Haufen Zwerge auf, um das Anwesen abzureißen. Einer nach dem anderen huschen sie mit dem abgerissenen Material als Bezahlung davon. Bei diesem Tempo sollten sie schnell fertig sein.", "Upon your request of a demolition, a bunch of dwarves appear to demolish the estate. One by one they scurry off with the broken down material as their payment, at this rate they should be done in no time.")
        else
            return
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Bestätigung","Confirmation Check"), common.GetNLS(user,"Bist du dir absolut sicher, dass du das wirklich durchziehen willst? Das ist die letzte Warnung. Der Abriss kann danach nicht mehr gestoppt oder rückgängig gemacht werden und wird alles auf deinem Grundstück zerstören, einschließlich der Dinge, die du statisch gemacht hast oder die nicht statisch sind!", "Are you certain that you are absolutely positively sure you want to go through with this? This is the final warning. The demolition can not be stopped or undone after this, and will destroy everything on your property including items you made static or items that are not static!"), callback)
    dialog:addOption(0,common.GetNLS(user,"Ja","Yes"))
    dialog:addOption(0,common.GetNLS(user,"Nein, das ist Kunst.","No, I changed my mind."))
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end

function M.demolishConfirmation(user, propertyName)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            scheduleDemolishment(user, propertyName)
        else
            return
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Bestätigung","Confirmation Check"), common.GetNLS(user,"Bist du sicher, dass du dein Anwesen abreißen willst? Das kann nicht rückgängig gemacht werden, und einmal gestartet, kann es nicht mehr gestoppt werden.", "Are you certain you want to demolish your estate property? This can not be undone and once initiated, it can not stop."), callback)
    dialog:addOption(0,common.GetNLS(user,"Ja","Yes"))
    dialog:addOption(0,common.GetNLS(user,"Nein, das ist Kunst.","No, I changed my mind."))
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)

end


function M.createKey(user)

    local propertyName = M.fetchPropertyName(user)

    if M.allowBuilding(user) then
        for i = 1, #propertyList.propertyTable do
            if propertyList.propertyTable[i][1] == propertyName then
                local doorId = propertyList.propertyTable[i][6]
                local keyId = propertyList.propertyTable[i][5]
                local keyNameDE = propertyList.propertyTable[i][2]
                if money.CharHasMoney(user, 500) then
                    money.TakeMoneyFromChar(user, 500)
                    common.CreateItem(user,keyId,1,999,{["lockId"]=doorId,["descriptionDe"]=keyNameDE,["descriptionEn"]=propertyName})
                    user:inform(common.GetNLS(user,
                    "Nachdem du einen Schlosser bezahlt hast dir eine Kopie deines Schlüssels anzufertigen, dauert es nicht lange bis du den fertigen Ersatzschlüssel in der Hand hälst.",
                    "Having paid a keysmith the fee to have a copy made of your property key, it does not take long before you hold it in your hand."))
                else
                    user:inform(common.GetNLS(user,"Das kannst du dir nicht leisten. Die Arbeit eines Schlossers ist nicht gratis. ","You can't afford that. No keysmith will work for nothing."))
                end
            end
        end
    else
        user:inform("Du bist nicht berechtigt für dieses Grundstück Schlüssel anzufertigen.","You do not have permission to create keys for this property.")
    end
end

function M.writeOnSignPost(user)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local input = dialog:getInput()
        if M.allowBuilding(user) then

            local TargetItem = M.checkIfSignPost(user)

            if TargetItem then
                TargetItem:setData("descriptionDe",input)
                TargetItem:setData("descriptionEn",input)
                world:changeItem(TargetItem)
            else
                user:inform("Du musst vor einem Hinweisschild stehen um darauf zu schreiben.","You need a sign post in front of you if you want to write on it.")
            end
        else
            user:inform("Das Hinweisschild muss sich auf deinem Grundstück befinden wenn du darauf schreiben möchtest.","The sign has to be on your property for you to write on it.")
        end
    end
    local dialog = InputDialog(common.GetNLS(user,"Hinweisschild","Sign Post"),common.GetNLS(user,"Was soll auf dem Schild stehen?","Write in what you want the sign post to say."), false, 255, callback)
    if M.checkIfSignPost(user) then
        user:requestInputDialog(dialog)
    else
        user:inform("Du musst vor einem Hinweisschild stehen um darauf zu schreiben.","You need a sign post in front of you if you want to write on it.")
    end
end

function M.deleteRoofItemOrTile(user, tile, thePosition)
    local tileOrObject
    local tileOrObjectDe
    local germanArticle

    if tile == true then
        tileOrObject = "tile"
        tileOrObjectDe = "Dachfeld"
        germanArticle = "das"
    else
        tileOrObject = "object"
        tileOrObjectDe = "Gegenstand"
        germanArticle = "den"
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                if not M.roofAndRoofTiles(user, nil, tile, "erase", thePosition) then
                    user:inform("Das Ziel muss ein "..tileOrObjectDe.." sein und sich auf einem Grundstück befinden, auf dem du bauen darfst. Es muss sich zudem direkt vor und über dir befinden.","Targeted item must be a roof "..tileOrObject.." on a property you are permitted to build on, one tile in front of you and above you.")
                end
            else
                user:inform("Du lässt "..germanArticle.." "..tileOrObjectDe.." intakt.","You decide against destroying the roof "..tileOrObject..".")
            end
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"Bestätigung","Confirmation Check"), common.GetNLS(user,"Bist du dir sicher, dass du "..germanArticle.." "..tileOrObjectDe.." abreißen möchtest?","Are you sure you want to destroy the roof "..tileOrObject.."?"), callback)
    dialog:addOption(0,common.GetNLS(user,"Ja, das kann weg.","Yes, destroy it."))
    dialog:addOption(0,common.GetNLS(user,"Nein, das ist Kunst.","No, I changed my mind."))
    dialog:setCloseOnMove()
    user:requestSelectionDialog(dialog)
end


function M.createWarpsAndExitObject(user, itemId, createOrErase)
    local direct = user:getFaceTo()
    local d = 1
    local vX, vY = common.GetDirectionVector(direct)
    local targetPosition = position(user.pos.x + vX * d, user.pos.y + vY * d, user.pos.z)
    local v2X = 0
    local v2Y = 0
    local v2Z = 0
    local positionTwo
    local positionThree
    local positionFour
    local trapStair

    if M.checkIfStairsOrTrapDoor(itemId) then
        for _, stair in pairs(itemList.Stairs) do
            if stair.Downstairs == itemId then --It's a stair item
                if user.pos.z >= 0 then
                    v2Z = 1
                elseif user.pos.z == -21 then
                    v2Z = 21
                end
                if stair.Direction == "north" then
                    v2Y = -1
                elseif stair.Direction == "east" then
                    v2X = 1
                end
                positionTwo = position(targetPosition.x + v2X * 1, targetPosition.y + v2Y * 1, targetPosition.z + v2Z)
                positionThree = position(targetPosition.x + v2X * 2, targetPosition.y + v2Y * 2, targetPosition.z + v2Z)
                positionFour = position(targetPosition.x + v2X * -1, targetPosition.y + v2Y * -1, targetPosition.z)
                trapStair = stair.Upstairs
                if not M.allowBuilding(user, positionTwo)
                or not M.allowBuilding(user, positionThree)
                or not M.allowBuilding(user, positionFour)
                then return false
                end
                if createOrErase == "create" then
                    M.createStairTrap(targetPosition, positionTwo, positionThree, positionFour, trapStair)
                elseif createOrErase == "erase" then
                    M.eraseStairTrap(targetPosition, positionTwo, stair.Upstairs, positionThree)
                end
            elseif stair.Upstairs == itemId then --It's a trap door item
                if user.pos.z == 0 then
                    v2Z = -21
                elseif user.pos.z >= 1 then
                    v2Z = -1
                end
                if stair.Direction == "north" then
                    v2Y = 1
                elseif stair.Direction == "east" then
                    v2X = -1
                end
                positionTwo = position(targetPosition.x + v2X * 1, targetPosition.y + v2Y * 1, targetPosition.z + v2Z)
                positionThree = position(targetPosition.x + v2X * 2, targetPosition.y + v2Y * 2, targetPosition.z + v2Z)
                positionFour = position(targetPosition.x + v2X * -1, targetPosition.y + v2Y * -1, targetPosition.z)
                trapStair = stair.Downstairs
                if not M.allowBuilding(user, positionTwo)
                or not M.allowBuilding(user, positionThree)
                or not M.allowBuilding(user, positionFour)
                then return false
                end
                if createOrErase == "create" then
                    M.createStairTrap(targetPosition, positionTwo, positionThree, positionFour, trapStair)
                elseif createOrErase == "erase" then
                    M.eraseStairTrap(targetPosition, positionTwo, stair.Downstairs, positionThree)
                end
            end
        end
    end
    return true
end

function M.getTrapDoorOrStairPosition(stair, trapDoor)

    local direction

    for _, stairPair in pairs(itemList.Stairs) do
        if (stair and stairPair.Downstairs == stair.id) or (trapDoor and stairPair.Upstairs == trapDoor.id) then
            direction = stairPair.Direction
        end
    end

    if trapDoor and not direction then -- There is a chance this is a closed trap door, housing needs the open version Id so we check that

        local openId

        if doors.CheckClosedDoor(trapDoor.id) then
            openId = doors.ClosedDoors[trapDoor.id]
        end

        for _, stairPair in pairs(itemList.Stairs) do
            if stairPair.Upstairs == openId then
                direction = stairPair.Direction
            end
        end

    end

    if not direction then
        --illegitimate item for housing that is not in housing catalogue
        return false
    end

    local targetPosition

    if stair then
        targetPosition = stair.pos
    else
        targetPosition = trapDoor.pos
    end

    local v2X = 0
    local v2Y = 0
    local v2Z = 0

    if stair then

        if targetPosition.z >= 0 then
            v2Z = 1
        elseif targetPosition.z == -21 then
            v2Z = 21
        end

        if direction == "north" then
            v2Y = -1
        elseif direction == "east" then
            v2X = 1
        end

        return position(targetPosition.x + v2X * 1, targetPosition.y + v2Y * 1, targetPosition.z + v2Z)

    elseif trapDoor then

        if targetPosition.z == 0 then
            v2Z = -21
        elseif targetPosition.z >= 1 then
            v2Z = -1
        end

        if direction == "north" then
            v2Y = 1
        elseif direction == "east" then
            v2X = -1
        end

        return position(targetPosition.x + v2X * 1, targetPosition.y + v2Y * 1, targetPosition.z + v2Z)
    end

end

function M.eraseStairTrap(positionOne, positionTwo, targetId, tile1pos)
    local warpOne = world:getField(positionOne)
    local warpTwo = world:getField(positionTwo)

    M.ifNoSurroundingTilesDeleteStairTiles(tile1pos, positionTwo)

    common.DeleteItemFromStack(positionTwo, {itemId = targetId})
    M.removeElevation(positionTwo)

    if warpOne:isWarp() then
        warpOne:removeWarp()
    end

    if warpTwo:isWarp() then
        warpTwo:removeWarp()
    end

end

function M.getTownName(item, property)
    if property then
        for i = 1, #propertyList.propertyTable do
            if property == propertyList.propertyTable[i][1] then
                return propertyList.propertyTable[i][7]
            end
        end
    else
        for i = 1, #propertyList.propertyTable do
            if (item.pos == propertyList.propertyTable[i][3]) then
                return propertyList.propertyTable[i][7]
            end
        end
    end
end

function M.checkIfLeaderOfTown(user, Town)
    if Town == "Outlaw" then
        return false
    end
    local home = factions.getMembershipByName(user)
    if (user:getQuestProgress(200) >= 8) and (home == Town) then
        return true
    else
        return false
    end
end

function M.destroyTile(user)

    if not M.allowBuilding(user) or not M.checkIfEstate(user) then
        return
    end

    if user.pos.z < 1 then
        user:inform("Du kannst nur Bodenfelder löschen, die über dem Erdgeschoss liegen.", "You can only destroy tiles that are above ground level.")
        return
    end

    local thePosition = common.GetFrontPosition(user)

    if world:isItemOnField(thePosition) then
        user:inform("Das Bodenfeld ist nicht leer. Entferne zunächst alle Gegenstände von ihm.", "If you want to destroy that tile, first clear it of any objects.")
        return
    end

    world:changeTile(0, thePosition)

    user:inform("Du zerstörst das Bodenfeld.", "You destroy the tile.")
end

function M.getBasementTileWall(propertyName)

    local realm = false

    for _, property in ipairs(propertyList.propertyTable) do
        if propertyName == property[1] then
            realm = property[7]
        end
    end

    if realm and realm == "Cadomyr" then
        return 12, 3622
    end

    return 2, 287
end

local function placeBasementWalls(wallID, lowerCoords, upperCoords)
    local lowerX = lowerCoords.x - 1
    local lowerY = lowerCoords.y - 1
    local upperX = upperCoords.x + 1
    local upperY = upperCoords.y + 1

    local positionsToCheckForWalls = {}

    for x = lowerX, upperX do
        table.insert(positionsToCheckForWalls, position(x, lowerY, lowerCoords.z))
        table.insert(positionsToCheckForWalls, position(x, upperY, lowerCoords.z))
    end

    for y = lowerY, upperY do
        table.insert(positionsToCheckForWalls, position(lowerX, y, lowerCoords.z))
        table.insert(positionsToCheckForWalls, position(upperX, y, lowerCoords.z))
    end

    for _, wallSpot in pairs(positionsToCheckForWalls) do

        if not world:isPersistentAt(wallSpot) then
            world:makePersistentAt(wallSpot)
        end

        if not world:isItemOnField(wallSpot) then
            world:createItemFromId(wallID, 1, wallSpot, true, 333, nil)
        end
    end

end

local function checkForAndCreateBasementTile(basementTileID, location)

    local field = world:getField(location)
    local tileID = field:tile()

    if tileID == 0 then
        world:changeTile(basementTileID, location)
    end
end

local function placeBasementTiles(tileID, lowerCoords, upperCoords)

    for x = lowerCoords.x - 1, upperCoords.x + 1 do
        for y = lowerCoords.y - 1, upperCoords.y + 1 do
            checkForAndCreateBasementTile(tileID, position(x, y, lowerCoords.z))
        end
    end

end

function M.createEstateBasements()

    local basementProperties = {}

    for _, property in pairs(propertyList.properties) do
        if property.estate then
            table.insert(basementProperties, property)
        end
    end

    for _, property in pairs(basementProperties) do
        local tileID, wallID = M.getBasementTileWall(property.name)
        if property.lower.z == -21 then --only for basement layers
            placeBasementWalls(wallID, property.lower, property.upper)
            placeBasementTiles(tileID, property.lower, property.upper)
        end
    end

end

function M.destroyItem(user)
    local targetItem
    local thePosition = common.GetFrontPosition(user)
    local itemDeleted = false

    if world:isItemOnField(thePosition) then
        targetItem = world:getItemOnField(thePosition)
    end

    if not targetItem then
        user:inform("Hier ist nichts, was du abreißen könntest.","There is no item to destroy.")
    elseif M.checkIfDestroyingPermitted(user, targetItem) then

        local itemName = world:getItemName(targetItem.id, user:getPlayerLanguage())

        local previewItem = targetItem:getData("preview") == "true"

        local callback = function(dialog)

            if not dialog:getSuccess() then
                return
            end

            local selected = dialog:getSelectedIndex()+1

            if selected == 1 then
                local stairTrapExist, stairsOrTrapdoor = M.checkIfStairsOrTrapDoor(targetItem.id)
                if not previewItem and stairTrapExist then
                    if user.pos.z < 0 and stairsOrTrapdoor == "stairs" then
                         user:inform("Um Kellerleitern zu zerstören musst du im Erdgeschoss sein. Du willst ja nicht hier unten gefangen sein.", "To destroy a set of basement stairs, you'll have to be above ground. Wouldn't want to get stuck down here, would you.")
                        return
                    elseif user.pos.z > 0 and stairsOrTrapdoor == "trapdoor" then
                        user:inform("Um eine Falltür eines höheren Geschosses zu zerstören musst du ein Stockwerk runter gehen. Du willst ja nicht hier oben gefangen sein.", "To destroy a trapdoor that belong to an upper floor, you'll have to do so from the floor below. Wouldn't want to get stuck up here, would you.")
                        return
                    end

                    if M.createWarpsAndExitObject(user, targetItem.id, "erase") then
                        itemDeleted = common.DeleteItemFromStack(thePosition, {itemId = targetItem.id})
                        M.removeElevation(thePosition)
                    else
                        user:inform("Du bist nicht berechtigt dies abzureißen.","You aren't allowed to destroy that.")
                    end
                else
                    local parts = {
                        {id = 3871, pos = position(thePosition.x-2, thePosition.y, thePosition.z)},
                        {id = 3872, pos = position(thePosition.x-1, thePosition.y-1, thePosition.z)},
                        {id = 3873, pos = position(thePosition.x, thePosition.y-1, thePosition.z)},
                        {id = 3874, pos = position(thePosition.x+1, thePosition.y, thePosition.z)},
                        {id = 3875, pos = position(thePosition.x+1, thePosition.y+1, thePosition.z)},
                        {id = 3876, pos = position(thePosition.x, thePosition.y+2, thePosition.z)},
                        {id = 3877, pos = position(thePosition.x-1, thePosition.y+2, thePosition.z)},
                        {id = 3878, pos = position(thePosition.x-2, thePosition.y+1, thePosition.z)}
                    }
                    for _, part in pairs(parts) do
                        if targetItem.id == part.id then
                            user:inform("Wenn du eine Tenne löschen möchtest, visiere die Tenne selbst an.","If you want to delete a threshing floor, target the threshing floor itself.")
                            return
                        end
                    end
                    if targetItem.id == 3879 then --threshing floor
                        for _, part in pairs(parts) do
                            common.DeleteItemFromStack(part.pos, {itemId = part.id})
                            M.removeElevation(part.pos)
                        end
                    end

                    itemDeleted = common.DeleteItemFromStack(thePosition, {itemId = targetItem.id})
                    M.removeElevation(thePosition)
                end
                if itemDeleted then
                    user:inform(common.GetNLS(user,"Du reißt ab: "..itemName,"You destroy the "..itemName))
                end
            else
                user:inform(common.GetNLS(user,"Nicht abgerissen: "..itemName,"You decide against destroying the "..itemName))
            end
        end
        local dialog = SelectionDialog(common.GetNLS(user,"Bestätigung","Confirmation Check"), common.GetNLS(user,"Bist du sicher, dass du dies abreißen möchtest: "..itemName,"Are you sure you want to destroy the "..itemName.."?"), callback)
        dialog:addOption(0,common.GetNLS(user,"Ja, das kann weg.","Yes, destroy it."))
        dialog:addOption(0,common.GetNLS(user,"Nein, das ist Kunst.","No, I changed my mind."))
        dialog:setCloseOnMove()
        user:requestSelectionDialog(dialog)
    else
        user:inform("Du bist nicht berechtigt dies abzureißen.","You're not allowed to destroy this item.")
    end
end

function M.getPropertyLocationIsPartOf(location)
    local X = location.x
    local Y = location.y
    local Z = location.z

    for _, property in pairs(propertyList.properties) do
        local lower = property.lower
        local upper = property.upper

        if Z >= lower.z and X >= lower.x and Y >= lower.y and Z <= upper.z and X <= upper.x and Y <= upper.y then
            return property.name
        end
    end

    return false
end

function M.placeStakeOnPosition(selectedPosition)
    local field = world:getField(selectedPosition)
    local itemsOnField = field:countItems()
    if itemsOnField >= 1 then -- only place on empty tiles, this way we avoid ruining what someone built if their lease expires
        return
    end
    local handrail = 3601
    local name = {english = "Property Lot Stake", german = "Grenzstein"}
    local description = {english = "A stake marking the corner of the boundary for a property lot.", german = "Ein Grenzstein, der ein Grundstück absteckt."}
    local theStake = world:createItemFromId(handrail, 1, selectedPosition, true, 999, {nameEn = name.english, nameDe = name.german, descriptionEn = description.english, descriptionDe = description.german})
    theStake.wear = 255
    world:changeItem(theStake)
end

function M.makeStatic(user)
    local targetItem
    local thePosition = common.GetFrontPosition(user)

    if not M.allowBuilding(user) then
        return
    end

    if world:isItemOnField(thePosition) then
        targetItem = world:getItemOnField(thePosition)
    end
    if not targetItem then
        user:inform("Hier ist nichts, was dauerhaft haltbar gemacht werden könnte.","There is no item to be made/unmade static.")
    elseif M.isStaticPermitted(user, targetItem) then
        if targetItem.wear ~= 255 then
            targetItem.wear = 255
            world:changeItem(targetItem)
            user:inform("Der Gegenstand ist nun dauerhaft haltbar. Er kann nicht mehr bewegt werden und wir nicht von selbst verschwinden.","The item has been made static. It can no longer be moved, and will no longer rot.")
        elseif targetItem.wear == 255 then
            targetItem.wear = 254
            world:changeItem(targetItem)
            user:inform("Der Gegenstand ist nun nicht mehr dauerhaft haltbar. Er kann nun bewegt werden und wird letzlich verschwinden.","The item is no longer static. It can now be moved, and will once more rot.")
        end
    else
        user:inform("Die Haltbarkeit dieses Gegenstandes kann nicht geändert werden.","This item can not be made/unmade static.")
    end
end

function M.makeWaterWalkable(user)

    local targetPosition = common.GetFrontPosition(user)
    local targetField = world:getField(targetPosition)
    local targetTileId = targetField:tile()

    if targetTileId == 6 then
        world:createItemFromId(42, 1, targetPosition, true, 999, nil)
        user:inform("Du kannst nun übers Wasser gehen.","You can now walk on the water tile.")
    else
        user:inform("Vor dir muss sich Wasser befinden.","The tile in front of you needs to be a water tile.")
    end

end

function M.getRentDurationByUser(user)
    local property = M.fetchPropertyName(user)
    local deed = M.getPropertyDeed(property)
    local duration = deed:getData("rentDuration")

    if duration ~= "" then
        return duration
    end
end

function M.checkForAndPlaceMissingStakes()

    for _, property in pairs(propertyList.properties) do
        if not M.checkIfPropertyHasTenant(property.name) and property.lower.z == 0 and property.estate and not property.outlaw then
            local positions = {}
            positions[1] = property.lower
            positions[2] = position(property.upper.x, property.upper.y, property.lower.z)
            positions[3] = position(property.lower.x, property.upper.y, property.lower.z)
            positions[4] = position(property.upper.x, property.lower.y, property.lower.z)

            for _, selectedPosition in pairs(positions) do
                if not M.checkPositionForStake(selectedPosition) then
                    M.placeStakeOnPosition(selectedPosition)
                end
            end
        end
    end
end


function M.removeTenantGuestBuilderDuration(propertyDeed)
    propertyDeed:setData("tenant", "")
    propertyDeed:setData("tenantID", "")

    for number = 1, 10 do
        propertyDeed:setData("coTenant"..number, "")
        propertyDeed:setData("coTenantID"..number, "")
    end

    for number = 1, M.max_builder_number do
        propertyDeed:setData("builder"..number, "")
        propertyDeed:setData("builderID"..number, "")
    end

    for number = 1, M.max_guest_number do
        propertyDeed:setData("guest"..number, "")
        propertyDeed:setData("guestID"..number, "")
    end

    propertyDeed:setData("rentDuration", "")

    world:changeItem(propertyDeed)
end

function M.deletePreviewItem(propertyName, bypassTTL)

    local propertyDeed = M.getPropertyDeed(propertyName)

    if propertyDeed == nil then
        return
    end

    local timer = propertyDeed:getData("previewItemTimer")

    if timer == "" then
        return
    end

    local X = propertyDeed:getData("previewItemPositionX")
    local Y = propertyDeed:getData("previewItemPositionY")
    local Z = propertyDeed:getData("previewItemPositionZ")
    local currentTime = common.GetCurrentTimestamp()
    local TTL = 30

    if not bypassTTL and timer+TTL > currentTime then
        return
    end

    local location = position(tonumber(X), tonumber(Y), tonumber(Z))
    local field = world:getField(location)
    local itemsOnField = field:countItems()
    local itemsToReplace = {}

    for i = 0, itemsOnField do
        local currentItem = field:getStackItem(itemsOnField-i)
        local preview = currentItem:getData("preview")
        local isPreviewItem = preview == "true"

        if currentItem.id ~= 0 then
            world:erase(currentItem, currentItem.number)
            if not isPreviewItem then
                table.insert(itemsToReplace, currentItem)
            end
        end
    end

    for i = 1, #itemsToReplace do
        local newIndex = #itemsToReplace + 1 - i
        world:createItemFromItem(itemsToReplace[newIndex], location, true)
    end

    propertyDeed:setData("previewItemTimer", "")
    world:changeItem(propertyDeed)
end

function M.scheduledDeletionOfPreviewItems()
    for i = 1, #propertyList.propertyTable do
        M.deletePreviewItem(propertyList.propertyTable[i][1], false)
    end
end

function M.ifNoSurroundingTilesDeleteStairTiles(tile1pos, tile2pos)

    local positionsToCheck = {}

    local deleteTiles = true

    for x = 0, 1 do
        for y = 0, 1 do
            table.insert(positionsToCheck, position(tile1pos.x + x, tile1pos.y + y, tile1pos.z))
            table.insert(positionsToCheck, position(tile1pos.x - x, tile1pos.y - y, tile1pos.z))
            table.insert(positionsToCheck, position(tile1pos.x + x, tile1pos.y - y, tile1pos.z))
            table.insert(positionsToCheck, position(tile1pos.x - x, tile1pos.y + y, tile1pos.z))
            table.insert(positionsToCheck, position(tile2pos.x + x, tile2pos.y + y, tile2pos.z))
            table.insert(positionsToCheck, position(tile2pos.x - x, tile2pos.y - y, tile2pos.z))
            table.insert(positionsToCheck, position(tile2pos.x + x, tile2pos.y - y, tile2pos.z))
            table.insert(positionsToCheck, position(tile2pos.x - x, tile2pos.y + y, tile2pos.z))
        end
    end

    for _, thePos in pairs(positionsToCheck) do
        if thePos ~= tile1pos and thePos ~= tile2pos then
            local field = world:getField(thePos)
            local tileID = field:tile()
            if tileID ~= 0 then
                deleteTiles = false
                break
            end
        end
    end

    if deleteTiles then
        world:changeTile(0, tile1pos)
        world:changeTile(0, tile2pos)
    end
end

function M.ifNoTileAddOne(thePosition)

    local field = world:getField(thePosition)
    local tileID = field:tile()

    if tileID == 0 then
        world:changeTile(59, thePosition) --has to be a roof tile so roof tile deletion can delete it if you build a roof-item above ground without building a tile first and then want to delete it without needing a staircase up
    end
end

function M.createStairTrap(positionOne, positionTwo, positionThree, positionFour, trapStair)
    M.ifNoTileAddOne(positionOne)
    M.ifNoTileAddOne(positionTwo)
    M.ifNoTileAddOne(positionThree)
    M.ifNoTileAddOne(positionFour)
    local warpOne = world:getField(positionOne)
    local warpTwo = world:getField(positionTwo)
    world:createItemFromId(trapStair, 1, positionTwo, true, 999, nil)
    warpOne:setWarp(positionThree)
    warpTwo:setWarp(positionFour)
end

function M.getPropertyName(item)
    for i = 1, #propertyList.propertyTable do
        if (item.pos == propertyList.propertyTable[i][3]) then
            return propertyList.propertyTable[i][1]
        end
    end
end

function M.getPropertyNameDE(item)
    for i = 1, #propertyList.propertyTable do
        if (item.pos == propertyList.propertyTable[i][3]) then
            return propertyList.propertyTable[i][2]
        end
    end
end

function M.getDefaultRent(item, property)
    if property then
        for i = 1, #propertyList.propertyTable do
            if property == propertyList.propertyTable[i][1] then
                return propertyList.propertyTable[i][4]
            end
        end
    else
        for i = 1, #propertyList.propertyTable do
            if (item.pos == propertyList.propertyTable[i][3]) then
                return propertyList.propertyTable[i][4]
            end
        end
    end
end

function M.getText(user,deText,enText)
    return common.GetNLS(user,deText,enText)
end

function M.propertyDeedLookAt(user, item)
    local lookAt = ItemLookAt()
      lookAt.name = common.GetNLS(user, "Grundstücksurkunde", "Property Deed")
      lookAt.description = common.GetNLS(user, "Grundstücksurkunde von "..M.getPropertyNameDE(item)..".", "The Property Deed of "..M.getPropertyName(item)..".")
      return lookAt
end

function M.sendMessageToRemovedTenant(propertyName, propertyNameDE, tenantID, user)

    local english = "You've been evicted from your former residence in "..propertyName..".\n\n~The Quartermaster"
        local german = "Du bist kein Bewohner von "..propertyNameDE.." mehr.\n\nDer Quartiersmeister"

        local callback = function(dialog)
            local success = dialog:getSuccess()
            if not success then
                return
            end
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                messenger.sendMessageViaScript(english, german, tenantID)
            end
        end

        local dialog = SelectionDialog(common.GetNLS(user, "Sende eine Nachricht", "Send Message"), common.GetNLS(user, "Möchtest du dem ehemaligen Bewohner eine Nachricht über seinen Rausschmiss schicken?", "Do you wish to send the evicted tenant an automated notice of their eviction?"), callback)
        dialog:addOption(0, common.GetNLS(user, "Ja", "Yes"))

        user:requestSelectionDialog(dialog)

end

function M.removeOwner(user, item, property)

    local propertyName

    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end

    local propertyDeed = M.getPropertyDeed(propertyName)

    local propertyNameDE = M.getPropertyNameDE(propertyDeed)

    local tenantID = propertyDeed:getData("tenantID")
    local tenantExists = false

    if not common.IsNilOrEmpty(tenantID) then
        tenantExists = true
    end

    M.removeTenantGuestBuilderDuration(propertyDeed)

    if tenantExists then

        M.sendMessageToRemovedTenant(propertyName, propertyNameDE, tenantID, user)

        user:inform(M.getText(user,"Vorheriger Mieter entfernt.","Previous tenant evicted."))
    end
end

function M.setRemoveCoTenant(user, deed, propertyName)

    if not deed then
        deed = M.getPropertyDeed(propertyName)
    end

    if not propertyName then
        propertyName = M.getPropertyName(deed)
    end


    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local selected = dialog:getSelectedIndex()+1

        for i = 1, 10 do
            if selected == i then
                local callback2 = function (dialog2)

                    if not dialog2:getSuccess() then
                        return
                    end

                    local input = dialog2:getInput()

                    if (input == nil or input == '') then
                        deed:setData("coTenantID"..selected, "")
                        deed:setData("coTenant"..selected, "")
                        world:changeItem(deed)
                    else
                        local tenantExists, tenantID = world:getPlayerIdByName(input)

                        if not tenantExists then
                            informDoesntExist(user)
                        elseif M.checkIfOwnsProperty(input) and not M.checkIfEstateViaName(propertyName) then
                            user:inform(M.getText(user,"Der Charakter mietet bereits ein Grundstück.","Character already rents a property."))
                        else
                            deed:setData("coTenantID"..selected, tenantID)
                            deed:setData("coTenant"..selected, input)
                            world:changeItem(deed)
                            user:inform(M.getText(user,input.." wurde als neuer Mitmieterin eingetragen.",input.." set as new co tenant."))
                        end
                    end
                end

            user:requestInputDialog(InputDialog(M.getText(user,"Mieter eintragen","Set Tenant"),
            M.getText(user,"Schreiben Sie den Namen der Person, die Sie als neuen Mitmieterin einsetzen möchten, oder lassen Sie das Feld leer, um einfach die bisherige Person aus dem gewählten Slot zu entfernen.",
            "Write in the name of who you want to set as the new co tenant, or leave it empty to just delete the old one of the selected slot."), false, 255, callback2))
            end
        end
    end

    local dialog = SelectionDialog(
    M.getText(user, "Mitbewalterverwaltung", "Co-tenant management"),
    M.getText(user, "Wähle einen Slot, um ihn mit einem neuen Mitbewohner zu überschreiben oder den alten Mitbewohner zu löschen.", "Select a slot to overwrite with a new co-tenant, or delete the old co-tenant of."),
    callback)

    for i = 1, 10 do

        local coTenant = deed:getData("coTenant"..i)

        if not common.IsNilOrEmpty(coTenant) then
            dialog:addOption(0, coTenant)
        else
            dialog:addOption(0, M.getText(user, "Leerer Platz", "Empty slot"))
        end
    end


    user:requestSelectionDialog(dialog)

end



function M.setOwner(user, item, propertyName)
    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local propertyDeed = M.getPropertyDeed(property)
    local callback = function (dialog)

        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        if (input == nil or input == '') then
            user:inform(M.getText(user,"Das Namensfeld darf nicht leer sein.","The name field can not be empty."))
        else
            local tenantExists, tenantID = world:getPlayerIdByName(input)

            if not tenantExists then
                informDoesntExist(user)
            elseif M.checkIfOwnsProperty(input) and not M.checkIfEstateViaName(property) then
                user:inform(M.getText(user,"Der Charakter mietet bereits ein Grundstück.","Character already rents a property."))
            else
                M.removeOwner(user, item, propertyName)
                propertyDeed:setData("rentDuration", 1)
                propertyDeed:setData("tenant", input)
                propertyDeed:setData("tenantID", tenantID)
                world:changeItem(propertyDeed)
                user:inform(M.getText(user,input.." wurde als neuer Mieter eingetragen.",input.." set as new tenant."))
                M.setSignature(user, item, propertyName)
            end
        end
    end

    user:requestInputDialog(InputDialog(M.getText(user,"Mieter eintragen","Set Tenant"),

    M.getText(user,"Trag hier den Namen des neuen Mieters ein.",
    "Write in the name of who you want to set as the new tenant."), false, 255, callback))
end

function M.checkIfOwnsProperty(Input)

    for i = 1, #propertyList.propertyTable do

        local propertyName = propertyList.propertyTable[i][1]
        local propertyDeed = M.getPropertyDeed(propertyName)
        local tenant = propertyDeed:getData("tenant")

        if tenant ~= "" and tenant == Input and not M.checkIfEstateViaName(propertyName) then
            return true
        end

        for y = 1, 10 do
            local coTenant = propertyDeed:getData("coTenant"..y)
            if not common.IsNilOrEmpty(coTenant) and coTenant == Input and not M.checkIfEstateViaName(propertyName) then
                return true
            end
        end
    end

    return false
end

function M.checkIfPlayerIsGuest(user, property)

    for i = 1, M.max_guest_number do

        local propertyDeed = M.getPropertyDeed(property)
        local guest = propertyDeed:getData("guestID"..i)

        if guest ~= "" and tonumber(guest) == user.id  then
            return true
        end
    end

    return false
end

function M.getRentDuration(item)

    local rentDuration = item:getData("rentDuration")

    if rentDuration ~= "" then
        return rentDuration
    else
        return "No rent duration found."
    end
end

function M.reduceRentTimer()

    for i = 1, #propertyList.propertyTable do

        local property = propertyList.propertyTable[i][1]
        local propertyDeed = M.getPropertyDeed(property)
        local rentDuration = propertyDeed:getData("rentDuration")

        if not common.IsNilOrEmpty(rentDuration) and tonumber(rentDuration) > 0 then

            local rentExemption = propertyDeed:getData("indefiniteRent")

            if common.IsNilOrEmpty(rentExemption) then
                rentExemption = 0
            end

            if tonumber(rentExemption) ~= 1 then
                propertyDeed:setData("rentDuration", (tonumber(rentDuration)-1))
                world:changeItem(propertyDeed)
            end
        end
    end
end

local function charOwnedDepotKeys(char, keyData, depot)

    if depot and keyData then -- Checking for a specific key in a specific depot
        return (depot:countItem(2558, keyData))+(depot:countItem(3054, keyData))+(depot:countItem(3055, keyData))+(depot:countItem(3056, keyData))
    end

    for _, selectDepot in pairs(depotScript.depots) do -- We check all depot if keys exist at all

        local depotFound = char:getDepot(selectDepot.id)

        if depotFound then
            return (depotFound:countItem(2558))+(depotFound:countItem(3054))+(depotFound:countItem(3055))+(depotFound:countItem(3056))
        end
    end
end

local towns = {"Cadomyr", "Runewick", "Galmair", "Outlaw"}

local function convertTableIntoList(theTable)

    local retString

    for _, object in pairs(theTable) do
        if not retString then
            retString = object
        else
            retString = retString..", "..object
        end
    end

    return retString

end

function M.deleteKeys(char, inform)

    local removedKeys = false

    local propertiesRemovedFrom = 0

    local listOfPropertyNamesEn = {}

    local listOfPropertyNamesDe = {}

    local outlaw = false

    for _, theTown in pairs(towns) do
        for i = 1, #propertyList.propertyTable do --Go through all properties

            local townPropertyBelongsTo = propertyList.propertyTable[i][7]

            if M.checkIfLeaderOfTown(char, theTown) and theTown == townPropertyBelongsTo then
                break
            end

            if theTown == townPropertyBelongsTo then

                local propertyName = propertyList.propertyTable[i][1] -- Fetch name of property
                local propertyDeed = M.getPropertyDeed(propertyName)
                local propertyNameDe = M.getPropertyNameDE(propertyDeed)
                local tenantID = propertyDeed:getData("tenantID") --Fetch owner of property
                local noTenant = common.IsNilOrEmpty(tenantID)
                local characterIsTenant = false
                local characterIsGuest = false
                local deleteKey = false

                if not noTenant then
                    characterIsTenant = char.id == tonumber(tenantID) or M.checkForCoTenants(propertyDeed, char)
                    characterIsGuest = M.checkIfPlayerIsGuest(char, propertyName)
                end

                if noTenant or (not characterIsTenant and not characterIsGuest) then
                    deleteKey = true
                end

                local keyID = propertyList.propertyTable[i][6] --Fetch what lock the key belongs to
                local keyType = propertyList.propertyTable[i][5] -- Fetch what type of key item it is
                local keyAmount = char:countItemAt("all",keyType,{["lockId"]=keyID}) -- Fetch how many keys character has in inventory
                local keysDeleted = false

                if keyAmount > 0 and deleteKey then
                    char:eraseItem(keyType,keyAmount,{["lockId"]=keyID})
                    removedKeys = true --external check for any keys at all deleted so inform gets sent
                    keysDeleted = true --internal key for adding this specific key to the inform
                end

                for _, depot in pairs(depotScript.depots) do

                    local foundDepot = char:getDepot(depot.id)

                    local depotKeyAmount = charOwnedDepotKeys(char, {["lockId"]=keyID}, foundDepot) -- Fetch how many keys character has in depot

                    if foundDepot and depotKeyAmount and deleteKey then
                        for z = 1, depotKeyAmount do
                            foundDepot:eraseItem(keyType,1,{["lockId"]=keyID})
                            removedKeys = true --external check for any keys at all deleted so inform gets sent
                            keysDeleted = true --internal key for adding this specific key to the inform
                        end
                    end
                end

                if M.isOutlawProperty(propertyName) and keysDeleted then
                    outlaw = true
                end

                if keysDeleted then

                    propertiesRemovedFrom = propertiesRemovedFrom + 1

                    table.insert(listOfPropertyNamesEn, propertyName)

                    table.insert(listOfPropertyNamesDe, propertyNameDe)
                end
            end
        end
    end

    local listedPropertiesEn = convertTableIntoList(listOfPropertyNamesEn)
    local listedPropertiesDe = convertTableIntoList(listOfPropertyNamesDe)

    if removedKeys then
        log("Keys belonging to "..char.name.."("..char.id..") were confiscated for properties: "..listedPropertiesEn)
    end

    if removedKeys and inform then
        if propertiesRemovedFrom == 1 and not outlaw then
            char:inform(
                "Die Schlüssel von "..listedPropertiesDe.." wurden von den Wachen einkassiert. Du bist dort nicht mehr willkommen.",
                "No more welcome at property "..listedPropertiesEn..", guards have been instructed to confiscate some keys you are no longer entitled to.")
        elseif propertiesRemovedFrom >= 1 and not outlaw then
            char:inform(
                "Die Wachen kassieren die Schlüssel für die folgenden Grunstücke ein, da du dort nicht mehr willkommen bist: "..listedPropertiesDe..".",
                "As you are no longer welcome to the following properties, guards have been instructed to confiscate some keys you are no longer entitled to: "..listedPropertiesEn.."."
            )
        elseif propertiesRemovedFrom >= 1 and outlaw then
            char:inform(
                "Du kannst die Schlüssel von "..listedPropertiesDe.." nicht an deinem Schlüsselbund finden. Hat sie dir wohlmöglich jemand des Nachts gestohlen?",
                "You notice that some of your keys, namely ones belonging to "..listedPropertiesEn.." are gone. Did someone steal them while you slept?"
            )
        end
    end

end

function M.getRequiredRankName(item, language)

    local nameDE = item:getData("nameDE")
    local nameEN = item:getData("nameEN")

    if not common.IsNilOrEmpty(nameEN) and nameEN == "false" then
        return false
    end

    for i = 1, #propertyList.propertyTable do
        if (item.pos == propertyList.propertyTable[i][3]) then
            if (language == "DE") and nameDE ~= "" then
                return nameDE
            elseif (language == "EN") and nameEN ~= "" then
                return nameEN
            elseif language == "DE" then
                return propertyList.propertyTable[i][10]
            elseif language == "EN" then
                return propertyList.propertyTable[i][9]
            end
        end
    end
end

function M.getSignature(item, language)

    local signatureEN = item:getData("signatureEN")
    local signatureDE = item:getData("signatureDE")

    if language == "DE" and signatureDE ~= "" then
        return signatureDE
    elseif language == "EN" and signatureEN ~= "" then
        return signatureEN
    elseif language == "DE" then
        return "der Quartiermeister"
    else
        return "the Quartermaster"
    end

end

function M.getTownLeaderTitle(town, language)

    --[[ Keeping this bit of code in case we in the future want to return to having unique titles for the town leaders you are told to seek out
    if (town == "Galmair") and (language == "DE") then
        return "Kanzler"
    elseif (town == "Galmair") and (language == "EN") then
        return "Chancellor"
    elseif (town == "Runewick") and (language == "DE") then
        return "Ratsmitglied"
    elseif (town == "Runewick") and (language == "EN") then
        return "Councillor"
    elseif (town == "Cadomyr") and (language == "DE") then
        return "Adeligen"
    elseif (town == "Cadomyr") and (language == "EN") then
        return "Noble"
    elseif language == "DE" then
        return "Anführer"
    else
        return "Leader"
    end
]]

    if language == "DE" then
        return "Stadtverwaltung"
    else
        return "Town Official"
    end
end

function M.propertyInformation(user, deed)

    local town = M.getTownName(deed)
    local rent = M.getRent(deed)
    local rentDE = M.getRentDE(deed)
    local property = M.getPropertyName(deed)
    local propertyDE = M.getPropertyNameDE(deed)
    local rank = M.getRequiredRankName(deed, "EN")
    local rankDE = M.getRequiredRankName(deed, "DE")
    local remainingDuration = M.getRentDuration(deed)
    local tenant = deed:getData("tenant")
    local signatureEN = M.getSignature(deed, "EN")
    local signatureDE = M.getSignature(deed, "DE")
    local townLeaderTitle = M.getTownLeaderTitle(town, "EN")
    local townLeaderTitleDE = M.getTownLeaderTitle(town, "DE")


    local tenantDe = tenant
    local tenantEn = tenant

    local additionalTenants = {}

    for i = 1, 10 do
        local name = deed:getData("coTenant"..i)
        if not common.IsNilOrEmpty(name) then
            table.insert(additionalTenants, name)
        end
    end

    for index, additionalTenant in ipairs(additionalTenants) do

        if index == #additionalTenants then
            tenantDe = tenantDe.." und"
            tenantEn = tenantEn.." and"
        end

        tenantDe = tenantDe.." "..additionalTenant
        tenantEn = tenantEn.." "..additionalTenant
    end

    local retText

    if M.checkOwner(deed) == "Unowned" then -- Shows info specific for when property is unowned

        local rankText = {english = "", german = ""}

        if rank and town ~= "Troll's Haven" then
            rankText.english = " Renting this property requires at minimum the rank of "..rank.."."
            rankText.german = " Um dieses Grundstück mieten zu können, müsst ihr zumindest "..rankDE.." sein."
        end

        local shouldYouWish = { english = " Should you wish to rent this property, please seek out the Quartermaster or one of your "
        ..townLeaderTitle.."s.\n~Signed, "..signatureEN , german = " Solltest du dieses Grundstück mieten wollen, wende dich an den Quartiermeister oder melde \z
        dich bei der "..townLeaderTitleDE.."\n~Unterzeichnet, "..signatureDE }

        if town == "Troll's Haven" then
            shouldYouWish.english = " If you want to rent this room, I'll take payment up front. \n ~Signed, Half-hung Bryan"
            shouldYouWish.german = " Wenn du dieses Zimmer mieten willst, nehme ich die Bezahlung im Voraus. /n ~Gezeichnet, Halbgehängter Bryan"
        end

        retText = M.getText(user,
        "Ihr könnt nun die "..propertyDE..
        " zum Preis von "..rentDE..
        " mieten."..rankText.german..shouldYouWish.german,
        "It is now possible to rent the "..property..
        " at a price of "..rent..rankText.english..shouldYouWish.english)
    elseif M.checkOwner(deed) == user.id or M.checkForCoTenants(deed, user) then -- Shows info specific for when property is owned by user

        local germanText
        local englishText

        local timeLeft = " in "..remainingDuration.." months."
        local timeLeftDe = "in "..remainingDuration.." Monaten aus."

        if tonumber(remainingDuration) == 1 then
            timeLeft = " at the start of the next month."
            timeLeftDe = " zu Beginn des nächsten Monats aus."
        end

        local additionalConcerns = { english =
        "\nFor additional questions or concerns, please seek out the Quartermaster or one of \z
        your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN,
        german = "\nFür weitere Fragen oder Anmerkungen, wende dich an den Quartiermeister oder melde dich \z
        bei der "..townLeaderTitleDE..".\n~Unterzeichnet, "..signatureDE}

        if town == "Troll's Haven" then
            additionalConcerns = {english = " ", german = " "} --Bryan doesnt care if you have concerns, he got paid up front anyways
        end

        local germanDefault = "An den aktuellen Bewohner von "..propertyDE..",\n die derzeitige Miete beträgt "..rentDE..
        "\n Ohne zusätzliche Zahlungen, läuft das aktuelle Mietverhältnis "..timeLeftDe..additionalConcerns.german

        local englishDefault = "To the current inhabitant of "..property..
        ",\nLet it be known that you are expected to pay a rent of "..rent..
        " Without additional payments, your current lease expires"..timeLeft..additionalConcerns.english


        local indefiniteRent = deed:getData("indefiniteRent")
        local freeRent = false

        if not common.IsNilOrEmpty(indefiniteRent) and tonumber(indefiniteRent) == 1 then
            freeRent = true
        end

        local englishFreeRent = "To the current inhabitant of "..property..",\n Let it be known that you are currently not expected to pay rent."..additionalConcerns.english
        local germanFreeRent = "An den aktuellen Bewohner von"..propertyDE..",\n ihr wohnt von nun an mietfrei."..additionalConcerns.german

        if not freeRent then
            germanText = germanDefault
            englishText = englishDefault
        else
            germanText = germanFreeRent
            englishText = englishFreeRent
        end

        retText = M.getText(user, germanText, englishText)
    else -- Shows info specific for when property is owned but not by user.
        if town ~= "Troll's Haven" then
            retText = M.getText(user,
            "Dieses Grundstück wird aktuell gemietet von "..tenantDe..
            ". Solltest du irgendwelche Bedenken haben oder ein freies Grundstück mieten wollen, wende dich bitte an \z
            den Quartiermeister oder melde dich bei der "..townLeaderTitleDE..
            ".\nUnterzeichnet, "..signatureDE,
            "This property is currently being leased to "..tenantEn..
            ". Should you have any concerns, or wish to rent a property that is currently available, please \z
            seek out the Quartermaster or one of your "..townLeaderTitle..
            "s.\n~Signed, "..signatureEN)
        elseif town == "Troll's Haven" then

            local germanText = "Dieses Zimmer ist derzeit an "..tenantDe.." vermietet. Sprich mit Halbgehängtem Bryan, wenn du anbieten möchtest, eine höhere Miete als er zu zahlen."
            local englishText = "This room is currently being leased to "..tenantEn..". Talk to half-hung Bryan if you want to offer to pay a higher rent than they do for the room."

            retText = M.getText(user, germanText, englishText)
        end
    end

    return retText
end

function M.abandonPropertyDialog(user, item)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                M.abandonProperty(user, item)
                user:inform(M.getText(user,"Nachdem du dem Quartiermeister den Schlüssel zurückgegeben hast, verabschiedest du dich von deinem alten Heim. Wo wirst du nun schlafen?","Having returned the key to the Quartermaster, you bid farewell to your old home. Now where will you sleep?"))
            else
                user:inform(M.getText(user,"Du hast dich entschieden das Mietverhältnis nicht zu beenden. ","You decide against giving up on your lease for the property."))
            end
        end
    end
    local dialog = SelectionDialog(M.getText(user,"Mietverhältnis beenden","Abandon property"),M.getText(user,"Bist du dir sicher, dass du das bestehende Mietverhältnis kündigen möchtest? Überschüssiges Geld wird nicht ausgezahlt.","Are you sure you want to abandon your lease on the property? Any remaining rent money will not be returned."),callback)
    dialog:addOption(0, M.getText(user,"Ja, Mietverhältnis beenden.","Yes, abandon it."))
    dialog:addOption(0, M.getText(user,"Nein, ich habe meine Meinung geändert.","No, I changed my mind."))
    user:requestSelectionDialog(dialog)
end

function M.abandonProperty(user, deed)

    if M.checkForCoTenants(deed, user) then --only remove co tenant status if a co tenant abandons property
        for i = 1, 10 do
            local coTenantId = deed:getData("coTenantID"..i)
            if not common.IsNilOrEmpty(coTenantId) and tonumber(coTenantId) == user.id then
                deed:setData("coTenantID"..i, "")
                deed:setData("coTenant"..i, "")
                world:changeItem(deed)
            end
        end
    else

        local replacedTenantWithCoTenant = false

        for i = 1, 10 do
            local coTenantId = deed:getData("coTenantID"..i)
            if not common.IsNilOrEmpty(coTenantId) then
                replacedTenantWithCoTenant = true
                deed:setData("tenantID", coTenantId)
                deed:setData("tenant", deed:getData("coTenant"..i))
                deed:setData("coTenantID"..i, "")
                deed:setData("coTenant"..i, "")
                world:changeItem(deed)
            end
        end

        if not replacedTenantWithCoTenant then
            M.removeTenantGuestBuilderDuration(deed)
        end
    end

    M.keyRetrieval(user)

end

function M.removeRentalOfPropertiesOfOtherTowns(user)
    for i = 1, #propertyList.propertyTable do
        local propertyName = propertyList.propertyTable[i][1]
        local propertyNameDE = propertyList.propertyTable[i][2]
        local propertyDeed = M.getPropertyDeed(propertyName)
        local tenant = propertyDeed:getData("tenantID")
        local town = propertyList.propertyTable[i][7]
        if tenant ~= "" then
            if tonumber(tenant) == user.id then

                M.removeTenantGuestBuilderDuration(propertyDeed)

                M.keyRetrieval(user)

                if town == "Outlaw" then
                    user:inform("Als Bürger einer Stadt kannst du keine Grundstücke außerhalb des Einflussbereiches einer Stadt behalten.","Having become a citizen of a town, you are no longer eligible to keep former properties that do not belong to the town.")
                else
                    user:inform("Nachdem du nicht länger Bürger von "..town.." bist, hast du das Recht auf deinen Mietanspruch auf "..propertyNameDE.." verloren und wirst gezwungen die Schlüssel zurückzugeben.","Because you are no longer a citizen of "..town.." you have forfeited the lease on the "..propertyName.." and been made to return your keys.")
                end
            end
        end
    end
end

function M.removeRentalIfDurationIsUp()
    for i = 1, #propertyList.propertyTable do
        local propertyName = propertyList.propertyTable[i][1]
        local propertyDeed = M.getPropertyDeed(propertyName)
        local duration = propertyDeed:getData("rentDuration")
        local tenant = propertyDeed:getData("tenant")
        local tenantID = propertyDeed:getData("tenantID")
        local rentExemption = propertyDeed:getData("indefiniteRent")

        local rentIsExemptedForThisProperty = not common.IsNilOrEmpty(rentExemption) and tonumber(rentExemption) == 1

        local durationIsEmptyOrZero = common.IsNilOrEmpty(duration) or tonumber(duration) == 0

        local tenantExists = not common.IsNilOrEmpty(tenant)

        if not rentIsExemptedForThisProperty and durationIsEmptyOrZero and tenantExists then -- No rent remains but there is a tenant registered
            log("The lease on "..propertyName.." has expired. The tenant "..tenant.."("..tenantID..") has been evicted along with any guests/builders.")
            M.removeTenantGuestBuilderDuration(propertyDeed)
        end
    end
end

function M.extendRent(user, item, property)

    local propertyName

    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end

    local propertyDeed = M.getPropertyDeed(propertyName)
    local rentDuration = propertyDeed:getData("rentDuration")

    if rentDuration == "" then
        return
    end

    local extendRent = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if (string.find(input,"") ~= nil) then
            if tonumber(input) == nil then
                user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
            elseif tonumber(input) <= 0 then
                user:inform(M.getText(user,"Die Zahl muss grösser als 0 sein.","You must set a number higher than 0."))
            elseif (tonumber(input)+rentDuration) > 48 then
                user:inform(M.getText(user,"Die Mietdauer darf 48 Monate nicht überschreiten.","Rent duration can not exceed 48 months."))
            else
                propertyDeed:setData("rentDuration", (rentDuration+input))
                world:changeItem(propertyDeed)
                user:inform(M.getText(user,"Mietdauer um"..input.." Monate verlängert.","Rent duration extended by "..input.." months."))
            end
        else
            user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end

    user:requestInputDialog(InputDialog(M.getText(user,"Miete verlängern","Extend rent"), M.getText(user,"Mietdauer für den aktuellen Mieter umsonst verlängern.\n Derzeit beträgt die Mietdauer noch "..rentDuration.." Monate.","Extend rent for current tenant at no charge.\n There's currently "..rentDuration.." months left on the lease."), false, 255, extendRent))
end

function M.setSignature(user, item, propertyName)

    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local propertyDeed = M.getPropertyDeed(property)
    local rankTitleEN = M.getRankTitle(user, "EN")
    local rankTitleDE = M.getRankTitle(user, "DE")
    local name = user.name

    if user:isAdmin() then
        propertyDeed:setData("signatureEN", "The Quartermaster")
        propertyDeed:setData("signatureDE", "Der Quartiermeister")
    else
        propertyDeed:setData("signatureEN", rankTitleEN.." "..name)
        propertyDeed:setData("signatureDE", rankTitleDE.." "..name)
    end

    world:changeItem(propertyDeed)
end

function M.getRankTitle(player, language)

    local Faction = factions.getFaction(player)

    if player:isAdmin() then
        return
    end

    if (player:increaseAttrib("sex",0) == 0) then --male Ranks
        if language == "DE" then
            return factions.townRanks[Faction.tid][Faction.rankTown].gRank;
        elseif language == "EN" then
            return factions.townRanks[Faction.tid][Faction.rankTown].eRank;
        end
    elseif language == "DE" then
        return factions.townRanks[tonumber(Faction.tid)+3][Faction.rankTown].gRank;
    elseif language == "EN" then
        return factions.townRanks[tonumber(Faction.tid)+3][Faction.rankTown].eRank;
    end
end

function M.keyRetrieval(char, inform)
    -- check if character owns any keys or is admin
    if (M.charOwnedKeys(char) == 0) and (not charOwnedDepotKeys(char) or charOwnedDepotKeys(char) == 0) or char:isAdmin() then
        return
    else
        M.deleteKeys(char, inform)
    end
end

function M.charOwnedKeys(char)
    return ((char:countItem(2558))+(char:countItem(3054))+(char:countItem(3055))+(char:countItem(3056)))
end

local function sendMessageToInformNewBuilderGuest(builderOrGuestID, builderOrGuest, propertyName, propertyNameDe)

    local english
    local german

    if M.isOutlawProperty(propertyName) then
        return --Such a message would be unimmersive for outlaw estates
    end

    if builderOrGuest == "builder" then
        english = "Following recommendation by the tenant of "..propertyName..", you are hereby authorised as a builder of the property. So fetch your trusted Construction Trowel and get to work! \n\n ~The Quartermaster"
        german = "Der Mieter von "..propertyNameDe.." hat dir das Baurecht erteilt. Also schwing die Kelle! \n\n Der Quartiermeister"
    else
        english = "The tenant of "..propertyName.." has informed us of your residency as a guest at their property. The guards have been notified to let you keep any keys to said property you may have in your possession. \n\n ~The Quartermaster"
        german = "Du bist fortan als Gast von "..propertyNameDe.." willkommen. Die Wachen wurden darüber informiert, dass du rechtmäßige Inhaber eines Schlüssels bist. \n\n Der Quartiermeister"
    end


    messenger.sendMessageViaScript(english, german, builderOrGuestID)

end

local function sendMessageToInformRemovedBuilderGuest(builderOrGuestID, builderOrGuest, propertyName, propertyNameDe)

    if M.isOutlawProperty(propertyName) then
        return --Such a message would be unimmersive for outlaw estates
    end

    local english
    local german

    if builderOrGuest == "builder" then
        english = "We regret to inform you that the tenant of "..propertyName.." has had your right to build on the property revoked. \n\n ~The Quartermaster"
        german = "Der Mieter von "..propertyNameDe.." hat dir das Baurecht entzogen. \n\n Der Quartiermeister"
    else
        english = "The tenant of "..propertyName.." has informed us that you have vacated your residency as a guest of their property. If you have yet to hand over your keys, the guards will now confiscate them. \n\n ~The Quartermaster "
        german = "Der Mieter von "..propertyNameDe.." hat uns darüber in Kenntnis gesetzt, dass du nicht länger ein Gast auf dem Grundstück bist. Schlüssel, die du noch abzugeben hast, werden dir von der Wache abgenommen. \n\n Der Quartiermeister"
    end

    messenger.sendMessageViaScript(english, german, builderOrGuestID)
end

function M.setBuilderOrGuest(user, item, builderOrGuest, propertyName)

    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local propertyDeed = M.getPropertyDeed(property)

    local propertyNameDe = M.getPropertyNameDE(propertyDeed)

    local builderOrGuestDe
    local builderOrGuestDePlural
    local textDe
    local textEn

    if builderOrGuest == "builder" then
        builderOrGuestDe = "Bauherr"
        builderOrGuestDePlural = "Bauherren"
        textDe = "Er/sie darf jetzt auf deinem Grundstück bauen."
        textEn = "They will now be permitted to build on your property."
    elseif builderOrGuest == "guest" then
        builderOrGuestDe = "Gast"
        builderOrGuestDePlural = "Gäste"
        textDe = "Schlüssel, die diese Person hat, werden nicht länger von den Wachen konfisziert."
        textEn = "Keys they have will no longer be confiscated by the guards."
    end

    local callback = function (dialog)
        if not dialog:getSuccess() then
            return
        end
        local input = dialog:getInput()
        if (input == nil or input == '') then
            user:inform(M.getText(user,"Das Namensfeld darf nicht leer sein.","The name field can not be empty."))
        else
            local builderOrGuestExists, builderOrGuestID = world:getPlayerIdByName(input)

            if not builderOrGuestExists then
                informDoesntExist(user)
            elseif builderOrGuestID == user.id then
                if builderOrGuest == "builder" then
                    user:inform("Als Mieter des Grundstücks hast du bereits das Baurecht.", "As the tenant of the property, you already have permission to build on it.")
                else
                    user:inform("Als Mieter des Grunstücks brauchst du dich nicht als Gast eintragen. Dies dient dazu, die Wachen darüber zu informieren, dass die Gäste Schlüssel zu deinem Grundstück besitzen dürfen.", "As the tenant of the property, it'd be superflous to make yourself a guest as well. If you want to let the guards know to let others keep keys to your property, however, you should register them as guest.")
                end
            else
                for i = 1, M["max_"..builderOrGuest.."_number"] do

                    local foundBuilderOrGuest = propertyDeed:getData(builderOrGuest..i)

                    if foundBuilderOrGuest == "" then
                        propertyDeed:setData(builderOrGuest..i, input)
                        propertyDeed:setData(builderOrGuest.."ID"..i, builderOrGuestID)
                        world:changeItem(propertyDeed)
                        user:inform(M.getText(user,input.." hat nun die Rechte als "..builderOrGuestDe..". "..textDe,input.." set as a "..builderOrGuest..". "..textEn))
                        sendMessageToInformNewBuilderGuest(builderOrGuestID, builderOrGuest, property, propertyNameDe)
                        return
                    elseif i == M["max_"..builderOrGuest.."_number"] then
                        user:inform(M.getText(user,"Du kannst nur "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuestDePlural.." gleichzeitig haben. Du musst einen von der List entfernen, bevor du jemanden Neues ernennen kannst.","You may only have "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuest.."s at a time. You must remove one if you want to add another." ))
                    end
                end
            end
        end
    end

    user:requestInputDialog(InputDialog(M.getText(user,builderOrGuestDe.." eintragen","Set "..builderOrGuest),
    M.getText(user,"Wen möchtest du als "..builderOrGuestDe.." eintragen?",
    "Write in the name of who you want to set as a "..builderOrGuest),
    false, 255, callback))
end

function M.removeBuilderOrGuest(user, item, builderOrGuest, propertyName)
    local guestOrBuildersExist = false
    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local propertyDeed = M.getPropertyDeed(property)

    local propertyNameDe = M.getPropertyNameDE(propertyDeed)

    local builderOrGuestDe
    local dialogNameEn
    local dialogNameDe
    local skippedGuestSlots = 0

    if builderOrGuest == "builder" then
        builderOrGuestDe = "Bauherren"
        dialogNameEn = "Builder's list"
        dialogNameDe = "Liste der Bauherren"
    elseif builderOrGuest == "guest" then
        builderOrGuestDe = "Gäste"
        dialogNameEn = "Guest List"
        dialogNameDe = "Gästeliste"
    end


    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            for i = 1, M["max_"..builderOrGuest.."_number"] do
                local currentBuilderOrGuest = propertyDeed:getData(builderOrGuest..i)
                if currentBuilderOrGuest ~= "" then
                    if selected == i-skippedGuestSlots then
                        local builderOrGuestID = tonumber(propertyDeed:getData(builderOrGuest.."ID"..i))
                        propertyDeed:setData(builderOrGuest..i, "")
                        propertyDeed:setData(builderOrGuest.."ID"..i, "")
                        world:changeItem(propertyDeed)
                        user:inform(M.getText(user,currentBuilderOrGuest.." wurde von der Liste der "..builderOrGuestDe.." entfernt.",currentBuilderOrGuest.." has been removed from the list of "..builderOrGuest.."s."))
                        sendMessageToInformRemovedBuilderGuest(builderOrGuestID, builderOrGuest, property, propertyNameDe)
                    end
                else
                    skippedGuestSlots = skippedGuestSlots+1
                end
            end
        end
    end

    local dialog = SelectionDialog(M.getText(user,dialogNameDe,dialogNameEn) ,
    M.getText(user,"Wähle einen Namen aus, der von der Liste der "..builderOrGuestDe.." entfernt werden soll.",
    "Select a name to remove them from the "..builderOrGuest.." list.") , callback)

    for i = 1, M["max_"..builderOrGuest.."_number"] do
        local currentBuilderOrGuest = propertyDeed:getData(builderOrGuest..i)
        if currentBuilderOrGuest ~= "" then
            dialog:addOption(0, currentBuilderOrGuest)
            guestOrBuildersExist = true
        end
    end

    if guestOrBuildersExist then
        user:requestSelectionDialog(dialog)
    else
        user:inform("Die Liste der "..builderOrGuestDe.." ist leer.","There are no "..builderOrGuest.."s to remove.")
    end
end

function M.getRentNumeral(item)
    local defaultRent = M.getDefaultRent(item)
    local rent = item:getData("rent")

    if rent ~= "" then
        return rent
    else
        return defaultRent
    end
end

function M.getTownManagementTool(town)
    local listOfTools = M.townManagmentItemPos
    local location

    if town == "Cadomyr" then
        location = listOfTools[1]
    elseif town == "Runewick" then
        location = listOfTools[2]
    elseif town == "Galmair" then
        location = listOfTools[3]
    end

    if not location then
        return
    end

    local toolId = {3106, 3104}

    local field = world:getField(location)
    local itemsOnField = field:countItems()

    for i = 0, itemsOnField do
        local chosenItem = field:getStackItem(itemsOnField - i )
        if chosenItem.id == toolId[1] or chosenItem.id == toolId[2] then
            return chosenItem
        end
    end

end

function M.addRent(town, rent)

    local townManagementTool = M.getTownManagementTool(town)

    if not townManagementTool then
        return
    end

    if not world:isPersistentAt(townManagementTool.pos) then
        world:makePersistentAt(townManagementTool.pos)
    end

    local amount = townManagementTool:getData("rent")

    if amount ~= "" then
        townManagementTool:setData("rent", (tonumber(amount)+tonumber(rent)))
    else
        townManagementTool:setData("rent", tonumber(rent))
    end
    world:changeItem(townManagementTool)
end

function M.payRent(user, item)
    local town = M.getTownName(item)

    local callback = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if tonumber(input) == nil then
            user:inform(M.getText(user,"Bitte gib eine Zahl ein.","Input must be a number."))
        elseif tonumber(input) <= 0 then
            user:inform(M.getText(user,"Die Mietdauer muss wenigstens einen Monat lang sein.","The number of months to rent has to be more than 0."))
        else
            local rent_cost = (tonumber(M.getRentNumeral(item))*tonumber(input))
            local rentDuration = item:getData("rentDuration")

            if (input == nil or input == "") then
                user:inform(M.getText(user,"Das Eingabefeld darf nicht leer sein.","Input field can't be left empty."))
            elseif not money.CharHasMoney(user, rent_cost) then--check money
                user:inform(M.getText(user,"Das kannst du dir nicht leisten.","You can't afford that."))
            elseif rentDuration ~= "" then
                if ((tonumber(input)+tonumber(rentDuration)) > 48)  then
                    user:inform(M.getText(user,"Du kannst die Mietdauer nicht auf mehr als 48 Monate verlängern.","Duration increase can not exceed the maximum of 48 months rent."))
                else
                    money.TakeMoneyFromChar(user, rent_cost)
                    M.addRent(town, rent_cost)
                    item:setData("rentDuration", (tonumber(input) + tonumber(rentDuration)))

                    if not M.checkForCoTenants(item, user) and not tonumber(item:getData("tenantID")) == user.id then
                        item:setData("tenant", user.name)
                        item:setData("tenantID", user.id)
                    end
                    world:changeItem(item)
                    user:inform(M.getText(user,"Auch wenn sich dein Geldbeutel nun deutlich leichter anfühlt, erfüllt dich das gute Gefühl, dass dein Grundstück dir für weitere "..input.." Monate gehört.","Your purse may feel lighter, but you rest comfortably in the knowledge that the residence before you is now yours for an additional "..input.." months."))
                end
            end

        end
    end

    if M.checkOwner(item) == user.id or M.checkForCoTenants(item, user) then

        local rentDuration = item:getData("rentDuration")

        if rentDuration ~= "" then
            user:requestInputDialog(InputDialog(M.getText(user,"Miete","Rent"), M.getText(user,
            "Deine Miete beträgt: "..M.getRentDE(item)..
            "\n Die verbleibende Mietdauer beträgt "..rentDuration..
            "Monate. \nUm wie viele Monate möchtest du das Mietverhältnis verlängern?",
            "The current rental fee is "..M.getRent(item)..
            "\n You currently have "..rentDuration..
            " months left on your lease. \nHow many months do you want to extend your rent by?"),
            false, 255, callback))
        end
    else
        user:requestInputDialog(InputDialog(M.getText(user,"Miete","Rent"), M.getText(user,
        "Deine Miete beträgt: "..M.getRentDE(item)..
        "\n Der erste Zahlungsmonat gilt nur bis zum Beginn des nächsten Monats. \nFür wie viele Monate möchtest du die Miete bezahlen?",
        "The current rental fee is "..M.getRent(item)..
        "\n The first month paid for only counts until the start of next month. \nHow many months do you want to rent for?"), false, 255, callback))
    end
end

function M.allowAllAutomaticRentExtension(user, realm)

    local state = 1

    for i = 1, #propertyList.propertyTable do
        local property = propertyList.propertyTable[i][1]
        local town = propertyList.propertyTable[i][7]
        local propertyDeed = M.getPropertyDeed(property)

        if town == realm then
            local result = propertyDeed:getData("automaticRentExtension")

            if result ~= "" then
                result = tonumber(result)
            else
                result = 0
            end

            state = math.min(state, result)

            if state == 0 then
                break
            end
        end
    end

    local newState

    if state == 0 then
        newState = 1
    else
        newState = 0
    end

    local title = {english = "Enable/Disable automatic rent", german = "Automatische Mietzahlung"}
    local texts = {
        {english = "Do you want to let the residents of all properties pay to extend their rent duration without your supervision?",
        german = "Möchtest du den Bewohnern aller Grundstücke erlauben, ihr Mietverhältnis ohne deine Aufsicht zu verlängern?",
        identifier = 1,
        informText = {
            english = "The residents of all properties will now be able to pay to extend their rent duration on their own. The resulting rent money can be collected at the town management instrument.",
            german = "Die Bewohner aller Grundstücke können nun selbst die Verlängerung ihres Mietverhältnisses bezahlen. Das Miete kann über das Stadtverwaltungswerkzeug abkassiert werden."}
        },
        {english = "Do you want to no longer let the residents any properties pay to extend their rent duration without your supervision?",
        german = "Möchtest du den Bewohnern aller Grundstücke nicht mehr erlauben, ihr Mietverhältnis ohne deine Aufsicht zu verlängern?",
        identifier = 0,
        informText = {
            english = "No residents will be able to pay to extend their rent duration without your supervision anymore.",
            german = "Die Bewohner können nun nicht mehr selbst die Verlängerung ihres Mietverhältnisses bezahlen."}
        }
    }

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            for i = 1, #propertyList.propertyTable do
                local property = propertyList.propertyTable[i][1]
                local town = propertyList.propertyTable[i][7]
                local propertyDeed = M.getPropertyDeed(property)
                if town == realm then
                    propertyDeed:setData("automaticRentExtension", newState)
                    world:changeItem(propertyDeed)
                end
            end
            for _, text in pairs(texts) do
                if text.identifier == newState then
                    user:inform(text.informText.german, text.informText.english)
                    break
                end
            end
        end
    end

    local dialog

    for _, text in pairs(texts) do
        if text.identifier == newState then
            dialog = SelectionDialog(M.getText(user, title.german, title.english), M.getText(user, text.german, text.english), callback)
            dialog:addOption(0, M.getText(user, "Ja", "Yes"))
            break
        end
    end

    user:requestSelectionDialog(dialog)

end

function M.allowAutomaticRentExtension(user, item, propertyName)
    local property
    local propertyDE

    if propertyName == nil then
        property = M.getPropertyName(item)
        propertyDE = M.getPropertyNameDE(item)
    else
        property = propertyName
        propertyDE = M.getPropertyNameDE(item)
    end

    local propertyDeed = M.getPropertyDeed(property)

    local currentState

    local result = propertyDeed:getData("automaticRentExtension")

    if result == "" then
        currentState = 0
    else
        currentState = tonumber(result)
    end

    local newState

    if currentState == 1 then
        newState = 0
    else
        newState = 1
    end

    local title = {english = "Enable/Disable automatic rent extension", german = "Miete"}
    local texts = {
        {english = "Do you want to let the resident of "..property.." pay to extend their rent duration without your supervision?",
        german = "Möchtest du den Bewohnern von "..propertyDE.." erlauben, ihr Mietverhältnis ohne deine Aufsicht zu verlängern?",
        identifier = 1,
        informText = {
            english = "The resident of "..property.." will now be able to pay to extend their rent duration on their own. The resulting rent money can be collected at the town management instrument.",
            german = "Die Bewohner von "..propertyDE.." können nun selbst die Verlängerung ihres Mietverhältnisses bezahlen. Das Miete kann über das Stadtverwaltungswerkzeug abkassiert werden."}
        },
        {english = "Do you want to no longer let the resident of "..property.." pay to extend their rent duration without your supervision?",
        german = "Möchtest du den Bewohnern von "..propertyDE.." nicht mehr erlauben, ihr Mietverhältnis ohne deine Aufsicht zu verlängern?",
        identifier = 0,
        informText = {
            english = "The resident of "..property.." will no longer be able to pay to extend their rent duration without your supervision.",
            german = "Die Bewohner von "..propertyDE.." können nun nicht mehr selbst die Verlängerung ihres Mietverhältnisses bezahlen."}
        }
    }

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            propertyDeed:setData("automaticRentExtension", newState)
            world:changeItem(propertyDeed)
            for _, text in pairs(texts) do
                if text.identifier == newState then
                    user:inform(text.informText.german, text.informText.english)
                    break
                end
            end
        end
    end

    local dialog

    for _, text in pairs(texts) do
        if text.identifier == newState then
            dialog = SelectionDialog(M.getText(user, title.german, title.english), M.getText(user, text.german, text.english), callback)
            dialog:addOption(0, M.getText(user, "Ja", "Yes"))
            break
        end
    end

    user:requestSelectionDialog(dialog)

end

function M.setIndefiniteRent(user, item, propertyName)
    local property
    local propertyDE

    if propertyName == nil then
        property = M.getPropertyName(item)
        propertyDE = M.getPropertyNameDE(item)
    else
        property = propertyName
        propertyDE = M.getPropertyNameDE(item)
    end

    local propertyDeed = M.getPropertyDeed(propertyName)

    local rentEn = M.getRent(propertyDeed, propertyName)
    local rentDe = M.getRentDE(propertyDeed, propertyName)

    local currentState

    local result = propertyDeed:getData("indefiniteRent")

    if result == "" then
        currentState = 0
    else
        currentState = tonumber(result)
    end

    local newState

    if currentState == 1 then
        newState = 0
    else
        newState = 1
    end

    local title = {english = "Enable/Disable rent", german = "Miete"}
    local texts = {
        {english = "Do you want to let the resident of "..property.." live rent free?",
        german = "Willst du den Bewohner von "..propertyDE.." mietfrei wohnen lassen?",
        identifier = 1,
        informText = {
            english = "The resident of "..property.." will now live rent free.",
            german = "Der Bewohner von "..propertyDE.." wohnt nun mietfrei."},
        informImpactedTenant = {
            english = "To the resident of "..property..". Let it be known that you are for the time being not expected to pay rent for your tenancy at said property. This may change in the future and you shall receive a similar letter if it does. \n\n ~The Quartermaster",
            german = "An den Mieter von "..propertyDE..": Bis auf Weiteres wohnst du nun mietfrei. Sollte sich hieran etwas ändern, wirst du davon rechtzeitig in Kenntnis gesetzt.  \n\n Der Quartiermeister"
        }
        },
        {english = "Do you want to no longer let the resident of "..property.." live rent free?",
        german = "Möchtest du vom Bewohner von "..propertyDE.." wieder Miete kassieren?",
        identifier = 0,
        informText = {
            english = "The resident of "..property.." will no longer live rent free.",
            german = "Der Bewohner von "..propertyDE.." wohnt nun nicht mehr mietfrei."},
        informImpactedTenant = {
            english = "To the resident of "..property..". Let it be known that you are once more expected to pay rent for your tenancy at said property. The current rent is set to "..rentEn..". \n\n ~The Quartermaster",
            german = "Als Bewohner von "..propertyDE.." musst du fortan wieder Miete zahlen. Die Mietzahlung beträgt "..rentDe.." pro Monat. \n\n Der Quartiermeister"
        }
        }
    }

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local selected = dialog:getSelectedIndex()+1

        local tenantEnglish
        local tenantGerman

        if selected == 1 then
            propertyDeed:setData("indefiniteRent", newState)
            world:changeItem(propertyDeed)
            for _, text in pairs(texts) do
                if text.identifier == newState then
                    user:inform(text.informText.german, text.informText.english)
                    tenantEnglish = text.informImpactedTenant.english
                    tenantGerman = text.informImpactedTenant.german
                    break
                end
            end

            local tenant = propertyDeed:getData("tenantID")
            messenger.sendMessageViaScript(tenantEnglish, tenantGerman, tenant)

            for i = 1, 10 do
                local coTenant = propertyDeed:getData("coTenantID"..i)

                if not common.IsNilOrEmpty(coTenant) then
                    messenger.sendMessageViaScript(tenantEnglish, tenantGerman, coTenant)
                end
            end

        end
    end

    local dialog

    for _, text in pairs(texts) do
        if text.identifier == newState then
            dialog = SelectionDialog(M.getText(user, title.german, title.english), M.getText(user, text.german, text.english), callback)
            dialog:addOption(0, M.getText(user, "Ja", "Yes"))
            break
        end
    end

    user:requestSelectionDialog(dialog)

end

local function setNoRankReq(selected, propertyDeed, user)

    if not selected == 8 then
        return
    end

    local propertyDe = M.getPropertyNameDE(propertyDeed)
    local propertyEn = M.getPropertyName(propertyDeed)

    propertyDeed:setData("nameEN", "false")
    propertyDeed:setData("nameDE", "false")
    world:changeItem(propertyDeed)
    user:inform(M.getText(user,"Zum Anmieten von "..propertyDe.."wird nun kein besonderer Rang mehr benötigt.","You've set it so that there is no longer any rank requirement associated with renting "..propertyEn.."."))

end

function M.setReqRank(user, item, propertyName)
    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local propertyDeed = M.getPropertyDeed(property)
    local propertyDe = M.getPropertyNameDE(propertyDeed)

    local town = M.getTownName(item, property)

    if town == "Outlaw" then
        user:inform("Bei Grundstücken außerhalb des Einflussbereiches einer Stadt kann kein Rang erforderlich gemacht werden.","Can't set required rank for non-town properties.")
        return
    end

    local callback1 = function (dialogGalmair)

        if not dialogGalmair:getSuccess() then
            return
        end

        local selected = dialogGalmair:getSelectedIndex()+1

        for i = 1,7 do
            if selected == i then
                propertyDeed:setData("nameEN", factions.GalmairRankListMale[i]["eRank"])
                propertyDeed:setData("nameDE", factions.GalmairRankListMale[i]["gRank"])
                world:changeItem(propertyDeed)
                user:inform(M.getText(user,"Der benötigte Rang für "..propertyDe.." wurde auf "..factions.GalmairRankListMale[i]["gRank"].." gesetzt.","Required rank to rent "..property.." has been set to "..factions.GalmairRankListMale[i]["eRank"].."."))
            end
        end
        setNoRankReq(selected, propertyDeed, user)
    end

    local callback2 = function (dialogRunewick)
    local success = dialogRunewick:getSuccess()
        if success then
            local selected = dialogRunewick:getSelectedIndex()+1
            for i = 1,7 do
                if selected == i then
                    propertyDeed:setData("nameEN", factions.RunewickRankListMale[i]["eRank"])
                    propertyDeed:setData("nameDE", factions.RunewickRankListMale[i]["gRank"])
                    world:changeItem(propertyDeed)
                    user:inform(M.getText(user,"Der benötigte Rang für "..propertyDe.." wurde auf "..factions.RunewickRankListMale[i]["gRank"].." gesetzt.","Required rank to rent "..property.." has been set to "..factions.RunewickRankListMale[i]["eRank"].."."))
                end
            end
            setNoRankReq(selected, propertyDeed, user)
        end
    end
    local callback3 = function (dialogCadomyr)
    local success = dialogCadomyr:getSuccess()
        if success then
            local selected = dialogCadomyr:getSelectedIndex()+1
            for i = 1,7 do
                if selected == i then
                    propertyDeed:setData("nameEN", factions.CadomyrRankListMale[i]["eRank"])
                    propertyDeed:setData("nameDE", factions.CadomyrRankListMale[i]["gRank"])
                    world:changeItem(propertyDeed)
                    user:inform(M.getText(user,"Der benötigte Rang für "..propertyDe.." wurde auf "..factions.CadomyrRankListMale[i]["gRank"].." gesetzt.","Required rank to rent "..property.." has been set to "..factions.CadomyrRankListMale[i]["eRank"].."."))
                end
            end
            setNoRankReq(selected, propertyDeed, user)
        end
    end

    local dialogGalmair = SelectionDialog(M.getText(user,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(user,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback1)
    local dialogRunewick = SelectionDialog(M.getText(user,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(user,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback2)
    local dialogCadomyr = SelectionDialog(M.getText(user,
    "Benötigten Rang einstellen",
    "Set required rank"),
    M.getText(user,
    "Bestimme welcher Rang benötigt werden soll, um dieses Grundstück zu mieten.",
    "Choose which rank should be required to rent this property."),
    callback3)
    for i = 1,7 do
        dialogGalmair:addOption(0, M.getText(user,factions.GalmairRankListMale[i]["gRank"],factions.GalmairRankListMale[i]["eRank"]))
        dialogRunewick:addOption(0, M.getText(user,factions.RunewickRankListMale[i]["gRank"],factions.RunewickRankListMale[i]["eRank"]))
        dialogCadomyr:addOption(0, M.getText(user,factions.CadomyrRankListMale[i]["gRank"],factions.CadomyrRankListMale[i]["eRank"]))
    end

    dialogGalmair:addOption(0, M.getText(user, "Keiner", "None"))
    dialogRunewick:addOption(0, M.getText(user, "Keiner", "None"))
    dialogCadomyr:addOption(0, M.getText(user, "Keiner", "None"))

    if town == "Galmair" then
        user:requestSelectionDialog(dialogGalmair)
    elseif town == "Runewick" then
        user:requestSelectionDialog(dialogRunewick)
    elseif town == "Cadomyr" then
        user:requestSelectionDialog(dialogCadomyr)
    end
end

function M.setRent(user, item, property)

    local propertyName

    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end

    local propertyDeed = M.getPropertyDeed(propertyName)
    local rentEN = M.getRent(propertyDeed, propertyName)
    local rentDE = M.getRentDE(propertyDeed, propertyName)

    local propertyDe = M.getPropertyNameDE(propertyDeed)

    local newRent = function (dialog)
        if (not dialog:getSuccess()) then
            return
        end

        local input = dialog:getInput()

        if (string.find(input,"") ~= nil) then
            if tonumber(input) == nil then
                user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
            elseif tonumber(input) <= 0 then
                user:inform(M.getText(user,"Die Zahl muss grösser als 0 sein.","You must set a number higher than 0."))
            else
                local germanMoney, englishMoney = money.MoneyToString(tonumber(input))
                propertyDeed:setData("rent", input)
                world:changeItem(propertyDeed)
                user:inform(M.getText(user,"Die Miete für "..propertyDe.." beträgt nun "..germanMoney..".","Rent for "..propertyName.." has been set to "..englishMoney.."."))
                M.setSignature(user, propertyDeed, propertyName)

                local textToImpactedPlayer = {english = "To the tenant of "..propertyName..". We send you this letter to inform you that the rent you are expected to pay has been changed from "..rentEN.." to "..englishMoney..". \n\n ~The Quartermaster", german = "An den Mieter von "..propertyDe..": Die Miete wurde von "..rentDE.." auf "..germanMoney.." erhöht. \n\n Der Quartiermeister"}

                local tenant = propertyDeed:getData("tenantID")

                if not common.IsNilOrEmpty(tenant) then
                    tenant = tonumber(tenant)
                    messenger.sendMessageViaScript(textToImpactedPlayer.english, textToImpactedPlayer.german, tenant)
                end

                for i = 1, 10 do
                    local coTenant = propertyDeed:getData("coTenantID"..i)

                    if not common.IsNilOrEmpty(coTenant) then
                        messenger.sendMessageViaScript(textToImpactedPlayer.english, textToImpactedPlayer.german, coTenant)
                    end
                end
            end
        else
            user:inform(M.getText(user,"Hier muss eine Zahl eingetragen werden.","Input must be a number."))
        end
    end
    user:requestInputDialog(InputDialog(M.getText(user,"Miete festsetzen.","Set rent."), M.getText(user,"Aktuelle Miete: "..rentDE.."\nSetze eine neue monatliche Miete in Kupferstücken fest.","Current rent: "..rentEN.."\nSet a new monthly rent in coppers."), false, 255, newRent))
end

function M.getRent(item, property)

    local propertyName

    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end

    local propertyDeed = M.getPropertyDeed(propertyName)
    local defaultRent = M.getDefaultRent(item, property)
    local rent = propertyDeed:getData("rent")

    if rent ~= "" then
        local coins = tonumber(rent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." gold coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." gold and "..sCoins.." silver coins per month.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." gold and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." silver coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." silver and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." copper coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." gold, "..sCoins.." silver and "..cCoins.." copper coins per month.")
        end
    else
        local coins = tonumber(defaultRent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." gold coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." gold and "..sCoins.." silver coins per month.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." gold and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." silver coins per month.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." silver and "..cCoins.." copper coins per month.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." copper coins per month.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." gold, "..sCoins.." silver and "..cCoins.." copper coins per month.")
        end
    end
end

function M.getRentDE(item, property)
    local propertyName

    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end

    local propertyDeed = M.getPropertyDeed(propertyName)
    local defaultRent = M.getDefaultRent(item, property)
    local rent = propertyDeed:getData("rent")

    if rent ~= "" then
        local coins = tonumber(rent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." Goldstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." Gold- und "..sCoins.." Silberstücke pro Monat.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." Gold- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." Silberstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." Kupferstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." Gold-, "..sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
        end
    else
        local coins = tonumber(defaultRent)
        local gCoins, sCoins, cCoins = money.MoneyToCoins(coins)
        if gCoins > 0 and sCoins == 0 and cCoins == 0 then
            return(gCoins.." Goldstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins == 0 then
            return(gCoins.." Gold- und "..sCoins.." Silberstücke pro Monat.")
        elseif gCoins > 0 and sCoins == 0 and cCoins > 0 then
            return(gCoins.." Gold- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins == 0 then
            return(sCoins.." Silberstücke pro Monat.")
        elseif gCoins == 0 and sCoins > 0 and cCoins > 0 then
            return(sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
        elseif gCoins == 0 and sCoins == 0 and cCoins > 0 then
            return(cCoins.." Kupferstücke pro Monat.")
        elseif gCoins > 0 and sCoins > 0 and cCoins > 0 then
            return(gCoins.." Gold-, "..sCoins.." Silber- und "..cCoins.." Kupferstücke pro Monat.")
        end
    end
end

function M.checkIfSignPost(user)
    local targetItem
    if not common.GetFrontItem(user) then
        return false
    else
        targetItem = common.GetFrontItem(user)
    end
    for _, item in pairs(itemList.items) do
        if item.category == "Sign Posts" and item.itemId == targetItem.id  then
            local previewItem = targetItem:getData("preview") == "true"

            if previewItem then
                user:inform("Du kannst einen zur Vorschau platzierten Gegenstand nicht beschriften.", "You can't write on a preview item.")
            else
                return targetItem
            end
        end
    end
    return false
end

function M.checkIfLockable(user)

    local targetItem

    if not common.GetFrontItem(user) then
        return false
    else
        targetItem = common.GetFrontItem(user)
    end

    for _, item in pairs(itemList.items) do

        if item.category == "Doors" then --All doors and gates

            if item.itemId == targetItem.id then
                return targetItem, item.category
            end

        elseif item.criteria == "Key" then -- Fence gates

            if item.itemId == targetItem.id then
                return targetItem, item.category
            end
        end
    end

    if M.doorIsATrapDoor(targetItem.id) then
        return targetItem, "Trap Doors"
    elseif M.doorIsAStair(targetItem.id) then
        return targetItem, "Stairs"
    end

    return false
end

function M.getTileGraphic(tileIdentifier)
    for _, tile in pairs(itemList.tiles) do
        if tile.tileId == tileIdentifier then
            return tile.displayId
        end
    end
end
function M.getTileName(user, tileIdentifier)

    for _, tile in pairs(itemList.tiles) do
        if tile.tileId == tileIdentifier then
            local tileStats = world:getItemStatsFromId(tile.displayId)
            return common.GetNLS(user, tileStats.German, tileStats.English)
        end
    end

    return "Unknown" --Catch-all. Should not reach this point to begin with.
end

function M.getItemName(user, itemIdentifier, tile)

    local list = itemList.items

    if tile then
        list = itemList.tiles
    end

    for _, item in pairs(list) do
        if (item.itemId and item.itemId == itemIdentifier) or (item.tileId and item.tileId == itemIdentifier)  then
            if item.nameDe then
                return common.GetNLS(user, item.nameDe, item.nameEn)
            end
        end
    end

    return false
end

function M.getLevelReq(identifier, isTile)
    if isTile then
        for _, tile in pairs(itemList.tiles) do
            if tile.tileId == identifier then
                return tile.level
            end
        end
    else
        for _, item in pairs(itemList.items) do
            if item.itemId == identifier then
                return item.level
            end
        end
    end
end
function M.getCraftTimeInSeconds(identifier, isTile)
    local level = M.getLevelReq(identifier, isTile)
    local baseTime = 10
    local timePerLevel = 3
    local amountOfSeconds = baseTime+timePerLevel*level

    return amountOfSeconds
end
function M.getSkill(identifier, tileIdentifier)
    if not tileIdentifier then
        for _, item in pairs(itemList.items) do
            if item.itemId == identifier then
                return Character[item.skill]
            end
        end
    elseif tileIdentifier then
        for _, tile in pairs(itemList.tiles) do
            if tile.tileId == identifier then
                return Character[tile.skill]
            end
        end
    else
        return 0
    end
end

function M.getSkillsToShow(user)

    local skills = {}

    for _, skill in ipairs(itemList.skills) do
        if M.checkIfSkillIsShown(user, skill.name) then
            table.insert(skills, skill)
        end
    end

    return skills
end

function M.removeHelper(user, deed, id) --Closing the dialog triggers this

    local helperAmount = deed:getData("helperAmount")

    if user then id = user.id end

    if common.IsNilOrEmpty(helperAmount) then
        return -- no helpers to find
    else
        helperAmount = tonumber(helperAmount)
    end

    local erased = false

    for i = 1, helperAmount do
        local helper = deed:getData("helper"..i)
        if not common.IsNilOrEmpty(helper) and tonumber(helper) == id then
            deed:setData("helper"..i, "") --erasing the helper
            erased = true
        end

        if erased then
            deed:setData("helper"..i-1, deed:getData("helper"..i)) --overwrite the previous one for the remaining ones after a deletion
        end

        if i == helperAmount and erased then
            deed:setData("helperAmount", helperAmount-1) -- Reducing the amount accordingly
        end
    end

    if erased then
        world:changeItem(deed)
    end
end

function M.addHelper(user, deed) --Triggered upon opening the dialog

    local helperAmount = deed:getData("helperAmount")

    if common.IsNilOrEmpty(helperAmount) then
        helperAmount = 0
    else
        helperAmount = tonumber(helperAmount)
    end

    for i = 1, helperAmount do
        local helper = deed:getData("helper"..i)
        if not common.IsNilOrEmpty and tonumber(helper) == user.id then
            return --Already listed as helper, possibly opened multiple menus with the tool
        end
    end

    deed:setData("helperAmount", helperAmount+1)
    deed:setData("helper"..helperAmount+1, user.id)
    world:changeItem(deed)
end

local elevationItemId = 4348 --An invisible item that elevates items placed on top, also elevates players that walk on it.
local maxElevation = 4 --the max amount of allowed elevation items for a tile


function M.removeElevation(pos) --called anytime a new elevation is set or anytime you delete an item, to prevent random floaty blocks with no item

    for i = 1, maxElevation do --the below function returns false if it doesnt find the item, so it is safe to run even if there is none meaning there is no need to check if the item exists
        common.DeleteItemFromStack(pos, {itemId = elevationItemId})
    end
end


local function addElevationItems(user, frontPos, i)

    local field = world:getField(frontPos)
    local itemsOnField = field:countItems()

    if itemsOnField == 0 then
        user:inform("Es muss ein Objekt vor dir sein, wenn du etwas anheben möchtest.", "There needs to be an item in front of you if you wish to elevate something.")
        return
    end

    local item = field:getStackItem(itemsOnField-1)

    if not M.checkIfItemIsWallDeco(item.id) and item.id ~= 268 and item.id ~= 269 then -- 268/269 are chimneys which are listed as wall decorations but wont count as such in this particular context
        user:inform("Du kannst nur Wanddekorationen anheben." , "You may only elevate wall decorations.")
        return
    end

    world:erase(item, item.number)

    for y = 1, i do
        world:createItemFromId(elevationItemId, 1, item.pos, true, 333, nil)
    end

    world:createItemFromItem(item, item.pos, true)


end

function M.setElevation(user)

    local callback = function(dialog)

        local success = dialog:getSuccess()

        if not success then
            return
        end

        local index = dialog:getSelectedIndex()

        local frontPos = common.GetFrontPosition(user)

        if index == 0 then
            M.removeElevation(frontPos)
        end

        for i = 1, maxElevation do
            if index == i and M.allowBuilding(user) then
                M.removeElevation(frontPos)
                addElevationItems(user, frontPos, i)
            end
        end
    end

    local germanText = "Hier kannst du die Höhe einer Wanddekoration auf der Kachel vor dir einstellen oder anpassen, falls du sie höher platzieren möchtest."
    local englishText = "Here you can set or adjust the elevation of a wall decoration on the tile you are facing, in case you want it to be higher up."

    local dialog = SelectionDialog(common.GetNLS(user,"Höhe einstellen","Set elevation"),
                                    common.GetNLS(user, germanText, englishText), callback)

    dialog:addOption(0,common.GetNLS(user,"Höhe 0","Elevation 0"))
    for i = 1, maxElevation do
        dialog:addOption(0,common.GetNLS(user,"Höhe "..i,"Elevation "..i))
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end

return M
