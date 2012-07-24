-- basic function for craft handling
-- Nitram
-- added object orientation by vilarion
require("base.common")

module("item.base.crafts", package.seeall)

-- ## NOTE: replaced os.time() with 123456789


notRepairable = { 1 };
--notRepairable = {1858, 1840, 92, 224, 1001, 399, 2647, 393, 2031};

Product = {
            Quantity = 1,
            ProductionSteps = { },
            Difficulty = 0,
            LeftOvers = { },
            FailLeftOvers = { },
            UseDataToWork = { };
    };


function Product:new( p )       -- new: constructor
    p = p or {};                -- if p=nil then create an empty list
    setmetatable( p, self );    -- metatable: holds functions of a class. loads product-stuff into this new product p.
    self.__index = self;        -- ??
    math.randomseed( 123456789 );
    return p;
end


Craft   = {
            Products = { },
            CategoryContent = { },
            Category = { },
            --GfxEffect = { },
            --SfxEffect = { },
            Skillname = "",

            SecretArt = false,

            DefaultRaceBonus = { 0, 0, 0, 0, 0, 0 },

            Tool = {  },
            ActiveTool = {  },
            ToolLink = {  },

            DefaultRepair = false,

            DefaultFoodConsumption = 500,

            DefaultTimePerStep = { 0, 0 },

            DefaultGfx = { 0, 0 },
            DefaultSfx = { 0, 0 },

            Interrupt_Messages = {  },

          };



-- constructor

--[[
Usage: myCraft = Craft:new{ LeadAttrib = "LEADATTRIB",
                            LeadSkill = "SKILL",
                            LeadSkillGroup = "GROUP",
                            [DefaultFoodConsumption = FOOD,]
                            [SecretArt = true,]
                            [DefaultTimePerStep = { TIME1, TIME2 },]
                            [DefaultRepair = true,]
                            [DefaultGfx = { GFXID, TIME },]
                            [DefaultSfx = { SFXID, TIME },]
                          };
--]]

function Craft:new( c )
    c = c or {};
    setmetatable( c, self );
    self.__index = self;
    c.Products = { };
    c.CategoryContent = { };
    c.Category = { };
    c.Tool = {  };
    c.ActiveTool = {  };
    c.ToolLink = {  };
    c.Interrupt_Messages = {  };
    c.DefaultProduct = Product:new{
        TimePerStep = c.DefaultTimePerStep,
        FoodConsumption = c.DefaultFoodConsumption,
        Repairable = c.DefaultRepair,
        GfxEffect = c.DefaultGfx,
        SfxEffect = c.DefaultSfx
    };
    math.randomseed( 123456789 );
    return c;
end


function Craft:AddTool( ItemID )
    self.Tool[ItemID] = true;
end


function Craft:AddActiveTool( InactiveItemID, ItemID )
    self.ActiveTool[ItemID] = true;
    self.ToolLink[ItemID]=InactiveItemID;
    self.ToolLink[InactiveItemID]=ItemID;
end

function Craft:AddCategory( ItemID )
    local CatID = table.getn(self.Category) + 1;
    self.Category[ CatID ] = { ["ItemID"] = ItemID, ["minSkill"] = 0 };
    return CatID;
end


function Product:AddProductionSteps( ItemList, Amount, LeftOvers, FailLeftOvers, UseDataToWork )
    local offset = table.getn(self["ProductionSteps"]);
    for i=1,Amount do
        self["ProductionSteps"][offset+i] = ItemList;
        self["LeftOvers"][offset+i] = LeftOvers;
        self["FailLeftOvers"][offset+i] = FailLeftOvers;
        self["UseDataToWork"][offset+i] = UseDataToWork;
    end;
    self["QualPerStep"] = 100 / table.getn(self["ProductionSteps"]);
end

function Product:AddDummySteps( Amount )
    self:AddProductionSteps( {0, 0, "belt"}, Amount, nil, nil, false );
end

function Craft:AddProduct( CatID, ItemID, Difficulty, Quantity, TimePerStep, Repairable )
    if (self.Products[ ItemID ] == nil) then
        self.Products[ ItemID ] = self.DefaultProduct:new{
            ["LeftOvers"] = { },
            ["FailLeftOvers"] = { },
            ["ProductionSteps"] = { },
            ["UseDataToWork"] = { },
            ["Difficulty"] = Difficulty,
            ["Quantity"] = Quantity,
            ["TimePerStep"] = TimePerStep,
        };
        if( Repairable ~= nil ) then
            self.Products[ ItemID ]["Repairable"] = Repairable;
        end;
    end;
    if (CatID ~= 0) then
        if (self.CategoryContent[ self.Category[ CatID ].ItemID ] == nil) then
            self.CategoryContent[ self.Category[ CatID ].ItemID ] = { };
        end
        table.insert(self.CategoryContent[ self.Category[ CatID ].ItemID ],ItemID);
        if (table.getn(self.CategoryContent[ self.Category[ CatID ].ItemID ]) == 1) then
            self.Category[ CatID ].minSkill = Difficulty[1];
        else
            self.Category[ CatID ].minSkill = math.min(self.Category[ CatID ].minSkill,Difficulty[1]);
        end
    end
    return self.Products[ ItemID ];
