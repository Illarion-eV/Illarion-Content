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
-- basic function for craft handling
-- Nitram
-- added object orientation by vilarion
-- rewritten for VBU by vilarion

local common = require("base.common")
local shared = require("craft.base.shared")
local lookat = require("base.lookat")
local licence = require("base.licence")
local gems = require("base.gems")
local foodScript = require("item.food")

local M = {}

local foodRarityTexts = {
    {english = "uncommon", german = "außergewöhnlich gut", identifier = 2,
    foodDescription = {
        english = "An uncommonly well made dish. Sure to be more filling than its common counterparts.",
        german = "Ein außergewöhnlich gut gelungenes Gericht. Ein wahrer Schmauß, der besser sättigt als ein normales Gericht."}},
    {english = "rare", german = "exzellent", identifier = 3,
    foodDescription = {
        english = "A dish so well-made it's a rarity among dishes. Not only more filling than its lesser counterparts, but also somewhat beneficial to the longevity and strength of the boons of your good diet.",
        german = "Ein wahres Schlemmergericht. Wohlbekömmlich und eine kleine Wohltat für die Länge und Auswirkung deiner guten Ernährung."}},
    {english = "unique", german = "einzigartig gut", identifier = 4,
    foodDescription = {
        english = "A dish made by such refined culinary arts, you might even say it's unique. Not only more filling than its lesser counterparts, but also very beneficial to both the longevity and strength of the boons of your good diet.",
        german = "Eine kulinarisches Köstlichkeit, die ihres Gleichen sucht. Äußerst wohlbekömmlich und eine wahre Wohltat für die Länge und Auswirkung deiner guten Ernährung."}}}


local Product = {
            quantity = 1,
            ingredients = {},
            difficulty = 0,
            remnants = {},
}

function Product:new(p)       -- new: constructor
    p = p or {}               -- if p=nil then create an empty list
    setmetatable(p, self)     -- metatable: holds functions of a class. loads product-stuff into this new product p.
    self.__index = self
    return p
end


local Craft = {
    products = {},
    categories = {},
    skill = nil,

    handTool = 0,
    tool = {},
    activeTool = {},
    toolLink = {},

    sfx = 0,
    sfxDuration = 0,

    fallbackCraft = nil,
}

-- constructor

--[[
Usage: myCraft = Craft:new{ craftEN = "CRAFT_EN",
                            craftDE = "CRAFT_DE",
                            handTool = ID,
                            [leadSkill = SKILL | leadSkill = function(user)],
                            [sfx = SFX, sfxDuration = DURATION,]
                            [fallbackCraft = CRAFTWITHSAMEHANDTOOL,]
                            [npcCraft = true,]
                            [lookAtFilter = (lookAt function(user, lookAt, data)),]
                          }
--]]

function Craft:new(c)
    c = c or {}
    setmetatable(c, self)
    self.__index = self
    c.products = {}
    c.categories = {}
    c.tool = {}
    c.activeTool = {}
    c.toolLink = {}
    c.defaultProduct = Product:new{}
    return c
end

function Craft:addTool(itemId)
    if not self.defaultTool then
        self.defaultTool = itemId
    end

    self.tool[itemId] = true
end

function Craft:addActiveTool(inactiveItemId, itemId)
    self.activeTool[itemId] = true
    self.toolLink[itemId] = inactiveItemId
    self.toolLink[inactiveItemId] = itemId
end

function Craft:addCategory(categoryNameEN, categoryNameDE)
    table.insert(self.categories, {nameEN = categoryNameEN, nameDE = categoryNameDE, minSkill = nil})
    return #self.categories
end

function Product:addIngredient(item, quantity, data)
    quantity = quantity or 1
    data = data or {}
    table.insert(self["ingredients"], {["item"]=item, ["quantity"]=quantity, ["data"]=data})
end

function Product:addRemnant(item, quantity, data)
    quantity = quantity or 1
    data = data or {}
    table.insert(self["remnants"], {["item"]=item, ["quantity"]=quantity, ["data"]=data})
