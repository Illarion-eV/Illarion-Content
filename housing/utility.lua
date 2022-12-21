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

local M = {}

 -- Cadomyr, Runewick, Galmair
 M.townManagmentItemPos = {position(116, 527, 0), position(951, 786, 1), position(344, 223, 0)}
 M.max_guest_number = 20
 M.max_builder_number = 20
 M.depotList={100,101,102,103}

 function M.checkOwner(item)

    local tenant = item:getData("tenantID")

    if tenant ~= "" then
        return tonumber(tenant)
    else
        return "Unowned"
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

function M.checkIfRoofOrRoofTile(theId, tileBoolean)

    if not tileBoolean then
        for _, item in pairs (itemList.items) do
            if item.category == "Roof" and item.itemId == theId then
                return true
            end
        end
    else
        for _, tile in pairs (itemList.tiles) do
            if theId == 0 then
                return false
            elseif tile.category == "Roof Tiles" and tile.tileId == theId then
                return true
            end
        end
    end
    return false
end

function M.fetchPropertyName(user, pos)

    local direct = user:getFaceTo()
    local d = 1
    local vX, vY = common.GetDirectionVector(direct)
    local x
    local y
    local z

    if pos == nil then
        x = user.pos.x + vX * d
        y = user.pos.y + vY * d
        z = user.pos.z
    else
        x = pos.x
        y = pos.y
        z = pos.z
    end
    for _, property in ipairs(propertyList.properties) do
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

function M.checkIfPlantOrTree(user, itemId)
    for _, item in pairs(itemList.items) do
        if item.category == "Plants" or item.category == "Trees" then
            if item.itemId == itemId then
                return true
            end
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

    if M.checkIfPlayerKnowsSkillByName(user, skill) and (not M.checkIfSkillOnlyHasEstateContents(skill) or M.checkIfEstate(user)) then
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

local function checkIfEntrance(user)

    if M.checkIfEstate(user) then
        return false
    end

    local targetItem = common.GetFrontItem(user)

    if not targetItem then
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

function M.getPropertyDeed(propertyName)
    for i = 1, #propertyList.propertyTable do
        if propertyName == propertyList.propertyTable[i][1] then
            local field = world:getField(propertyList.propertyTable[i][3])
            local itemsOnField = field:countItems()
            for i2 = 0, itemsOnField do
                local currentItem = field:getStackItem(itemsOnField-i2)
                if currentItem.id == 3772 or currentItem.id == 3773 then
                    return currentItem
                end
            end
        end
    end
end

function M.checkIfItemIsWallDeco(itemId)

    for _, item in pairs(itemList.items) do
        if item.id == itemId then
            if item.category == "Paintings"
            or item.category == "Flags and crests"
            or item.category == "Wall Decorations"
            then return true
            end
        end
    end

    return false
end

function M.wallWindowPermissions(user, pos, id)

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


function M.allowBuilding(user, alternatePosition)

    if checkIfEntrance(user) then
        return false
    end

    local frontPos = common.GetFrontPosition(user)
        if alternatePosition then
            frontPos = alternatePosition
        end
    local propertyName = M.fetchPropertyName(user, frontPos)
    local deed = M.getPropertyDeed(propertyName)

    if M.fetchPropertyName(user, frontPos) then

        local tenantID = deed:getData("tenantID")

        if tenantID ~= "" and tonumber(tenantID) == user.id then
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

