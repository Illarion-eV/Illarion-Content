-- I_51 Eimer mit Wasser fuellen

require("base.common")

function UseItemWithField( User, SourceItem, TargetPos, Counter, Param )
    local Field = world:getField(TargetPos);
    local boden = base.common.GetGroundType(Field:tile());
    if (boden == 6) then  -- Am Wasser fuellen
		base.common.TurnTo(User, TargetPos);
        FillBucket( User, SourceItem );
    end
end

-- Wassereimer fuellen
function UseItem( User, SourceItem, TargetItem, Counter, Param )
	local pos = base.common.GetFrontPosition(User);
	local Field = world:getField(pos);
	local boden = base.common.GetGroundType(Field:tile());
	if(base.common.GetFrontItemID(User) == 2207) then -- Am Brunnen fuellen
		FillBucket(User, SourceItem);
	elseif (boden == 6) then -- Am Wasser fuellen
		FillBucket(User, SourceItem);
	else
		base.common.InformNLS(User, "Du musst am Brunnen stehen, um Wasser zu schöpfen.", "You need to stand in front of the well to scoop water.");
	end
end

-- common bucket filling function
function FillBucket( User, SourceItem )
    -- bucket in hand
    cntBuckets = User:countItemAt( "body", 51 );
    if ( cntBuckets > 1 ) then
        base.common.InformNLS( User, 
        "Du kannst immer nur einen Eimer befüllen.",
        "You can only fill one bucket at once.");
    elseif ( cntBuckets == 1 ) and (SourceItem.number == 1) then
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
    else
        base.common.InformNLS( User, 
        "Du musst den Eimer in die Hand nehmen.", 
        "You need to hold the bucket in your hand." );
    end        
end