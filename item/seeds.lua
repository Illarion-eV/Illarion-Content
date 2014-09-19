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
local common = require("base.common")
local sowing = require("content.gatheringcraft.sowing")

local M = {}

-- UPDATE items SET itm_script='item.seeds' WHERE itm_id IN (259,291,534,2494,2917,728,773,779);

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 247 WHERE itm_id = 246;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 248 WHERE itm_id = 247;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 246 WHERE itm_id = 248;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 259 WHERE itm_id = 259;

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 289 WHERE itm_id = 288;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 290 WHERE itm_id = 289;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 291 WHERE itm_id = 290;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 291 WHERE itm_id = 291;

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 536 WHERE itm_id = 535;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 537 WHERE itm_id = 536;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 534 WHERE itm_id = 537;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 534 WHERE itm_id = 534;

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 2491 WHERE itm_id = 2490;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 2492 WHERE itm_id = 2491;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 2494 WHERE itm_id = 2492;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 2494 WHERE itm_id = 2494;

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 539 WHERE itm_id = 538;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 540 WHERE itm_id = 539;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 2917 WHERE itm_id = 540;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 2917 WHERE itm_id = 2917;

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 730 WHERE itm_id = 729;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 731 WHERE itm_id = 730;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 732 WHERE itm_id = 731;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 732 WHERE itm_id = 732;

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 775 WHERE itm_id = 774;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 776 WHERE itm_id = 775;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 777 WHERE itm_id = 776;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 773 WHERE itm_id = 777;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 773 WHERE itm_id = 773;

-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 781 WHERE itm_id = 780;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 782 WHERE itm_id = 781;
-- UPDATE items SET com_agingspeed = 2, com_objectafterrot = 779 WHERE itm_id = 782;
-- UPDATE items SET com_agingspeed = 4, com_objectafterrot = 779 WHERE itm_id = 779;



function M.UseItem(User, SourceItem, ltstate)

	sowing.StartGathering(User, SourceItem, ltstate);
end


-- some plants rot to seeds again, those have a different data value
function M.MoveItemBeforeMove(User, SourceItem, TargetItem)
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
    common.HighInformNLS(User,
		"Du brauchst eine Sichel, um die Samen zu ernten.",
		"You need a sickle to harvest the seeds.");
    return false;
  end
  return true;
end

-- function M.MoveItemAfterMove(User, SourceItem, TargetItem)
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

return M

