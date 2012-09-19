module("triggerfield.eldan_close", package.seeall)

-- Eldan Shrine close secret door
function MoveToField( Ch )
    if( Ch:getFaceTo() == 2 ) then
        -- Ch:inform( "Tür zu es zieht..." );
        pos = { position( -169, -94, 46 ), position( -169, -93, 46 ) };
        for i = 1,2 do
            while( world:isItemOnField( pos[i] ) ) do
                world:erase( world:getItemOnField( pos[i] ), 1 );
            end
            world:createItemFromId( 31, 1, pos[i], true, 333 ,0);
        end
        world:makeSound( 5, Ch.pos );
    end
end
