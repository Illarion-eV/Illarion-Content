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
local pyr = require("magic.arcane.enchanting.effects.pyr")
local daear = require("magic.arcane.enchanting.effects.daear")
local ilyn = require("magic.arcane.enchanting.effects.ilyn")
local magic = require("base.magic")
local bottles = require("item.bottles")
local antiTroll = require("magic.base.antiTroll")


local M = {}

local itemsWithRemnants = {
    -- Instead of having to add a remnant each time an item that should have one is in a recipe,
    -- this list means we only have to put the remnant in once and no one will forget to add the corresponding remnant anymore.
    -- Also necessary in order for the script to know when a remnant is to not be given due to daear procs.
    -- Exceptions: A list of final product IDs that use an ingredient with a remnant but shouldn't, such as bucket of water having both the bucket and water used in dye-making.
        {id = Item.lampOil, remnant = Item.oilBottle},
        {id = Item.bucketOfWater, remnant = Item.bucket, exceptions = {Item.blackDye, Item.greenDye, Item.blueDye, Item.redDye, Item.yellowDye, Item.whiteDye}},
        {id = Item.blackDye, remnant = Item.bucket},
        {id = Item.greenDye, remnant = Item.bucket},
        {id = Item.blueDye, remnant = Item.bucket},
        {id = Item.redDye, remnant = Item.bucket},
        {id = Item.yellowDye, remnant = Item.bucket},
        {id = Item.whiteDye, remnant = Item.bucket},
        {id = Item.bottleOfInk, remnant = Item.emptyInkBottle},
        {id = Item.beeHoney, remnant = Item.emptyHoneyJar},
        {id = Item.firewaspHoney, remnant = Item.emptyHoneyJar},
        {id = Item.eggSalad, remnant = Item.soupBowl},
        {id = Item.bottleOfBlackberryJuice, remnant = Item.emptyJuiceBottle},
        {id = Item.bottleOfStrawberryJuice, remnant = Item.emptyJuiceBottle},
        {id = Item.blueberryJuice, remnant = Item.emptyJuiceBottle},
        {id = Item.cloudberryJuice, remnant = Item.emptyJuiceBottle},
        {id = Item.raspberryJuice, remnant = Item.emptyJuiceBottle},
        {id = Item.deerberryJuice, remnant = Item.emptyJuiceBottle},
        {id = Item.elderberryJuice, remnant = Item.emptyJuiceBottle},
        {id = Item.bottleOfCabbageJuice, remnant = Item.vegetableJuiceBottle},
        {id = Item.bottleOfCarrotJuice, remnant = Item.vegetableJuiceBottle},
        {id = Item.bellpepperJuice, remnant = Item.vegetableJuiceBottle},
        {id = Item.cucumberJuice, remnant = Item.vegetableJuiceBottle},
        {id = Item.pumpkinJuice, remnant = Item.vegetableJuiceBottle},
        {id = Item.tomatoJuice, remnant = Item.vegetableJuiceBottle},
        {id = Item.bottleOfGrapeJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.bottleOfOrangeJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.bottleOfTangerineJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.bottleOfBananaJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.appleJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.cherryJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.pearJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.mangoJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.peachJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.plumJuice, remnant = Item.fruitJuiceBottle},
        {id = Item.pineappleJuice, remnant = Item.fruitJuiceBottle}
    }

for _, bottle in pairs(bottles.bottles) do -- Since bottles conveniently already have the remnants listed, we just add that to the list using the existing one
    table.insert(itemsWithRemnants, {id = bottle.full[1], remnant = bottle.empty[1]}) -- The bottle is always listed first, the rest are serving jugs and such that are not used in crafting
end

M.itemsWithRemnants = itemsWithRemnants -- for use in construction

local function checkRequiredMana(user, craftingTime, isPortalBookCrafting) -- Portal book creation uses the standard craft script to create the books, but requires mana consumption

    if not isPortalBookCrafting then
        return true, 0
    end

    local manaConsumption = craftingTime * 5 --One second crafting, 50 mana cost

    manaConsumption = magic.getValueWithGemBonus(user, manaConsumption)

    if magic.hasSufficientMana(user, manaConsumption) then
        return true, manaConsumption
    else
        user:inform("Du hast nicht genug Mana, um das Buch mit der erforderlichen Raum-Magie zu durchdringen.", "You do not have enough mana to imbue the book with the required spatial magic.")
        return false, 0
    end

