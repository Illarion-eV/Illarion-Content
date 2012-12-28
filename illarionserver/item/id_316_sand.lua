require("base.common")


module("item.id_316_sand", package.seeall)

-- UPDATE common SET com_script='item.id_316_sand' WHERE com_itemid = 316;

function MoveItemBeforeMove(User, SourceItem, TargetItem)
    deleteIt=false;
    GroundItem=world:getItemOnField(TargetItem.pos);
    if (GroundItem.id==10) then
        world:erase(GroundItem,1);
        deleteIt=true
        world:gfx(45,TargetItem.pos);
    end
    return true
end

function MoveItemAfterMove(User, SourceItem, TargetItem)
    if deleteIt then world:erase(TargetItem,1) end
end
