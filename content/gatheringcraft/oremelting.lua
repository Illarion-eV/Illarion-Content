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
-- Forge off: 2836
-- Forge on: 2835

-- Forge off: 2837
-- Forge on: 2834

-- coal (21) + { iron ore (22), copper ore (2536), gold nuggets (234), silver ore (1062), merinium ore (2534)}
--          --> {iron (2535), copper (2550), silver (104), gold (236), merinium (2571)} ingot

-- additional tool: crucible-pincers (2751)


require("base.common")
require("content.gathering")

module("content.gatheringcraft.oremelting", package.seeall)

-- creates a simple item struct that specifies the id and the amount that is needed
-- @param itemId  The ID of that item.
-- @param itemAmount  The amount of that item. Default is 1.
function CreateItem(itemId, itemAmount)
  if (itemAmount == nil) then
    itemAmount = 1;
  end
  return {id = itemId, amount = itemAmount};
end

-- @param oreItem  Item struct of the ore. The amount specifies how many are required.
-- @param productItem  Item struct of the product (the ingot). The amount specifies how many are produced.
function CreateOre(oreItem, productItem, additionalRequiredItems)
  return {ore = oreItem, product = productItem};
end

OreList = {
  CreateOre(CreateItem(22), CreateItem(2535)),                              -- iron
  CreateOre(CreateItem(2536), CreateItem(2550)),                            -- copper
  CreateOre(CreateItem(234), CreateItem(236)),                              -- gold
  CreateOre(CreateItem(1062), CreateItem(104)),  							-- silver
  CreateOre(CreateItem(2534), CreateItem(2571))                             -- merinium (pure fire required)
};
CoalItem = CreateItem(21);

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local oremelting = content.gathering.oremelting;

	base.common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
		if (User:increaseAttrib("sex",0) == 0) then
			gText = "seine";
			eText = "his";
		else
			gText = "ihre";
			eText = "her";
		end
		User:talk(Character.say, "#me unterbricht "..gText.." Arbeit.", "#me interrupts "..eText.." work.")

		if (SourceItem.id == 2834) then --swapping
			SourceItem.id = 2837;
			SourceItem.wear = 255;
			world:changeItem(SourceItem);
			User:changeSource(SourceItem);
		end

		if (SourceItem.id == 2835) then --swapping
			SourceItem.id = 2836;
			SourceItem.wear = 255;
			world:changeItem(SourceItem);
			User:changeSource(SourceItem);
		end

		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	-- additional tool item is needed
	if (User:countItemAt("all",2751)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Tiegelzange um Erz zu schmelzen.",
		"You need a pair of crucible-pincers for melting ore." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 2751 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2751 ) then
			base.common.HighInformNLS( User,
			"Du musst die Tiegelzange in der Hand haben!",
			"You have to hold the crucible-pincers in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		if (SourceItem.id == 2835) then --turn it off
			SourceItem.id = 2836;
			SourceItem.wear = 255;
			world:changeItem(SourceItem);
			User:changeSource(SourceItem);
		end

		if (SourceItem.id == 2834) then
			SourceItem.id = 2837;
			SourceItem.wear = 255;
			world:changeItem(SourceItem);
			User:changeSource(SourceItem);
		end

		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?

	if (User:countItemAt("all",CoalItem.id)<CoalItem.amount) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Kohle um an der Esse zu arbeiten.",
		"You need coal for working at the forge." );
		return;
	end

  -- NOTE: we assume here that the user's items do not change while working.
  -- => the ore that we found at the beginning is the same as in the end.
  local oreItem = nil;
  for _,i in pairs(OreList) do
    if (User:countItemAt("all",i.ore.id)>=i.ore.amount) then
        oreItem = i;
        break;
    end
  end
  
  
  if (oreItem == nil) then
		base.common.HighInformNLS( User,
		"Du brauchst Eisenerz, Kupfererz, Silbererz, Goldnuggets oder Meriniumerz um es zu schmelzen.",
		"You need iron ore, copper ore, silver ore, gold nuggets or merinium ore for melting it." );
    return;
  end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
    -- oh wait, check if someone else is working at the tool
    if (SourceItem.id == 2836) or (SourceItem.id == 2837) then
      -- alright, it's off
      oremelting.SavedWorkTime[User.id] = oremelting:GenWorkTime(User,toolItem);
      User:startAction( oremelting.SavedWorkTime[User.id], 0, 0, 0, 0);
      User:talk(Character.say, "#me beginnt an der Esse Erz zu schmelzen.", "#me starts to melt ore at the forge.")

	     if (SourceItem.id == 2836) then --turn it on!
            SourceItem.id = 2835;
			SourceItem.wear = 2;
            world:changeItem(SourceItem);
            User:changeSource(SourceItem);
	    end

	    if (SourceItem.id == 2837) then --turn it on!
            SourceItem.id = 2834;
			SourceItem.wear = 2;
            world:changeItem(SourceItem);
            User:changeSource(SourceItem);
	    end

    else
      -- it's on, can't work now.
      base.common.HighInformNLS( User,
      "Jemand anderes arbeitet schon an der Esse.",
      "Someone else is already working at the forge." );
    end
		return
	end

	-- since we're here, we're working

	if oremelting:FindRandomItem(User) then

    if (SourceItem.id == 2835) then --turn it off
      SourceItem.id = 2836;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end

	if (SourceItem.id == 2834) then
      SourceItem.id = 2837;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end

		return

	end

	User:learn( oremelting.LeadSkill, oremelting.SavedWorkTime[User.id], oremelting.LearnLimit);
	User:eraseItem( oreItem.ore.id, oreItem.ore.amount ); -- erase the item we're working on
  User:eraseItem( CoalItem.id, CoalItem.amount );

	local amount = oreItem.product.amount; -- set the amount of items that are produced
	local notCreated = User:createItem( oreItem.product.id, amount, 333, nil ); -- create the new produced items
  local nextActionStarted = false;
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( oreItem.product.id, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
    if (User:countItemAt("all",CoalItem.id)>=CoalItem.amount) then  -- there are still items we can work on
      if (User:countItemAt("all",oreItem.ore.id)>=oreItem.ore.amount) then

          oremelting.SavedWorkTime[User.id] = oremelting:GenWorkTime(User,toolItem);
          User:startAction( oremelting.SavedWorkTime[User.id], 0, 0, 0, 0);
          nextActionStarted = true;

      else -- no ore
        base.common.HighInformNLS(User,
        "Du brauchst Eisenerz, Kupfererz, Silbererz, Goldnuggets oder Meriniumerz um es zu schmelzen.",
        "You need iron ore, copper ore, silver ore, gold nuggets or merinium ore for melting it." );
      end
    else -- no coal
      base.common.HighInformNLS(User,
      "Du hast nicht mehr genug Kohle.",
      "You don't have enough coal anymore." );
    end
	end

	if base.common.GatheringToolBreaks( User, toolItem, oremelting:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Tiegelzange zerbricht.",
		"Your old crucible-pincers break.");

    if (SourceItem.id == 2835) then --turn it off
      SourceItem.id = 2836;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end

	if (SourceItem.id == 2834) then --turn it off
      SourceItem.id = 2837;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end

		return
	end
  if (not nextActionStarted) then

    if (SourceItem.id == 2835) then --turn it off
      SourceItem.id = 2836;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end

	if (SourceItem.id == 2834) then --turn it off
      SourceItem.id = 2837;
	  SourceItem.wear = 255;
      world:changeItem(SourceItem);
      User:changeSource(SourceItem);
    end

  end
end