end

function Craft:AddInterruptMessage(gText,eText)
    table.insert(self.Interrupt_Messages,{["german"] = gText,["english"] = eText});
end




--------------------------------------------------------------------------------

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

function Craft:ModifySkill( User,toolItem )
    local Skill = User:getSkill(self.LeadSkill);
    local Attrib = User:increaseAttrib(self.LeadAttrib,0);
    stone1, str1, stone2, str2=base.common.GetBonusFromTool(toolItem);
    local step=0;
    if stone1==3 then       -- ruby raises skill
        step=str1;
    end
    if stone2==3 then
        step=step+str2;
    end
    Skill=Skill+step;
    --User:inform("ModifySkill: "..Skill * base.common.Scale(0.5,1.5,Attrib*5));
    return math.min(100,math.max(0,Skill * base.common.Scale(0.5,1.5,Attrib*5)));
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
            base.common.TempInformNLS( User,
            "Dir fehlt ein notwendiges Material.",
            "You do not have a required material ready." );
        elseif (available == 0) then
            base.common.TempInformNLS( User,
            "Dir fehlt "..world:getItemName( StepInfos[1], Player.german )..".",
            "You lack "..world:getItemName( StepInfos[1], Player.english ).."." );
        else
            base.common.TempInformNLS( User,
            "Das Material reicht nicht. Du brauchst mehr "..world:getItemName( StepInfos[1], Player.german ),
            "The materials are insufficient. You lack of "..world:getItemName( StepInfos[1], Player.english ) );
        end
        return false;
    end
    return true
end

function Craft:checkSuccess( User, ItemID,toolItem )
    local Chance = base.common.Scale(60,96,(self:ModifySkill(User,toolItem)-self.Products[ItemID].Difficulty[1])/(self.Products[ItemID].Difficulty[2]-self.Products[ItemID].Difficulty[1])*100);
    --User:inform("Erfolgschance: "..Chance);
    if (math.random()*100 > Chance) then
        return false;
    else
        return true;
    end
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
   --[[ step=0;
    if stone1==2 then       -- smaragd raises durability of product
        step=0.05*str1;
    end
    if stone2==2 then
        step=step+0.05*str2;
    end
    Dura = Dura * (((math.random()+step)*0.2)+0.9);
    Dura = Dura * (((math.random()+step)*0.2)+0.9);
    Dura = Dura * base.common.Scale(4,11,math.floor(qual_tool*11))/10;
    Dura = math.floor(Dura);
    Dura = math.max(01,math.min(99,Dura)); ]]--
	Dura = 99; -- all produced items will have maximum durability
    return math.min(999,math.max(101,Qual*100+Dura));
end

function Craft:GenerateRepairEffekt( User, ItemID,toolItem )
    local Qual = base.common.Scale(5,22,(self:ModifySkill(User,toolItem)-self.Products[ItemID].Difficulty[1])/(math.min(100,self.Products[ItemID].Difficulty[2])-self.Products[ItemID].Difficulty[1])*100);
    stone1, str1, stone2, str2=base.common.GetBonusFromTool(toolItem);
    local step=0;
    if stone1==4 then       -- blackstone raises reparation stuff
        step=0,05*str1;
    end
    if stone2==4 then
        step=step+0,05*str2;
    end
    Qual = Qual * (((math.random()+step)*0.2)+0.9);
    Qual = Qual * (((math.random()+step)*0.2)+0.9);
    Qual = Qual * (((math.random()+step)*0.2)+0.9);
    return math.min(99,math.max(0,Qual));
end

-- Arbeitszeit generieren
function Craft:GenWorkTime(User, ItemID, toolItem)
    local Attrib = User:increaseAttrib(self.LeadAttrib,0);
    local Skill  = math.min(100,User:getSkill(self.LeadSkill)*10);

    gem1, str1, gem2, str2=base.common.GetBonusFromTool(toolItem);
    step=0;
    if gem1==3 then     -- ruby modifies skill!
        step=str1;
    end
    if gem2==3 then
        step=step+str2;
    end
    Skill=Skill+step;
    step=0;
    if gem1==6 then     -- amethyst modifies time needed
        step=str1;
    end
    if gem2==6 then
        step=step+str2;
    end
    step=step*1.75;
    time1=math.floor((self.Products[ ItemID ].TimePerStep[1])*(100-step)/100);
    time2=math.floor((self.Products[ ItemID ].TimePerStep[2])*(100-step)/100);
    return math.floor(base.common.Scale(time1,time2,(Attrib+Skill-self.Products[ ItemID ].Difficulty[1])/(100 - self.Products[ ItemID ].Difficulty[2])*100));
