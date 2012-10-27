-- UPDATE common SET com_script = 'item.id_917_cursedshield' WHERE com_itemid = 917;

require("base.common")
require("item.general.metal")

module("item.id_917_cursedshield", package.seeall, package.seeall(item.general.metal))

function MoveItemBeforeMove( User, SourceItem, TargetItem )
    -- if shield was purified, then no possibility of curse
    if ( SourceItem.data == 1 ) then return true; end;
    
    -- if the shield is cursed, make it impossible to unequip
    if ( SourceItem.data == 2 ) and ( ( SourceItem.itempos == 5 ) or ( SourceItem.itempos == 6 ) ) then
        -- if successfully removed
        if ( math.random( 2000 ) <= User:increaseAttrib( "willpower", 0 ) * 4 ) then
            base.common.InformNLS( User, "German", "With a strong will and perserverance, you manage to detach the cursed shield from your hand." )
            return true;
        end;
        -- else unable to remove shield
        base.common.InformNLS( User, "German", "Some kind of dark energy seems to prohibit you from releasing the shield." );
        return false;
    end;
    
    return true;
end;

function MoveItemAfterMove( User, SourceItem, TargetItem )
    -- if shield equipped in hands
    if ( TargetItem.itempos == 5 ) or ( TargetItem.pos == 6 )then
        -- if curse gets in effect
        local curseChance = math.random( 5 + User:increaseAttrib( "essence", 0 ) + math.floor( User:getSkill(Character.magicResistance) / 5 ) );
        -- if shield curse had already been effected, but user managed to remove it
        if ( SourceItem.data == 2 ) then curseChance = 1; end;
        
        if ( curseChance == 1 ) then
            TargetItem.data = 2;
            world:changeItem( TargetItem );
            base.common.InformNLS( User, "German", "A sudden dark energy emenates from the shield and seems to clutch to your hand." );
            return true;
        end;
    end;
    
    return true;
end;

--function LookAtItem(User,Item)
--    if ( Item.data == 1 ) then
--        world:itemInform( User, Item, "Heavy Metal Shield" );
--    else
--        world:itemInform( User, Item, "Cursed Shield" );
--    end;
--end