function M.roofAndRoofTiles(user, itemId, tileBoolean, createOrErase)
    local thePosition = common.GetFrontPosition(user)
    local targetPosition = position(thePosition.x, thePosition.y, thePosition.z + 1)
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
        targetId = targetItem.id
    end

    if tileBoolean and createOrErase == "erase" then
        targetId = tileField:tile()
    end

    if not M.checkIfRoofOrRoofTile(targetId, tileBoolean) then
        return false
    end

    if not M.allowBuilding(user, targetPosition) then
        if createOrErase == "create" then
            local lowerPosition = position(targetPosition.x, targetPosition.y, targetPosition.z - 1)
            if M.allowBuilding(user, lowerPosition) then
                targetPosition = lowerPosition -- Build the object/tile in front of you instead, if you want a roof you can access via stairs by building on the topmost floor
            else
                return false
            end
        else
            return false
        end
    end

    if not tileBoolean then
        if createOrErase == "create" then
            M.ifNoTileAddOne(targetPosition)
            world:createItemFromId(itemId, 1, targetPosition, true, 999, nil)
        elseif createOrErase == "erase" then
            local itemDeleted = common.DeleteItemFromStack(targetPosition, {itemId = targetItem.id})
            if itemDeleted then
                user:inform(common.GetNLS(user,"","You destroy the roof object."))
            end
        end
    else
        if createOrErase == "create" then
            world:changeTile(itemId, targetPosition)
        elseif createOrErase == "erase" then
            world:changeTile(34, targetPosition)
            user:inform(common.GetNLS(user,"","You destroy the roof tile."))
        end
    end
    return true
end

function M.setPersistenceForProperties()
    for _, property in pairs(propertyList.properties) do
        log("Setting persistence for "..property.name)
        for x = property.lower.x, property.upper.x do
            for y = property.lower.y, property.upper.y do
                for z = property.lower.z, property.upper.z do
                    if not world:isPersistentAt(position(x, y, z)) then
                        world:makePersistentAt(position(x, y, z))
                    end
                end
            end
        end
        log("Done setting persistence for "..property.name)
    end

    log("Creating estate basements")
    M.createEstateBasements() -- in case any estates are lacking basement tiles and walls, this function will fix that
    log("Done creating estate basements")

    log("Now checking that all property deeds are where they should be")
    for i = 1, #propertyList.propertyTable do
        local location = propertyList.propertyTable[i][3]

        if not world:isPersistentAt(location) then
            log("Setting persistence for property deed belonging to "..propertyList.propertyTable[i][1])
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
            log("Creating missing property deed for property "..propertyList.propertyTable[i][1])
            world:createItemFromId(3772, 1, location, true, 333, nil) --This will lead to some deeds that should be 3773 facing the wrong direction, but this is also only ever called if one is missing to begin with when a GM sets persistence
        end
    end
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
        local TargetItem = M.checkIfLockable(user)
        for i = 1, #propertyList.propertyTable do
            if propertyList.propertyTable[i][1] == propertyName then
                local doorId = propertyList.propertyTable[i][6]
                TargetItem:setData("lockId",doorId)
                TargetItem:setData("doorLock","locked")
                TargetItem:setData("descriptionEn",propertyName)
                TargetItem:setData("descriptionDe",propertyNameDe)
                world:changeItem(TargetItem)
                user:inform("Schloss eingebaut.","Lock created.")
            end
        end
    else
        user:inform("Du kannst nur auf deinem Grundstück Schlösser in Türen und Tore einsetzen.","You can only create locks for doors or gates that are on your property.")
    end
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

function M.eraseStairTrap(positionOne, positionTwo, targetId, tile1pos)
    local warpOne = world:getField(positionOne)
    local warpTwo = world:getField(positionTwo)

    M.ifNoSurroundingTilesDeleteStairTiles(tile1pos, positionTwo)

    common.DeleteItemFromStack(positionTwo, {itemId = targetId})

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
            log("Creating basement walls for property "..property.name)
            placeBasementWalls(wallID, property.lower, property.upper)
            log("Creating basement tiles for property "..property.name)
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
                    else
                        user:inform("Du bist nicht berechtigt dies abzureißen.","You aren't allowed to destroy that.")
                    end
                else
                    itemDeleted = common.DeleteItemFromStack(thePosition, {itemId = targetItem.id})
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

function M.clearStakePosition(selectedPosition)
    local field = world:getField(selectedPosition)
    local itemsOnField = field:countItems()
    while itemsOnField >= 1 do
        local chosenItem = field:getStackItem(itemsOnField - 1 )
        world:erase(chosenItem, chosenItem.number)
        itemsOnField = field:countItems()
    end
