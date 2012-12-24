-- UPDATE common SET com_script = 'item.id_917_cursedshield' WHERE com_itemid = 917;

require("base.common")
require("item.general.metal")

module("item.id_917_cursedshield", package.seeall, package.seeall(item.general.metal))

function MoveItemBeforeMove( User, SourceItem, TargetItem )
    -- if shield was purified, then no possibility of curse
    if ( tonumber(SourceItem:getData("cursedShield")) == 1 ) then return true; end;
    
    -- if the shield is cursed, make it impossible to unequip
    if ( tonumber(SourceItem:getData("cursedShield")) == 2 ) and ( ( SourceItem.itempos == 5 ) or ( SourceItem.itempos == 6 ) ) then
        -- if successfully removed
        if ( math.random( 2000 ) <= User:increaseAttrib( "willpower", 0 ) * 4 ) then
            base.common.InformNLS( User, "Mit deinem starken Willen und Ausdauer schaffst du es, das verfluchte Schild von deiner Hand zu lösen.", "With a strong will and perseverance, you manage to detach the cursed shield from your hand." )
            return true;
        end;
        -- else unable to remove shield
        base.common.InformNLS( User, "Eine dunkle Energie scheint dich daran zu hindern das Schild loszulassen.", "Some kind of dark energy seems to prohibit you from releasing the shield." );
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
        if ( tonumber(SourceItem:getData("cursedShield")) == 2 ) then curseChance = 1; end;
        
        if ( curseChance == 1 ) then
            tonumber(TargetItem:getData("cursedShield")) = 2;
            world:changeItem( TargetItem );
            base.common.InformNLS( User, "Eine plötzliche dunkle Energie strömt aus dem Schild und scheint deine Hand zu packen.", "A sudden dark energy emenates from the shield and seems to clutch to your hand." );
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
