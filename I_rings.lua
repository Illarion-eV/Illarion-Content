dofile("base_lookat_jewel.lua");        -- takes care of lookats
dofile("base_jewel_bonus.lua");   -- takes care of bonus stuff from puting on that ring

function MoveItemAfterMove( User, SourceItem, TargetItem )
    --User:inform("in move");
    stoneNr,stoneStr=getBonus(TargetItem);
    --User:inform("bla");
    if stoneNr>0 then                                                   -- obviously a gem was inserted!
        if ((TargetItem.itempos==7) or (TargetItem.itempos==8)) then    -- put on a finger
            giveBonus(User,TargetItem);                                 -- now raise corresponding attribute(s) and start LTE
        elseif ((SourceItem.itempos==7) or (SourceItem.itempos==8)) then  -- taken off of a finger
            takeBonus(User,SourceItem,stoneNr,stoneStr);                -- now lower corresponding attribute(s) and remove/change LTE
        end
        --User:inform("blubb");
    end
end

function UseItem(User, SourceItem, TargetItem, Counter, param)
    --User:inform("test");
end