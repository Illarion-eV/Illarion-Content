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

    handTool = 0,
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
                            handTool = ID,
                            [leadSkill = SKILL | leadSkill = function(user)],
                            [defaultFoodConsumption = FOOD,]
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
    c.defaultProduct = Product:new{
        foodConsumption = c.defaultFoodConsumption,
    }
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
			local neededFood = 0
			local foodOK = false
			local product = self.products[productId]
			foodOK, neededFood = self:checkRequiredFood(user, product.foodConsumption, product.difficulty)
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
        base.common.TurnTo(user, source.pos)
        if not self:isHandToolEquipped(user) then
            local germanTool = world:getItemName(self.handTool, Player.german)
            local englishTool = world:getItemName(self.handTool, Player.english)
            base.common.HighInformNLS(user,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: " .. germanTool,
            "To work here you have to hold a tool in your hand: " .. englishTool)
            return false
        end
    else
        if not self:locationFine(user) then
            return false
        end

        if not self:isHandToolEquipped(user) then
            self:swapToInactiveItem(user)
            base.common.HighInformNLS(user,
            "Du musst das Werkzeug in die Hand nehmen um damit zu arbeiten.",
            "To work with that tool you have to hold it in your hand.")
            return false
        end
    end

    return true
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
    local lookAt = base.lookat.GenerateItemLookAtFromId(user, item, quantity, data)
    
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

	local zero=true;

    for i = 1,#self.products do
        local product = self.products[i]
        local productRequirement = product.difficulty
        
        if productRequirement <= skill then
			
			local continue = true;
			--[[if isTestserver() then
				
				Don't delete this. It's necessary for the unique items.

				local special = product.data.RareWeapon;
				if(special==nil) then
					special = product.data.RareArmour;
				end

				if special~=nil then
					special=tonumber(special);
					if not RareItems(user,product.item,-special) then
						continue=false;
					elseif(zero) then
						zero=false;
						if user:getPlayerLanguage() == Player.german then
							dialog:addGroup(self.categories[#self.categories].nameDE)
						else
							dialog:addGroup(self.categories[#self.categories].nameEN)
						end

						categoryListId[#self.categories] = listId;
						listId = listId + 1;
					end
				end

			end]]

			if(continue) then
				dialog:addCraftable(i, categoryListId[product.category], product.item, self:getLookAt(user, product).name, self:getCraftingTime(product, skill), product.quantity)

				for j = 1, #product.ingredients do
					local ingredient = product.ingredients[j]
					dialog:addCraftableIngredient(ingredient.item, ingredient.quantity)
				end
			end
        end
    end
end

function RareItems(user, comparisonid, dataId)

	local itemsOnChar = {};
	for i=17,0,-1 do 
		local item = user:getItemAt(i);
		local itemId = item.id
		if (itemId > 0) then
			if itemId==comparisonid then
				if (tonumber(item:getData("RareArmour"))==dataId) then
					return true;
				elseif (tonumber(item:getData("RareWeapon"))==dataId) then
					return true
				end
            end
		end
	end

	return false;
end

function Craft:refreshDialog(dialog, user)
    dialog:clearGroupsAndProducts()
    self:loadDialog(dialog, user)
end

function Craft:getCraftingTime(product, skill)
    if not self.npcCraft then
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
    frontItem.wear = 2
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
    
    for i = 1, #product.ingredients do
        local ingredient = product.ingredients[i]
		local available = user:countItemAt("all", ingredient.item, ingredient.data)
        
        if available < ingredient.quantity then
            materialsAvailable = false
            local ingredientName = self:getLookAt(user, ingredient).name

            if available == 0 then
                base.common.HighInformNLS( user,
                "Dir fehlt: "..ingredientName..".",
                "You lack: "..ingredientName..".")
            else
                base.common.HighInformNLS( user,
                "Das Material reicht nicht. Dir fehlt: "..ingredientName..".",
                "The materials are insufficient. You lack: "..ingredientName..".")
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
     
    local quality = base.common.Scale(4, 8, scalar)
    local toolQuality = math.floor(toolItem.quality/100)
    
    quality = quality + math.random(math.min(0,((toolQuality-5)/2)),math.max(0,((toolQuality-5)/2))); -- +2 for a perfect tool, -2 for a crappy tool
	    
    quality = math.floor(quality)
	quality = base.common.Limit(quality, 1, 9)
	
	quality = quality + math.random(-1,1); -- Final scatter!
	quality = base.common.Limit(quality, 1, 9)
	    
    local durability = 99
    return quality * 100 + durability
	
end

function Craft:locationFine(user)

    self:turnToTool(user)

    local staticTool = base.common.GetFrontItemID(user)
    if self.activeTool[staticTool] then
        if not self.fallbackCraft then
            base.common.HighInformNLS(user,
            "Hier arbeitet schon jemand.",
            "Someone is working here already.")
        end
        return false
    elseif not self.tool[staticTool] then
        if not self.fallbackCraft then
            local germanTool = world:getItemName(self.defaultTool, Player.german)
            local englishTool = world:getItemName(self.defaultTool, Player.english)
            base.common.HighInformNLS(user,
            "Du stehst nicht neben dem benötigten Werkzeug: " .. germanTool,
            "There is no " .. englishTool .. " close by to work with.")
        end
        return false
    elseif base.common.GetFrontItem(user).id == 359 and base.common.GetFrontItem(user).quality == 100 then
        if not self.fallbackCraft then
            base.common.HighInformNLS(user,
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
        local staticTool = base.common.GetFrontItemID(user, right)

        if self.tool[staticTool] then
            user:turn(right)
            return true
        end

        staticTool = base.common.GetFrontItemID(user, left)

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
        base.common.HighInformNLS(user,
        "Du bist nicht fähig genug um das zu tun.",
        "You are not skilled enough to do this.")
        self:swapToInactiveItem(user)
        return false
    end
    
    local neededFood = 0
    if not self.npcCraft then
        local foodOK = false
        foodOK, neededFood = self:checkRequiredFood(user, product.foodConsumption, product.difficulty)
        if not foodOK then
            self:swapToInactiveItem(user)
            return false
        end
    end

    if self:checkMaterial(user, productId) then
        self:createItem(user, productId, toolItem)
       
        if not self.npcCraft then 
            base.common.ToolBreaks(user, toolItem, true)
            base.common.GetHungry(user, neededFood)
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
        base.common.HighInformNLS(user,
        "Du kannst nichts mehr halten.",
        "You cannot carry anything else.")
    end
end
