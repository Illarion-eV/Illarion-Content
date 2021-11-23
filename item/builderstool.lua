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
local construction = require("craft.final.construction")
local itemList = require("craft.base.itemList")
local propertyList = require("base.propertyList")
local notice = require("item.notice")
local money = require("base.money")
local M = {}
local function createLock(User)
local propertyName = propertyList.fetchPropertyName(User)
local propertyNameDe
    for i = 1, #notice.propertyTable do
        if propertyName == notice.propertyTable[i][1] then
            propertyNameDe = notice.propertyTable[i][2]
        end
    end
    if propertyList.fetchBuildersPermission(User) and itemList.checkIfLockable(User) then
        local TargetItem = itemList.checkIfLockable(User)
        for i = 1, #notice.propertyTable do
            if notice.propertyTable[i][1] == propertyName then
                local doorId = notice.propertyTable[i][6]
                TargetItem:setData("lockId",doorId)
                TargetItem:setData("doorLock","locked")
                TargetItem:setData("descriptionEn",propertyName)
                TargetItem:setData("descriptionDe",propertyNameDe)
                world:changeItem(TargetItem)
                User:inform("","Lock created")
            end
        end
    else
        User:inform("","You can only create locks for doors or gates that are on your property.")
    end
end
local function createKey(User)
local propertyName = propertyList.fetchPropertyName(User)
    if propertyList.fetchBuildersPermission(User) then
        for i = 1, #notice.propertyTable do
            if notice.propertyTable[i][1] == propertyName then
                local doorId = notice.propertyTable[i][6]
                local keyId = notice.propertyTable[i][5]
                local keyNameDE = notice.propertyTable[i][2]
                if money.CharHasMoney(User, 500) then
                    money.TakeMoneyFromChar(User, 500)
                    common.CreateItem(User,keyId,1,999,{["lockId"]=doorId,["descriptionDe"]=keyNameDE,["descriptionEn"]=propertyName})
                    User:inform(common.GetNLS(User,
                    "Nachdem du einen Schl�sselmacher bezahlt hast dir eine Kopie deines Schl�ssels anzufertigen, dauert es nicht lange bis du den fertigen Ersatzschl�ssel in der Hand h�lst. ",
                    "Having paid a keysmith the fee to have a copy made of your property key, it does not take long before you hold it in your hand."))
                else
                    User:inform(common.GetNLS(User,"Das kannst du dir nicht leisten. Die Arbeit eines Schl�sselmachers ist nicht gratis. ","You can't afford that. No keysmith will work for nothing."))
                end
            end
        end
    else
        User:inform("","You do not have permission to create keys for this property.")
    end
end
local function writeOnSignPost(User)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end
        local input = dialog:getInput()
        if propertyList.fetchBuildersPermission(User) then
            if itemList.checkIfSignPost(User) then
                local TargetItem = itemList.checkIfSignPost(User)
                TargetItem:setData("descriptionDe",input)
                TargetItem:setData("descriptionEn",input)
                world:changeItem(TargetItem)
            else
                User:inform("","You need a sign post in front of you if you want to write on it.")
            end
        else
            User:inform("","The sign has to be on your property for you to write on it.")
        end
    end
    local dialog = InputDialog(common.GetNLS(User,"","Sign Post"),common.GetNLS(User,"","Write in what you want the sign post to say."), false, 255, callback)
    if itemList.checkIfSignPost(User) then
        User:requestInputDialog(dialog)
    else
        User:inform("","You need a sign post in front of you if you want to write on it.")
    end
end
local function destroyingPermitted(User, targetItem)
    for _, item in pairs(itemList.items) do
        if item.itemId == targetItem.id then
            if item.typeOf == "Estate" then
                if propertyList.checkIfPropertyIsEstate(User) then
                    return true
                end
            end
        elseif propertyList.checkIfEstate(User) then --Estates can destroy anything on the property, even things they can not build.
            return true
        end
    end
return false
end
local function deleteRoofItemOrTile(User, tile)
local tileOrObject
local tileOrObjectDe
    if tile == true then
        tileOrObject = "tile"
        tileOrObjectDe = ""
    else
        tileOrObject = "object"
        tileOrObjectDe = ""
    end
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                if not propertyList.roofAndRoofTiles(User, nil, tile, "erase") then
                    User:inform(""..tileOrObjectDe.."","Targeted item must be a roof "..tileOrObject.." on a property you are permitted to build on, one tile in front of you and above you.")
                end
            else
                User:inform(""..tileOrObjectDe..".","You decide against destroying the roof "..tileOrObject..".")
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Confirmation Check"), common.GetNLS(User,"","Are you sure you want to destroy the roof "..tileOrObject.."?"), callback)
    dialog:addOption(0,common.GetNLS(User,"","Yes, destroy it."))
    dialog:addOption(0,common.GetNLS(User,"","No, I changed my mind."))
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end

