-- UPDATE common SET com_script='item.id_372_poisonfield' where com_itemid=372;

require("base.common")

module("item.id_372_poisonfield", package.seeall)

function IniFireField()
    --Human, Dwarf, Halfling, Elf, Orc, Lizard, Drow, Troll, Mummy, Skeleton, Beholder, Blackbeholder, Transparentbeholder, Brownmummy, Bluemummy, Sheep, Spider, Redskeleton, Redspider, Greenspider, Bluespider, Pig, Brownpig, Transparentspider, Wesp, Redwesp, Stonegolem, Brownstonegolem, Redstonegolem, Silverstonegolem, Transparentstonegolem, Cow, Browncow, Wolf, Transparentwolf, Blackwolf, Greywolf, Redwolf, Redraptor, Silverbear, Blackbear, Bear, Raptor, Zombie, Hellhound, Imp, Irongolem, Ratman, Dog, Beetle, Fox, Slime, Chicken, Bonedragon, Blackbonedragon, Redbonedragon, Transparentbonedragon, Greenbonedragon, Bluebonedragon, Goldbonedragon, Redmummy, Greymummy, Blackmummy, Goldmummy, Transparentskeleton, Blueskeleton, Greenskeleton, Goldirongolem, Goldskeleton, Bluetroll, Blacktroll, Redtroll, Blackzombie, Transparentzombie, Redzombie, Blackhellhound, Transparenthellhound, Greenhellhound, Redhellhound, Redimp, Blackimp, Blueirongolem, Redratman, Greenratman, Blueratman, Reddog, Greydog, Blackdog, Greenbeetle, Copperbeetle, Redbeetle, Goldbeetle, Greyfox, Redslime, Blackslime, Transparentslime, Brownchicken, Redchicken, Blackchicken
    AffectedRaces={  0,  1,  2,  3,  4,  5,  6,  9, 10, 11, 12, 13, 14, 15, 17, 19, 20, 21, 22, 23, 26, 27, 29, 30, 31, 32, 33, 34, 39, 40, 41, 42, 43, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108};
    AffectedStren={100,100,100,100,100,100,100,100,100,100,100, 40,100,100,100,100,100,120,130,110, 20,100, 10,100,100,100, 40,150,100, 30, 20,100,100, 10,100,100, 20,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100, 100, 100, 100, 100, 100, 100, 100, 100, 100};
    AffectedPoiso={100, 80,100,100, 90,100,100,110,100,120,  0,  0, 10,  0,  0,  0,  0, 80,100, 10,  0, 30,  5,  2,100,100,  0, 70,120,  0,  1,100,100, 50,100,100,  5,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100, 100, 100, 100, 100, 100, 100, 100, 100, 100};
end

function CharacterOnField(User)
    if (AffectedRaces==nil) then
        IniFireField();
    end
    if (User:increaseAttrib("hitpoints",0) == 0) then
        return
    end
	-- Giftwolke auf dem Feld suchen
	-- !!Eventuell gibt es Probleme, wenn sich mehrere Wolken auf einem Feld befinden!!
	local Items = base.common.GetItemsOnField(User.pos);
	local FieldItem;
	for i, item in pairs(Items) do
		if(item.id == 372) then
			FieldItem = item;
			break
		end
	end
    if (FieldItem.quality>100) then
        UserRace=User:getRace();                  -- Char Rasse
        for i,theRace in pairs(AffectedRaces) do   -- Rassenliste durchlaufen
            if UserRace==theRace then              -- User Rasse finden
                found=true
                RaceStrenght=AffectedStren[i];
                PoisStrength=AffectedPoiso[i];
            end
        end
        if not found or RaceStrenght==nil or PoisStrength==nil then
            RaceStrenght=100;
            PoisStrength=100;
        end
        resist=SpellResistence(User);      -- Magie Resistenz prüfen
        if (resist<FieldItem.quality) then
            damageDealt=math.random((7/1000)*math.floor((FieldItem.quality-resist)*RaceStrenght),(9/1000)*math.floor((FieldItem.quality-resist)*RaceStrenght));--AffectedStren[i]
            poisonDealt=math.random((2/100)*math.floor((FieldItem.quality-resist)*(PoisStrength/20)),(5/100)*math.floor((FieldItem.quality-resist)*(PoisStrength/20)));
            User:increaseAttrib("hitpoints",-damageDealt);
		User:setPoisonValue( base.common.Limit( (User:getPoisonValue() + poisonDealt) , 0, 10000) );
            --User:increasePoisonValue(poisonDealt);
        else
            DeleteFlame(User, FieldItem);
        end
    else
        DeleteFlame(User, FieldItem);
        if (User:getPlayerLanguage()==0) then
            User:inform("Die Giftwolke war nur eine Illusion und verpufft");
        else
            User:inform("The poisoncloud was just an illusion and disappears");
        end
    end
end

function DeleteFlame(User, FlameItem)
	local field = world:getField(User.pos);
	local count = field:countItems();
	local currentitem;
	local items = { };
	for i=0, count-1 do
		currentitem = world:getItemOnField(User.pos);
		world:erase(currentitem, currentitem.number);
		if(currentitem.id ~= FlameItem.id) then
			table.insert(items, currentitem);
		end
	end
	for i,item in pairs(items) do
		world:createItemFromItem(item, User.pos, true);
	end
end

function SpellResistence(TargetChar)
    local TInt=TargetChar:increaseAttrib("intelligence",0);
    local TEss=TargetChar:increaseAttrib("essence",0);
    local TSkill=TargetChar:getSkill(Character.magicResistance);
    local ResTry=(((TSkill*2)+(TEss*2)+TInt)/300)*999;
    return math.max(0,math.min(999,math.floor(ResTry*(math.random(8,12)/10))))
end