end

function M.placeStakeOnPosition(selectedPosition)
    local handrail = 3601
    M.clearStakePosition(selectedPosition)
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

function M.getRentDuration(user)
    local property = M.fetchPropertyName(user)
    local deed = M.getPropertyDeed(property)
    local duration = deed:getData("rentDuration")

    if duration ~= "" then
        return duration
    end
end

function M.checkForAndPlaceMissingStakes()

    log("Check for and placing of missing stakes has been initiated.")
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
        log("The property deed for "..propertyName.." is missing from the map, causing script errors.")
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
                log("tileID: "..tostring(tileID).." at position: "..tostring(thePos))
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
        world:changeTile(40, thePosition)
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

function M.removeOwner(user, item, property)

    local propertyName

    if property == nil then
        propertyName = M.getPropertyName(item)
    else
        propertyName = property
    end

    local propertyDeed = M.getPropertyDeed(propertyName)

    M.removeTenantGuestBuilderDuration(propertyDeed)

    user:inform(M.getText(user,"Vorheriger Mieter entfernt.","Previous tenant evicted."))
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
                user:inform("Dieser Name steht nicht in der Bürgerrolle. Hast du den Namen vielleicht falsch geschrieben?", "That name is not in the citizen registry. Did you perhaps misspell the name?")
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
        if rentDuration ~= "" and tonumber(rentDuration) > 0 then
            local rentExemption = propertyDeed:getData("indefiniteRent")
            if rentExemption == "" then
                rentExemption = 0
            end

            if tonumber(rentExemption) ~= 1 then
                propertyDeed:setData("rentDuration", (tonumber(rentDuration)-1))
                world:changeItem(propertyDeed)
            end
        end
    end
end

function M.charOwnedDepotKeys(char)

    for i = 1, #M.depotList do

        local depNr = M.depotList[i]
        local depot = char:getDepot(depNr)

        if depot then
            local ownedDepotKeys = (depot:countItem(2558))+(depot:countItem(3054))+(depot:countItem(3055))+(depot:countItem(3056))
            if ownedDepotKeys >= 1 then
                return ownedDepotKeys
            else
                return 0
            end
        end
    end
end

local towns = {"Cadomyr", "Runewick", "Galmair", "Outlaw"}

function M.deleteKeys(char, inform)

    local removedKeys = false

    for _, theTown in pairs(towns) do
        for i = 1, #propertyList.propertyTable do --Go through all properties

            local townPropertyBelongsTo = propertyList.propertyTable[i][7]

            if M.checkIfLeaderOfTown(char, townPropertyBelongsTo) and theTown == townPropertyBelongsTo then
                break
            end

            local propertyName = propertyList.propertyTable[i][1] -- Fetch name of property
            local propertyDeed = M.getPropertyDeed(propertyName)
            local tenantID = propertyDeed:getData("tenantID") --Fetch owner of property
            local noTenant = common.IsNilOrEmpty(tenantID)
            local characterIsTenant = false
            local characterIsGuest = false
            if not noTenant then
                characterIsTenant = char.id == tonumber(tenantID)
                characterIsGuest = M.checkIfPlayerIsGuest(char, propertyName)
            end

            local keyID = propertyList.propertyTable[i][6] --Fetch what lock the key belongs to
            local keyType = propertyList.propertyTable[i][5] -- Fetch what type of key item it is
            local keyAmount = char:countItemAt("all",keyType,{["lockId"]=keyID}) -- Fetch how many keys character has in inventory
            local depotKeyAmount = M.charOwnedDepotKeys(char) -- Fetch how many keys character has in depot
            local totalKeys = 0

            if keyAmount then
                totalKeys = keyAmount
            end

            if depotKeyAmount then
                totalKeys = totalKeys + depotKeyAmount
            end

            if totalKeys > 0 and (noTenant or not characterIsTenant and  not characterIsGuest) then

                if keyAmount > 0 then
                    char:eraseItem(keyType,keyAmount,{["lockId"]=keyID})
                    removedKeys = true
                end

                for depotIndex = 1, #M.depotList do

                    local depNr = M.depotList[depotIndex]
                    local depot = char:getDepot(depNr)

                    if depot and depotKeyAmount ~= nil then
                        for z = 1, depotKeyAmount do
                            depot:eraseItem(keyType,1,{["lockId"]=keyID})
                            removedKeys = true
                        end
                    end
                end
            end
        end
    end

    if removedKeys and inform then
        char:inform("Bei deinem letzten Stadtbesuch wurden bei einer routinemäßigen Taschenkontrolle durch die Wachen Schlüssel, die du nicht besitzen solltest, gefunden und konfisziert.", "Upon your latest town visit, some keys you were not supposed to have were confiscated by the guards in a random bag check at the gates.")
    end

