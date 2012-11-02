-- basic function for craft handling
-- Nitram
-- added object orientation by vilarion
-- changed for VBU by vilarion

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
}



-- constructor

--[[
Usage: myCraft = Craft:new{ craftEN = "CRAFT_EN",
                            craftDE = "CRAFT_DE",
                            leadSkill = SKILL,
                            [defaultFoodConsumption = FOOD,]
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
    self.tool[itemId] = true
end

function Craft:addActiveTool(inactiveItemId, itemId)
    self.activeTool[itemId] = true;
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

function Craft:addProduct(categoryId, itemId, difficulty, learnLimit, deciseconds, quantity, data)
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
            ["time"] = deciseconds,
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

function Craft:showDialog(user)
    local callback = function(dialog)
        local result = dialog:getResult()
        if result == CraftingDialog.playerCrafts then
            local item = dialog:getCraftableIndex()
            local amount = dialog:getCraftableAmount()
            user:inform("Craft " .. amount .. " of item index " .. item)
            local startCrafting = true
            return startCrafting
        elseif result == CraftingDialog.playerLooksAtItem then
            local productId = dialog:getCraftableIndex() + 1
            return getProductLookAt(user, productId)
        elseif result == CraftingDialog.playerLooksAtIngredient then
            local productId = dialog:getCraftableIndex() + 1
            local ingredientId = dialog:getIngredientIndex() + 1
            return self:getIngredientLookAt(user, productId, ingredientId)
        elseif result == CraftingDialog.playerCraftingComplete then
            user:inform("Crafting complete!")
        elseif result == CraftingDialog.playerCraftingAborted then
            user:inform("Crafting aborted!")
        else
            user:inform("Dialog closed!")
        end
    end
    local dialog = CraftingDialog(self:getName(user), callback)
    self:loadDialog(dialog, user)
    user:requestCraftingDialog(dialog)
end

--------------------------------------------------------------------------------

function Craft:getProductLookAt(user, productId)
    local product = self.products[productId]
    local item = product.item;
    local data = product.data;
    return base.lookat.GenerateItemLookAtFromId(user, item, data)
end

function Craft:getIngredientLookAt(user, productId, ingredientId)
    local ingredient = self.products[productId].ingredients[ingredientId]
    local item = ingredient.item;
    local data = ingredient.data;
    return base.lookat.GenerateItemLookAtFromId(user, item, data)
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
    
    for i = 1,#self.categories do
        local category = self.categories[i]
        local categoryRequirement = category.minSkill
        if categoryRequirement and categoryRequirement <= skill then
            if user:getPlayerLanguage() == Player.german then
                dialog:addGroup(category.nameDE)
            else
                dialog:addGroup(category.nameEN)
            end
        end
    end

    for i = 1,#self.products do
        local product = self.products[i]
        local productRequirement = product.difficulty
        
        if productRequirement <= skill then
            dialog:addCraftable(product.category - 1, product.item, product:getName(user), product.time, product.quantity)

            for j = 1, #product.ingredients do
                local ingredient = product.ingredients[j]
                dialog:addCraftableIngredient(ingredient.id, ingredient.quantity)
            end
        end
    end
end

function Product:getName(user)
    local isGerman = (user:getPlayerLanguage() == Player.german)
    local usedName

    if isGerman then
        usedName = self.data.nameDe
    else
        usedName = self.data.nameEn
    end
    
    if base.common.IsNilOrEmpty(usedName) then
        usedName = world:getItemName(self.item, user:getPlayerLanguage())
    end

    return usedName
end

function Craft:SwapToActiveItem( User )
    local frontItem = base.common.GetFrontItem( User );
    if not self.ToolLink[frontItem.id] then
        return
    end
    if not self.Tool[frontItem.id] then
        return
    end
    if self.ActiveTool[frontItem.id] then
        return
    end
    frontItem.id = self.ToolLink[frontItem.id];
    frontItem.wear = 2;
    world:changeItem(frontItem);
end

function Craft:SwapToInactiveItem( User )
    local frontItem = base.common.GetFrontItem( User );
    if not self.ToolLink[frontItem.id] then
        return
    end
    if self.Tool[frontItem.id] then
        return
    end
    if not self.ActiveTool[frontItem.id] then
        return
    end
    if (frontItem.id ~= self.ToolLink[frontItem.id]) then
        frontItem.id = self.ToolLink[frontItem.id];
        frontItem.wear = 255;
        world:changeItem(frontItem);
    end
end

function Craft:checkRequiredFood( User, NeededFood, Difficulty )
    local requiredFood = NeededFood*( 0.02*Difficulty+1 );
    if base.common.FitForHardWork( User, ( NeededFood*2 )+requiredFood ) then
        return true,requiredFood;
    else
        return false,0;
    end
end

function Craft:getSkill(user)
    return user:getSkill(self.leadSkill);
end

function Craft:CheckMaterial( User, ItemID, Step )
    local StepInfos = self.Products[ ItemID ].ProductionSteps[Step];
    if (StepInfos == nil) then
        return false
    end
    if (StepInfos[1] == 0) then
        return true
    end
    local available = User:countItemAt( StepInfos[3], StepInfos[1] );
    if (available < StepInfos[2]) then
        if (self.SecretArt) then
            base.common.InformNLS( User,
            "Dir fehlt ein notwendiges Material.",
            "You do not have a required material ready." );
        elseif (available == 0) then
            base.common.InformNLS( User,
            "Dir fehlt "..world:getItemName( StepInfos[1], Player.german )..".",
            "You lack "..world:getItemName( StepInfos[1], Player.english ).."." );
        else
            base.common.InformNLS( User,
            "Das Material reicht nicht. Du brauchst mehr "..world:getItemName( StepInfos[1], Player.german ),
            "The materials are insufficient. You lack of "..world:getItemName( StepInfos[1], Player.english ) );
        end
        return false;
    end
    return true
end

function Craft:GenerateQuality( User, ItemID, toolItem )
    local Qual = base.common.Scale(5,8,(self:ModifySkill(User,toolItem)-self.Products[ItemID].Difficulty[1])/(math.min(100,self.Products[ItemID].Difficulty[2])-self.Products[ItemID].Difficulty[1])*100);
    stone1, str1, stone2, str2=base.common.GetBonusFromTool(toolItem);
    local step=0;
    local qual_tool=math.floor(toolItem.quality/100);
    if stone1==7 then       -- topas raises quality of product
        step=0.05*str1;
    end
    if stone2==7 then
        step=step+0.05*str2;
    end
    if stone1==5 then       -- bluestone raises tool quality
        qual_tool=qual_tool+0.2*str1;
    end
    if stone2==5 then
        qual_tool=qual_tool+0.2*str2;
    end
    Qual = Qual * (((math.random()+step)*0.2)+0.9);     -- add bonus from bluestone to random result!
    Qual = Qual * (((math.random()+step)*0.2)+0.9);
    Qual = Qual * base.common.Scale(4,11,math.floor(qual_tool*11))/10; --Changing lower bounds will make tools matter less
    Qual = math.floor(Qual);
    Qual = math.max(1,math.min(9,Qual));
    local Dura = base.common.Scale(66,88,(self:ModifySkill(User,toolItem)-self.Products[ItemID].Difficulty[1])/(math.min(100,self.Products[ItemID].Difficulty[2])-self.Products[ItemID].Difficulty[1])*100);
	Dura = 99; -- all produced items will have maximum durability
    return math.min(999,math.max(101,Qual*100+Dura));
end

function Craft:LocationFine( User, ltstate, mode )
    if (self.Tool ~= 0) then
        local StaticTool = base.common.GetFrontItemID( User );
        if ((ltstate ~= Action.success) and (self.ToolLink[StaticTool] ~= StaticTool) and (table.getn(self.ActiveTool) ~= 0)) then
            if self.ActiveTool[StaticTool] then
                if not mode then
                    base.common.InformNLS(User,
                    "Hier arbeitet schon jemand.",
                    "Someone is working here already.");
                    return false
                else
                    return 2,base.common.GetNLS(User,
                    "Hier arbeitet schon jemand.",
                    "Someone is working here already.");
                end
            elseif not self.Tool[StaticTool] then
                if not mode then
                    base.common.InformNLS(User,
                    "Hier kannst du nicht arbeiten.",
                    "You cannot work here.");
                    return false
                else
                    return 1,base.common.GetNLS(User,
                    "Hier kannst du nicht arbeiten.",
                    "You cannot work here.");
                end
            end
        elseif not self.ActiveTool[StaticTool] and not self.Tool[StaticTool] then
            if not mode then
                base.common.InformNLS(User,
                "Hier kannst du nicht arbeiten.",
                "You cannot work here.");
                return false
            else
                return 1,base.common.GetNLS(User,
                "Hier kannst du nicht arbeiten.",
                "You cannot work here.");
            end
        elseif base.common.GetFrontItem( User ).quality < 100 then
            if not mode then
                base.common.InformNLS(User,
                "Das Werkzeug ist kaputt.",
                "The tool is broken.");
                return false
            else
                return 1,base.common.GetNLS(User,
                "Das Werkzeug ist kaputt.",
                "The tool is broken.");
            end
		elseif base.common.GetFrontItem( User ).id==359 and base.common.GetFrontItem( User ).quality==100 then
			if not mode then
                base.common.InformNLS(User,
                "Die Flamme ist nur eine Illusion.",
                "The flame is just an illusion.");
                return false
            else
                return 1,base.common.GetNLS(User,
                "Die Flamme ist nur eine Illusion.",
                "The flame is just an illusion.");
            end
        end
    end
    if not mode then
        return true;
    else
        return 0,"";
    end
end

function Craft:GenerateMenu( User, toolItem )
	if (table.getn(self.Category) == 0) then
        return false;
    end
    local StaticTool = base.common.GetFrontItemID( User );
    local Skill = self:ModifySkill(User,toolItem);
    local subCat=MenuStruct(  );
    for i, Cat in pairs(self.Category) do
        if (Cat.minSkill <= Skill) then
            subCat:addItem( Cat.ItemID );      -- ueberkategorien
        end
    end
    User:sendMenu( subCat );
    return true;
end

function Craft:GenerateItemList( User, Param, toolItem )
    local StaticTool = base.common.GetFrontItemID( User );
    local Skill = self:ModifySkill(User,toolItem);
    local ItemMenu=MenuStruct(  );
    if (table.getn(self.Category) == 0) then
        for i, Item in pairs(self.Products) do
            if (Item.Difficulty[1] <= Skill) then
                ItemMenu:addItem( i );
            end
        end
        User:sendMenu( ItemMenu );
    else
        if ( self.CategoryContent[ Param ] ~= nil ) then
            for i, ItemID in pairs(self.CategoryContent[ Param ]) do
                if (self.Products[ ItemID ].Difficulty[1] <= Skill) then
                    ItemMenu:addItem( ItemID );
                end
            end
            User:sendMenu( ItemMenu );
        end
    end
end

function Craft:IsProduct( ItemId )
	return (self.Products[ ItemId ] ~= nil);
end

function Craft:ToolCreateItem( User, Param, WorkOnItem, ltstate, toolItem )
    local ProduceItem = nil;
    local ItemID;
    local repair = true;

    if (WorkOnItem ~= nil) then
        ItemID = WorkOnItem.id;
        ProduceItem = self.Products[ ItemID ];
    end

    local newItem = false;
    if (ProduceItem == nil) then
        ItemID = Param;
        ProduceItem = self.Products[ ItemID ];
        newItem = true;
    end
    if (ProduceItem == nil) then
        return;
    end
    if (ProduceItem.Difficulty[1] > self:ModifySkill(User,toolItem)) then
        base.common.InformNLS(User,
        "Du bist nicht fähig genug um das zu tun.",
        "You are not skilled enough to do this.");
        return
    end
    local foodOK,neededFood = self:checkRequiredFood( User, ProduceItem.FoodConsumption, ProduceItem.Difficulty[1] );
    if not foodOK then
        return;
    end
    local didSomething = false;
    if newItem then
        if self:CheckMaterial( User, ItemID, 1 ) then
            self:CraftNewItem( User, ItemID, nil, 1, ltstate , toolItem);
            didSomething = true;
        end
    end
    if didSomething and (ltstate == Action.success) then
        base.common.ToolBreaks( User, toolItem, true );
        base.common.GetHungry( User, neededFood );
        --User:learn(self.LeadSkillGroup,self.LeadSkill,2,math.min(100,ProduceItem.Difficulty[2]));
		--Replace with new learn function, see learn.lua 
    end
end

function Craft:CraftNewItem( User, ItemID, WorkOnItem, Step, ltstate, toolItem )
    if (ltstate == Action.none) then
        -- check for free slot in belt
		local foundSlot = false;
		if Step == 1 then
			for i=12,17 do
				if (User:getItemAt(i).id==0) then
					foundSlot = true;
					break;
				end
			end
			if not foundSlot then
				base.common.InformNLS(User,
					"Du hast keinen Platz mehr in deinem Gürtel.",
					"You have no room left in your belt.");
				return;
			end
		end
		User:startAction( self:GenWorkTime( User, ItemID,toolItem ), self.Products[ ItemID ].GfxEffect[1], self.Products[ ItemID ].GfxEffect[2], self.Products[ ItemID ].SfxEffect[1], self.Products[ ItemID ].SfxEffect[2]);
        if (Step == 1) then
            User:talkLanguage(Character.say, Player.german, "#me beginnt zu arbeiten.");
            User:talkLanguage(Character.say, Player.english, "#me starts to work.");
        else
            base.common.InformNLS(User,
				"Du setzt die Arbeit fort.",
				"You continue the work.");
        end
        self:SwapToActiveItem( User );
        return
    end
    dropLeftOver = true;
    local StepInfos = self.Products[ ItemID ].ProductionSteps[Step];
    if (StepInfos[1] ~= 0) then
        User:eraseItem(StepInfos[1],StepInfos[2]);
    end
        
    local ItemQual = 0;
    local ItemCount = 1;
    if (Step == table.getn(self.Products[ ItemID ].ProductionSteps)) then -- Item fertig -> Finale Qualität
        ItemQual = self:GenerateQuality( User, ItemID, toolItem );
        ItemCount = self.Products[ ItemID ].Quantity;
        base.common.InformNLS(User,
            "Du beendest die Arbeit.",
            "You finish the work.");
    else
        ItemQual = math.floor(self.Products[ ItemID ].QualPerStep * Step);
    end
    if (WorkOnItem == nil) then
        local notcreated = User:createItem(ItemID,ItemCount,ItemQual,0);
        if (notcreated ~= 0) then
            world:createItemFromId(ItemID,notcreated,User.pos,true,ItemQual,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You cannot carry anything else.");
        else
            if self:CheckMaterial( User, ItemID, (Step + 1) ) then
                foundMadeItem = false;
                for bodypos=12,17 do
                    CheckItem = User:getItemAt(bodypos);
                    if ((CheckItem.id == ItemID) and (CheckItem.number == ItemCount) and (CheckItem.quality == ItemQual) and (CheckItem.data == 0)) then
                        User:changeTarget(CheckItem);
                        foundMadeItem = true;
                        break;
                    end
                end
                if foundMadeItem then
                    User:startAction( self:GenWorkTime( User, ItemID, toolItem ), self.Products[ ItemID ].GfxEffect[1], self.Products[ ItemID ].GfxEffect[2], self.Products[ ItemID ].SfxEffect[1], self.Products[ ItemID ].SfxEffect[2]);
                    base.common.InformNLS(User,
                        "Du setzt die Arbeit fort.",
                        "You continue the work.");
                else
                    self:SwapToInactiveItem( User );
                end
            else
                self:SwapToInactiveItem( User );
            end
        end
    else
        WorkOnItem.quality = ItemQual;
        WorkOnItem.number = ItemCount;
        world:changeItem(WorkOnItem);
        if self:CheckMaterial( User, ItemID, (Step + 1) ) then
            User:startAction( self:GenWorkTime( User, ItemID, toolItem ), self.Products[ ItemID ].GfxEffect[1], self.Products[ ItemID ].GfxEffect[2], self.Products[ ItemID ].SfxEffect[1], self.Products[ ItemID ].SfxEffect[2]);
            base.common.InformNLS(User,
                "Du setzt die Arbeit fort.",
                "You continue the work.");
            User:changeTarget(User:getItemAt(WorkOnItem.itempos));
        else
            self:SwapToInactiveItem( User );
        end
    end
    if ((self.Products[ ItemID ].LeftOvers[Step] ~= nil) and (dropLeftOver)) then
        local notcreated = User:createItem(self.Products[ ItemID ].LeftOvers[Step][1],self.Products[ ItemID ].LeftOvers[Step][2],333,0);
        if (notcreated ~= 0) then
            world:createItemFromId(self.Products[ ItemID ].LeftOvers[Step][1],notcreated,User.pos,true,333,0);
            base.common.InformNLS(User,
            "Du kannst nichts mehr halten.",
            "You cannot carry anything else.");
        end
    end
end
