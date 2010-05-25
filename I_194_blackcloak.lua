dofile( "base_lookat.lua" );
require("base.common")
function LookAtItem(User,Item)
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,3,false,true )); 
end

function MoveItemAfterMove( User, SourceItem, TargetItem )
    --anlegen des schattenmantels
    if ( TargetItem:getType() == 4 and (TargetItem.itempos == 7 or TargetItem.itempos == 8) and TargetItem.data == 100 ) then
        --unsichtbarkeitseffekt hinzu fuegen
        User.effects:addEffect( CLongTimeEffect(11,10) );
    --ablegen des schattenmantels
    elseif ( TargetItem.data == 100 ) then
        fnd, eff = User.effects:find( 11 );
        if ( fnd ) then
            User.effects:removeEffect( 11 );
        end
    end
end

