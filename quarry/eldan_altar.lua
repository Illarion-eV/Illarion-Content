module("triggerfield.eldan_altar", package.seeall)

-- Eldan Shrine praying at the altar
function CharacterOnField( Ch )
    if( string.find( Ch.lastSpokenText, "eldan" ) ~= nil ) then
        pos = { position( -169, -94, 46 ), position( -169, -93, 46 ) };
        for i = 1,2 do
            while( world:isItemOnField( pos[i] ) ) do
                world:erase( world:getItemOnField( pos[i] ), 1 );
            end;
        end;
        Ch:startMusic( 0 );
        world:makeSound( 4, Ch.pos );
Ch:inform("MagicFlags1:" .. Ch:getMagicFlags( 1 ));
        if( Ch:getMagicFlags( 1 ) == 0 ) then
            --Ch:setMagicType( 1 );
            Ch:teachMagic( 1, 4 );
            Ch:setMagicType( 1 );
        end;
    end;
end