local function checkIfUserIsSure(User, targetItem)
local itemName = world:getItemName(targetItem.id, User:getPlayerLanguage())
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                User:inform(common.GetNLS(User,""..itemName,"You destroy the "..itemName))
                if propertyList.checkIfStairsOrTrapDoor(User, targetItem.id) then
                    if propertyList.createWarpsAndExitObject(User, targetItem.id, "erase") then
                        world:erase(targetItem,1)
                    else
                        User:inform("","You aren't allowed to destroy that.")
                    end
                else
                    world:erase(targetItem,1)
                end
            else
                User:inform(common.GetNLS(User,"","You decide against destroying the "..itemName))
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Confirmation Check"), common.GetNLS(User,"","Are you sure you want to destroy the "..itemName.."?"), callback)
    dialog:addOption(0,common.GetNLS(User,"","Yes, destroy it."))
    dialog:addOption(0,common.GetNLS(User,"","No, I changed my mind."))
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end
local function destroyItem(User)
local targetItem
    if not common.GetFrontItem(User) then
        targetItem = false
    else
        targetItem = common.GetFrontItem(User)
    end
    if not targetItem then
        User:inform("","There is no item to destroy.")
    elseif destroyingPermitted(User, targetItem) then
        checkIfUserIsSure(User, targetItem)
    else
        User:inform("","You're not allowed to destroy this item.")
    end
end
local function staticPermitted(User, targetItem)
    for i = 1, #itemList.excludedFromStatic do
        if targetItem.id == itemList.excludedFromStatic[i] then
            return false
        end
    end
return true
end
local function makeStatic(User)
local targetItem
    if not common.GetFrontItem(User) then
        targetItem = false
    else
        targetItem = common.GetFrontItem(User)
    end
    if not targetItem then
        User:inform("","There is no item to be made/unmade static.")
    elseif staticPermitted(User, targetItem) then
        if targetItem.wear ~= 255 then
            targetItem.wear = 255
            world:changeItem(targetItem)
            User:inform("","The item has been made static. It can no longer be moved, and will no longer rot.")
        elseif targetItem.wear == 255 then
            targetItem.wear = 254
            world:changeItem(targetItem)
            User:inform("","The item is no longer static. It can now be moved, and will once more rot.")
        end
    else
        User:inform("","This item can not be made/unmade static.")
    end
end

M.categoryCheck = {}
table.insert(M.categoryCheck, { name = "Chairsblacksmithing", level = 50})
table.insert(M.categoryCheck, { name = "Armoursblacksmithing", level = 60})
table.insert(M.categoryCheck, { name = "Lightsblacksmithing", level = 20})
table.insert(M.categoryCheck, { name = "Wall Decorationsblacksmithing", level = 80})
table.insert(M.categoryCheck, { name = "Altarsmining", level = 20})
table.insert(M.categoryCheck, { name = "Lightsmining", level = 50})
table.insert(M.categoryCheck, { name = "Shelves and cabinetsmining", level = 60})
table.insert(M.categoryCheck, { name = "Statuesmining", level = 40})
table.insert(M.categoryCheck, { name = "Bookrestsmining", level = 30})
table.insert(M.categoryCheck, { name = "Chimneyspottery", level = 80})
table.insert(M.categoryCheck, { name = "MirrorsglassBlowing", level = 90})
table.insert(M.categoryCheck, { name = "MagicenchantingOfJewels", level = 60})
table.insert(M.categoryCheck, { name = "Wallscarpentry", level = 10})
table.insert(M.categoryCheck, { name = "Doorscarpentry", level = 50})
table.insert(M.categoryCheck, { name = "Stairscarpentry", level = 20})
table.insert(M.categoryCheck, { name = "Gates and fencescarpentry", level = 20})
table.insert(M.categoryCheck, { name = "Trap Doorscarpentry", level = 20})
table.insert(M.categoryCheck, { name = "Gates and fencesblacksmithing", level = 50})
table.insert(M.categoryCheck, { name = "Battlementsmining", level = 50})
table.insert(M.categoryCheck, { name = "Doorsmining", level = 40})
table.insert(M.categoryCheck, { name = "Columnsmining", level = 60})
table.insert(M.categoryCheck, { name = "Stairsmining", level = 60})
table.insert(M.categoryCheck, { name = "Wallsmining", level = 40})
table.insert(M.categoryCheck, { name = "Gates and fencesmining", level = 20})
table.insert(M.categoryCheck, { name = "Trap Doorsmining", level = 60})
table.insert(M.categoryCheck, { name = "Roofpottery", level = 40})
table.insert(M.categoryCheck, { name = "Wallspottery", level = 40})
table.insert(M.categoryCheck, { name = "Gates and fencespottery", level = 30})
table.insert(M.categoryCheck, { name = "Plantsherblore", level = 50})
table.insert(M.categoryCheck, { name = "Treesherblore", level = 50})
table.insert(M.categoryCheck, { name = "Logswoodcutting", level = 20})
table.insert(M.categoryCheck, { name = "WindowsglassBlowing", level = 50})

