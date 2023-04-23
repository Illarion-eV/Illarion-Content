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

local M = {}

local previewInformCooldown = {}
local hintCooldown = {}

local function loadIngredients(object)

    local ingredients = {}
    local remnants = {}

    for i = 1, 4 do
        local ingredient = object["ingredient" .. i]
        local amount = object["ingredient".. i .. "Amount"]
        if ingredient then
            table.insert(ingredients,{id = ingredient, quantity = amount, data = {}})
            if ingredient == Item.bucketOfWater then
                table.insert(remnants, {id = Item.bucket, quantity = 1, data = {}})
            end
        end
    end
    return ingredients, remnants
end

local function showObject(user, object, category, skill, carpentryEstateCatalogue)

    if carpentryEstateCatalogue ~= nil
    and ((carpentryEstateCatalogue and object.typeOf ~= "Estate")
    or (not carpentryEstateCatalogue and object.typeOf == "Estate"))
    then return false
    end

    if category.nameEN == object.category
        and object.skill == skill.name
        and object.level <= skill.level
        and (object.typeOf ~= "Estate" or utility.checkIfEstate(user))
        then return true
    end

    return false
end

local function loadObjects(user, products, index, object, category, skill, carpentryEstateCatalogue)
    if showObject(user, object, category, skill, carpentryEstateCatalogue) then
        local ingredients, remnants = loadIngredients(object)
        local id, tile
        if object.itemId then
            id = object.itemId
            tile = false
        else
            id = object.tileId
            tile = true
        end

        table.insert(products, {level = object.level, category = index, id = id, ingredients = ingredients, remnants = remnants, tile = tile, difficulty = object.level, quantity = 1, data = {}})
        return true
    end
    return false
end

local function loadProducts(user, categories, skill, carpentryEstateCatalogue)
    local products = {}
    for index, category in ipairs(categories) do
        local theList = itemList.items
        if category.tile then
            theList = itemList.tiles
        end

        for _, object in ipairs(theList) do
            if loadObjects(user, products, index, object, category, skill, carpentryEstateCatalogue) then
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
            and skill.level >= item.level
            and (not category.Estate or utility.checkIfEstate(user))
            then return true, false
        end
    end
    for _, tile in ipairs(itemList.tiles) do
        if category.categoryEn == tile.category
            and skill.name == tile.skill
            and skill.level >= tile.level
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
        local requirement = product.difficulty

        if requirement <= skill.level then

            local time = loadCraftingTime(product.level)
            local category = categoryList[product.category]
            local categoryId = category.id
            local name = loadProductName(user, product.id, category.tile)
            local productId = product.id
            if category.tile then
                productId = utility.getTileGraphic(product.id)
            end
            dialog:addCraftable( index, categoryId , productId, name, time, 1)
        end

        for _, ingredient in ipairs(product.ingredients) do
            dialog:addCraftableIngredient(ingredient.id, ingredient.quantity)
        end
    end
end

local function showTemporaryPreviewOfItem(productId, user, isTile)
    -- For special items like stairs, only the first object will be previewed and not the upper/lower stair

    if isTile then
        productId = utility.getTilePreview(productId)
    end

    local frontPos = common.GetFrontPosition(user)
    local roofPos = position(frontPos.x, frontPos.y, frontPos.z+1)

    if utility.checkIfRoofOrRoofTile(productId, false) and user.pos.z >= 0 and utility.getPropertyLocationIsPartOf(roofPos) then
        frontPos = roofPos
    end

    local field = world:getField(frontPos)

    if not field then
        return
    end

    if not utility.wallWindowPermissions(user, frontPos, productId) then
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
        user:inform("Vorschau des Gegenstandes.", "Preview item placed.")
    else
        user:inform("Indem du den Mauszeiger über den Gegenstand im Menü bewegst, erstellst du einen Gegenstand zur Vorschau an dem Ort, an dem er gebaut wird, wenn du ihn herstellst. Dieser Gegenstand verschwindet nach 30 Sekunden oder immer dann, wenn du oder jemand anderes einen anderen Gegenstand auf demselben Grundstück zur Vorschau erstellt.", "By hovering over the item in the menu, you've created an item for preview in the location it will be built if you craft it. This item will disappear after 30 seconds, or whenever you or someone else preview another item on the same property.")
        previewInformCooldown[user.id] = currentTime + 3600 --This long inform only shows once an hour, so as to not be spammy
    end
