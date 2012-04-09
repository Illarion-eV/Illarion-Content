-- I_51 Eimer mit Wasser fuellen

-- UPDATE common SET com_script='item.id_51_emptybucket' WHERE com_itemid IN (51);

require("base.common")
require("druid.base.brewing_plants_gemdust")

module("item.id_51_emptybucket", package.seeall)

-- Wassereimer fuellen
function UseItem( User, SourceItem, TargetItem, Counter, Param )
	local pos = base.common.GetFrontPosition(User);
	local Field = world:getField(pos);
	local boden = base.common.GetGroundType(Field:tile());
	local frontItem = base.common.GetFrontItem( User );
	if frontItem == nil then
	    IdFrontItem = 0
	else
        IdfrontItem = frontItem.id	
	end
	
	if(IdfrontItem == 2207) then -- Am Brunnen fuellen
		FillBucket(User, SourceItem);
	elseif (boden == 6) then -- Am Wasser fuellen
		FillBucket(User, SourceItem);
	elseif(IdfrontItem == 1008) and (frontItem:getData("cauldronFilledWith") == "water") then -- cauldron with water
	    druid.base.brewing_plants_gemdust.UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	else
		base.common.InformNLS(User, "Du musst am Brunnen stehen, um Wasser zu schöpfen.", "You need to stand in front of the well to scoop water.");
	end
end

-- common bucket filling function
function FillBucket( User, SourceItem )
    if base.common.FitForWork( User ) then
        local getWater = 40*(21/User:increaseAttrib("dexterity",0))+60;
        if (math.random(0,100) < getWater) then
            --User:inform( "fill bucket" );
            SourceItem.id = 52;
            SourceItem.data = 10;
            world:changeItem(SourceItem);
        else
            base.common.InformNLS( User, 
            "Der Eimer rutscht dir aus der Hand.", 
            "The bucket slips out of your hand." );
            User:eraseItem(51,1);
        end
        base.common.GetHungry( User, 200 );
    end    
end