end

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
            difficulty = 0
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
    c.defaultProduct = Product:new{}
    return c
end

function Craft:addTool(itemId)
    if not self.defaultTool then
        self.defaultTool = itemId
    end

    self.tool[itemId] = true
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
            ["ingredients"] = {}
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
            local manaOk = checkRequiredMana(user, product:getCraftingTime(self:getSkill(user)), self.leadSkill == Character.spatialMagic)
            local canWork = self:allowCrafting(user, source) and self:checkMaterial(user, productId) and foodOK and manaOk
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

local function getPortalBookName(user, product)

    if not common.IsNilOrEmpty(product.data.destinationCoordsZ) then
        for _, portalSpot in pairs(antiTroll.portals) do
            if portalSpot.location.z == product.data.destinationCoordsZ and portalSpot.location.x == product.data.destinationCoordsX and portalSpot.location.y == product.data.destinationCoordsY then
                return common.GetNLS(user,portalSpot.nameDe, portalSpot.nameEn)
            end
        end
    end

    return false

end

function Craft:getProductLookAt(user, productId)
    local product = self.products[productId]
    local lookAt = self:getLookAt(user, product)

    local newName = getPortalBookName(user, product) -- Custom name if portal book

    if newName then
        lookAt.name = newName
    end

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

            local name = getPortalBookName(user, product)
            if not name then
                name = self:getLookAt(user, product).name
            end

            local craftingTime = self:getCraftingTime(product, skill)
            dialog:addCraftable(i, categoryListId[product.category], product.item, name, craftingTime, product.quantity)

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

local function deleteRareItems(user, ingredient, rareItemsToDelete, amountOfIngredients, index, toSave)

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

            if toSave <= 0 then --failsafe in case negative numbers ever reach here, which they should not to begin with
                toSave = 0
            end

            if toSave >= deleteAmount then --Check that not all ingredients are saved here
                user:eraseItem(ingredient.item, deleteAmount - toSave, data)
            end

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

    -- if in the future more than cooking gets a rarity, this must be altered as items with a max stack of 1 already get a quality upgrade chance via pyr
    local guaranteedOneRarity = pyr.upQuality(user)

    -- This gives pyr a purpose in cooking too. Only people already capable of making perfect items will be able to proc it, so no pyr will be wasted and no low dex crafters can bypass the dex requirement for high rarity items.

    -- Proccing pyr in cooking will also be exceedingly rare since it only has a chance to proc when you make a perfect item, ensuring the rarity of... well, rarity.

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

    if retVal < 4 and guaranteedOneRarity then
        retVal = retVal + 1
    end

    return retVal

end

function Craft:checkIfFoodItem(productId)

    local product = self.products[productId]

    if foodScript.foodList[product.item] and foodScript.foodList[product.item].crafted then
        return true
    end

    return false

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

    if quality < common.ITEM_MAX_QUALITY then
        local maxStack = world:getItemStatsFromId(productId).MaxStack
        if maxStack == 1 and pyr.upQuality(user) then -- only items with a max stack of 1 have a quality to increase
            quality = quality + 1
        end
    end

    local durability = common.ITEM_MAX_DURABILITY
    return common.calculateItemQualityDurability(quality, durability)

end

function Craft:locationFine(user)

    self:turnToTool(user)

    local staticTool = common.GetFrontItemID(user)
    if not self.tool[staticTool] then
        if not self.fallbackCraft then
            local germanTool = world:getItemName(self.defaultTool, Player.german)
            local englishTool = world:getItemName(self.defaultTool, Player.english)
            common.HighInformNLS(user,
            "Du stehst nicht neben dem benötigten Werkzeug: " .. germanTool,
            "There is no " .. englishTool .. " close by to work with.")
        end
        return false
    elseif common.GetFrontItem(user).id == 359 and common.GetFrontItem(user).quality == 100 then
        if not self.fallbackCraft then
            common.HighInformNLS(user,
            "Aus irgendeinem Grund liefert die Flamme nicht die benötigte Hitze.",
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
        "Du bist nicht fähig genug um das zu tun.",
        "You are not skilled enough to do this.")
        return false
    end

    local foodOK, neededFood = self:checkRequiredFood(user, product:getCraftingTime(skill))

    local manaOk, neededMana = checkRequiredMana(user, product:getCraftingTime(skill), self.leadSkill == Character.spatialMagic)

    if not self.npcCraft then
        if not foodOK or not manaOk then
            return false
        end
    end

    if self:checkMaterial(user, productId) then
        self:createItem(user, productId, toolItem)

        if not self.npcCraft then
            shared.toolBreaks(user, toolItem, product:getCraftingTime(skill))
            common.GetHungry(user, neededFood)
            user:increaseAttrib("mana", -neededMana) -- This defaults to 0 needed mana if not portal book crafting
        end

        if type(self.leadSkill) == "number" then
            user:learn(self.leadSkill, product:getCraftingTime(skill), product.learnLimit)
            local newSkill = self:getSkill(user)
            skillGain = (newSkill > skill)
        end
    end

    return skillGain