local function checkIfCategoryShown(User, categoryName, craft)
    if craft == "misc" then
        return true
    end
local skill = Character[craft]
local level = User:getSkill(skill)
    for _, category in ipairs(M.categoryCheck) do
        if category.name == categoryName..craft then
            if level >= category.level then
                return true
            else
                return false
            end
        end
    end
return true
end
local function checkIfPlayerKnowsSkill(User, skillName)
    if skillName == "misc" then
        return true
    end
local skill = Character[skillName]
local level = User:getSkill(skill)
    if level > 0 then
        return true
    end
return false
end
local function checkIfSkillIsShown(User, skill)
    if skill == "misc" then
        return true
    end
local amount = 0
    for _, category in ipairs(itemList.categories) do
        if construction[tostring(category)..skill] and checkIfCategoryShown(User, category.categoryEn, skill) then
            if category.Estate then
                if propertyList.checkIfEstate(User) then
                    amount = amount+1
                end
            else
                amount = amount+1
            end
        end
    end
    if amount > 0 and checkIfPlayerKnowsSkill(User, skill) then
        return true
    end
return false
end

local function listOfCategories(User, SourceItem, skill)
local categoryNumber = 0
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            for _, category in ipairs(itemList.categories) do
                if construction[tostring(category)..skill] and checkIfCategoryShown(User, category.categoryEn, skill) then
                    if category.Estate then
                        if propertyList.checkIfEstate(User) then
                            categoryNumber = categoryNumber+1
                            if selected == categoryNumber then
                                construction[tostring(category)..skill]:showDialog(User, SourceItem)
                            end
                        end
                    else
                        categoryNumber = categoryNumber+1
                        if selected == categoryNumber then
                            construction[tostring(category)..skill]:showDialog(User, SourceItem)
                        end
                    end
                end
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Categories"), common.GetNLS(User,"","Choose a category"), callback)
    for _, category in ipairs(itemList.categories) do
        if construction[tostring(category)..skill] and checkIfCategoryShown(User, category.categoryEn, skill) then
            if category.Estate then
                if propertyList.checkIfEstate(User) then
                    dialog:addOption(0,common.GetNLS(User,category.categoryDe,category.categoryEn))
                end
            else
                dialog:addOption(0,common.GetNLS(User,category.categoryDe,category.categoryEn))
            end
        end
    end
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end
local function craftSelection(User, SourceItem)
local categoryNumber = 0
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            for _, skill in ipairs(itemList.skills) do
                if checkIfSkillIsShown(User, skill.name) then
                    categoryNumber = categoryNumber+1
                    if selected == categoryNumber then
                        listOfCategories(User, SourceItem, skill.name)
                    end
                end
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Skill Selection"), common.GetNLS(User,"","Choose which skill you want to use to create items with."), callback)
    for _, skill in ipairs(itemList.skills) do
        if checkIfSkillIsShown(User, skill.name) then
            dialog:addOption(0,common.GetNLS(User,skill.displayDe,skill.displayEn))
        end
    end
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end
local function destroySelection(User)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if selected == 1 then
                destroyItem(User)
            elseif selected == 2 then
                deleteRoofItemOrTile(User, false)
            else
                deleteRoofItemOrTile(User, true)
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Destroy"), common.GetNLS(User,"","Choose type of destruction."), callback)
    dialog:addOption(0,common.GetNLS(User,"","Items"))
    dialog:addOption(0,common.GetNLS(User,"","Roof Objects"))
    dialog:addOption(0,common.GetNLS(User,"","Roof Tiles"))
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end
local function makeWaterWalkable(User)
local targetPosition = common.GetFrontPosition(User)
local targetField = world:getField(targetPosition)
local targetTileId = targetField:tile()
    if targetTileId == 6 then
        world:createItemFromId(42, 1, targetPosition, true, 999, nil)
        User:inform("","You can now walk on the water tile.")
    else
        User:inform("","The tile in front of you needs to be a water tile.")
    end
