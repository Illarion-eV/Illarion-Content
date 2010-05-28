-- Sense ( 271 )

-- reifes Getreide  --> Getreideb�ndel

-- UPDATE common SET com_script='item.id_271_scythe' WHERE com_itemid IN (271);

require("base.common")
require("item.id_general.metal")
require("content.gathering")

module("item.id_271_scythe", package.seeall, package.seeall(item.id_general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param )   
	content.gathering.InitGathering();
	
    if ((TargetItem == nil) or (TargetItem.id == 0)) then -- Anvisiertes Item Vorhanden
        TargetItem = base.common.GetFrontItem( User ); -- Wenn nicht Item in Blickrichtung nehmen
    end
    
    if (TargetItem.id ~= 248) then
        return
    end
    
    if base.common.Encumbrence(User) then -- Durch Steife R�stung behindert
        base.common.InformNLS( User,
        "Deine R�stung behindert dabei die Feldarbeit zu verrichten.",
        "Your armor disturbes while farming." );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Sense in der Hand
        base.common.InformNLS( User, 
        "Du mu�t die Sense in die H�nde nehmen.", 
        "Take the scythe into your hands." )
        return
    end
    
    if not base.common.IsLookingAt( User, TargetItem.pos ) then -- Blickrichtung pr�fen
        base.common.TurnTo( User, TargetItem.pos ); -- notfalls drehen
    end
    
	if not farming:FindRandomItem(User) then
		return
	end
	
    if base.common.ToolBreaks( User, SourceItem, true ) then -- Sense besch�digen
        base.common.InformNLS( User, 
        "Die rostige Sense zerbricht.", 
        "The rusty scythe breaks." );
        return
    end
    
    if (TargetItem.data > 1) then
        TargetItem.data = TargetItem.data - 1;
        world:changeItem(TargetItem);
    else
        world:erase( TargetItem, 1 );     -- Getreideitem l�schen
    end
    local notCreated = User:createItem( 249, 1, 333 ,0); -- Getreideb�ndel erstellen
    if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char �berladen
        world:createItemFromId( 249, notCreated, User.pos, true, 333 ,0);
        base.common.InformNLS(User,
        "Du kannst nichts mehr halten.",
        "You can't carry any more.");
    end
end