end

function Craft:addProduct(categoryId, itemId, quantity, data)
    local difficulty = math.min(world:getItemStatsFromId(itemId).Level, 100)
    local learnLimit = math.min(difficulty + 20, 100)
    quantity = quantity or 1
    data = data or {}

    if categoryId > 0 and categoryId <= #self.categories then
        table.insert(self.products, self.defaultProduct:new{
            ["category"] = categoryId,
            ["item"] = itemId,
            ["difficulty"] = difficulty,
            ["learnLimit"] = learnLimit,
            ["quantity"] = quantity,
            ["data"] = data,
            ["ingredients"] = {},
            ["remnants"] = {},
        })

        if self.categories[categoryId].minSkill then
            self.categories[categoryId].minSkill = math.min(self.categories[categoryId].minSkill, difficulty)
        else
            self.categories[categoryId].minSkill = difficulty
        end

        return self.products[#self.products]
    end

    return nil
end

function Craft:showDialog(user, source)

    local allowCraft, checkForFallbackCraft = self:allowCrafting(user, source)

    if not allowCraft then
        if checkForFallbackCraft and self.fallbackCraft then
            self.fallbackCraft:showDialog(user, source)
        end

        return
    end

    local callback = function(dialog)
        local result = dialog:getResult()
        if result == CraftingDialog.playerCrafts then
            local productId = dialog:getCraftableId()
            local product = self.products[productId]
            local foodOK = self:checkRequiredFood(user, product:getCraftingTime(self:getSkill(user)))
            local canWork = self:allowCrafting(user, source) and self:checkMaterial(user, productId) and foodOK
            if canWork then
                self:swapToActiveItem(user)
            end
            return canWork
        elseif result == CraftingDialog.playerLooksAtItem then
            local productId = dialog:getCraftableId()
            return self:getProductLookAt(user, productId)
        elseif result == CraftingDialog.playerLooksAtIngredient then
            local productId = dialog:getCraftableId()
            local ingredientId = dialog:getIngredientIndex() + 1
            return self:getIngredientLookAt(user, productId, ingredientId)
        elseif result == CraftingDialog.playerCraftingComplete then
            local productId = dialog:getCraftableId()
            local skillGain = self:craftItem(user, productId)
            if skillGain then
                self:refreshDialog(dialog, user)
            end
            return skillGain
        else
            self:swapToInactiveItem(user)
        end
    end
    local dialog = CraftingDialog(self:getName(user), self.sfx, self.sfxDuration, callback)
    self:loadDialog(dialog, user)
    user:requestCraftingDialog(dialog)
end

function Craft:allowCrafting(user, source)
    if not self.npcCraft then
        return self:allowUserCrafting(user, source)
    else
        return self:allowNpcCrafting(user, source)
    end
end

function Craft:allowUserCrafting(user, source)
    if source:getType() == scriptItem.field and self.tool[source.id] then
        common.TurnTo(user, source.pos)

        if not self:userHasLicense(user) then
            return false, false
        end

        if not self:isHandToolEquipped(user) then
            local germanTool = world:getItemName(self.handTool, Player.german)
            germanTool = germanTool:gsub("^%l", string.upper) --Upper case
            local englishTool = world:getItemName(self.handTool, Player.english)
            englishTool = englishTool:gsub("^%l", string.upper) --Upper case

            common.HighInformNLS(user,
            "Dir fehlt ein intaktes Werkzeug in deiner Hand um hier zu arbeiten: " .. germanTool,
            "To work here you have to hold an intact tool in your hand: " .. englishTool)
            return false, false
        end
    else
        if not self:locationFine(user) then
            return false, true
        end

        if not self:userHasLicense(user) then
            return false, false
        end

        if not self:isHandToolEquipped(user) then
            self:swapToInactiveItem(user)
            common.HighInformNLS(user,
            "Du musst ein intaktes Werkzeug in die Hand nehmen um damit zu arbeiten.",
            "You must have an intact tool in your hand to work with.")
            return false, false
        end
    end

    return true
end

function Craft:userHasLicense(user)
    return not licence.licence(user)
end

function Craft:isHandToolEquipped(user)

    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == self.handTool and common.isBroken(leftTool) == false then
        return true
    elseif rightTool.id == self.handTool and common.isBroken(rightTool) == false then
        return true
    end

    return false
end

function Craft:getHandToolEquipped(user)
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == self.handTool and common.isBroken(leftTool) == false then
        return leftTool
    elseif rightTool.id == self.handTool and common.isBroken(rightTool) == false then
        return rightTool
    end

    return nil
end

function Craft:getCurrentGemBonus(user)
    local handItem = self:getHandToolEquipped(user)
    if handItem ~= nil then
        return gems.getGemBonus(handItem)
    else
        return 0
    end
end

function Craft:allowNpcCrafting(user, source)
    return user:isInRange(source, 2)
end

function Craft:getProductLookAt(user, productId)
    local product = self.products[productId]
    local lookAt = self:getLookAt(user, product)
    return lookAt
end

function Craft:getIngredientLookAt(user, productId, ingredientId)
    local ingredient = self.products[productId].ingredients[ingredientId]
    local lookAt = self:getLookAt(user, ingredient)
    return lookAt
end

function Craft:getLookAt(user, object)
    local item = object.item
    local quantity = object.quantity
    local data = object.data
    local lookAt = lookat.GenerateItemLookAtFromId(user, item, quantity, data)

    if self.lookAtFilter then
        lookAt = self.lookAtFilter(user, lookAt, data)
    end

    return lookAt
end

function Craft:getName(user)
    local isGerman = (user:getPlayerLanguage() == Player.german)
    local craft

    if isGerman then
        craft = self.craftDE
    else
        craft = self.craftEN
    end

    craft = craft or "unknown craft"

    return craft
end

function Craft:loadDialog(dialog, user)
    local skill = self:getSkill(user)
    local categoryListId = {}
    local listId = 0

    for i = 1,#self.categories do
        local category = self.categories[i]
        local categoryRequirement = category.minSkill
        if categoryRequirement and categoryRequirement <= skill then
            if(category.nameEN~="Rare Items") then
                if user:getPlayerLanguage() == Player.german then
                    dialog:addGroup(category.nameDE)
                else
                    dialog:addGroup(category.nameEN)
                end

                categoryListId[i] = listId
                listId = listId + 1
            end
        end
    end

    for i = 1,#self.products do
        local product = self.products[i]
        local productRequirement = product.difficulty

        if productRequirement <= skill then

            local craftingTime = self:getCraftingTime(product, skill)
            dialog:addCraftable(i, categoryListId[product.category], product.item, self:getLookAt(user, product).name, craftingTime, product.quantity)

            for j = 1, #product.ingredients do
                local ingredient = product.ingredients[j]
                dialog:addCraftableIngredient(ingredient.item, ingredient.quantity)
            end
        end
    end
end

function Craft:refreshDialog(dialog, user)
    dialog:clearGroupsAndProducts()
    self:loadDialog(dialog, user)
end

function Craft:getCraftingTime(product, skill)
    if not self.npcCraft then
        return product:getCraftingTime(skill)
    else
        return 10 --default time
    end
end

function Product:getCraftingTime(skill)

    --This function returns the crafting time, scaled by the price of the item.
    local learnProgress
    if (self.learnLimit == self.difficulty) then
        learnProgress = 50 --This is a temporary solution until we get "effective" skills beyond 100 as proposed by Bloodraven, see Ars Magica
    else
        learnProgress = (skill - self.difficulty) / (self.learnLimit - self.difficulty) * 100
    end
    local theItem = world:getItemStatsFromId(self.item)
    local minimum = math.max (((30+((self.quantity * theItem.Worth)-200)*(1500-30)/(133300-200))),30) --30: Minimum time; 200: Minimum price; 1500: maximum time; 133300: maximum price
    local craftingTime = common.Scale(minimum * 2, minimum, learnProgress)

    if craftingTime > 99 then
        craftingTime = 10 * math.floor(craftingTime/10 + 0.5) -- Round correctly to whole seconds
    end
    return craftingTime

end

function Craft:swapToActiveItem(user)
    if self.npcCraft then
        return
    end

    local frontItem = common.GetFrontItem(user)

    if not self.toolLink[frontItem.id] then
        return
    end

    if not self.tool[frontItem.id] then
        return
    end

    if self.activeTool[frontItem.id] then
        return
    end

    frontItem.id = self.toolLink[frontItem.id]
    frontItem.wear = 2
    world:changeItem(frontItem)
end

function Craft:swapToInactiveItem(user)
    if self.npcCraft then
        return
    end

    local frontItem = common.GetFrontItem(user)

    if not self.toolLink[frontItem.id] then
        return
    end

    if self.tool[frontItem.id] then
        return
    end

    if not self.activeTool[frontItem.id] then
        return
    end

    if frontItem.id ~= self.toolLink[frontItem.id] then
        frontItem.id = self.toolLink[frontItem.id]
        frontItem.wear = 255
        world:changeItem(frontItem)
    end
end

function Craft:checkRequiredFood(user, craftingTime)
    local neededFood=craftingTime*4 --One second of crafting takes 40 food points
    if common.FitForHardWork(user, math.ceil(neededFood+craftingTime*0.1)) then --Each second, one spends one food point per default.
        return true, neededFood
    else
        return false, 0
    end
end

function Craft:getSkill(user)
    local skillType = type(self.leadSkill)

    if skillType == "number" then
        return user:getSkill(self.leadSkill)
    elseif skillType == "function" then
        return self.leadSkill(user)
    else
        return 0
    end
end



local function checkForRareFoodIngredient(user, ingredient)

    local available = 0

    for _, foodRarity in pairs(foodRarityTexts) do
        local descriptionEn = foodRarity.foodDescription.english
        local descriptionDe = foodRarity.foodDescription.german
        local identifier = foodRarity.identifier
        available = available + user:countItemAt("all", ingredient.item, {["descriptionDe"] = descriptionDe, ["descriptionEn"] = descriptionEn, ["rareness"] = identifier})
    end

    return available
end

local function deleteRareItems(user, ingredient, rareItemsToDelete)

    local deletedSoFar = 0

    local rareIngredientBonus = 0

    for _, foodRarity in ipairs(foodRarityTexts) do

        local descriptionEn = foodRarity.foodDescription.english
        local descriptionDe = foodRarity.foodDescription.german
        local identifier = foodRarity.identifier
        local data = {["descriptionDe"] = descriptionDe, ["descriptionEn"] = descriptionEn, ["rareness"] = identifier}
        local available = user:countItemAt("all", ingredient.item, data)
        local deleteAmount

        if available > rareItemsToDelete then
            deleteAmount = rareItemsToDelete
        else
            deleteAmount = available
        end

        if deleteAmount > 0 then
            user:eraseItem(ingredient.item, deleteAmount, data)
        end

        rareIngredientBonus = rareIngredientBonus + deleteAmount-1*identifier

        deletedSoFar = deletedSoFar + deleteAmount

        if deletedSoFar == rareItemsToDelete then
            break
        end
    end

    return rareIngredientBonus
end

function Craft:checkMaterial(user, productId)
    local product = self.products[productId]

    if product == nil then
        return false
    end

    local materialsAvailable = true
    local lackText = ""
    local enoughText = ""

    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        local available = user:countItemAt("all", ingredient.item, ingredient.data)
        local rareFoodIngredients = checkForRareFoodIngredient(user, ingredient)

        available = available + rareFoodIngredients

        if available < ingredient.quantity then
            materialsAvailable = false
            local ingredientName = self:getLookAt(user, ingredient).name

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

function Craft:generateRarity(user, productId, toolItem, rareIngredientBonus)

    -- 1 = common, 2 = uncommon, 3 = rare, 4 = unique
    -- Max chances: 0.4% unique, 2% rare, 10% uncommon, 87.6% common (includes the chance to get perfect items to even get here)

    if self.npcCraft then
        return 1
    end

    local retVal = 1

    local maxPerfectChance = 0.5967194738 --Maximum probability for quality 9(perfect) items

    local rareIngredientInfluence = 1 + rareIngredientBonus/100 -- increase the final chance by an additional 1%/2%/3% per uncommon/rare/unique item used, eg a chance of 10% uncommon when you use an uncommon ingredient becomes 10.1%

    local rarities = {(0.004*rareIngredientInfluence)/maxPerfectChance, (0.02*rareIngredientInfluence)/maxPerfectChance, (0.1*rareIngredientInfluence)/maxPerfectChance} --unique, rare, uncommon

    local rand = math.random()

    for _, rarity in ipairs(rarities) do
        if rarity >= rand then
            retVal = retVal+1
        end
    end

    return retVal

end

function Craft:checkIfFoodItem(productId)
    local product = self.products[productId]
    if not foodScript.foodList[product.item] then
        return false
    end
    if foodScript.foodList[product.item].crafted then
        return true, foodScript.foodList[product.item].buffs
    end
end

function Craft:generateQuality(user, productId, toolItem)

    if self.npcCraft then
        return 999
    end

    local gemBonus = tonumber(self:getCurrentGemBonus(user))
    local skill = self.leadSkill
    local leadAttribName = common.GetLeadAttributeName(skill)
    local leadAttribValue = user:increaseAttrib(leadAttribName, 0)

    local meanQuality = 5
    meanQuality = meanQuality*(1+common.GetAttributeBonusHigh(leadAttribValue)+common.GetQualityBonusStandard(toolItem))+gemBonus/100 --Apply boni of dexterity, tool quality and gems.
    meanQuality = common.Limit(meanQuality, 1, 8.5) --Limit to a reasonable maximum to avoid overflow ("everything quality 9"). The value here needs unnatural attributes.
    local rolls = 8 --There are eight chances to increase the quality by one. This results in a quality distribution 1-9.
    local quality = 1 + common.BinomialByMean((meanQuality-1), rolls)
    quality = common.Limit(quality, 1, common.ITEM_MAX_QUALITY)

    local durability = common.ITEM_MAX_DURABILITY
    return common.calculateItemQualityDurability(quality, durability)

end

function Craft:locationFine(user)

    self:turnToTool(user)

    local staticTool = common.GetFrontItemID(user)
    if self.activeTool[staticTool] then
        if not self.fallbackCraft then
            common.HighInformNLS(user,
            "Hier arbeitet schon jemand.",
            "Someone is working here already.")
        end
        return false
    elseif not self.tool[staticTool] then
        if not self.fallbackCraft then
            local germanTool = world:getItemName(self.defaultTool, Player.german)
            local englishTool = world:getItemName(self.defaultTool, Player.english)
            common.HighInformNLS(user,
            "Du stehst nicht neben dem ben?tigten Werkzeug: " .. germanTool,
            "There is no " .. englishTool .. " close by to work with.")
        end
        return false
    elseif common.GetFrontItem(user).id == 359 and common.GetFrontItem(user).quality == 100 then
        if not self.fallbackCraft then
            common.HighInformNLS(user,
            "Aus irgendeinem Grund liefert die Flamme nicht die ben?tigte Hitze.",
            "For some reason the flame does not provide the required heat.")
        end
        return false
    end

    return true
end

-- Turn to a static tool, keeping the turning radius as small as possible and searching
-- in the following order around the user (u), starting at the frontal position (1):
-- 2 1 3
-- 4 u 5
-- 6 8 7
function Craft:turnToTool(user)
    local dir = user:getFaceTo()
    local right = dir
    local left = (right - 1) % 8

    for i=1,4 do
        local staticTool = common.GetFrontItemID(user, right)

        if self.tool[staticTool] then
            user:turn(right)
            return true
        end

        staticTool = common.GetFrontItemID(user, left)

        if self.tool[staticTool] then
            user:turn(left)
            return true
        end

        right = (right + 1) % 8
        left = (left - 1) % 8
    end

    return false
end

function Craft:craftItem(user, productId)
    local product = self.products[productId]
    local skill = self:getSkill(user)
    local skillGain = false

    local toolItem = self:getHandToolEquipped(user)

    if product.difficulty > skill then
        common.HighInformNLS(user,
        "Du bist nicht f?hig genug um das zu tun.",
        "You are not skilled enough to do this.")
        self:swapToInactiveItem(user)
        return false
    end

    local foodOK, neededFood = self:checkRequiredFood(user, product:getCraftingTime(skill))
    if not self.npcCraft then
        if not foodOK then
            self:swapToInactiveItem(user)
            return false
        end
    end

    if self:checkMaterial(user, productId) then
        self:createItem(user, productId, toolItem)

        if not self.npcCraft then
            shared.toolBreaks(user, toolItem, product:getCraftingTime(skill))
            common.GetHungry(user, neededFood)
        end

        if type(self.leadSkill) == "number" then
            user:learn(self.leadSkill, product:getCraftingTime(skill), product.learnLimit)
            local newSkill = self:getSkill(user)
            skillGain = (newSkill > skill)
        end
    end

    self:swapToInactiveItem(user)

    return skillGain
end

function Craft:createItem(user, productId, toolItem)
    local product = self.products[productId]
    product.data.descriptionDe = ""
    product.data.descriptionEn = "" -- reset descriptions, same reasoning as below
    product.data.rareness = "" -- reset rarity or else it creates the most recent result of the rarity calculation even if not a perfect item

    local rareIngredientBonus = 0

    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        local regularFoodIngredients = user:countItemAt("all", ingredient.item, ingredient.data)
        local totalToDelete = ingredient.quantity
        local regularItemsToDelete
        local rareItemsToDelete = 0

        if regularFoodIngredients >= totalToDelete then
            regularItemsToDelete = totalToDelete
        else
            regularItemsToDelete = regularFoodIngredients
            rareItemsToDelete = totalToDelete-regularFoodIngredients
        end

        if regularItemsToDelete > 0 then
            user:eraseItem(ingredient.item, regularItemsToDelete, ingredient.data)
        end

        if rareItemsToDelete > 0 then
            rareIngredientBonus = deleteRareItems(user, ingredient, rareItemsToDelete)
        end
    end

    local quality = self:generateQuality(user, productId, toolItem)

    local itemStats = world:getItemStatsFromId(product.item)
    if itemStats.MaxStack == 1 then
        product.data.craftedBy = user.name
    else
        product.data.craftedBy = nil
    end

    local rarity = 0

    local foodItem, foodBuff = self:checkIfFoodItem(productId)

    if foodItem and quality >= 900 then
        rarity = self:generateRarity(user, productId, toolItem, rareIngredientBonus)

        if not foodBuff then
            rarity = common.Limit(rarity, 0, 2)
        end

        if rarity > 1 then
            product.data.rareness = rarity
        end
    end

    for _, selectedRarity in pairs(foodRarityTexts) do
        if rarity == selectedRarity.identifier then
            local nameEnglish = itemStats.English
            local nameGerman = itemStats.German
            common.TempInformNLS(user, "Die Speise '"..nameGerman.."' ist dir "..nameGerman.." gelungen.", "Through your masterful skill, your "..nameEnglish.." ended up being of "..selectedRarity.english.." quality.")
            if foodItem then
                product.data.descriptionDe = selectedRarity.foodDescription.german
                product.data.descriptionEn = selectedRarity.foodDescription.english
            end
            break
        end
    end

    common.CreateItem(user, product.item, product.quantity, quality, product.data)

    for i=1, #product.remnants do
        local remnant = product.remnants[i]
       common.CreateItem(user, remnant.item, remnant.quantity, 333, remnant.data)
    end
end

M.Product = Product
M.Craft = Craft
return M
