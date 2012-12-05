-- pork (307) --> ham (306)
-- trout (73) --> smoked fish (455)
-- salmon (355) --> smoked fish (455)

-- UPDATE common SET com_script='item.id_305_smokingoven' WHERE com_itemid IN (305,304);

require("base.common")
require("content.gathering")

module("item.id_305_smokingoven", package.seeall)

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

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local smokefood = content.gathering.smokefood;
  
  if (craftList == nil) then
    craftList = {
      CreateCraftItem(CreateItem(307), CreateItem(306)),
      CreateCraftItem(CreateItem(73), CreateItem(455)),
      CreateCraftItem(CreateItem(355), CreateItem(455))
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
		User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
		User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	if base.common.Encumbrence(User) then
		base.common.InformNLS( User,
		"Deine Rüstung behindert Dich beim Räuchern des Fisches und Schweinefleisches.",
		"Your armour disturbs you while smoking fish and pork." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?
  local craftItem = nil;
  for _,entry in pairs(craftList) do
    if (User:countItemAt("all",entry.source.id)>=entry.source.amount) then
      craftItem = entry;
      break;
    end
  end
	if (craftItem == nil) then -- check for items to work on
		base.common.InformNLS( User, 
		"Du brauchst Forellen, Lachs oder rohen Schinken um diese zu räuchern.", 
		"You need trouts, salmons or ham for smoking them." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		smokefood.SavedWorkTime[User.id] = smokefood:GenWorkTime(User,nil);
		User:startAction( smokefood.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt an der Räucherhütte zu arbeiten.");
		User:talkLanguage( Character.say, Player.english, "#me starts to work at the smoke oven."); 
		return
	end

	-- since we're here, we're working

	if smokefood:FindRandomItem(User) then
		return
	end

	User:learn( smokefood.LeadSkill, smokefood.SavedWorkTime[User.id], 100);
	User:eraseItem( craftItem.source.id, craftItem.source.amount ); -- erase the item we're working on
	local amount = craftItem.product.amount; -- set the amount of items that are produced
	local notCreated = User:createItem( craftItem.product.id, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( craftItem.product.id, notCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
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
			base.common.InformNLS(User,
			"Du brauchst Forellen, Lachs oder rohen Schinken um diese zu räuchern.", 
      "You need trouts, salmons or ham for smoking them." );
		end
	end
end