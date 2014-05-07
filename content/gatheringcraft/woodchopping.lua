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

-- trees

-- additional tool: axe ( 74 )

require("base.common")
require("content.gathering")

module("content.gatheringcraft.woodchopping", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local theCraft = content.gathering.woodchopping;

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
	if (User:countItemAt("all",74)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst ein Beil um Holz zu hacken.",
		"You need a hatchet to chop wood." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 74 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 74 ) then
			base.common.HighInformNLS( User,
			"Du musst das Beil in der Hand haben!",
			"You have to hold the hatchet in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary


	-- check if it is a special and therefore uncuttable tree
	if SourceItem:getData("uncuttableTree") ~= "" then
	    preventCutting(User, toolItem, SourceItem)
		return
	end

	local tree = TreeItems[SourceItem.id];

	-- check the amount
	local changeItem = false;
	local amount = SourceItem:getData("wood_amount");
	if ( amount == "" ) then
		amount = tree.Amount;
		SourceItem:setData("wood_amount", "" .. amount);
		changeItem = true;
	else
		amount = tonumber(amount);
	end

	if ( amount <= 0 ) then
		-- should never happen, but handle it nevertheless
		world:erase(SourceItem, SourceItem.number);
		world:createItemFromId(tree.TrunkId, 1, SourceItem.pos, true, 333, nil);
		base.common.HighInformNLS( User,
		"Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
		"There is no wood anymore that you can chop. Give the tree time to grow again." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,toolItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 6, 0);
		User:talk(Character.say, "#me beginnt Holz zu hacken.", "#me starts to chop wood.")
		if ( changeItem ) then
			world:changeItem(SourceItem);
		end
		return;
	end

	-- since we're here, we're working
	User:performAnimation(5);
	if theCraft:FindRandomItem(User) then
		if ( changeItem ) then
			world:changeItem(SourceItem);
		end
		return
	end

	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
	amount = amount - 1;
	SourceItem:setData("wood_amount", "" .. amount);
	local producedItemId = tree.LogId;
	if (math.random() <= tree.BoughProbability ) then
		producedItemId = tree.BoughId;
	end
	local notCreated = User:createItem( producedItemId, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( producedItemId, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (amount > 0) then  -- there are still items we can work on
			theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,toolItem);
			User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 6, 0);
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, theCraft:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein altes Beil zerbricht.",
		"Your old hatchet breaks.");
	end
	if ( amount <= 0 ) then
		world:erase(SourceItem, SourceItem.number);
		world:createItemFromId(tree.TrunkId, 1, SourceItem.pos, true, 333, nil);
		base.common.HighInformNLS( User,
		"Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
		"There is no wood anymore that you can chop. Give the tree time to grow again." );
		return;
	end
	SourceItem:setData("wood_amount","" .. amount);
	world:changeItem(SourceItem);
end

function InitTreeItems()
	if ( TreeItems ~= nil ) then
		return;
	end
	TreeItems = {};

	AddTree(  11,125,2560,  56,10,0.4); -- apple tree
    AddTree(  14,125,2560,  56,10,0.4); -- apple tree
    AddTree( 299,541, 543,2786,15,0.4); -- cherry tree
    AddTree( 300,541, 543,2786,15,0.4); -- cherry tree
    AddTree( 308,309,   3,   0,12,-1); -- fir tree
    AddTree( 586,587, 544,  56,10,0.4); -- cachdern tree
    AddTree(1804,542, 544,  56,15,0.4); -- naldor tree
    AddTree(1809,584, 544,  56,24,0.4); -- eldan oak
    AddTree(1817,585,   3,   0,19,-1); -- scandrel pine
end

function AddTree(TreeId, TrunkId, LogId, BoughId, Amount, BoughProbability)
	local treeTable = {};
	treeTable.TrunkId = TrunkId;
	treeTable.LogId = LogId;
	treeTable.BoughId = BoughId;
	treeTable.Amount = Amount;
	treeTable.BoughProbability = BoughProbability;
	table.insert(TreeItems, TreeId, treeTable);
end

function preventCutting(User, theAxe, theTree)
    local effectId = tonumber(theTree:getData("uncuttableTree"))

	-- security check
	if effectId == nil then
	    return
	end

	local textInDe, textInEn
	if effectId == 1 then
	    world:gfx(2,User.pos)
		world:makeSound(13,User.pos)
		textInDe = "Aus heiterem Himmel wirst du von einem Blitz getroffen!"
		textInEn = "Out of the blue, you are struck by lightning!"
		User:increaseAttrib("hitpoints",-3000)
	else
        textInDe = "Als du zum Fällen ausholst, rutscht dir das Beil fast aus der Hand. Du kannst es gerade noch so festhalten."
		textInEn = "As you strike out, you nearly drop the hatchet. You barely keep hold of it"
	end
    User:inform(textInDe, textInEn, Character.highPriority)

end

function getChopableTree(User)
	InitTreeItems();

	local targetItem = base.common.GetFrontItem(User);
	if targetItem ~= nil and TreeItems[targetItem.id] ~= nil then
		return targetItem;
	end

	for x=-1,1 do
		for y=-1,1 do
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isItemOnField(pos) ) then
				targetItem = world:getItemOnField(pos);
				if ( targetItem ~= nil and TreeItems[targetItem.id] ~= nil) then
					return targetItem;
				end
			end
		end
	end
	return nil;

--[[
	local tree = TreeItems[TargetItem.id];

	if tree == nil then
		base.common.HighInformNLS( User,
		"Du kannst diese Baumart nicht fällen.",
		"You cannot cut down this kind of tree." );
		return;
	end;
]]
end
