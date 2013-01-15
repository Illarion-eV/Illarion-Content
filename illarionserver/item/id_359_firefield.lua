-- UPDATE common SET com_script='item.id_359_firefield' where com_itemid=359;

-- How it works: AffectedRaces holds a list of all races that have non-standard effect (thus, consuming more than or less than 100% of damage from a field).
-- AffectedStren holds a list of damage-percentages, 100 (which would be default anyway) means 100% and so on. The first entry in the Races-list corresponds
-- to the first entry in the Stren-list, thus, these lists have to have EQUAL LENGTH!!!!!!!!!!!!!!

require("base.common")

module("item.id_359_firefield", package.seeall)

function IniFireField()
    --Human, Dwarf, Halfling, Elf, Orc, Lizard, Drow, Troll, Mummy, Skeleton, Beholder, Blackbeholder, Transparentbeholder, Brownmummy, Bluemummy, Sheep, Spider, Redskeleton, Redspider, Greenspider, Bluespider, Pig, Brownpig, Transparentspider, Wesp, Redwesp, Stonegolem, Brownstonegolem, Redstonegolem, Silverstonegolem, Transparentstonegolem, Cow, Browncow, Wolf, Transparentwolf, Blackwolf, Greywolf, Redwolf, Redraptor, Silverbear, Blackbear, Bear, Raptor, Zombie, Hellhound, Imp, Irongolem, Ratman, Dog, Beetle, Fox, Slime, Chicken, Bonedragon, Blackbonedragon, Redbonedragon, Transparentbonedragon, Greenbonedragon, Bluebonedragon, Goldbonedragon, Redmummy, Greymummy, Blackmummy, Goldmummy, Transparentskeleton, Blueskeleton, Greenskeleton, Goldirongolem, Goldskeleton, Bluetroll, Blacktroll, Redtroll, Blackzombie, Transparentzombie, Redzombie, Blackhellhound, Transparenthellhound, Greenhellhound, Redhellhound, Redimp, Blackimp, Blueirongolem, Redratman, Greenratman, Blueratman, Reddog, Greydog, Blackdog, Greenbeetle, Copperbeetle, Redbeetle, Goldbeetle, Greyfox, Redslime, Blackslime, Transparentslime, Brownchicken, Redchicken, Blackchicken
    AffectedRaces={  0,  1,  2,  3,  4,  5,  6,  9, 10, 11, 12, 13, 14, 15, 17, 19, 20, 21, 22, 23, 26, 27, 29, 30, 31, 32, 33, 34, 39, 40, 41, 42, 43, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108};
    AffectedStren={100, 80,100,100, 70,110,100,100,100,100,120, 40,100,100,100,100,100,200,130,110, 20,100, 10,100,100,100, 40,150,100, 30, 20,100,100,  0,100,100, 20,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100, 100, 100, 100, 100, 100, 100, 100, 100, 100};
end

function CharacterOnField(User)  -- geht los wenn ein Char auf das Feld tritt
    if (AffectedRaces==nil) then
        IniFireField();          -- Einmalige Initialisierung
    end
    if (User:increaseAttrib("hitpoints",0) == 0) then
        return
    end
	-- Flamme auf dem Feld suchen
	-- !!Eventuell gibt es Probleme, wenn sich mehrere Flammen auf einem Feld befinden!!
	local Items = base.common.GetItemsOnField(User.pos);
	local FieldItem;

	for i, item in pairs(Items) do
		if(item.id == 359) then
			FieldItem = item;
			break
		end
	end
    if (FieldItem.quality>100) and User.pos.z ~= 100 and User.pos.z ~= 101 and User.pos.z ~= 40 then --no harmful flames on noobia or the working camp
        local UserRace=User:getRace();                  -- Char Rasse
        for i,theRace in pairs(AffectedRaces) do   -- Rassenliste durchlaufen
            if UserRace==theRace then              -- User Rasse finden
                found=true
                RaceStrenght=AffectedStren[i];
            end
        end
        if not found or RaceStrenght==nil then
            RaceStrenght=100;
        end
        local resist=SpellResistence(User);      -- Magie Resistenz prüfen
        if (resist<FieldItem.quality*2) then   -- Qualität des Items --> Stärke mit Magie Resistenz vergleichen
			local damageLow = (3/100)*math.floor((math.max(10,FieldItem.quality-resist))*RaceStrenght)
			local damageHigh = (5/100)*math.floor((math.max(FieldItem.quality-resist))*RaceStrenght)
            local damageDealt=math.random(math.min(damageLow,damageHigh),math.max(damageLow,damageHigh));--AffectedStren[i]
            User:increaseAttrib("hitpoints",-damageDealt); -- Schaden berechnen und bewirken
            -- Added by abcfantasy, inform user
            if (User:getPlayerLanguage()==0) then
                User:inform("Du fühlst, wie das glühend heiße Feuer allmählich deine Haut verbrennt.");
            else
                User:inform("You feel the scorching fire gradually burn your skin.");
            end
        else
            DeleteFlame(User,FieldItem);
        end
    else
        DeleteFlame(User,FieldItem);
        if (User:getPlayerLanguage()==0) then
            User:inform("Die Feuerflamme war nur eine Illusion und verpufft.");
        else
            User:inform("The fireflame was just an illusion and disappears.");
        end
    end
end

function SpellResistence(TargetChar)
    local TInt=TargetChar:increaseAttrib("intelligence",0);
    local TEss=TargetChar:increaseAttrib("essence",0);
    local TSkill=TargetChar:getSkill(Character.magicResistance);
    local ResTry=(((TSkill*2)+(TEss*2)+TInt)/300)*999;
    return math.max(0,math.min(999,math.floor(ResTry*(math.random(8,12)/10))))
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
