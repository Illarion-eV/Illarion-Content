--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- sowing seeds
require("base.common")
require("content.gatheringcraft.sowing")

module("item.seeds", package.seeall)

-- UPDATE common SET com_script='item.seeds' WHERE com_itemid IN (259,291,534,2494,2917,728,773,779);

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 247 WHERE com_itemid = 246;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 248 WHERE com_itemid = 247;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 246 WHERE com_itemid = 248;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 259 WHERE com_itemid = 259;

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 289 WHERE com_itemid = 288;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 290 WHERE com_itemid = 289;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 291 WHERE com_itemid = 290;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 291 WHERE com_itemid = 291;

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 536 WHERE com_itemid = 535;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 537 WHERE com_itemid = 536;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 534 WHERE com_itemid = 537;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 534 WHERE com_itemid = 534;

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 2491 WHERE com_itemid = 2490;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 2492 WHERE com_itemid = 2491;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 2494 WHERE com_itemid = 2492;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2494 WHERE com_itemid = 2494;

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 539 WHERE com_itemid = 538;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 540 WHERE com_itemid = 539;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 2917 WHERE com_itemid = 540;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2917 WHERE com_itemid = 2917;

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 730 WHERE com_itemid = 729;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 731 WHERE com_itemid = 730;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 732 WHERE com_itemid = 731;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 732 WHERE com_itemid = 732;

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 775 WHERE com_itemid = 774;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 776 WHERE com_itemid = 775;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 777 WHERE com_itemid = 776;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 773 WHERE com_itemid = 777;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 773 WHERE com_itemid = 773;

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 781 WHERE com_itemid = 780;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 782 WHERE com_itemid = 781;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 779 WHERE com_itemid = 782;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 779 WHERE com_itemid = 779;



function UseItem(User, SourceItem, ltstate)

	content.gatheringcraft.sowing.StartGathering(User, nil, ltstate);
end


-- some plants rot to seeds again, those have a different data value
function MoveItemBeforeMove(User, SourceItem, TargetItem)
  local amount = SourceItem:getData("amount");
  if (amount ~= "") then
    -- amount = tonumber(amount);
    -- debug("move seed, amount " .. amount);
    -- if (amount == 2) then
      -- world:createItemFromId( SourceItem.id, amount, User.pos, true, 333, nil );
    -- elseif (amount == 3) then
      -- if (TargetItem:getType() == 3) then
        -- -- item is dragged to the map
        -- world:createItemFromId( SourceItem.id, amount, TargetItem.pos, true, 333, nil );
      -- else
        -- -- item is dragged to the User
        -- User:createItem(SourceItem.id, amount, 333, nil);
      -- end
    -- end
    -- world:erase(SourceItem, SourceItem.number);
    -- world:increase(SourceItem, -SourceItem.number);
    base.common.HighInformNLS(User,
		"Du brauchst eine Sichel, um die Samen zu ernten.",
		"You need a sickle to harvest the seeds.");
    return false;
  end
  return true;
end

-- function MoveItemAfterMove(User, SourceItem, TargetItem)
  -- local amount = SourceItem:getData("amount");
  -- if (amount ~= "") then
    -- amount = tonumber(amount);
    -- debug("remove " .. SourceItem.number);
    -- if (TargetItem:getType() == 3) then
      -- -- item is dragged to the map
      -- world:createItemFromId( SourceItem.id, amount, User.pos, true, 333, nil );
    -- else
      -- -- item is dragged to the User
      -- User:createItem(SourceItem.id, amount, 333, nil);
    -- end
    -- world:erase(SourceItem, SourceItem.number);
    -- world:erase(TargetItem, SourceItem.number);
  -- end
-- end
