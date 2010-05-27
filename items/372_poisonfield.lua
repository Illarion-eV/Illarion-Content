-- UPDATE common SET com_script='items.372_poisonfield' where com_itemid=372;

require("base.common")

module("items.372_poisonfield", package.seeall)

function IniFireField()
    --hum,dwa,hal,elf,orc,liz,gno,fry,gob,tro,mum,skl,beh,cld,hlr,buy,sel,ins,shp,spd,dsk,rot,dem,scp,pig,inv,sku,wsp,ftr,shd,stn,mgo,gno,dra,drw,drw,lde
    AffectedRaces={  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36};
    AffectedStren={100,100,100,100,100,100,100,100,100,100,100, 40,100,100,100,100,100,120,130,110, 20,100, 10,100,100,100, 40,150,100, 30, 20,100,100, 10,100,100, 20};
    AffectedPoiso={100, 80,100,100, 90,100,100,110,100,120,  0,  0, 10,  0,  0,  0,  0, 80,100, 10,  0, 30,  5,  2,100,100,  0, 70,120,  0,  1,100,100, 50,100,100,  5};
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
        UserRace=User:get_race();                  -- Char Rasse
        for i,theRace in pairs(AffectedRaces) do   -- Rassenliste durchlaufen
            if UserRace==theRace then              -- User Rasse finden
                found=true
                RaceStrenght=AffectedStren[i];
                PoisStrength=AffectedPoiso[i];
            end
        end
        if not found then
            RaceStrenght=100;
            PoisStrength=100;
        end
        resist=SpellResistence(User);      -- Magie Resistenz pr�fen
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
    local TSkill=TargetChar:getSkill("magic resistance");
    local ResTry=(((TSkill*2)+(TEss*2)+TInt)/300)*999;
    return math.max(0,math.min(999,math.floor(ResTry*(math.random(8,12)/10))))
end