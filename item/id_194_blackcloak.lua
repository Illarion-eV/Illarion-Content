-- UPDATE common SET com_script='item.id_194_blackcloak' WHERE com_itemid IN (194);

require("item.priest.cloth")
require("base.common")

module("item.id_194_blackcloak", package.seeall, package.seeall(item.priest.cloth))

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