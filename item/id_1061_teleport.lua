-- UPDATE common SET com_script='item.id_1061_teleport' WHERE com_itemid=1061;
require("item.id_10_teleportgate")
require("base.common")

module("item.id_1061_teleport", package.seeall)

function InitializeBook( )

    if TargetName == nil then

        TargetName={  };
        TargetName[ 1 ]="Galmair";

        TargetName[ 2 ]="Cadomyr";

        TargetName[ 3 ]="Runewick";

        TargetName[ 4 ]="Wilderland";

        TargetName[ 5 ]="Safepoint 1";

        TargetName[ 6 ]="Safepoint 2";
		
        TargetName[ 7 ]="Safepoint 3";

        TargetName[ 8 ]="Safepoint 4";

		TargetName[ 9 ]="Safepoint 5";
    end
--local gate = TargetName[ SourceItem:getData("destination")]
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
    User:inform( "reading teleport book" )
	
    InitializeBook(  );

    User:inform( "target id "..SourceItem:getData("destination") )
    local gate = TargetName[ SourceItem:getData("destination")]

    if gate ~= nil then
        User:inform( "gate found" )

        if ( User:countItemAt( "body", 1061 ) > 0 ) then

            local loc;
            local success = false;
            local radius = 4;

            for i = 1, 10 do
                User:inform( "placing" )
                loc = position( User.pos.x - radius + math.random( 2*radius ), User.pos.y - radius + math.random( 2*radius ), User.pos.z )
                User:inform( "trying pos "..loc.x..", "..loc.y )

                -- never create it on people
                -- never create it on items
                if not world:isCharacterOnField( loc ) and not world:isItemOnField( loc ) and (world:getField( loc ):tile()~=6) then
                -- not in GR Cell, protected by ritual
                --and (( (loc.x < -72) or (loc.x > -67) ) or ( (loc.y < -220) or (loc.y > -216) ))
                -- not on Vanima Garden Island...same as above
                --and (( (loc.x < 404) or (loc.x > 410) ) or ( (loc.y < 203) or (loc.y > 209) ))
                -- not in secret underground cell...same as above
                --and ((( (loc.x < -72) or (loc.x > -55) ) or ( (loc.y < -74) or (loc.y > -60) )) or loc.z~=-3) then
                    -- create a gate to the destination
                    User:inform( "creating" )
                    AportalIsBorn = world:createItemFromId( 10, 1, loc, true, 933 ,0);
					AportalIsBorn:setData("Destination",(SourceItem:getData("destination")))
					world:changeItem(AportalIsBorn)
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

    local gate = TargetName[ Item:getData("destination")]

    if gate == nil then
        world:itemInform( User, Item, base.common.GetNLS( User, "Zauberbuch", "Magical book" ) );
    else
        world:itemInform( User, Item, base.common.GetNLS( User, "Portal nach ", "Portal to " )..gate );
    end
end
