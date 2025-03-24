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
local shared = require("craft.base.shared")
local lookat = require("base.lookat")
local itemList = require("housing.itemList")
local gems = require("base.gems")
local utility = require("housing.utility")
local daear = require("magic.arcane.enchanting.effects.daear")
local crafts = require("craft.base.crafts")

local itemsWithRemnants = crafts.itemsWithRemnants

local M = {}

local previewInformCooldown = {}
local hintCooldown = {}
local aboveVsGroundRoofHintGivenThisSession = {}

local function loadIngredients(object)

    local ingredients = {}

    for i = 1, 5 do
        local ingredient = object["ingredient" .. i]
        local amount = object["ingredient".. i .. "Amount"]
        if ingredient then

            -- Ingredient gets loaded
            table.insert(ingredients,{id = ingredient, quantity = amount, data = {}})

        end
    end
    return ingredients
end

local function showObject(user, object, category, skill, overloaded)

    if overloaded ~= nil
        and ((overloaded and object.typeOf ~= "Estate")
        or (not overloaded and object.typeOf == "Estate"))
        then return false
    end

    if category.nameEN == object.category
        and object.skill == skill.name
        and (object.typeOf ~= "Estate" or utility.checkIfEstate(user))
        then return true
    end

    return false
end

local function loadObjects(user, products, index, object, category, skill, overloaded)
    if showObject(user, object, category, skill, overloaded) then
        local ingredients = loadIngredients(object)
        local id, tile
        if object.itemId then
            id = object.itemId
            tile = false
        else
            id = object.tileId
            tile = true
        end

        local aboveBoolean = false

        if object.category == "Roof(Above)" or object.category == "Roof Tiles(Above)" then
            aboveBoolean = true
        end

        table.insert(products, {level = object.level, category = index, id = id, ingredients = ingredients, tile = tile, above = aboveBoolean, difficulty = object.level, quantity = 1, data = {}})
        return true
    end
    return false
end

local function loadProducts(user, categories, skill, overloaded)
    local products = {}
    for index, category in ipairs(categories) do
        local theList = itemList.items
        if category.tile then
            theList = itemList.tiles
        end

        for _, object in ipairs(theList) do
            if loadObjects(user, products, index, object, category, skill, overloaded) then
                category.productAmount = category.productAmount + 1
            end
        end
    end

    return products
end

local function showCategory(user, skill, category)
    for _, item in ipairs(itemList.items) do
        if category.categoryEn == item.category
            and skill.name == item.skill
            and (not category.Estate or utility.checkIfEstate(user))
            then return true, false
        end
    end
    for _, tile in ipairs(itemList.tiles) do
        if category.categoryEn == tile.category
            and skill.name == tile.skill
            and (not category.Estate or utility.checkIfEstate(user))
            then return true, true
        end
    end

    return false
end

local function loadCategories(user, skill)

    local categories = {}

    for _, category in ipairs(itemList.categories) do
        local showCat, tile = showCategory(user, skill, category)
        if showCat then
            table.insert(categories, {nameEN = category.categoryEn, nameDE = category.categoryDe, tile = tile, Estate = category.Estate, productAmount = 0})
        end
    end

    return categories
end

local function loadSkill(user, skillName)

    if skillName == "misc" then
        return 100
    end

    return user:getSkill(Character[skillName])
end

local function loadCraftingTime(level)

    local baseTime = 200

    local time = baseTime * 1 + (level/10)

    time = 10 * math.floor(time/10 + 0.5)

    return time
end

local function loadProductName(user, itemId, tile)

    local name = utility.getItemName(user, itemId)

    if tile then
        name = utility.getTileName(user, itemId)
    elseif not name then
        name = lookat.GenerateItemLookAtFromId(user, itemId, 1, {}).name
    end

    return name
end

