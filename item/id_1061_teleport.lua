-- UPDATE common SET com_script='item.id_1061_teleport' WHERE com_itemid=1061;
require("item.id_10_teleportgate")
require("base.common")

module("item.id_1061_teleport", package.seeall)

function InitializeBook(  )

    if TargetName == nil then

        TargetName={  };
        TargetName[ 301 ]="Galmair";

        TargetName[ 302 ]="Cadomyr";

        TargetName[ 303 ]="Runewick";

        TargetName[ 304 ]="Wilderland";

        TargetName[ 305 ]="Safepoint 1";

        TargetName[ 306 ]="Safepoint 2";
		
        TargetName[ 307 ]="Safepoint 3";

        TargetName[ 308 ]="Safepoint 4";

		TargetName[ 309 ]="Safepoint 5";
    end

end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    InitializeBook(  );

    local gate = TargetName[ SourceItem.quality ]

    if gate ~= nil then

        if ( User:countItemAt( "body", 1061 ) > 0 ) then

            local loc;
            local success = false;
            local radius = 4;

            for i = 1, 10 do
                loc = position( User.pos.x - radius + math.random( 2*radius ), User.pos.y - radius + math.random( 2*radius ), User.pos.z )

                -- never create it on people
                -- never create it on items
                if not world:isCharacterOnField( loc ) and not world:isItemOnField( loc ) and (world:getField( loc ):tile()~=6) then

                    -- create a gate to the destination
                    world:createItemFromId( 10, 1, loc, true, 933 ,(SourceItem.quality-100));
                    world:makeSound( 4, loc )

                    success = true;
                    break
                end

            end

            -- no free space found
            if not success then
                base.common.InformNLS( User,
                "Rings um Dich erzittern Boden und Gegenstände!",
                "All around you ground and items are trembling!" );
            end

            -- use up the book
            --if math.random( 1, 3 )==2 then
            --base.common.InformNLS( User,
            --"Das Buch wurde zu oft verwendet. Es zerfällt zu Staub.",
            --"The book was used too often. It decays into dust." );
            world:erase( SourceItem, 1 );
            --end
        else
            base.common.InformNLS( User,
            "Nimm das Buch zum Lesen in die Hände.",
            "Take the book in your hands to read it." );
        end

    end
end

function LookAtItem( User, Item )
    User:inform( "lookat book" )

    InitializeBook(  );

    local gate = TargetName[ Item.quality ]

    if gate == nil then
        world:itemInform( User, Item, base.common.GetNLS( User, "Zauberbuch", "Magical book" ) );
    else
        world:itemInform( User, Item, base.common.GetNLS( User, "Portal nach ", "Portal to " )..gate );
    end
end