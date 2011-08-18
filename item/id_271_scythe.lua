-- Sense ( 271 )

-- reifes Getreide  --> Getreidebündel

-- UPDATE common SET com_script='item.id_271_scythe' WHERE com_itemid IN (271);

require("base.common")
require("item.general.metal")
require("content.gathering")

module("item.id_271_scythe", package.seeall, package.seeall(item.general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param )   
	content.gathering.InitGathering();
	
    local TargetItem = base.common.GetFrontItem( User ); -- look for full grown grain
    if (TargetItem == nil or TargetItem.id ~= 248) then
        return
    end
    
    if base.common.Encumbrence(User) then -- Durch Steife Rüstung behindert
        base.common.InformNLS( User,
        "Deine Rüstung behindert dabei die Feldarbeit zu verrichten.",
        "Your armour disturbes while farming." );
        return
    end
    
    if ( SourceItem:getType() ~= 4 ) then -- Sense in der Hand
        base.common.InformNLS( User, 
        "Du musst die Sense in die Hände nehmen.", 
        "Take the scythe into your hands." )
        return
    end
    
    if not base.common.IsLookingAt( User, TargetItem.pos ) then -- Blickrichtung prüfen
        base.common.TurnTo( User, TargetItem.pos ); -- notfalls drehen
    end
    local farming = content.gathering.farming;
	if not farming:FindRandomItem(User) then
		return
	end
	
    if base.common.ToolBreaks( User, SourceItem, true ) then -- Sense beschädigen
        base.common.InformNLS( User, 
        "Die rostige Sense zerbricht.", 
        "The rusty scythe breaks." );
        return
    end
    
    if (TargetItem.data > 1) then
        TargetItem.data = TargetItem.data - 1;
        world:changeItem(TargetItem);
    else
        world:erase( TargetItem, 1 );     -- Getreideitem löschen
    end
    local notCreated = User:createItem( 249, 1, 333 ,0); -- Getreidebündel erstellen
    if ( notCreated > 0 ) then -- Zu viele Items erstellt --> Char überladen
        world:createItemFromId( 249, notCreated, User.pos, true, 333 ,0);
        base.common.InformNLS(User,
        "Du kannst nichts mehr halten.",
        "You can't carry any more.");
    end
end