end

function Craft:GetNextStep( User, Item )
    return math.ceil(Item.quality / self.Products[ Item.id ].QualPerStep)+1;
end

function Craft:LocationFine( User, ltstate, mode )
    if (self.Tool ~= 0) then
        local StaticTool = base.common.GetFrontItemID( User );
        if ((ltstate ~= Action.success) and (self.ToolLink[StaticTool] ~= StaticTool) and (table.getn(self.ActiveTool) ~= 0)) then
            if self.ActiveTool[StaticTool] then
                if not mode then
                    base.common.TempInformNLS(User,
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
                    base.common.TempInformNLS(User,
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
                base.common.TempInformNLS(User,
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
                base.common.TempInformNLS(User,
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
                base.common.TempInformNLS(User,
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

function Craft:CheckInterrupt(User)
    if (table.getn(self.Interrupt_Messages) > 0) then
        if base.common.IsInterrupted( User ) then
            local message = math.random(1,table.getn(self.Interrupt_Messages));
            base.common.TempInformNLS(User,
            self.Interrupt_Messages[message].german,
            self.Interrupt_Messages[message].english);
            return false;
        end
    end
    return true;
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
        base.common.TempInformNLS(User,
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
        if self:CheckMaterial( User, ItemID, 1 ) and self:CheckInterrupt( User ) then
            self:CraftNewItem( User, ItemID, nil, 1, ltstate , toolItem);
            didSomething = true;
        end
    else
        if (WorkOnItem.quality >= 100) then
            for i,checkId in pairs(notRepairable) do
                if ItemID == checkId then
                    repair = false;
                    break;
                end
            end

            if ProduceItem.Repairable and repair then
                self:RepairItem( User, WorkOnItem, ltstate, toolItem );
                didSomething = true;
            end
        else
            if self:CheckMaterial( User, ItemID, self:GetNextStep( User, WorkOnItem ) ) and self:CheckInterrupt( User ) then
                self:CraftNewItem( User, ItemID, WorkOnItem, self:GetNextStep( User, WorkOnItem ), ltstate, toolItem );
                didSomething = true;
            end
        end
    end
    if didSomething and (ltstate == Action.success) then
        base.common.ToolBreaks( User, toolItem, true );
        base.common.GetHungry( User, neededFood );
        --User:learn(self.LeadSkillGroup,self.LeadSkill,2,math.min(100,ProduceItem.Difficulty[2]));
		--Replace with new learn function, see learn.lua 
    end
end

function Craft:RepairItem( User, Item, ltstate ,toolItem)
    if (ltstate == Action.none) then
        User:startAction( self:GenWorkTime( User, Item.id, toolItem ), self.Products[ Item.id ].GfxEffect[1], self.Products[ Item.id ].GfxEffect[2], self.Products[ Item.id ].SfxEffect[1], self.Products[ Item.id ].SfxEffect[2]);
        User:talkLanguage(Character.say, Player.german, "#me beginnt mit der Reparatur.");
        User:talkLanguage(Character.say, Player.english, "#me starts to repair.");
        self:SwapToActiveItem( User );
        return
    end

    if (Item.quality < 200) then
        base.common.TempInformNLS(User,
        "Der Gegenstand zerbricht, bei dem Versuch ihn zu reparieren.",
        "The Item breaks, while trying to repair it.");
        world:erase(Item,1);
        self:SwapToInactiveItem( User );
        return
    end

    if self:checkSuccess(User, Item.id,toolItem) then
        local Qual = math.floor(Item.quality/100);
        local Dura = Item.quality - (Qual*100);
        Dura = Dura + self:GenerateRepairEffekt( User, Item.id ,toolItem);
        Item.quality = Qual*100 + math.min(99,Dura);
    end
    Item.quality = Item.quality - 100;
    world:changeItem( Item );
    self:SwapToInactiveItem( User );
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
				base.common.TempInformNLS(User,
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
            base.common.TempInformNLS(User,
				"Du setzt die Arbeit fort.",
				"You continue the work.");
        end
        self:SwapToActiveItem( User );
        return
    end
    dropLeftOver = true;
    local StepInfos = self.Products[ ItemID ].ProductionSteps[Step];
    if (StepInfos[1] ~= 0) then
        if ( not self.Products[ ItemID ].UseDataToWork[Step]) then
            User:eraseItem(StepInfos[1],StepInfos[2]);
        else
            local foundTestItem = false;
			for i=12,17 do
                local TestItem = User:getItemAt(i);
                if (TestItem.id == StepInfos[1]) then
                    foundTestItem = true;
					if (TestItem.data < 2) then
                        User:eraseItem(StepInfos[1],1);
                    else
                        TestItem.data = TestItem.data - 1;
                        world:changeItem(TestItem);
                        dropLeftOver = false;
                    end
                    break;
                end
            end
			if not foundTestItem then
				local bag = User:getBackPack();
				if bag then
					local cnt = 0;
					while bag:viewItemNr(cnt) and not foundTestItem do
						local _,TestItem = bag:viewItemNr(cnt);
						if TestItem.id==StepInfos[1] then
							foundTestItem = true;
							if TestItem.data<2 then
								User:eraseItem(StepInfos[1],1);
							else
								TestItem.data = TestItem.data - 1;
								User:inform("before changeItem");
								world:changeItem(TestItem);
								User:inform("after changeItem");
								dropLeftOver = false;
							end
						end
						cnt = cnt+1;
					end
				end
			end
        end
    end
    if self:checkSuccess(User, ItemID,toolItem) then
        local ItemQual = 0;
        local ItemCount = 1;
        if (Step == table.getn(self.Products[ ItemID ].ProductionSteps)) then -- Item fertig -> Finale Qualität
            ItemQual = self:GenerateQuality( User, ItemID, toolItem );
            ItemCount = self.Products[ ItemID ].Quantity;
			base.common.TempInformNLS(User,
				"Du beendest die Arbeit.",
				"You finish the work.");
        else
            ItemQual = math.floor(self.Products[ ItemID ].QualPerStep * Step);
        end
        if (WorkOnItem == nil) then
			local notcreated = User:createItem(ItemID,ItemCount,ItemQual,0);
            if (notcreated ~= 0) then
                world:createItemFromId(ItemID,notcreated,User.pos,true,ItemQual,0);
                base.common.TempInformNLS(User,
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
                        base.common.TempInformNLS(User,
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
            -- Edit by abcfantasy: Wine brewing contest
            if ( ( ItemID == 2500 ) and ( ItemQual >= 100 ) ) then
                WorkOnItem.data = GetWineQuality( User );
            end;
            -- end edit
            WorkOnItem.quality = ItemQual;
            WorkOnItem.number = ItemCount;
            world:changeItem(WorkOnItem);
            if self:CheckMaterial( User, ItemID, (Step + 1) ) then
                User:startAction( self:GenWorkTime( User, ItemID, toolItem ), self.Products[ ItemID ].GfxEffect[1], self.Products[ ItemID ].GfxEffect[2], self.Products[ ItemID ].SfxEffect[1], self.Products[ ItemID ].SfxEffect[2]);
                base.common.TempInformNLS(User,
					"Du setzt die Arbeit fort.",
					"You continue the work.");
                User:changeTarget(User:getItemAt(WorkOnItem.itempos));
            else
                self:SwapToInactiveItem( User );
            end
        end
    else
        base.common.TempInformNLS(User,
        "Deine Arbeit misslingt.",
        "Your work fails.");
        if (self.Products[ ItemID ].FailLeftOvers[Step] ~= nil) then
            if ((self.Products[ ItemID ].FailLeftOvers[Step][3] == nil) or (math.random(100) <= self.Products[ ItemID ].FailLeftOvers[Step][3])) then
                local notcreated = User:createItem(self.Products[ ItemID ].FailLeftOvers[Step][1],self.Products[ ItemID ].FailLeftOvers[Step][2],333,0);
                if (notcreated ~= 0) then
                    world:createItemFromId(self.Products[ ItemID ].FailLeftOvers[Step][1],notcreated,User.pos,true,333,0);
                    base.common.TempInformNLS(User,
                    "Du kannst nichts mehr halten.",
                    "You cannot carry anything else.");
                end
            end
        end
        self:SwapToInactiveItem( User );
    end
    if ((self.Products[ ItemID ].LeftOvers[Step] ~= nil) and (dropLeftOver)) then
        local notcreated = User:createItem(self.Products[ ItemID ].LeftOvers[Step][1],self.Products[ ItemID ].LeftOvers[Step][2],333,0);
        if (notcreated ~= 0) then
            world:createItemFromId(self.Products[ ItemID ].LeftOvers[Step][1],notcreated,User.pos,true,333,0);
            base.common.TempInformNLS(User,
            "Du kannst nichts mehr halten.",
            "You cannot carry anything else.");
        end
    end
end

-- Added by abcfantasy for wine contest
function GetWineQuality( User )
        local skill = User:getSkill( "baking" );
        local attr = User:increaseAttrib( "dexterity", 0 );

        local randValue = math.random( -23, 23 );

        return ( skill + attr + randValue );
end