end

local function getTotalQuantity(product)

    local retval = 0

    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        retval = retval + ingredient.quantity
    end

    return retval
end

local function checkForRemnantException(product, exceptions)

    for _, exception in pairs(exceptions) do
        if exception == product then
            return true
        end
    end

    return false

end


function Craft:createItem(user, productId, toolItem)
    local product = self.products[productId]
    product.data.descriptionDe = ""
    product.data.descriptionEn = "" -- reset descriptions, same reasoning as below
    product.data.rareness = "" -- reset rarity or else it creates the most recent result of the rarity calculation even if not a perfect item

    local rareIngredientBonus = 0
    local amountOfIngredients = #product.ingredients
    local ingredientSaved = false

    local itemsToReturnAsRemnants = {}

    for i = 1, amountOfIngredients do

        local ingredient = product.ingredients[i]
        local regularIngredients = user:countItemAt("all", ingredient.item, ingredient.data)
        local totalToDelete = ingredient.quantity
        local regularItemsToDelete
        local rareItemsToDelete = 0
        local toSave = 0

        local chance = 1/amountOfIngredients -- equal chance for each ingredient involved to be the one saved

        if not self.npcCraft and not ingredientSaved then -- Did the glyph proc and has the proc not already been used by a previous ingredient? Does not apply to npc crafts
            if math.random() <= chance or i == amountOfIngredients then -- equal chance that each ingredient is picked to roll for the save, if its the last ingredient and none were picked before it picks that
                local saveIngredient = daear.saveResource(user, world:getItemStatsFromId(ingredient.item).Level, getTotalQuantity(product), totalToDelete)
                if saveIngredient then
                    toSave = math.ceil(totalToDelete/5) --possible to save up to 1 resource per 5 required of it. EG if a recipe requires 46-50 pins, you get 10 instead of just 1 in return.
                    ingredientSaved = true
                end
            end
        end

        for _, remnant in pairs(itemsWithRemnants) do -- If the item has a corresponding remnant item, it gets added to the list for later
            if ingredient.item == remnant.id and (totalToDelete - toSave > 0) and (not remnant.exceptions or not checkForRemnantException(product.item, remnant.exceptions)) then
                table.insert(itemsToReturnAsRemnants, { id = remnant.remnant, amount = totalToDelete - toSave}) -- If the glyph saves any, the -toSave ensures that we dont return extra remnant items
            end
        end

        if regularIngredients >= totalToDelete then -- Prioritises consuming normal items over rare ones
            regularItemsToDelete = totalToDelete
        else
            regularItemsToDelete = regularIngredients
            rareItemsToDelete = totalToDelete-regularIngredients
        end

        if regularItemsToDelete > 0 then

            if toSave < regularItemsToDelete then --Check for recipes where there is only one ingredient and it got saved
                user:eraseItem(ingredient.item, regularItemsToDelete - toSave, ingredient.data) -- delete the ingredients minus the ones to be saved
            end

            toSave = toSave - regularItemsToDelete

        end

        if rareItemsToDelete > 0 then
            rareIngredientBonus = deleteRareItems(user, ingredient, rareItemsToDelete, amountOfIngredients, i, toSave)
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

    local foodItem = self:checkIfFoodItem(productId)

    if foodItem and quality >= 900 then
        rarity = self:generateRarity(user, productId, toolItem, rareIngredientBonus)

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

    if not self.npcCraft  and ilyn.duplicateItem(user, world:getItemStatsFromId(product.item).Level) then --Important to check for npcCraft, we dont want it to proc for magic gem combination
        common.CreateItem(user, product.item, product.quantity, quality, product.data)
    end

    for _, remnant in pairs(itemsToReturnAsRemnants) do
        common.CreateItem(user, remnant.id, remnant.amount, 333, {})
    end

end

M.Product = Product
M.Craft = Craft
return M