local function loadDialog(user, dialog, skill, categories, products)

    local categoryList = {}

    local listId = 0

    for index , category in ipairs(categories) do
        if category.productAmount > 0 then
            dialog:addGroup(common.GetNLS(user, category.nameDE, category.nameEN))
            categoryList[index] = {}
            categoryList[index].id =listId
            categoryList[index].tile = category.tile

            listId = listId + 1
        end
    end

    for index , product in ipairs(products) do

        local time = loadCraftingTime(product.level)
        local category = categoryList[product.category]
        local categoryId = category.id
        local name = loadProductName(user, product.id, category.tile)
        local productId = product.id
        if category.tile then
            productId = utility.getTileGraphic(product.id)
        end
        dialog:addCraftable( index, categoryId , productId, name, time, 1)

        for _, ingredient in ipairs(product.ingredients) do
            dialog:addCraftableIngredient(ingredient.id, ingredient.quantity)
        end
    end
end

local function showTemporaryPreviewOfItem(productId, user, isTile, above)
    -- For special items like stairs, only the first object will be previewed and not the upper/lower stair

    local informPlus = ""
    local informPlusDe = ""

    local frontPos = common.GetFrontPosition(user)
    local roofPos = position(frontPos.x, frontPos.y, frontPos.z+1)

    if utility.checkIfRoofOrRoofTile(productId, isTile, above) and user.pos.z >= 0 and utility.getPropertyLocationIsPartOf(roofPos) then

        local field = world:getField(roofPos)

        if field and field:tile() ~= 0 then --No points trying to place an item above if there is no field or tile to place it on
            frontPos = roofPos
        else
            informPlus = " There is nowhere above that the preview item can be placed. Defaulting to the tile in front of you instead."
            informPlusDe = " Es gibt keinen Platz oben, auf dem der Vorschaugegenstand platziert werden kann. Stattdessen wird standardmäßig das Feld vor dir gewählt."
        end
    end

    if isTile then
        productId = utility.getTilePreview(productId) --The display item version of the tile
    end

    local field = world:getField(frontPos)

    if not field then
        return
    end

    if field:tile() == 0 then --Putting an item on tile 0 will cause a buggy ? to pop up and not go away
        return
    end

    if not utility.wallWindowPermissions(user, frontPos, productId, isTile) or utility.checkIfEntrance(user, frontPos, isTile) then
        return
    end

    local propertyName = utility.getPropertyLocationIsPartOf(frontPos)

    local deed = utility.getPropertyDeed(propertyName)

    utility.deletePreviewItem(propertyName, true)

    local currentTime = common.GetCurrentTimestamp()
    deed:setData("previewItemPositionX", frontPos.x)
    deed:setData("previewItemPositionY", frontPos.y)
    deed:setData("previewItemPositionZ", frontPos.z)
    deed:setData("previewItemTimer", currentTime)
    world:changeItem(deed)

    local previewItem = world:createItemFromId(productId, 1, frontPos, true, 111, {["preview"] = "true"})
    previewItem.wear = 255
    world:changeItem(previewItem)

    if previewInformCooldown[user.id] and  previewInformCooldown[user.id] >= currentTime then
        user:inform("Vorschau des Gegenstandes."..informPlusDe, "Preview item placed."..informPlus)
    else
        user:inform("Indem du den Mauszeiger über den Gegenstand im Menü bewegst, erstellst du einen Gegenstand zur Vorschau an dem Ort, an dem er gebaut wird, wenn du ihn herstellst. Dieser Gegenstand verschwindet nach 30 Sekunden oder immer dann, wenn du oder jemand anderes einen anderen Gegenstand auf demselben Grundstück zur Vorschau erstellt.", "By hovering over the item in the menu, you've created an item for preview in the location it will be built if you craft it. This item will disappear after 30 seconds, or whenever you or someone else preview another item on the same property.")
        previewInformCooldown[user.id] = currentTime + 3600 --This long inform only shows once an hour, so as to not be spammy
    end
end

local function getLookAt(user, object)
    local item = object.id
    local quantity = object.quantity
    local data = object.data
    local lookAt = lookat.GenerateItemLookAtFromId(user, item, quantity, data)
    local customName = utility.getItemName(user, item)

    if customName then
        lookAt.name = customName
    end

    if object.tile then
        lookAt = ItemLookAt()
        lookAt.name = utility.getTileName(user, item)
    end

    return lookAt
end

