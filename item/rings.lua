-- UPDATE common SET com_script = 'item.id_rings' WHERE com_itemid IN (68, 277, 278, 279, 280, 281, 282);

require("item.id_general.jewel")
require("content.jewelbonus")

require("item.id_rings", package.seeall, package.seeall(item.id_general.jewel))

function MoveItemAfterMove( User, SourceItem, TargetItem )
    --User:inform("in move");
    stoneNr,stoneStr=content.jewelbonus.getBonus(TargetItem);
    --User:inform("bla");
    if stoneNr>0 then                                                   -- obviously a gem was inserted!
        if ((TargetItem.itempos==7) or (TargetItem.itempos==8)) then    -- put on a finger
            content.jewelbonus.giveBonus(User,TargetItem);                                 -- now raise corresponding attribute(s) and start LTE
        elseif ((SourceItem.itempos==7) or (SourceItem.itempos==8)) then  -- taken off of a finger
            content.jewelbonus.takeBonus(User,SourceItem,stoneNr,stoneStr);                -- now lower corresponding attribute(s) and remove/change LTE
        end
        --User:inform("blubb");
    end
end