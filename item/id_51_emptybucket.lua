-- I_51 Eimer mit Wasser fuellen

-- UPDATE common SET com_script='item.id_51_emptybucket' WHERE com_itemid IN (51);

require("base.common")
require("alchemy.base.alchemy")

module("item.id_51_emptybucket", package.seeall)

-- Wassereimer fuellen
function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	local pos = base.common.GetFrontPosition(User);
	local Field = world:getField(pos);
	local boden = base.common.GetGroundType(Field:tile());
	local frontItem = base.common.GetFrontItem( User );
	if frontItem == nil then
	    IdFrontItem = 0
	else
        IdfrontItem = frontItem.id	
	end
	
	if(IdfrontItem == 2207) or (IdfrontItem == 631) or (IdfrontItem == 2079) then -- Am Brunnen fuellen
		FillBucket(User, SourceItem);
	elseif (boden == 6) then -- Am Wasser fuellen
		FillBucket(User, SourceItem);
	elseif(IdfrontItem == 1010) and (frontItem:getData("filledWith") == "water") then -- cauldron with water
	    FillFromCauldron(User,SourceItem,frontItem,Counter,Param,ltstate)
	else
		base.common.InformNLS(User, 
    "Du kannst den Eimer an einem Brunnen oder an einem Gewässer füllen.", 
    "You can fill the bucket at a well or at some waters.");
	end
end

-- common bucket filling function
function FillBucket( User, SourceItem )
  if base.common.FitForWork( User ) then
    SourceItem.id = 52;
    SourceItem:setData("amount", "10");
    world:changeItem(SourceItem);
    base.common.GetHungry( User, 100 );
  end
end

function FillFromCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate)
    
    if ( ltstate == Action.abort ) then
		base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	   return
	end
		
	-- is the char an alchemist?
	    local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
		if not anAlchemist then
		    return
	    end
		
	if ( ltstate == Action.none ) then
		User:startAction( 20, 21, 5, 0, 0)
		return
	end

	world:makeSound(10,TargetItem.pos)
	TargetItem.id = 1008
	TargetItem:setData("filledWith","")
	world:changeItem(TargetItem)
  SourceItem.id = 52
  SourceItem:setData("amount", "1");
	SourceItem.quality = 333
	world:changeItem(SourceItem)
end