local function getEquippedTrowel(user)
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == Item.constructionTrowel and common.isBroken(leftTool) == false then
        return leftTool
    elseif rightTool.id == Item.constructionTrowel and common.isBroken(rightTool) == false then
        return rightTool
    end

    return nil
end

--[[
Because the usual eraseItem functionality only allows you to delete items with no data, all data or specific data, it is not
possible to use it to delete items with craftedBy data without deleting items with custom description/name.
So the below function does that for us instead.
]]
local function eraseOrCheckForIngredient(user, amount, ingredient, erase)

    local items = {}

    local backpack = user:getBackPack()

    local belt = {Character.belt_pos_1, Character.belt_pos_2, Character.belt_pos_3, Character.belt_pos_4, Character.belt_pos_5, Character.belt_pos_6}

    for _, slot in pairs(belt) do
        table.insert(items, user:getItemAt(slot))
    end

    for i = 0, 99 do
        local success, theItem = backpack:viewItemNr(i)

        if success then
            table.insert(items, theItem)
        end
    end

    local itemsFound = 0

    for _, theItem in pairs(items) do

        if erase and amount == 0 then
            return
        end
        if theItem.id == ingredient then
            if common.IsNilOrEmpty(theItem:getData("descriptionEn")) and common.IsNilOrEmpty(theItem:getData("nameEn")) then --Shouldnt be a custom item of any value
                if erase then
                    world:erase(theItem, math.min(theItem.number, amount))
                    amount = amount - math.min(theItem.number, amount)
                else
                    itemsFound = itemsFound + theItem.number
                end
            end
        end
    end

    if erase then
        return amount
    else
        return itemsFound
    end
end

local function hasMaterials(user, product)

    local materialsAvailable = true
    local lackText = ""
    local enoughText = ""

    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        local available = eraseOrCheckForIngredient(user, false, ingredient.id)

        if available < ingredient.quantity then
            materialsAvailable = false
            local ingredientName = getLookAt(user, ingredient).name

            if available == 0 then
                lackText = lackText..ingredientName..", "
            else
                enoughText = enoughText..ingredientName..", "
            end
        end
    end

    if lackText ~= "" then
        lackText=string.sub(lackText,1,-3)
        common.HighInformNLS( user, "Dir fehlt: "..lackText.."!", "You lack: "..lackText..".")
    end

    if enoughText ~= "" then
        enoughText=string.sub(enoughText,1,-3)
        common.HighInformNLS(user, "Zu wenig: "..enoughText..".", "Not enough: "..enoughText..".")
    end

    return materialsAvailable
end

local function generateQuality(user, trowel, skill)

    local gemBonus = gems.getGemBonus(trowel)
    local skillID
    local leadAttribValue
    if skill.name ~= "misc" then
        skillID = Character[skill.name]
        local leadAttribNames = common.GetLeadAttributeName(skillID)
        local leadAttribValue1 = user:increaseAttrib(leadAttribNames.first, 0) * 0.6
        local leadAttribValue2 = user:increaseAttrib(leadAttribNames.second, 0) * 0.4
        leadAttribValue = leadAttribValue1 + leadAttribValue2
    else
        leadAttribValue = user:increaseAttrib("dexterity", 0)
    end

    local meanQuality = 5
    meanQuality = meanQuality*(1+common.GetAttributeBonusHigh(leadAttribValue)+common.GetQualityBonusStandard(trowel))+gemBonus/100 --Apply boni of dexterity, tool quality and gems.
    meanQuality = common.Limit(meanQuality, 1, 8.5) --Limit to a reasonable maximum to avoid overflow ("everything quality 9"). The value here needs unnatural attributes.
    local rolls = 8 --There are eight chances to increase the quality by one. This results in a quality distribution 1-9.
    local quality = 1 + common.BinomialByMean((meanQuality-1), rolls)
    quality = common.Limit(quality, 1, common.ITEM_MAX_QUALITY)

    local durability = common.ITEM_MAX_DURABILITY
    return common.calculateItemQualityDurability(quality, durability)

end

local function getTotalQuantity(product)

    local retval = 0

    for _, ingredient in pairs(product.ingredients) do
        retval = retval + ingredient.quantity
    end

    return retval