end

function M.getRequiredRankName(item, language)

    local nameDE = item:getData("nameDE")
    local nameEN = item:getData("nameEN")

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

    if M.checkOwner(deed) == "Unowned" then -- Shows info specific for when property is unowned
        local propertyInfo = MessageDialog(M.getText(user,"Notiz des Quartiermeisters","Quartermaster's notice"),
        M.getText(user,
        "Bürger von "..town..
        ",\nihr könnt nun die "..propertyDE..
        " zum Preis von "..rentDE..
        " mieten. Um dieses Grundstück mieten zu können, müsst ihr zumindest "..rankDE..
        " sein. Solltest du dieses Grundstück mieten wollen, wende dich an den Quartiermeister oder melde \z
        dich bei einem "..townLeaderTitleDE..
        "~Unterzeichnet, "..signatureDE,
        "Citizen of "..town..
        ",\nit is now possible to rent the "..property..
        " at a price of "..rent..
        " Renting this property requires at minimum the rank of "..rank..
        ". Should you seek to rent this property, please seek out the quartermaster or one of your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN),
        function() end)
        user:requestMessageDialog(propertyInfo)
    elseif M.checkOwner(deed) == user.id then -- Shows info specific for when property is owned by user

        local germanText
        local englishText

        local germanDefault = "An den aktuellen Bewohner von "..propertyDE..",\n die derzeitige Miete beträgt "..rentDE..
        "\n Ohne zusätzliche Zahlungen, läuft das aktuelle Mietverhältnis in "..remainingDuration..
        " Monaten aus.\nFür weitere Fragen oder Anmerkungen, wende dich an den Quartiermeister oder melde dich \z
        bei einem "..townLeaderTitleDE..
        ".\n~Unterzeichnet, "..signatureDE
        local englishDefault = "To the current inhabitant of "..property..
        ",\nLet it be known that you are expected to pay a rent of "..rent..
        " Without additional payments, your current lease expires in "..remainingDuration..
        " months.\nFor additional questions or concerns, please seek out the quartermaster or one of \z
        your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN

        local indefiniteRent = deed:getData("indefiniteRent")
        local freeRent = false

        if not common.IsNilOrEmpty(indefiniteRent) and tonumber(indefiniteRent) == 1 then
            freeRent = true
        end

        local englishFreeRent = "To the current inhabitant of "..property..",\n Let it be known that you are currently not expected to pay rent.\nFor additional questions or concerns, please seek out the quartermaster or one of \z
        your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN
        local germanFreeRent = "An den aktuellen Bewohner von"..propertyDE..",\n ihr wohnt von nun an mietfrei.\nFür weitere Fragen oder Anmerkungen, wende dich an den Quartiermeister oder melde dich \z
        bei einem "..townLeaderTitleDE..
        ".\n~Unterzeichnet, "..signatureDE

        if not freeRent then
            germanText = germanDefault
            englishText = englishDefault
        else
            germanText = germanFreeRent
            englishText = englishFreeRent
        end

        local propertyInfo = MessageDialog(M.getText(user,"Notiz des Quartiermeisters","Quartermaster's notice"),
        M.getText(user, germanText, englishText
        ),
        function() end)
        user:requestMessageDialog(propertyInfo)
    else -- Shows info specific for when property is owned but not by user.
         local propertyInfo = MessageDialog(M.getText(user,"Notiz des Quartiermeisters","Quartermaster's notice"),
         M.getText(user,
        "Bürger von "..town..
        ",\n dieses Grundstück wird aktuell gemietet von "..tenant..
        ". Solltest du irgendwelche Bedenken haben oder ein freies Grundstück mieten wollen, wende dich bitte an \z
        den Quartiermeister oder melde dich bei einem "..townLeaderTitleDE..
        ".\nUnterzeichnet, "..signatureDE,
        "Citizen of "..town..
        ",\nThis property is currently being leased to "..tenant..
        ". Should you have any concerns, or wish to rent a property that is currently available, please \z
        seek out the quartermaster or one of your "..townLeaderTitle..
        "s.\n~Signed, "..signatureEN),
        function() end)
        user:requestMessageDialog(propertyInfo)
    end
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

function M.abandonProperty(user, item)

    M.removeTenantGuestBuilderDuration(item)

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

        if duration == "" or tonumber(duration) == 0 then

            M.removeTenantGuestBuilderDuration(propertyDeed)

        else
            return
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
    if (M.charOwnedKeys(char) == 0) and (M.charOwnedDepotKeys(char) == nil) or char:isAdmin() then
        return
    else
        M.deleteKeys(char, inform)
    end
end

function M.charOwnedKeys(char)
    return ((char:countItem(2558))+(char:countItem(3054))+(char:countItem(3055))+(char:countItem(3056)))
end

function M.setBuilderOrGuest(user, item, builderOrGuest, propertyName)
    local property
    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end
    local propertyDeed = M.getPropertyDeed(property)
    local builderOrGuestDe
    local builderOrGuestDePlural
    local textDe
    local textEn
    if builderOrGuest == "builder" then
        builderOrGuestDe = "Erbauer"
        builderOrGuestDePlural = "Erbauer"
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
                user:inform("Dieser Name steht nicht in der Bürgerrolle. Hast du den Namen vielleicht falsch geschrieben?", "That name is not in the citizen registry. Did you perhaps misspell the name?")
            else
                for i = 1, M["max_"..builderOrGuest.."_number"] do

                    local foundBuilderOrGuest = propertyDeed:getData(builderOrGuest..i)

                    if foundBuilderOrGuest == "" then
                        propertyDeed:setData(builderOrGuest..i, input)
                        propertyDeed:setData(builderOrGuest.."ID"..i, builderOrGuestID)
                        world:changeItem(propertyDeed)
                        user:inform(M.getText(user,input.." hat nun die Rechte als "..builderOrGuestDe.."."..textDe,input.." set as a "..builderOrGuest..". "..textEn))
                        return
                    elseif i == M["max_"..builderOrGuest.."_number"] then
                        user:inform(M.getText(user,"Du kannst nur "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuestDePlural.." gleichzeitig haben. Du musst einen von der List entfernen, bevor du jemanden Neues ernennen kannst.","You may only have "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuest.."s at a time. You must remove one if you want to add another." ))
                    end
                end
            end
        end
    end
    user:requestInputDialog(InputDialog(M.getText(user,"Ernenne "..builderOrGuestDe,"Set "..builderOrGuest),
    M.getText(user,"Wen möchtest du als "..builderOrGuestDe.." benennen?",
    "Write in the name of who you want to set as a "..builderOrGuest),
    false, 255, callback))
end

function M.setBuilderOrGuest(user, item, builderOrGuest, propertyName)

    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local propertyDeed = M.getPropertyDeed(property)
    local builderOrGuestDe
    local builderOrGuestDePlural
    local textDe
    local textEn

    if builderOrGuest == "builder" then
        builderOrGuestDe = "Erbauer"
        builderOrGuestDePlural = "Erbauer"
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
                user:inform("Dieser Name steht nicht in der Bürgerrolle. Hast du den Namen vielleicht falsch geschrieben?", "That name is not in the citizen registry. Did you perhaps misspell the name?")
            else
                for i = 1, M["max_"..builderOrGuest.."_number"] do

                    local foundBuilderOrGuest = propertyDeed:getData(builderOrGuest..i)

                    if foundBuilderOrGuest == "" then
                        propertyDeed:setData(builderOrGuest..i, input)
                        propertyDeed:setData(builderOrGuest.."ID"..i, builderOrGuestID)
                        world:changeItem(propertyDeed)
                        user:inform(M.getText(user,input.." hat nun die Rechte als "..builderOrGuestDe.."."..textDe,input.." set as a "..builderOrGuest..". "..textEn))
                        return
                    elseif i == M["max_"..builderOrGuest.."_number"] then
                        user:inform(M.getText(user,"Du kannst nur "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuestDePlural.." gleichzeitig haben. Du musst einen von der List entfernen, bevor du jemanden Neues ernennen kannst.","You may only have "..M["max_"..builderOrGuest.."_number"].." "..builderOrGuest.."s at a time. You must remove one if you want to add another." ))
                    end
                end
            end
        end
    end

    user:requestInputDialog(InputDialog(M.getText(user,"Ernenne "..builderOrGuestDe,"Set "..builderOrGuest),

    M.getText(user,"Wen möchtest du als "..builderOrGuestDe.." benennen?",
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

    local builderOrGuestDe
    local dialogNameEn
    local dialogNameDe
    local skippedGuestSlots = 0

    if builderOrGuest == "builder" then
        builderOrGuestDe = "Erbauer"
        dialogNameEn = "Builder's list"
        dialogNameDe = "Liste der Erbauer"
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
                        propertyDeed:setData(builderOrGuest..i, "")
                        propertyDeed:setData(builderOrGuest.."ID"..i, "")
                        world:changeItem(propertyDeed)
                        user:inform(M.getText(user,currentBuilderOrGuest.." wurde von der Liste entfernt.",currentBuilderOrGuest.." has been removed from the list."))
                    end
                else
                    skippedGuestSlots = skippedGuestSlots+1
                end
            end
        end
    end

    local dialog = SelectionDialog(M.getText(user,dialogNameDe,dialogNameEn) ,
    M.getText(user,"Wähle einen Namen aus, der von der Liste entfernt werden soll.",
    "Select a name to remove them from the list.") , callback)

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

    local toolId = 3106

    local field = world:getField(location)
    local itemsOnField = field:countItems()

    for i = 0, itemsOnField do
        local chosenItem = field:getStackItem(itemsOnField - i )
        if chosenItem.id == toolId then
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
                    item:setData("tenant", user.name)
                    item:setData("tenantID", user.id)
                    world:changeItem(item)
                    user:inform(M.getText(user,"Auch wenn sich dein Geldbeutel nun deutlich leichter anfühlt, verlässt du das Büro des Quartiermeisters mit dem guten Gefühl, dass dein Grundstück dir für weitere "..input.." Monate gehört.","After another visit to the quartermaster's office, your purse may feel lighter, but you rest comfortably in the knowledge that the residence before you is now yours for an additional "..input.." months."))
                end
            end

        end
    end

    if M.checkOwner(item) == user.id then

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

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
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

    local title = {english = "Enable/Disable automatic rent extension", german = "Automatische Verlängerung des Mietverhältnisses"}
    local texts = {
        {english = "Do you want to let the resident of "..property.." pay to extend their rent duration without your supervision?",
        german = "Möchtest du den Bewohnern von "..property.." erlauben, ihr Mietverhältnis ohne deine Aufsicht zu verlängern?",
        identifier = 1,
        informText = {
            english = "The resident of "..property.." will now be able to pay to extend their rent duration on their own. The resulting rent money can be collected at the town management instrument.",
            german = "Die Bewohner von "..property.." können nun selbst die Verlängerung ihres Mietverhältnisses bezahlen. Das Miete kann über das Stadtverwaltungswerkzeug abkassiert werden."}
        },
        {english = "Do you want to no longer let the resident of "..property.." pay to extend their rent duration without your supervision?",
        german = "Möchtest du den Bewohnern von "..property.." nicht mehr erlauben, ihr Mietverhältnis ohne deine Aufsicht zu verlängern?",
        identifier = 0,
        informText = {
            english = "The resident of "..property.." will no longer be able to pay to extend their rent duration without your supervision.",
            german = "Die Bewohner von "..property.." können nun nicht mehr selbst die Verlängerung ihres Mietverhältnisses bezahlen."}
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

    local title = {english = "Enable/Disable rent", german = "Miete kassieren oder freistellen"}
    local texts = {
        {english = "Do you want to let the resident of "..property.." live rent free?",
        german = "Willst du den Bewohner von "..propertyDE.." mietfrei wohnen lassen?",
        identifier = 1,
        informText = {
            english = "The resident of "..property.." will now live rent free.",
            german = "Der Bewohner von "..propertyDE.." wohnt nun mietfrei."}
        },
        {english = "Do you want to no longer let the resident of "..property.." live rent free?",
        german = "Möchtest du vom Bewohner von "..propertyDE.." wieder Miete kassieren?",
        identifier = 0,
        informText = {
            english = "The resident of "..property.." will no longer live rent free.",
            german = "Der Bewohner von "..propertyDE.." lebt nun nicht mehr mietfrei."}
        }
    }

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local selected = dialog:getSelectedIndex()+1

        if selected == 1 then
            propertyDeed:setData("indefiniteRent", newState)
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

function M.setReqRank(user, item, propertyName)
    local property

    if propertyName == nil then
        property = M.getPropertyName(item)
    else
        property = propertyName
    end

    local propertyDeed = M.getPropertyDeed(property)

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
                user:inform(M.getText(user,"Der benötigte Rang wurde auf "..factions.GalmairRankListMale[i]["gRank"].." gesetzt.","Required rank has been set to "..factions.GalmairRankListMale[i]["eRank"].."."))
            end
        end
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
                    user:inform(M.getText(user,"Der benötigte Rang wurde auf "..factions.RunewickRankListMale[i]["gRank"].." gesetzt.","Required rank has been set to "..factions.RunewickRankListMale[i]["eRank"].."."))
                end
            end
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
                    user:inform(M.getText(user,"Der benötigte Rang wurde auf "..factions.CadomyrRankListMale[i]["gRank"].." gesetzt.","Required rank has been set to "..factions.CadomyrRankListMale[i]["eRank"].."."))
                end
            end
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

    if town == "Galmair" then
        user:requestSelectionDialog(dialogGalmair)
    elseif town == "Runewick" then
        user:requestSelectionDialog(dialogCadomyr)
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
    local rentEN = M.getRent(item, propertyName)
    local rentDE = M.getRentDE(item, propertyName)

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
                propertyDeed:setData("rent", input)
                world:changeItem(propertyDeed)
                user:inform(M.getText(user,"Mietpreis auf "..input.." gesetzt.","Rent set to "..input))
                M.setSignature(user, item, propertyName)
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
                return targetItem
            end
        elseif item.criteria == "Key" then -- Fence gates
            if item.itemId == targetItem.id then
                return targetItem
            end
        end
    end
    return false
end

function M.getTileGraphic(tileIdentifier)
    for _, tile in pairs(itemList.tiles) do
        if tile.tileId == tileIdentifier then
            return tile.ingredient1
        end
    end
end
function M.getTileName(user, tileIdentifier)
    for _, tile in pairs(itemList.tiles) do
        if tile.tileId == tileIdentifier then
            return common.GetNLS(user, tile.nameDe, tile.nameEn)
        end
    end
end
function M.getItemName(user, itemIdentifier)
    for _, item in pairs(itemList.items) do
        if item.itemId == itemIdentifier then
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



return M
