-- lumberjacking
-- UPDATE common SET com_script='item.id_74_axe' WHERE com_itemid IN (74,2946);

require("base.common")
require("item.general.metal")
require("content.gathering")

module("item.id_74_axe", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	InitTreeItems();
	local woodchopping = content.gathering.woodchopping;
	
	base.common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
		if (User:increaseAttrib("sex",0) == 0) then
			gText = "seine";
			eText = "his";
		else
			gText = "ihre";
			eText = "her";
		end
		User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
		User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end
	
	if (SourceItem:getType() ~= 4) then -- tool in Hand
		base.common.HighInformNLS( User,
		"Du musst das Beil in der Hand haben!",
		"You have to hold the hatchet in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	-- check for tree
	local TargetItem = base.common.GetFrontItem(User);
	if ( TargetItem == nil ) then -- if there is no front item, check for nearby tree
		for x=-1,1 do 
			for y=-1,1 do 
				local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
				if ( world:isItemOnField(pos) ) then
					TargetItem = world:getItemOnField(pos);
					if ( TreeItems[TargetItem.id] ~= nil) then
						break;
					end
					TargetItem = nil;
				end
			end
			if ( TargetItem ~= nil and TreeItems[TargetItem.id] ~= nil) then
				break;
			end
		end
	end
	if ( TargetItem == nil ) then
		base.common.HighInformNLS( User,
		"Um Holz zu hacken musst du zu einem Baum gehen.",
		"For chopping wood you have to go to a tree." );
		return;
	end
	
	if not base.common.IsLookingAt( User, TargetItem.pos ) then -- check looking direction
		base.common.TurnTo( User, TargetItem.pos ); -- turn if necessary
	end
	
	local tree = TreeItems[TargetItem.id];
	
	if tree == nil then
		base.common.HighInformNLS( User,
		"Du kannst diesen Baum nicht fällen.",
		"You cannot cut down this tree." );
		return;
	end;
	
	-- any other checks?
	local changeItem = false;
	local amount = TargetItem:getData("wood_amount");
	if ( amount == "" ) then
		amount = tree.Amount;
		TargetItem:setData("wood_amount", "" .. amount);
		changeItem = true;
	else
		amount = tonumber(amount);
	end
	
	if ( amount <= 0 ) then
		-- should never happen, but handle it nevertheless
		world:erase(TargetItem, TargetItem.number);
		world:createItemFromId(tree.TrunkId, 1, TargetItem.pos, true, 333, nil);
		base.common.HighInformNLS( User,
		"Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
		"There is no wood anymore that you can chop. Give the tree time to grow again." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		woodchopping.SavedWorkTime[User.id] = woodchopping:GenWorkTime(User,SourceItem);
		User:startAction( woodchopping.SavedWorkTime[User.id], 0, 0, 6, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Holz zu hacken.");
		User:talkLanguage( Character.say, Player.english, "#me starts to chop wood."); 
		if ( changeItem ) then
			world:changeItem(TargetItem);
		end
		return;
	end

	-- since we're here, we're working

	if woodchopping:FindRandomItem(User) then
		if ( changeItem ) then
			world:changeItem(TargetItem);
		end
		return
	end

	User:learn( woodchopping.LeadSkill, woodchopping.SavedWorkTime[User.id], 100 );
	amount = amount - 1;
	TargetItem:setData("wood_amount", "" .. amount);
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
		if (amount>0) then  -- there are still items we can work on
			woodchopping.SavedWorkTime[User.id] = woodchopping:GenWorkTime(User,SourceItem);
			User:startAction( woodchopping.SavedWorkTime[User.id], 0, 0, 6, 0);
		end
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein altes Beil zerbricht.",
		"Your old hatchet breaks.");
	end
	if ( amount <= 0 ) then
		world:erase(TargetItem, TargetItem.number);
		world:createItemFromId(tree.TrunkId, 1, TargetItem.pos, true, 333, nil);
		base.common.HighInformNLS( User,
		"Hier gibt es kein Holz mehr zu holen. Gib dem Baum Zeit um nachzuwachsen.",
		"There is no wood anymore that you can chop. Give the tree time to grow again." );
		return;
	end
	TargetItem:setData("wood_amount","" .. amount);
	world:changeItem(TargetItem);
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
--[[ old lists
function initLists(  )
    -- Initialisierung der Listen
    if (trees ~= nil) then
        return
    end
    trees = { };
    logs = { };
    AddTree(  11,125,560,561,562,563,2560,10,  56); -- Apfelbaum
    AddTree(  14,125,560,561,562,563,2560,10,  56); -- Apfelbaum
    AddTree( 299,541,564,565,566,567, 543,15,2786); -- Kirschbaum
    AddTree( 300,541,564,565,566,567, 543,15,2786); -- Kirschbaum
    AddTree( 308,309,572,573,574,575,   3,12,   0); -- Tanne
    AddTree( 586,587,592,593,594,595, 544,10,  56); -- Cachdern-Baum
    AddTree(1804,542,568,569,570,571, 544,15,  56); -- Naldorbaum
    AddTree(1809,584,576,577,578,579, 544,24,  56); -- Alter Naldorbaum
    AddTree(1817,585,580,581,582,583,   3,19,   0); -- Nadelbaum
end -- function initLists

function AddTree(TreeID,StumpID,NLog,OLog,SLog,WLog,Logs,maxLogs,bough)
    trees[ TreeID ] = { StumpID, NLog, OLog, SLog, WLog, maxLogs };
    logs[ NLog ] = {Logs,bough};
    logs[ OLog ] = {Logs,bough};
    logs[ SLog ] = {Logs,bough};
    logs[ WLog ] = {Logs,bough};
end
--]]
function LookAtItem(User,Item)
    item.general.metal.LookAtItem(User,Item)
end
