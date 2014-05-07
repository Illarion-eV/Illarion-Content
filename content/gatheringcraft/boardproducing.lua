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

-- workbench (724, 725)

-- conifer wood (3) --> conifer wooden boards (2543)
-- cherry wood (543) --> cherry wood boards(545)
-- naldor wood (544) --> naldor wood boards(546)
-- applewood (2560) --> apple wood boards(2716)

-- additional tool: saw (9)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.boardproducing", package.seeall)

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
-- @param productItem  Item struct of the product (the ingot). The amount specifies how many are produced.
function CreateCraftItem(sourceItem, productItem)
	return {source = sourceItem, product = productItem};
end

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local boardproducing = content.gathering.boardproducing;

	if (craftList == nil) then
		craftList = {
			CreateCraftItem(CreateItem(3), CreateItem(2543)),             -- conifer
			CreateCraftItem(CreateItem(543), CreateItem(545)),            -- cherry
			CreateCraftItem(CreateItem(544), CreateItem(546)),            -- naldor
			CreateCraftItem(CreateItem(2560), CreateItem(2716))           -- apple/deciduous
		};
	end

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

	-- additional tool item is needed
	if (User:countItemAt("all",9)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Säge um Bretter herzustellen.",
		"You need a saw for producing boards." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 9 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 9 ) then
			base.common.HighInformNLS( User,
			"Du musst die Säge in der Hand haben!",
			"You have to hold the saw in your hand!" );
			return
		end
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
		"Du brauchst Nadelholz, Kirschholz, Naldorholz oder Apfelholz um es zu zersägen.",
		"You need conifer wood, cherry wood, naldor wood or applewood for sawing them." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		boardproducing.SavedWorkTime[User.id] = boardproducing:GenWorkTime(User,toolItem);
		User:startAction( boardproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Holz zu sägen.", "#me starts to saw wood.")
		return
	end

	-- since we're here, we're working

	if boardproducing:FindRandomItem(User) then
		return
	end

	User:learn( boardproducing.LeadSkill, boardproducing.SavedWorkTime[User.id], boardproducing.LearnLimit);
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
			boardproducing.SavedWorkTime[User.id] = boardproducing:GenWorkTime(User,toolItem);
			User:startAction( boardproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Holz mehr.",
			"You have no wood anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, boardproducing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Säge zerbricht.",
		"Your old saw breaks.");
		return
	end
end
