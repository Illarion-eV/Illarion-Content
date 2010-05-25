require("base.common")

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if ( SourceItem.data == 50 ) then
        blsEffect = User.effects:find( 2701 );
        
        if ( blsEffect == nil ) then
            --blsEffect = CLongTimeEffect( 2701, 36000 );
            blsEffect = CLongTimeEffect( 2701, 600 );
            User.effects:addEffect( blsEffect, true );
        else
            User:inform( "The power of the sword appears to be drained." );
        end;
    end;
end;

function LookAtItem(User,Item)
    if ( Item.data == 50 ) then
        world:itemInform( User, Item, "blessed longsword" );    
    end;
end;