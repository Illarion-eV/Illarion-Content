require("base.common")
require("base.treasure")

-- UPDATE common SET com_script='item.id_505_treasuremap' WHERE com_itemid IN (505);

module("item.id_505_treasuremap", package.seeall)

function LookAtItem(User, Item)

    local dir = base.treasure.getDirection( User, Item );
    local distance = base.treasure.getDistance (User, Item );
    local TreasureName = base.treasure.GetTreasureName( math.floor(Item.quality/100), User:getPlayerLanguage(), not dir );

    if not dir then
        world:itemInform( User, Item, base.common.GetNLS( User,
            "Eine Karte mit einer Markierung auf einer Position irgendwo in deiner unmittelbaren Nähe. Du vermutest, dass es sich um "..TreasureName.." handelt.",
            "A map that shows a position somewhere really close to your current position. You think it could be "..TreasureName.."." ) );
    elseif string.find(dir,"wrong")~=nil then
        world:itemInform( User, Item, base.common.GetNLS( User,
            "Du scheinst dich nicht im richtigen Gebiet aufzuhalten.",
            "You don't seem to be in the correct area."));
    else
        world:itemInform( User, Item, base.common.GetNLS( User,
            "Eine Karte mit einer Markierung, die sich wahrscheinlich von dir aus gesehen "..distance.." im "..dir.." befindet. Du vermutest, dass es sich um "..TreasureName.." handelt.",
            "A map that shows a mark that is probably located somewhere "..distance.." in the "..dir.." of your current position. You believe the map leads to "..TreasureName.."." ) );
    end;

end;

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )  -- DONT EDIT THIS LINE!

end
