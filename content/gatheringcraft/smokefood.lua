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

-- smokingoven (305)

-- pork (307) --> ham (306)
-- trout (73) --> smoked fish (455)
-- salmon (355) --> smoked fish (455)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.smokefood", package.seeall)

-- creates a simple item struct that specifies the id and the amount that is needed
-- @param itemId  The ID of that item.
-- @param itemAmount  The amount of that item. Default is 1.
function CreateItem(itemId, itemAmount)
  if (itemAmount == nil) then
    itemAmount = 1;
  end
  return {id = itemId, amount = itemAmount};
end

-- @param sourceItem  Item struct of the source. The amount specifies how many are required.
-- @param productItem  Item struct of the product. The amount specifies how many are produced.
function CreateCraftItem(sourceItem, productItem)
  return {source = sourceItem, product = productItem};
end

craftList = {
  CreateCraftItem(CreateItem(307), CreateItem(306)),
  CreateCraftItem(CreateItem(73), CreateItem(455)),
  CreateCraftItem(CreateItem(355), CreateItem(455)),
  CreateCraftItem(CreateItem(1209), CreateItem(455)),
  CreateCraftItem(CreateItem(1210), CreateItem(455))
};

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local smokefood = content.gathering.smokefood;

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
		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?
  local craftItem = nil;
  for _,entry in pairs(craftList) do
    if (User:countItemAt("all",entry.source.id)>=entry.source.amount) then
      craftItem = entry;
      break;
    end
  end
	if (craftItem == nil) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Forellen, Lachs oder rohen Schinken um diese zu räuchern.",
		"You need trouts, salmons or ham for smoking them." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		smokefood.SavedWorkTime[User.id] = smokefood:GenWorkTime(User,nil);
		User:startAction( smokefood.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt an der Räucherhütte zu arbeiten.", "#me starts to work at the smoke oven.")
		return
	end

	-- since we're here, we're working

	if smokefood:FindRandomItem(User) then
		return
	end

	User:learn( smokefood.LeadSkill, smokefood.SavedWorkTime[User.id], smokefood.LearnLimit);
	User:eraseItem( craftItem.source.id, craftItem.source.amount ); -- erase the item we're working on
	local amount = craftItem.product.amount; -- set the amount of items that are produced
	local notCreated = User:createItem( craftItem.product.id, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( craftItem.product.id, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
    craftItem = nil;
    for _,entry in pairs(craftList) do
      if (User:countItemAt("all",entry.source.id)>=entry.source.amount) then
        craftItem = entry;
        break;
      end
    end
		if (craftItem ~= nil) then  -- there are still items we can work on
			smokefood.SavedWorkTime[User.id] = smokefood:GenWorkTime(User,nil);
			User:startAction( smokefood.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du brauchst Forellen, Lachs oder rohen Schinken um diese zu räuchern.",
      "You need trouts, salmons or ham for smoking them." );
		end
	end
end