end



local function eraseIngredients(user, product)

    local remnantItemsToCreate = {}

    local ingredientSaved = false

    for index, ingredient in ipairs(product.ingredients) do

        local save = 0

        if not ingredientSaved and (math.random() <= 1/#product.ingredients or index == #product.ingredients) then
            local commonItem = world:getItemStatsFromId(ingredient.id)
            local saveIngredient = daear.saveResource(user, commonItem.Level, getTotalQuantity(product), ingredient.quantity)
            if saveIngredient then
                ingredientSaved = true
                save = math.ceil(ingredient.quantity/5) --possible to save up to 1 resource per 5 required of it. EG if a recipe requires 46-50 pins, you get 10 instead of just 1 in return.
            end
        end

        if save < ingredient.quantity then
            local erased = user:eraseItem(ingredient.id, ingredient.quantity - save, ingredient.data)

            if erased < ingredient.quantity - save then
                eraseOrCheckForIngredient(user, ingredient.quantity-save-erased, ingredient.id, true)
            end
        end

        for _, remnant in pairs(itemsWithRemnants) do
            if remnant.id == ingredient.id and (ingredient.quantity-save > 0) then
                table.insert(remnantItemsToCreate, {id = remnant.remnant, quantity = ingredient.quantity-save})
            end
        end

    end

    return remnantItemsToCreate
end

local function createItem(user, product, trowel, skill)

    local quality = generateQuality(user, trowel, skill)
    product.data.craftedBy = user.name
    local target = common.GetFrontPosition(user)
    if not utility.allowBuilding(user) then
        return
    end

    local remnantItemsToCreate = {}

    local propertyName = utility.getPropertyLocationIsPartOf(target)
    utility.deletePreviewItem(propertyName, true)

    if product.tile then
        if utility.checkIfRoofOrRoofTile(product.id, true, product.above) then
            if utility.roofAndRoofTiles(user, product.id, true, "create", product.above) then
                remnantItemsToCreate = eraseIngredients(user, product)
            else
                user:inform("Du bist nicht dazu berechtigt, hier zu bauen.","You do not have permission to build there.")
            end
        else
            remnantItemsToCreate = eraseIngredients(user, product)
            world:changeTile(product.id, target)
        end
    else
        if not utility.wallWindowPermissions(user, target, product.id, product.tile) or utility.checkIfEntrance(user, target, product.tile) then
            return
        end

        if utility.checkIfStairsOrTrapDoor(product.id) then
            if utility.createWarpsAndExitObject(user, product.id, "create") then
                remnantItemsToCreate = eraseIngredients(user, product)
                local targetItem = world:createItemFromId(product.id, product.quantity, target, true, quality, nil)
                targetItem.wear = 255
                world:changeItem(targetItem)
            else
                user:inform("Du bist nicht dazu berechtigt, hier zu bauen.","You do not have permission to build there.")
            end
        elseif utility.checkIfRoofOrRoofTile(product.id, false, product.above) then
            if utility.roofAndRoofTiles(user, product.id, false, "create", product.above) then
                remnantItemsToCreate = eraseIngredients(user, product)
            else
                user:inform("Du bist nicht dazu berechtigt, hier zu bauen.","You do not have permission to build there.")
            end
        elseif utility.checkIfPlantOrTree(product.id) then
            if utility.checkIfGardeningCriteriaMet(user, product.id) then
                remnantItemsToCreate = eraseIngredients(user, product)
                world:createItemFromId(product.id, product.quantity, target, true, quality, nil)
            else
                user:inform("Das kannst du hier nicht pflanzen.","You can't plant this here.")
            end
        else
            remnantItemsToCreate = eraseIngredients(user, product)
            local field = world:getField(target)
            if field:tile() == 0 then
                world:changeTile(34, target) --To prevent buggy ? tiles if you want to have something like a floating handrail at the edge of the nearby tile.
            end
            local targetItem = world:createItemFromId(product.id, product.quantity, target, true, quality, nil)
            targetItem.wear = 255
            world:changeItem(targetItem)
        end
    end

    for _, remnant in pairs(remnantItemsToCreate) do

        common.CreateItem(user, remnant.id, remnant.quantity, 333, {})

    end

end

local function craftItem(user, product, skill)

    if not utility.allowBuilding(user) then
        return
    end

    local trowel = getEquippedTrowel(user)

    local time = loadCraftingTime(product.level)

    local foodOk, foodToReduce = utility.checkRequiredFood(user, time)
    if not foodOk then
        return
    end

    if hasMaterials(user, product) then

        shared.toolBreaks(user, trowel, time)

        common.GetHungry(user, foodToReduce)

        createItem(user, product, trowel, skill)

    end

    return false

end

local function multiSkillsThatAreCountedAsOne(user, skill, productLevel, hasSkillLevel, languageAppropriateSkillName)

    local playerIsGerman = user:getPlayerLanguage() == Player.german

    if skill.name == "blacksmithing" then

        local finesmithing = loadSkill(user, "finesmithing")

        local armourer = loadSkill(user, "armourer")

        if productLevel <= armourer or productLevel <= finesmithing then
            hasSkillLevel = true
        end

        if playerIsGerman then
            languageAppropriateSkillName = "Schmieden, Feinschmieden oder Rüstschmieden"
        else
            languageAppropriateSkillName = "blacksmithing, finesmithing or armouring"
        end
    end

    if skill.name == "herblore" then

        local farming = loadSkill(user, "farming")

        if productLevel <= farming then
            hasSkillLevel = true
        end

        if playerIsGerman then
            languageAppropriateSkillName = "Kräuterkunde oder Ackerbau"
        else
            languageAppropriateSkillName = "herblore or farming"
        end
    end


    return hasSkillLevel, languageAppropriateSkillName

end

local function roofInform(user, product, tile, accessedViaLookat, above)

    if not aboveVsGroundRoofHintGivenThisSession[user.id] and utility.checkIfRoofOrRoofTile(product.id, tile, above) then
        if not accessedViaLookat then
            user:inform("Was du zu bauen versuchst, ist ein Dach(Oben)-Kategoriegegenstand oder -feld, was bedeutet, dass es auf dem Feld vor dir, jedoch eine Ebene darüber, gebaut wird. Wenn du es stattdessen vor dir bauen möchtest, wähle den Gegenstand aus der Dach(Boden)-Kategorie.", "What you are trying to build is a roof(above) category item or tile, which means it will be built on the tile in front of you but one layer above.  If you want to build it in front of you instead, build the one in the roof(ground) category. Lastly, it will be built infront of you regardless if there is no floor above you to build on.")
        else
            user:inform("Der Gegenstand/das Feld, über dem sich dein Cursor befindet, gehört zur Dach(Oben)-Kategorie. Das bedeutet, dass es auf dem Feld vor dir, jedoch eine Ebene darüber, gebaut wird. Wenn du es stattdessen vor dir bauen möchtest, wähle den Gegenstand aus der Dach(Boden)-Kategorie.", "The item/tile you are hovering your cursor over is of the roof(above) category. Which means it will be built on the tile in front of you but one layer above. If you want to build it in front of you instead, build the one in the roof(ground) category. Zuletzt wird es vor dir gebaut, unabhängig davon, ob es über dir keinen Boden zum Bauen gibt.")
        end

        aboveVsGroundRoofHintGivenThisSession[user.id] = true -- prevents spam
    end
end

function M.showDialog(user, skillName, overloaded)

    local skill = {}
    skill.level = loadSkill(user, skillName)
    skill.name = skillName

    local categories = loadCategories(user, skill)

    local products = loadProducts(user, categories, skill, overloaded)

    if not utility.allowBuilding(user) then
        return
    end

    local currentTime = common.GetCurrentTimestamp()

    if not hintCooldown[user.id] or hintCooldown[user.id] <= currentTime then

        user:inform("[Bauhilfe] Wenn du mit dem Mauszeiger über die Grafik eines Objekts im Baumenü fährst, wird eine Vorschau dieses Objekts vor dir angezeigt, damit du sehen kannst, wie es aussieht.", "[Housing Hint] If you hover over the graphic of an object in the construction menu, it will place a preview of that item in front of you so that you can see how it looks.")
        -- If we want to add more hints this way later on, we can change this to its own function that picks a hint from a list of hints and cycles through them based on a questID status so there are no repeats until they have all been shown.
        hintCooldown[user.id] = currentTime + 3600 --Only shows once an hour, so as to not be spammy
    end

    local callback = function(dialog)

        local result = dialog:getResult()

        if result == CraftingDialog.playerCrafts then
            local productIndex = dialog:getCraftableId()
            local product = products[productIndex]
            local foodOK = utility.checkRequiredFood(user, loadCraftingTime(product.level))
            local canWork = utility.allowBuilding(user) and foodOK
            local hasSkillLevel = product.level <= skill.level

            local frontPos = common.GetFrontPosition(user)

            if not getEquippedTrowel(user) then
                user:inform("Die Baukelle muss noch intakt sein und du musst sie in einer Hand halten, um sie zu benutzen.", "The construction trowel must be intact and in one of your hands for you to use it.")
                return
            end

            if not utility.realmAllowsFarming(frontPos) and product.tile and product.id == 4 then
                user:inform("Leider ist das Klima in Cadomyr zu rau, Ackerland würde in kürzester Zeit austrocknen.", "Sadly the Cadomyr climate is too harsh, farmland would dry up in no time.")
                return
            end

            if skill.name ~= "misc" then

                local languageAppropriateSkillName = user:getSkillName(Character[skill.name])

                hasSkillLevel, languageAppropriateSkillName = multiSkillsThatAreCountedAsOne(user, skill, product.level, hasSkillLevel, languageAppropriateSkillName)

                if not hasSkillLevel then
                    common.HighInformNLS(user, "Hierfür benötigst du Level "..product.level.." in "..languageAppropriateSkillName..". Oder du fragst jemanden, der sich damit besser auskennt als du.", "You need level "..product.level.." in "..languageAppropriateSkillName.." to do that. You could always seek out someone else to do it for you.")
                    return false
                end
            end

            if utility.checkIfPlantOrTree(product.id) then
                if not utility.checkIfGardeningCriteriaMet(user, product.id) then
                    canWork = false
                    user:inform("Das kannst du hier nicht pflanzen.","You can't plant this here.")
                end
            end

            if utility.checkIfBasementExclusive(product.id) then
                if not (user.pos.z < 0) then
                    canWork = false
                    user:inform("Du kannst keine Kellergeschosselemente überirdisch bauen.", "You can't build basement exclusive items above ground.")
                end
            end

            if not utility.wallWindowPermissions(user, frontPos, product.id, product.tile) or not hasMaterials(user, product) or utility.checkIfEntrance(user, frontPos, product.tile) then
                canWork = false
            end

            roofInform(user, product, product.tile, false, product.above)

            return canWork

        elseif result == CraftingDialog.playerLooksAtItem then

            local productIndex = dialog:getCraftableId()
            local product = products[productIndex]
            roofInform(user, product, product.tile, true, product.above)
            if utility.allowBuilding(user) then
                showTemporaryPreviewOfItem(product.id, user, product.tile, product.above)
            end

            return getLookAt(user, product)

        elseif result == CraftingDialog.playerLooksAtIngredient then
            local productIndex = dialog:getCraftableId()
            local product = products[productIndex]
            local ingredientIndex = dialog:getIngredientIndex() + 1
            local ingredient = product.ingredients[ingredientIndex]

            return getLookAt(user, ingredient)

        elseif result == CraftingDialog.playerCraftingComplete then
            local productIndex = dialog:getCraftableId()
            local product = products[productIndex]

            return craftItem(user, product, skill)
        end
    end

    local sfxDuration = 25

    local sfx = 0

    for _, selectedSkill in ipairs(itemList.skills) do
        if skill.name == selectedSkill.name then
            sfx = selectedSkill.sfx
        end
    end

    local dialog = CraftingDialog(common.GetNLS(user, "Baumenü", "Construction"), sfx, sfxDuration, callback)
    loadDialog(user, dialog, skill, categories, products)
    user:requestCraftingDialog(dialog)
end

return M
