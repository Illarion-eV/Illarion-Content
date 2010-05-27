-- UPDATE common SET com_script='items.360_icefield' where com_itemid=360;

require("base.common")

module("items.360_icefield", package.seeall())

function IniFireField()
                 --hum,dwa,hal,elf,orc,liz,gno,fry,gob,tro,mum,skl,beh,cld,hlr,buy,sel,ins,shp,spd,dsk,rot,dem,scp,pig,inv,sku,wsp,ftr,shd,stn,mgo,gno,dra,drw,drw,lde
    AffectedRaces={  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36};
    AffectedStren={100,120,100,100,100, 90,100,100,100,100, 90,110,100,100,100,100,100,150, 20,120, 30,100,130,100,100,100,100,110,100, 50, 20,100,100, 90,100,100, 80};
end

function CharacterOnField(User)
    if (AffectedRaces==nil) then
        IniFireField();
    end
	-- Eisflamme auf dem Feld suchen
	-- !!Eventuell gibt es Probleme, wenn sich mehrere Flammen auf einem Feld befinden!!
	local Items = base.common.GetItemsOnField(User.pos);
	local FieldItem;
	for i, item in pairs(Items) do
		if(item.id == 360) then
			FieldItem = item;
			break
		end
	end
    if (FieldItem.quality>100) then
        UserRace=User:get_race();                  -- Char Rasse
        for i,theRace in pairs(AffectedRaces) do   -- Rassenliste durchlaufen
            if UserRace==theRace then              -- User Rasse finden
                resist=SpellResistence(User);      -- Magie Resistenz prüfen
                if resist<FieldItem.quality then   -- Qualität des Items --> Stärke mit Magie Resistenz vergleichen
                    damageDealt=base.common.NormalRnd((7/100)*math.floor((FieldItem.quality-resist)*AffectedStren[i]),(9/100)*math.floor((FieldItem.quality-resist)*AffectedStren[i]));--AffectedStren[i]
                    User:increaseAttrib("hitpoints",-damageDealt); -- Schaden berechnen und bewirken
                end
            end
        end
    else
        DeleteFlame(User, FieldItem);
        if (User:getPlayerLanguage()==0) then
            User:inform("Die Eisflamme war nur eine Illusion und verpufft");
        else
            User:inform("The iceflame was just an illusion and disappears");
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

function SpellResistence(TChar)                 -- should be 0 (no res) to 100 (super res)
    MRes=TChar:getSkill("magic resistance");    -- should depend on Int, Wp and magic resistency
    RInt=TChar:increaseAttrib("intelligence",0);
    RWillpower=TChar:increaseAttrib("willpower",0);

    BaseSuccess=math.ceil((MRes+RWillpower+RInt)*100/140);
    --TChar:talk(CCharacter.say,"Eval SpRes. for "..TChar.name..": Mag Res= "..MRes..", Int= "..RInt..", WP="..RWillpower.." and calcbase= "..BaseSuccess);
    return math.max(math.ceil((BaseSuccess*base.common.NormalRnd(0,100))/50),0);
end

function base.common.NormalRnd(min,max)     -- returns ~normal distribution between min/max with m=(min+max)/2
    base=0;
    for t=1,10 do
        base=base+math.random(max-min+1)-1; -- creates ~normal distri from 0 to (max-min)*10 with mu=(max-min)*10/2
    end
    base=math.ceil(base/10);                -- scale to 0-(max-min)
    base=base+min;                          -- shift to min -> min to max
    return base;
end

function ItemRotsOnField(oldItem,newItem)
    if (firstrot==nil) then
        rotted={};
    end
    Posi=newItem.pos
    if (rotted[Posi]==nil) then rotted[Posi]=1 end
    if (rotted[Posi]==2) then
        world:eraseItem(newItem,newItem.number);
        rotted[Posi]=0;
        world:gfx(38,Posi);
    end
    rotted[Posi]=rotted[Posi]+1;
end
    