end

local function getLookAt(user, object)
    local item = object.id
    local quantity = object.quantity
    local data = object.data
    local lookAt = utility.getItemName(user, item)

    if not lookAt then
        lookAt = lookat.GenerateItemLookAtFromId(user, item, quantity, data)
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

local function hasMaterials(user, product)

    local materialsAvailable = true
    local lackText = ""
    local enoughText = ""

    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        local available = user:countItemAt("all", ingredient.id, ingredient.data)

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
    local leadAttribName
    local leadAttribValue
    if skill.name ~= "misc" then
        skillID = Character[skill.name]
        leadAttribName = common.GetLeadAttributeName(skillID)
        leadAttribValue = user:increaseAttrib(leadAttribName, 0)
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

local function eraseIngredients(user, product)
    for _, ingredient in ipairs(product.ingredients) do
        user:eraseItem(ingredient.id, ingredient.quantity, ingredient.data)
    end
end

local function createItem(user, product, trowel, skill)

    local quality = generateQuality(user, trowel, skill)
    product.data.craftedBy = user.name
    local target = common.GetFrontPosition(user)
    if not utility.allowBuilding(user) then
        return
    end

    local propertyName = utility.getPropertyLocationIsPartOf(target)
    utility.deletePreviewItem(propertyName, true)

    if product.tile then
        if utility.checkIfRoofOrRoofTile(product.id, true) then
            if utility.roofAndRoofTiles(user, product.id, true, "create") then
                eraseIngredients(user, product)
            else
                user:inform("Du bist nicht dazu berechtigt, hier zu bauen.","You do not have permission to build there.")
            end
        else
            eraseIngredients(user, product)
            world:changeTile(product.id, target)
        end
    else
        if not utility.wallWindowPermissions(user, target, product.id) then
            return
        end

        if utility.checkIfStairsOrTrapDoor(product.id) then
            if utility.createWarpsAndExitObject(user, product.id, "create") then
                eraseIngredients(user, product)
                local targetItem = world:createItemFromId(product.id, product.quantity, target, true, quality, nil)
                targetItem.wear = 255
                world:changeItem(targetItem)
            else
                user:inform("Du bist nicht dazu berechtigt, hier zu bauen.","You do not have permission to build there.")
            end
        elseif utility.checkIfRoofOrRoofTile(product.id, false) then
            if utility.roofAndRoofTiles(user, product.id, false, "create") then
                eraseIngredients(user, product)
            else
                user:inform("Du bist nicht dazu berechtigt, hier zu bauen.","You do not have permission to build there.")
            end
        elseif utility.checkIfPlantOrTree(user, product.id) then
            if utility.checkIfGardeningCriteriaMet(user, product.id) then
                eraseIngredients(user, product)
                world:createItemFromId(product.id, product.quantity, target, true, quality, nil)
            else
                user:inform("Das kannst du hier nicht pflanzen.","You can't plant this here.")
            end
        else
            eraseIngredients(user, product)
            local targetItem = world:createItemFromId(product.id, product.quantity, target, true, quality, nil)
            targetItem.wear = 255
            world:changeItem(targetItem)
        end
    end

    for _, remnant in ipairs(product.remnants) do
       common.CreateItem(user, remnant.item, remnant.quantity, 333, remnant.data)
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

function M.showDialog(user, skillName, carpentryEstateCatalogue)

    local skill = {}
    skill.level = loadSkill(user, skillName)
    skill.name = skillName

    local categories = loadCategories(user, skill)

    local products = loadProducts(user, categories, skill, carpentryEstateCatalogue)

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

            local frontPos = common.GetFrontPosition(user)

            if not utility.wallWindowPermissions(user, frontPos, product.id) or not hasMaterials(user, product) then
                canWork = false
            end

            return canWork

        elseif result == CraftingDialog.playerLooksAtItem then
            local productIndex = dialog:getCraftableId()
            local product = products[productIndex]
            if utility.allowBuilding(user) then
                showTemporaryPreviewOfItem(product.id, user, product.tile)
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
