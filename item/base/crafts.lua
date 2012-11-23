-- basic function for craft handling
-- Nitram
-- added object orientation by vilarion
-- rewritten for VBU by vilarion

require("base.common")
require("base.lookat")

module("item.base.crafts", package.seeall)

Product = {
            quantity = 1,
            ingredients = {},
            difficulty = 0,
            remnants = {},
}

function Product:new(p)       -- new: constructor
    p = p or {}               -- if p=nil then create an empty list
    setmetatable(p, self)     -- metatable: holds functions of a class. loads product-stuff into this new product p.
    self.__index = self       -- ??
    return p
end


Craft = {
    products = {},
    categories = {},
    skill = nil,

    defaultRaceBonus = {0, 0, 0, 0, 0, 0},

    tool = {},
    activeTool = {},
    toolLink = {},

    defaultFoodConsumption = 500,
    sfx = 0,
    sfxDuration = 0,

    fallbackCraft = nil,
}



-- constructor

--[[
Usage: myCraft = Craft:new{ craftEN = "CRAFT_EN",
                            craftDE = "CRAFT_DE",
                            [leadSkill = SKILL | questStatus = QUEST],
                            [defaultFoodConsumption = FOOD,]
                            [sfx = SFX, sfxDuration = DURATION,]
                            [fallbackCraft = CRAFTWITHSAMEHANDTOOL,]
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
    c.defaultProduct = Product:new{
        foodConsumption = c.defaultFoodConsumption,
    }
    c.userCraft = leadSkill ~= nil
    c.npcCraft = not leadSkill and questStatus ~= nil
    return c
end

function Craft:addTool(itemId)
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

function Craft:addProduct(categoryId, itemId, difficulty, learnLimit, minTime, maxTime, quantity, data)
    difficulty = math.min(difficulty, 100)
    learnLimit = math.min(learnLimit, 100)
    quantity = quantity or 1
    data = data or {}
    
    if categoryId > 0 and categoryId <= #self.categories then
        table.insert(self.products, self.defaultProduct:new{
            ["category"] = categoryId,
            ["item"] = itemId,
            ["difficulty"] = difficulty,
            ["learnLimit"] = learnLimit,
            ["minTime"] = minTime,
            ["maxTime"] = maxTime,
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
            local canWork = self:allowCrafting(user, source) and self:checkMaterial(user, productId)
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
            local skillGain = self:craftItem(user, productId, source)
            if skillGain then
                self:refreshDialog(dialog, user)
            end
            return skillGain
        elseif result == CraftingDialog.playerCraftingAborted then
            self:swapToInactiveItem(user)
        else
            -- user:inform("Dialog closed!")
        end
    end
    local dialog = CraftingDialog(self:getName(user), self.sfx, self.sfxDuration, callback)
    self:loadDialog(dialog, user)
    user:requestCraftingDialog(dialog)
end

--------------------------------------------------------------------------------

function Craft:allowCrafting(user, source)
    if self.userCraft then
        return self:allowUserCrafting(user, source)
    elseif self.npcCraft then
        return self:allowNpcCrafting(user, source)
    end

    return false
end

function Craft:allowUserCrafting(user, source)
    if not self:locationFine(user) then
        return false
    end

    if not base.common.CheckItem(user, source) then
        self:swapToInactiveItem(user)
        return false
    end

    if source:getType() ~= 4 then
        base.common.InformNLS(user,
        "Du musst das Werkzeug in die Hand nehmen um damit zu arbeiten.",
        "To work with that tool you have to hold it in your hand.")
        return false
    end

    if base.common.Encumbrence(user) then
        base.common.InformNLS(user,
        "Deine Râstung hindert dich am arbeiten.",
        "Your armour hinders you from working.")
        self:swapToInactiveItem(user)
        return false
    end

    return true
end

function Craft:allowNpcCrafting(user, source)
    return user:isInRange(source, 2)
end

function Craft:getProductLookAt(user, productId)
    local product = self.products[productId]
    local item = product.item
    local quantity = product.quantity
    local data = product.data
    return base.lookat.GenerateItemLookAtFromId(user, item, quantity, data)
end

function Craft:getIngredientLookAt(user, productId, ingredientId)
    local ingredient = self.products[productId].ingredients[ingredientId]
    local item = ingredient.item
    local quantity = ingredient.quantity
    local data = ingredient.data
    return base.lookat.GenerateItemLookAtFromId(user, item, quantity, data)
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
            if user:getPlayerLanguage() == Player.german then
                dialog:addGroup(category.nameDE)
            else
                dialog:addGroup(category.nameEN)
            end

            categoryListId[i] = listId
            listId = listId + 1
        end
    end

    for i = 1,#self.products do
        local product = self.products[i]
        local productRequirement = product.difficulty
        
        if productRequirement <= skill then
            dialog:addCraftable(i, categoryListId[product.category], product.item, product:getName(user), self:getCraftingTime(product, skill), product.quantity)

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
    if self.userCraft then
        return product:getCraftingTime(skill)
    else
        return product.minTime
    end
end

function Product:getCraftingTime(skill)
    local requirement = self.difficulty
    local learnProgress = (skill - requirement) / (self.learnLimit - requirement) * 100
    local craftingTime = base.common.Scale(self.maxTime, self.minTime, learnProgress)
    craftingTime = math.ceil(craftingTime)
    return craftingTime
end

function Product:getName(user)
    return getItemName(user, self.item, self.data)
end

function getItemName(user, item, data)
    local isGerman = (user:getPlayerLanguage() == Player.german)
    local usedName

    if isGerman then
        usedName = data.nameDe
    else
        usedName = data.nameEn
    end
    
    if base.common.IsNilOrEmpty(usedName) then
        usedName = world:getItemName(item, user:getPlayerLanguage())
    end

    return usedName
end

function Craft:swapToActiveItem(user)
    if self.npcCraft then
        return
    end

    local frontItem = base.common.GetFrontItem(user)
    
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
    frontItem.wear = 3
    world:changeItem(frontItem)
end

function Craft:swapToInactiveItem(user)
    if self.npcCraft then
        return
    end

    local frontItem = base.common.GetFrontItem(user)
    
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

function Craft:checkRequiredFood(user, neededFood, difficulty)
    local requiredFood = neededFood * (0.02*difficulty + 1)
    if base.common.FitForHardWork(user, neededFood*2 + requiredFood) then
        return true, requiredFood
    else
        return false, 0
    end
end

function Craft:getSkill(user)
    if self.userCraft then
        return user:getSkill(self.leadSkill)
    else
        return user:getQuestProgress(self.questStatus)
    end
end

function Craft:checkMaterial(user, productId)
    local product = self.products[productId]

    if product == nil then
        return false
    end

    local materialsAvailable = true
    
    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        local available = user:countItemAt("all", ingredient.item, ingredient.data)
        
        if available < ingredient.quantity then
            materialsAvailable = false
            local ingredientName = getItemName(user, ingredient.item, ingredient.data)

            if available == 0 then
                base.common.InformNLS( user,
                "Dir fehlt "..ingredientName..".",
                "You lack "..ingredientName..".")
            else
                base.common.InformNLS( user,
                "Das Material reicht nicht. Du brauchst mehr "..ingredientName..".",
                "The materials are insufficient. You lack "..ingredientName..".")
            end
        end
    end
    
    return materialsAvailable
end

function Craft:generateQuality(user, productId, toolItem)
    if self.npcCraft then
        return 999
    end
    
    local product = self.products[productId]
    local scalar = (self:getSkill(user) - product.difficulty) / (math.min(100, product.learnLimit) - product.difficulty) * 100
     
    local quality = base.common.Scale(5, 8, scalar)
    local toolQuality = math.floor(toolItem.quality/100)
    
    quality = quality * (math.random() * 0.2 + 0.9)
    quality = quality * (math.random() * 0.2 + 0.9)
    
    quality = quality * base.common.Scale(4, 11, math.floor(toolQuality*11)) / 10 -- Changing lower bounds will make tools matter less
    
    quality = math.floor(quality)
	quality = base.common.Limit(quality, 5, 9)
    
    local durability = 99
    return quality * 100 + durability
end

function Craft:locationFine(user)
    local staticTool = base.common.GetFrontItemID(user)
    if self.activeTool[staticTool] then
        if not self.fallbackCraft then
            base.common.InformNLS(user,
            "Hier arbeitet schon jemand.",
            "Someone is working here already.")
        end
        return false
    elseif not self.tool[staticTool] then
        if not self.fallbackCraft then
            base.common.InformNLS(user,
            "Hier kannst du nicht arbeiten.",
            "You cannot work here.")
        end
        return false
    elseif base.common.GetFrontItem(user).id == 359 and base.common.GetFrontItem(user).quality == 100 then
        if not self.fallbackCraft then
            base.common.InformNLS(user,
            "Aus irgendeinem Grund liefert die Flamme nicht die benoetigte Hitze.",
            "For some reason the flame does not provide the required heat.")
        end
        return false
    end
    
    return true
end

function Craft:craftItem(user, productId, toolItem)
    local product = self.products[productId]
    local skill = self:getSkill(user)
    local skillGain = false
    
    if product.difficulty > skill then
        base.common.InformNLS(user,
        "Du bist nicht fähig genug um das zu tun.",
        "You are not skilled enough to do this.")
        self:swapToInactiveItem(user)
        return
    end
    
    if self.userCraft then
        local foodOK, neededFood = self:checkRequiredFood(user, product.foodConsumption, product.difficulty)
        if not foodOK then
            self:swapToInactiveItem(user)
            return
        end
    end

    if self:checkMaterial(user, productId) then
        self:createItem(user, productId, toolItem)
       
        if self.userCraft then 
            base.common.ToolBreaks(user, toolItem, true)
            base.common.GetHungry(user, neededFood)
            
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

    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
        user:eraseItem(ingredient.item, ingredient.quantity, ingredient.data)
    end

    local quality = self:generateQuality(user, productId, toolItem)

    local itemStats = world:getItemStatsFromId(product.item)
    if itemStats.MaxStack == 1 then
        product.data.craftedBy = user.name
    else
        product.data.craftedBy = nil
    end

    local notCreatedAmount = user:createItem(product.item, product.quantity, quality, product.data)
    local createdEverything = true

    if (notCreatedAmount > 0) then
        createdEverything = false
        world:createItemFromId(product.item, notCreatedAmount, user.pos, true, quality, product.data)
    end

    for i=1, #product.remnants do
        local remnant = product.remnants[i]
        notCreatedAmount = user:createItem(remnant.item, remnant.quantity, 333, remnant.data)
        if (notCreatedAmount > 0) then
            createdEverything = false
            world:createItemFromId(remnant.item, notCreatedAmount, user.pos, true, 333, remnant.data)
        end
    end

    if not createdEverything then
        base.common.InformNLS(user,
        "Du kannst nichts mehr halten.",
        "You cannot carry anything else.")
    end
end
