-- * Anh�ger-Amulett: Ein Priester kann ein "leeres" Amulett (Data=0) durch Anwendung seines eigenen Amuletts 
-- auf dieses dessen Data-Wert auf seine Player-ID setzen, damit wird es zum Amulett fr Anh�ger (siehe oben).
require("base.common")
dofile("base_priests.lua");

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    if (TargetItem.id==222 and TargetItem.data==0) then         -- Ziel ist ein geeignetes Amulett
        if SourceItem.data==User.id and SourceItem.quality>1000 and SourceItem.quality<1017 then  
                                                                -- Priesteramulett korrekt!
            if User:getMagicType()==1 then                      -- User ist Priester
                TargetItem.data=User.id;
                TargetItem.quality=1000;
                world:changeItem(TargetItem);
                base.common.InformNLS(User,"Das Amulett wurde geweiht!", "This amulet was blessed!");
            end
        end
    elseif SourceItem.data == 111 then
		if counter == 1 then
			RingOfPower(User);
		end
	end
end

function LookAtItem(User,Item)
    if Item.quality>1000 and Item.quality<1017 then       -- priesteramulett, das einem Gott geweiht ist.
        ItemName=getGodFromData(Item.quality)..base.common.GetNLS(User," geweihtes Amulett"," devoted amulet");
    elseif Item.quality==1000 then
        ItemName=base.common.GetNLS(User,"Zeichen des Glaubens", "Sign of faith");
    else
        ItemName=base.common.GetNLS(User,"Amulett", "amulet");
    end
    world:itemInform(User,Item,base.common.GetNLS(User,"Du siehst ","You see ")..ItemName);
end

function MoveItemBeforeMove(User, SourceItem, TargetItem)
    moveWorks=false;
    if SourceItem.data==User.id and User:getMagicType()==1 and SourceItem.itempos==2 and SourceItem.quality>1000 and SourceItem.quality<1017 then
        base.common.InformNLS(User, "Du kannst das Amulett nicht von deinem Hals lösen.", "You cannot take that amulett off your neck.");
    elseif SourceItem.itempos==2 and SourceItem.quality==1000 then
        -- du verlierst deine zugehoerigkeit
        isDisciple, blessEffect = User.effects:find(1000);
        if isDisciple then
            blessEffect:addValue("terminate", 1);
            blessEffect.nextCalled = 1;
            SourceItem.quality = 999;
            world:changeItem(SourceItem);
        end
        moveWorks = true;
    else
        moveWorks=true;
    end
    return moveWorks;
end

function RingOfPower(User)
	
	local pos = base.common.GetFrontPosition(User);
	world:gfx(2,pos);
	world:makeSound(4,pos);
	local flame = world:createItemFromId(359,1,pos,true,333,0);
	flame.wear = 1;
	world:changeItem(flame);
	world:makeSound(7,pos);
end