end
local function miscDialog(User)
local propertyName = propertyList.fetchPropertyName(User)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if propertyName then
                if propertyList.fetchBuildersPermission(User) then
                    if selected == 1 then
                        makeStatic(User)
                    elseif selected == 2 then
                        writeOnSignPost(User)
                    elseif selected == 3 then
                        makeWaterWalkable(User)
                    elseif selected == 4 and propertyList.checkIfEstate(User) then
                        createLock(User)
                    elseif selected == 5 and propertyList.checkIfEstate(User) then
                        createKey(User)
                    end
                else
                    User:inform("","You do not have permission to do this.") -- This only happens if the user tries to cheat by turning while in dialog at property borders.
                end
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Misc Menu"), common.GetNLS(User,"","Choose what to do"), callback)
    dialog:addOption(0,common.GetNLS(User,"","(Un)Make item static"))
    dialog:addOption(0,common.GetNLS(User,"","Write on Sign Post"))
    dialog:addOption(0,common.GetNLS(User,"","Make water walkable"))
    if propertyList.checkIfEstate(User) then
        dialog:addOption(0,common.GetNLS(User,"","Create a lock"))
        dialog:addOption(0,common.GetNLS(User,"","Create a key"))
    end
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end
function M.getRentDuration(User)
local property = propertyList.fetchPropertyName(User)
local foundCurrentRentDuration, currentRentDuration = ScriptVars:find("rentDuration"..property)
    if foundCurrentRentDuration then
        return currentRentDuration
    end
end
function M.propertyManagement(User)
local property = propertyList.fetchPropertyName(User)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if propertyList.fetchBuildersPermission(User) then
                if selected == 1 then
                    notice.setBuilderOrGuest(User, nil, "guest", property)
                elseif selected == 2 then
                    notice.removeBuilderOrGuest(User, nil, "guest", property)
                elseif selected == 3 then
                    notice.setBuilderOrGuest(User, nil, "builder", property)
                elseif selected == 4 then
                    notice.removeBuilderOrGuest(User, nil, "builder", property)
                end
            else
                User:inform("","You do not have permission to do this.") -- This only happens if the user tries to cheat by turning while in dialog at property borders.
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Property Management"), common.GetNLS(User,"","Choose what to do below."), callback)
    dialog:addOption(0, common.GetNLS(User,"","Add Guest"))
    dialog:addOption(0, common.GetNLS(User,"","Remove Guest"))
    dialog:addOption(0, common.GetNLS(User,"","Give Builder's Permission"))
    dialog:addOption(0, common.GetNLS(User,"","Remove Builder's Permission"))
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end
local function mainDialog(User, SourceItem)
local outlawRentDuration = ""
local Outlaw
    if propertyList.checkIfOutlaw(User) then
        Outlaw = true
        outlawRentDuration = common.GetNLS(User,"","You will remain the owner of this property for the next ")..M.getRentDuration(User).." months. A GM will have to renew your duration within that time or the property will be forfeit.\n"
    end
local propertyName = propertyList.fetchPropertyName(User)
    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex()+1
            if propertyName then
                if propertyList.fetchBuildersPermission(User) then
                    if selected == 1 then
                        construction.makeAllCategories(User)
                        craftSelection(User, SourceItem)
                    elseif selected == 2 and propertyList.checkIfEstate(User) then
                        destroySelection(User)
                    elseif selected == 2 then
                        destroyItem(User)
                    elseif selected == 3 then
                        miscDialog(User)
                    elseif selected == 4 then
                        M.propertyManagement(User)
                    end
                else
                    User:inform("","You do not have permission to do this.") -- This only happens if the user tries to cheat by turning while in dialog at property borders.
                end
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(User,"","Menu"), common.GetNLS(User,"",outlawRentDuration.."Choose what to do below."), callback)
    dialog:addOption(0,common.GetNLS(User,"","Build"))
    dialog:addOption(0,common.GetNLS(User,"","Destroy"))
    dialog:addOption(0,common.GetNLS(User,"","Misc"))
    if Outlaw then
        dialog:addOption(0,common.GetNLS(User,"","Property Management"))
    end
    dialog:setCloseOnMove()
    User:requestSelectionDialog(dialog)
end
function M.UseItem(User, SourceItem)
local propertyName = propertyList.fetchPropertyName(User)
    if not propertyName then
        User:inform("","You can't build outside of property land.")
    elseif propertyList.fetchBuildersPermission(User) then
        mainDialog(User, SourceItem)
    else
        User:inform("","You do not have permission to do this.")
    end
end
return M