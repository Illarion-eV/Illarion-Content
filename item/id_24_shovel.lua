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
-- UPDATE common SET com_script='item.id_24_shovel' WHERE com_itemid=24;

require("base.common")
require("base.treasure")
require("item.general.metal")
require("content.gathering")

module("item.id_24_shovel", package.seeall, package.seeall(item.general.metal))

LookAtItem = item.general.metal.LookAtItem

SAND_PIT = 1208
CLAY_PIT = 1206

function UseItem(User, SourceItem, ltstate)
	content.gathering.InitGathering();
	-- the craft has to be determined according to ground type, see below
	if ( StoneList == nil ) then
		StoneList={ 914, 915, 1245, 1246, 1273, 1276 };
	end

	local TargetPos = base.common.GetFrontPosition(User);
	local groundTile = world:getField( TargetPos ):tile();
    local groundType = base.common.GetGroundType( groundTile );
	local gt = base.common.GroundType;

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

	if (SourceItem:getType() ~= 4) then -- tool in Hand
		base.common.HighInformNLS( User,
		"Du musst die Schaufel in der Hand haben!",
		"You have to hold the shovel in your hand!" );
		return
	end
	
	local foundSource = false;
	local TargetItem
	-- check for well or fountain
	TargetItem = base.common.GetItemInArea(User.pos, SAND_PIT);
	if (TargetItem == nil) then
		TargetItem = base.common.GetItemInArea(User.pos, CLAY_PIT);
	end
	if (TargetItem ~= nil) then
	if not base.common.IsLookingAt( User, TargetItem.pos ) then -- check looking direction
		base.common.TurnTo( User, TargetItem.pos ); -- turn if necessary
	end
		foundSource=true
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	-- first check for a treasure
	if (groundType ~= gt.rocks) and
			base.treasure.DigForTreasure( User, TargetPos, (User:getSkill(Character.mining)/10)+1,
			base.common.GetNLS( User,
				"Du gräbst mit deiner Schaufel in den Boden und stößt auf etwas hartes, von dem ein hölzerner Klang ausgeht. Noch einmal graben und du hältst den Schatz in deinen Händen.",
				"You dig with your shovel into the ground and hit suddenly something hard and wooden sounding. You only have to dig another time to get the treasure." ),
			false ) then
		return;
    end

	if not foundSource then
		if ( groundType == gt.field ) then
			base.common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Ackerboden, doch findest du hier gar nichts.",
			"You dig a small hole into the farming ground. But you find nothing.");
		elseif ( groundType == gt.sand ) then
			base.common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Dreck, doch findest du hier gar nichts.",
			"You dig a small hole into the forest ground. But you find nothing.");
		elseif ( groundType == gt.sand ) then
			base.common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Sand, doch findest du hier gar nichts.",
			"You dig a small hole into the forest ground. But you find nothing.");
		elseif ( groundType == gt.forest ) then
			base.common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in den Waldboden, doch findest du hier gar nichts.",
			"You dig a small hole into the forest ground. But you find nothing.");
		elseif ( groundType == gt.grass ) then
			base.common.HighInformNLS( User,
			"Du gräbst ein kleines Loch in die Wiese, doch findest du hier gar nichts.",
			"You dig a small hole into the grass. But you find nothing.");
		elseif ( groundType == gt.rocks ) then
			base.common.HighInformNLS( User,
			"Der Boden besteht hier aus solidem Stein. Mit einer Schaufel hast du eindeutig das falsche Werkzeug.",
			"The ground here is heavy stone. With a shovel you have the wrong tool here for sure.");
		elseif ( groundType == gt.water ) then
			base.common.HighInformNLS( User,
			"Im Wasser mit einer Schaufel zu graben geht zwar relativ leicht, doch der Effekt ist recht gering.",
			"To dig with a shovel in the water is pretty easy. But sadly there is no effect in doing this.");
		else
			base.common.HighInformNLS(User,
			"Du versuchst an dieser Stelle zu graben, findest aber nichts.",
			"You attempt to dig here, but you don't find anything.");
		end
	end
	
	local theCraft;
	local digForDE, digForEN, digForID;
	if ( TargetItem.id == SAND_PIT ) then
		theCraft = content.gathering.sanddigging;
		digForDE = "Sand";
		digForEN = "sand";
		digForID = 726;
	else
		theCraft = content.gathering.claydigging;
		digForDE = "Lehm";
		digForEN = "clay";
		digForID = 26;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,SourceItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt nach " .. digForDE .. " zu graben.", "#me starts to dig for " .. digForEN .. ".")
		return
	end
	
	
	-- check the amount
	local MaxAmount = 20
	local changeItem = false;
	local amountStr = TargetItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	elseif ( TargetItem.wear == 255 ) then
		-- first time that a (static!) herb item is harvested
		amount = MaxAmount;
		TargetItem:setData("amount","" .. MaxAmount);
		changeItem = true;
	end
	if ( amount < 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. TargetItem.id .. " at (" .. TargetPos.x .. "," .. TargetPos.y .. "," .. TargetPos.z .. "). Please inform a developer.");
		return;
	end
	if ( amount <= 1 ) then
		-- check for regrow even at amount==1, so a continuous working is guaranteed
		-- only non farming items regrow
		local serverTime = world:getTime("unix");
		for i=1,MaxAmount do
			local t = TargetItem:getData("next_regrow_" .. i);
			if ( t ~= "" and tonumber(t) <= serverTime ) then
				-- regrow
				amount = amount + 1;
				TargetItem:setData("next_regrow_" .. i, "");
				changeItem = true;
			end
		end
		if ( amount == 0 ) then
			-- not regrown...
			base.common.HighInformNLS( User,
			"An dieser Stelle gibt es nicht mehrs zu holen.",
			"There isn't anything left in this pit." );
			if ( changeItem ) then
				world:changeItem(TargetItem);
			end
			return;
		elseif ( amount > MaxAmount ) then
			-- this should never happen
			User:inform("[ERROR] Too high amount " .. amount .. " for item id " .. TargetItem.id .. " at (" .. TargetPos.x .. "," .. TargetPos.y .. "," .. TargetPos.z .. "). Please inform a developer.");
			if ( changeItem ) then
				world:changeItem(TargetItem);
			end
			return;
		else
			TargetItem:setData("amount", "" .. amount);
			changeItem = true;
		end
	end
	
	-- since we're here, we're working

	if theCraft:FindRandomItem(User) then
		if ( changeItem ) then
			world:changeItem(TargetItem);
		end
		return
	end
	
	amount = amount - 1;
	-- update the amount
	TargetItem:setData("amount", "" .. amount);
	changeItem = true;
	-- and update the next regrow
	local regrowOk = false;
	for i=1,MaxAmount do
		local t = TargetItem:getData("next_regrow_" .. i);
		-- look for a free slot
		if ( t == "") then
			TargetItem:setData("next_regrow_" .. i, "" .. world:getTime("unix") + 300);
			regrowOk = true;
			changeItem = true;
			break;
		end
	end
	if ( not regrowOk ) then
		-- there was no free slot, this should never happen
		User:inform("[ERROR] There was no regrow slot for item id " .. TargetItem.id .. " at (" .. TargetPos.x .. "," .. TargetPos.y .. "," .. TargetPos.z .. "). Please inform a developer.");
		if ( changeItem ) then
			world:changeItem(TargetItem);
		end
		return;
	end
	
  if ( changeItem ) then
		world:changeItem(TargetItem);
	end

	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
	local notCreated = User:createItem( digForID, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( digForID, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten.",
		"You can't carry any more.");
	else -- character can still carry something
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,SourceItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schaufel zerbricht.",
		"Your old shovel breaks.");
		return
	end
end