-- UPDATE common SET com_script = 'item.rings' WHERE com_itemid IN (68, 277, 278, 279, 280, 281, 282);

require("item.general.jewel")
require("content.jewelbonus")

module("item.rings", package.seeall)

function MoveItemAfterMove( User, SourceItem, TargetItem )

    stoneNr,stoneStr=content.jewelbonus.getBonus(TargetItem);

    if stoneNr>0 then                                                   -- obviously a gem was inserted!
        if ((TargetItem.itempos==7) or (TargetItem.itempos==8)) then    -- put on a finger
			if ((SourceItem.itempos == 7) or (SourceItem.itempos==8)) then
				-- no change
			else
				content.jewelbonus.giveBonus(User,TargetItem); -- now raise corresponding attribute(s) and start LTE
			end
        elseif ((SourceItem.itempos==7) or (SourceItem.itempos==8)) then  -- taken off of a finger
			content.jewelbonus.takeBonus(User,SourceItem,stoneNr,stoneStr);                -- now lower corresponding attribute(s) and remove/change LTE
        end

    end
end

function LookAtItem(User,Item)
	item.general.jewel.LookAtItem(User,Item);
end
