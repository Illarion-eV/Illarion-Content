-- Schleifstein ( 270 )
-- UPDATE common SET com_script='I_270_schleifstein.lua' WHERE com_itemid IN (270);

require("base.common")

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

    if not base.common.IsLookingAt( User, SourceItem.pos ) then -- Blickrichtung
        base.common.TurnTo( User, SourceItem.pos ); -- Drehen wenn nötig
    end
    
    if (User:countItemAt("body",2140)==0) then -- kleine Zange
        base.common.InformNLS( User,
        "Du benötigst eine kleine Zange um den Edelstein zu halten.",
        "You need small tongs to cut the gems." );
        return
    end
    
	base.common.InformNLS(User, "Du musst die Zange in die Hand nehmen und sie dann benutzen.", "Take the small tongs in your hand and use it.");
end