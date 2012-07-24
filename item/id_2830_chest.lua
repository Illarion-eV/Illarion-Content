-- UPDATE common SET com_script='item.id_2830_chest' WHERE com_itemid=2830;

require("base.common")
require("base.treasure")

module("item.id_2830_chest", package.seeall)

function LookAtItem(User, Item)
    local TreasureName = base.treasure.GetTreasureName( Item.data, User:getPlayerLanguage(), false );
    world:itemInform( User, Item, TreasureName );
end

function UseItem(User,SourceItem)

    level=SourceItem.data;
    posi=SourceItem.pos;

    base.common.InformNLS(User, "Du öffnest die Schatzkiste...", "You open the treasure chest...");
	world:erase(SourceItem,1);
	if SourceItem.data ~= 0 and SourceItem.data < 10 then
        world:gfx(16,posi);
        world:makeSound(13,posi);
        base.treasure.SpawnTreasure( level, posi );
	else	
        base.common.InformNLS(User, "...sie ist leer!", "...it is empty!");
    end

end

