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
local craft = require("base.craft")
local lookat = require("base.lookat")
local licence = require("base.licence")
local gems = require("base.gems")
local glypheffects = require("magic.glypheffects")

local OFFSET_PRODUCTS_REPAIR = 235
local repairItemList = {}

--[[productId for craftable items: id in products table.
productId for repairable items position in inventory plus offset. Inventory has 17 positions, max productId = 255
]]--
local REPAIR_RESOURCE_USAGE = 0.3 -- 0-1; 0.5 means: probability to need ingedient for 100% repair
local REPAIR_QUALITY_INCREASE_GENERAL = 0.6 -- probability for quality increase at 100% repair
local REPAIR_QUALITY_INCREASE_KNOWN_CRAFTER = 0.4 -- additional probability for quality increase at 100% repair if item made by player
local DUMMY_MIN_SKILL_REPAIR_ONLY = 200 -- not reachable skill for group 'repair only', need to hide not craftable items

local M = {}

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
        if self:isRepairCategory(categoryId) then
            self.categories[categoryId].minSkill = DUMMY_MIN_SKILL_REPAIR_ONLY
        end

        return self.products[#self.products]
    end

    return nil
end

function Craft:showDialog(user, source)

    if not self:allowCrafting(user, source) then
        if self.fallbackCraft then
            self.fallbackCraft:showDialog(user, source)
        end

        return
    end

    local callback = function(dialog)
        local result = dialog:getResult()
        if result == CraftingDialog.playerCrafts then
            local productId = dialog:getCraftableId()
            if self:isRepairItem(productId) then
                productId = self:findReferenceProductId(user,productId)
            end
            local neededFood = 0
            local foodOK = false
            local product = self.products[productId]
            foodOK, neededFood = self:checkRequiredFood(user, product:getCraftingTime(self:getSkill(user),0))
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
            local skillGain
            if self:isRepairItem(productId) then
                skillGain = self:repairItem(user, productId)
            else
                skillGain = self:craftItem(user, productId)
            end
            if skillGain then
                self:refreshDialog(dialog, user)
            end
            return skillGain
        elseif result == CraftingDialog.playerCraftingAborted then
            self:swapToInactiveItem(user)
        else
            self:swapToInactiveItem(user)
        end
    end
    local dialog = CraftingDialog(self:getName(user), self.sfx, self.sfxDuration, callback)
    self:loadDialog(dialog, user)
    user:requestCraftingDialog(dialog)
end

--------------------------------------------------------------------------------

function Craft:allowCrafting(user, source)
    if not self.npcCraft then
        return self:allowUserCrafting(user, source)
    else
        return self:allowNpcCrafting(user, source)
    end

    return false
end

function Craft:allowUserCrafting(user, source)
    if source:getType() == scriptItem.field and self.tool[source.id] then
        common.TurnTo(user, source.pos)

        if not self:userHasLicense(user) then
            return false
        end

        if not self:isHandToolEquipped(user) then
            local germanTool = world:getItemName(self.handTool, Player.german)
            local englishTool = world:getItemName(self.handTool, Player.english)
            common.HighInformNLS(user,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: " .. germanTool,
            "To work here you have to hold a tool in your hand: " .. englishTool)
            return false
        end
    else
        if not self:locationFine(user) then
            return false
        end

        if not self:userHasLicense(user) then
            return false
        end

        if not self:isHandToolEquipped(user) then
            self:swapToInactiveItem(user)
            common.HighInformNLS(user,
            "Du musst das Werkzeug in die Hand nehmen um damit zu arbeiten.",
            "To work with that tool you have to hold it in your hand.")
            return false
        end
    end

    return true
end

function Craft:userHasLicense(user)
    return not licence.licence(user)
end

function Craft:isHandToolEquipped(user)
    local leftTool = user:getItemAt(Character.left_tool).id
    local rightTool = user:getItemAt(Character.right_tool).id

    if leftTool == self.handTool or rightTool == self.handTool then
        return true
    end

    return false
end

function Craft:getHandToolEquipped(user)
    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == self.handTool then
        return leftTool
    elseif rightTool.id == self.handTool then
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
    local lookAt
    if self:isRepairItem(productId) then
        lookAt = lookat.GenerateLookAt(user, user:getItemAt( productId - OFFSET_PRODUCTS_REPAIR ), 0)
    else
        local product = self.products[productId]
        lookAt = self:getLookAt(user, product)
    end
    return lookAt
end

function Craft:getIngredientLookAt(user, productId, ingredientId)
   local lookAt
    if self:isRepairItem(productId) then
        productId = self:findReferenceProductId(user, productId)
    end
    local ingredient = self.products[productId].ingredients[ingredientId]
    lookAt = self:getLookAt(user, ingredient)
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

function Craft:cleanRepairItemList (user)
    local limitTime = common.GetCurrentTimestamp() - 18000 --5hrs ago
    for _, listEntry in ipairs(repairItemList) do
        if listEntry[1] < limitTime then
            listEntry = nil
        end
    end
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
    local repairListId = listId

    local glyphEffect = 1
    glyphEffect = glypheffects.effectOnCraftingTime(user)
    local gemBonus = self:getCurrentGemBonus(user)
    for i = 1,#self.products do
        local product = self.products[i]
        local productRequirement = product.difficulty

        if productRequirement <= skill and self:isRepairCategory(product.category) == false then

            local craftingTime = self:getCraftingTime(product, skill, gemBonus) * glyphEffect
            dialog:addCraftable(i, categoryListId[product.category], product.item, self:getLookAt(user, product).name, craftingTime, product.quantity)

            for j = 1, #product.ingredients do
                local ingredient = product.ingredients[j]
                dialog:addCraftableIngredient(ingredient.item, ingredient.quantity)
            end
        end
    end


    local repairPositions = {12, 13, 14, 15, 16, 17} -- all belt positions
    local showRepairGroup = false
    local repairSkill = self:getRepairSkill(user)
    local glyphEffect = 1
    local repairItemListSub = {}
    local hasDataRepairItemListSub = false
    for k = 1, #repairPositions do
        local itemAtCharacter = user:getItemAt( repairPositions[k] )
        local itemStats = world:getItemStatsFromId(itemAtCharacter.id)
        local durability = common.getItemDurability(itemAtCharacter)
        if itemStats.MaxStack == 1 then
            for i = 1, #self.products do
                local product = self.products[i]
                local productRequirement = product.difficulty
                local craftingTime = self:getCraftingTime(product, repairSkill, 0)
                if product.item == itemAtCharacter.id and productRequirement <= repairSkill and ((craftingTime * (99 - durability)/99) > 9 or durability < 91 ) then
                    if showRepairGroup == false then
                        dialog:addGroup(user:getPlayerLanguage() == Player.german and "Reparieren" or "Repair")
                        showRepairGroup = true
                        glyphEffect = glypheffects.effectOnRepairTime(user)
                    end
                    craftingTime = craftingTime * glyphEffect * (99 - durability)/99
                    local listPosition = OFFSET_PRODUCTS_REPAIR+repairPositions[k]
                    dialog:addCraftable(listPosition, repairListId, product.item, self:getLookAt(user, product).name, craftingTime, product.quantity)
                    repairItemListSub[listPosition] = {product.item, durability}
                    hasDataRepairItemListSub = true
                    for j = 1, #product.ingredients do
                        local ingredient = product.ingredients[j]
                        dialog:addCraftableIngredient(ingredient.item, ingredient.quantity)
                    end

                end
            end
        end
    end
    self:cleanRepairItemList (user)
    if hasDataRepairItemListSub then
        repairItemListSub[1] = common.GetCurrentTimestamp()
        repairItemList[user.id] = repairItemListSub
    else
        repairItemList[user.id]=nil
    end

end

function Craft:refreshDialog(dialog, user)
    dialog:clearGroupsAndProducts()
    self:loadDialog(dialog, user)
end

function Craft:getCraftingTime(product, skill, gemBonus)
    if not self.npcCraft then
        return product:getCraftingTime(skill, gemBonus)
    else
        return 10 --default time
    end
end

function Product:getCraftingTime(skill,gemBonus)

    local learnProgress

    --This function returns the crafting time, scaled by the price of the item.
    if (self.learnLimit == self.difficulty) then
        learnProgress = 50 --This is a temporary solution until we get "effective" skills beyond 100 as proposed by Bloodraven, see Ars Magica
    else
        learnProgress = (skill - self.difficulty) / (self.learnLimit - self.difficulty) * 100
    end
    local theItem = world:getItemStatsFromId(self.item)
    local minimum = math.max (((30+((self.quantity * theItem.Worth)-200)*(1500-30)/(133300-200))),30) --30: Minimum time; 200: Minimum price; 1500: maximum time; 133300: maximum price
    local craftingTime = common.Scale(minimum * 2, minimum, learnProgress)
    if theItem.MaxStack ~= 1 then
        craftingTime = craftingTime - craftingTime*0.005*gemBonus; -- 36% (lvl3) lead to 18% time saving
    end
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

function Craft:generateQuality(user, productId, toolItem)

    if self.npcCraft then
        return 999
    end

    local product = self.products[productId]
    local scalar

    if product.learnLimit == product.difficulty then
        scalar = 50 --This is a temporary solution until we get "effective" skills beyond 100 as proposed by Bloodraven, see Ars Magica
    else
        scalar = (self:getSkill(user) - product.difficulty) / (math.min(100, product.learnLimit) - product.difficulty) * 100
    end

    local quality = common.Scale(4, 8, scalar)
    local toolQuality = common.getItemQuality(toolItem)
    local gemBonus = tonumber(self:getCurrentGemBonus(user))
    local glyphBonus = glypheffects.effectOnQuality(user) + glypheffects.effectBloodToQuality(user)

    quality = quality + math.random(math.min(0,((toolQuality-5)/2)),math.max(0,((toolQuality-5)/2 ))+ gemBonus/12) + glyphBonus; -- +2 for a perfect tool, -2 for a crappy tool, +1 per each 12% gem Bonus to max

    quality = math.floor(quality)
    quality = common.Limit(quality, 1, common.ITEM_MAX_QUALITY)

    quality = quality + math.random(-1,1); -- Final scatter!
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
        self:swapToInactiveItem(user)
        return false
    end

    local neededFood = 0
    if not self.npcCraft then
        local foodOK = false
        foodOK, neededFood = self:checkRequiredFood(user, product:getCraftingTime(skill,0))
        if not foodOK then
            self:swapToInactiveItem(user)
            return false
        end
    end

    if self:checkMaterial(user, productId) then
        self:createItem(user, productId, toolItem)

        if not self.npcCraft then
            local originalDurability = common.getItemDurability(toolItem)
            if craft.ToolBreaks(user, toolItem, product:getCraftingTime(skill,0)) then
                common.HighInformNLS(user,"Dein altes Werkzeug zerbricht.", "Your old tool breaks.")
            else
                glypheffects.effectToolSelfRepair(user, toolItem, originalDurability)
            end
            common.GetHungry(user, neededFood)
        end

        if type(self.leadSkill) == "number" then
            user:learn(self.leadSkill, product:getCraftingTime(skill,0), product.learnLimit)
            local newSkill = self:getSkill(user)
            skillGain = (newSkill > skill)
        end
    end

    self:swapToInactiveItem(user)

    return skillGain
end

function Craft:createItem(user, productId, toolItem)
    local product = self.products[productId]

    for i = 1, #product.ingredients do
        if not glypheffects.effectSaveMaterialOnProduction(user) then
            local ingredient = product.ingredients[i]
            user:eraseItem(ingredient.item, ingredient.quantity, ingredient.data)
        end
    end

    local quality = self:generateQuality(user, productId, toolItem)

    local itemStats = world:getItemStatsFromId(product.item)
    if itemStats.MaxStack == 1 then
        product.data.craftedBy = user.name
    else
        product.data.craftedBy = nil
    end

    common.CreateItem(user, product.item, product.quantity, quality, product.data)

    for i=1, #product.remnants do
        local remnant = product.remnants[i]
       common.CreateItem(user, remnant.item, remnant.quantity, 333, remnant.data)
    end
end

function Craft:repairItem(user, productIdList)
    local productId = self:findReferenceProductId(user, productIdList)
    local product = self.products[productId]
    local itemToRepair = user:getItemAt( productIdList - OFFSET_PRODUCTS_REPAIR )
    local skill = self:getSkill(user)
    local repairSkill = self:getRepairSkill(user)
    local repairTime = product:getCraftingTime(skill,0) * (99 - common.getItemDurability(itemToRepair))/99

    local skillGain = false

    local toolItem = self:getHandToolEquipped(user)
    if itemToRepair.id ~= repairItemList[user.id][productIdList][1] or common.getItemDurability(itemToRepair) ~= repairItemList[user.id][productIdList][2] then
    common.HighInformNLS(user,
        "[Info] Bitte tausche die Gegenstände in deinem Inventar nicht während der Reparatur.",
        "[Info] Please don't move items in your inventory during the repair.")
        return false
    end
    if product.difficulty > repairSkill then  -- safty grid
        common.HighInformNLS(user,
        "Du bist nicht fähig genug um das zu tun.",
        "You are not skilled enough to do this.")
        self:swapToInactiveItem(user)
        return false
    end

    if common.getItemDurability(itemToRepair) == 99 then  -- safty grid
        common.InformNLS(user,
        "Du findest nichts, was du an dem Werkstück reparieren könntest.",
        "There is nothing to repair on that item.")
        return false
    end

    local neededFood = 0
    if not self.npcCraft then
        local foodOK = false
        foodOK, neededFood = self:checkRequiredFood(user, repairTime)
        if not foodOK then
            self:swapToInactiveItem(user)
            return false
        end
    end

    if self:checkMaterial(user, productId) then
        self:createRepairedItem(user, productId, itemToRepair)

        if not self.npcCraft then
            local originalDurability = common.getItemDurability(toolItem)
            if craft.ToolBreaks(user, toolItem, repairTime) then
                common.HighInformNLS(user,"Dein altes Werkzeug zerbricht.", "Your old tool breaks.")
            else
                glypheffects.effectToolSelfRepair(user, toolItem, originalDurability)
            end
            common.GetHungry(user, neededFood)
        end

        if type(self.leadSkill) == "number" then
            user:learn(self.leadSkill, repairTime, product.learnLimit)
            local newSkill = self:getSkill(user)
            skillGain = (newSkill > skill)
        end
    end

    self:swapToInactiveItem(user)

    return skillGain
end

function Craft:createRepairedItem(user, productId, itemToRepair)
    local product = self.products[productId]
    local itemDamage = (100 - common.getItemDurability(itemToRepair))/100
    local quality = common.getItemQuality(itemToRepair)
    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        if math.random() < itemDamage * REPAIR_RESOURCE_USAGE then
            if not glypheffects.effectSaveMaterialOnRepair(user) then
                user:eraseItem(ingredient.item, ingredient.quantity, ingredient.data)
            end
        end
    end

    local bestQuality = itemToRepair:getData("qualityAtCreation")
    local repairQualityIncrease
    local glyphBonus = 0
    if common.IsNilOrEmpty(bestQuality) then
        itemToRepair:setData("qualityAtCreation", quality)
    else
        if (quality < tonumber(bestQuality)) then
            glyphBonus = glypheffects.effectOnUserRepairQuality(user,itemToRepair)
            if Craft:isKnownCrafter(itemToRepair) then
                repairQualityIncrease = REPAIR_QUALITY_INCREASE_GENERAL + REPAIR_QUALITY_INCREASE_KNOWN_CRAFTER + glyphBonus
            else
                repairQualityIncrease = REPAIR_QUALITY_INCREASE_GENERAL + glyphBonus
            end
            if (math.random() < itemDamage * repairQualityIncrease) then
                quality = quality +1
                common.InformNLS(user,
                "Dir gelingt es, die Qualität des Gegenstands "..world:getItemName(itemToRepair.id,Player.german).." etwas zu verbessern.",
                "You have succeeded in improving the quality of the item "..world:getItemName(itemToRepair.id,Player.english)..".")
            else
                common.InformNLS(user,
                "Du reparierst "..world:getItemName(itemToRepair.id,Player.german)..".",
                "You repair "..world:getItemName(itemToRepair.id,Player.english)..".")
            end
        else
            common.InformNLS(user,
            "Du reparierst "..world:getItemName(itemToRepair.id,Player.german)..".",
            "You repair "..world:getItemName(itemToRepair.id,Player.english)..".")
        end
    end

    itemToRepair.quality = common.calculateItemQualityDurability(quality, common.ITEM_MAX_DURABILITY)
    world:changeItem(itemToRepair)
end

function Craft:isKnownCrafter(item)
    if not common.IsNilOrEmpty(item:getData("craftedBy")) then
        return true
    end
    if not common.IsNilOrEmpty(item:getData("nameEn")) then
        return true
    end
    if not common.IsNilOrEmpty(item:getData("descriptionEn")) then
        return true
    end
    return false
end

function Craft:findReferenceProductId(user, productId)
    if self:isRepairItem(productId) then
        local itemAtCharacter = user:getItemAt( productId - OFFSET_PRODUCTS_REPAIR )
        for i = 1, #self.products do
            local product = self.products[i]
            if product.item == itemAtCharacter.id then
                return i
            end
        end
    else
        return productId
    end
    return 0
end

function Craft:getRepairSkill(user)
    local repairSkill = self:getSkill(user) + tonumber (self:getCurrentGemBonus(user))
    return repairSkill
end

function Craft:isRepairItem(productId)
    if productId > OFFSET_PRODUCTS_REPAIR then
        return true
    end
return false
end

function Craft:isRepairCategory(categoryId)
    if self.categories[categoryId].nameEN == "repair only" then
        return true
    end
    return false
end

M.Product = Product
M.Craft = Craft
return M
