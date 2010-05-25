-- please do NOT USE this function since it is highly inefficient and will be 
-- deprecated with the next server version. It serves debug purposes only! - vilarion

function removeItemIdFromFieldStack( id, pos )

    local stack = {};
    local i = -1;
    local found = false;
    local itm;
    while( world:isItemOnField(pos) and (not found) ) do
        itm = world:getItemOnField(pos);
        if( itm.id == id ) then
            found = true;
        else
            i = i + 1;
            stack[i] = itm;
        end;
        world:erase( itm, itm.number );
    end;
    while( i >= 0 ) do
        world:createItemFromItem( stack[i], pos, true );
        i = i - 1;
    end;

end
