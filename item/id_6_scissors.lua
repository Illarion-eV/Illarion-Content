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
-- UPDATE common SET com_script='item.id_6_scissors' WHERE com_itemid IN (6);

-- sheep (monster 18) --> wool (170)
-- entrails (63) --> thread (50)

require("item.base.crafts")
require("item.general.metal")

module("item.id_6_scissors", package.seeall)

LookAtItem = item.general.metal.LookAtItem

function UseItem(User, SourceItem, ltstate)
	-- first decide if we're cutting wool or entrails
	local targetCharacter = base.common.GetFrontCharacter(User);
	-- check for sheep in front
	if (targetCharacter ~= nil and targetCharacter:getRace()==18) then
		UseItemWoolCutting( User, SourceItem, ltstate, targetCharacter );
		return;
	end
	-- look for a nearby sheep
	for x=-1,1 do
		for y=-1,1 do
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isCharacterOnField(pos) ) then
				targetCharacter = world:getCharacterOnField(pos);
				if ( targetCharacter:getRace() == 18 ) then
					UseItemWoolCutting( User, SourceItem, ltstate, targetCharacter );
					return;
				end
			end
		end
	end
	if (User:countItemAt("all",63)>0) then -- check for entrails
		UseItemEntrailsCutting( User, SourceItem, ltstate );
		return;
	end
	-- there is no sheep and no entrails
	base.common.HighInformNLS( User,
	"Du brauchst entweder ein Schaf, um es zu scheren, oder Eingeweide, um sie zu Garn zu zerschneiden.",
	"You need either a sheep for shearing it, or entrails for cutting it and thus producing thread." );
end

function UseItemWoolCutting( User, SourceItem, ltstate, Sheep )
	content.gathering.InitGathering();
	local woolcutting = content.gathering.woolcutting;

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
		"Du musst die Schere in der Hand haben!",
		"You have to hold the scissors in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, Sheep.pos ); -- turn if necessary

	-- Sheep should actually be already a sheep character struct, but check it nevertheless
	if ( Sheep == nil or (Sheep ~= nil and Sheep:getRace()~=18) ) then
		base.common.HighInformNLS( User,
		"Du musst vor einem Schaf stehen, um es zu scheren.",
		"You have to stand in front of a sheep for shearing it." );
		return;
	end

	-- check if sheep still gives wool
	local foundEffect, shearingEffect = Sheep.effects:find(402);
    if (not foundEffect) then
		shearingEffect = LongTimeEffect(402, 1800); -- call every 3min
		shearingEffect:addValue("gatherAmount", 0);
		Sheep.effects:addEffect(shearingEffect);
	end
	local foundAmount, gatherAmount = shearingEffect:findValue("gatherAmount");

	if ( ltstate == Action.none ) then -- currently not working -> let's go

		if gatherAmount >= 100 then
			base.common.HighInformNLS( User,
			"Dieses Schaf wurde kürzlich erst geschoren und gibt momentan keine Wolle.",
			"This sheep has been sheared recently and doesn't give wool right now." );
			return;
		end
		woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User,SourceItem);
		User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 2, 20);
		User:talk(Character.say, "#me beginnt ein Schaf zu scheren.", "#me starts to shear a sheep.")
		-- make sure the sheep doesn't move away
		Sheep.movepoints = math.min(Sheep.movepoints, -1*woolcutting.SavedWorkTime[User.id]);
		return;
	end

	-- since we're here, we're working

	if woolcutting:FindRandomItem(User) then
		return
	end

	User:learn( woolcutting.LeadSkill, woolcutting.SavedWorkTime[User.id], woolcutting.LearnLimit);

	gatherAmount = gatherAmount + 1
	shearingEffect:addValue("gatherAmount", gatherAmount);

	local notCreated = User:createItem( 170, 1, 333, nil); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 170, notCreated, User.pos, true, 333, nil);
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	elseif gatherAmount < 100 then -- character can still carry something and more wool is available
		woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User,SourceItem);
		User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 2, 20);
		-- make sure the sheep doesn't move away
		Sheep.movepoints = math.min(Sheep.movepoints, -1*woolcutting.SavedWorkTime[User.id]);
	else
		base.common.HighInformNLS( User,
		"Dieses Schaf ist nun geschoren und gibt keine Wolle mehr.",
		"This sheep is now sheared properly and doesn't give any more wool." );
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schere zerbricht.",
		"Your old scissors break.");
		return
	end
end

function UseItemEntrailsCutting( User, SourceItem, ltstate )
	content.gathering.InitGathering();
	local entrailscutting = content.gathering.entrailscutting;

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
		"Du musst die Schere in der Hand haben!",
		"You have to hold the scissors in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	-- any other checks?

	if (User:countItemAt("all",63)==0) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Eingeweide um daraus Garn herzustellen.",
		"You need entrails for producing thread." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		entrailscutting.SavedWorkTime[User.id] = entrailscutting:GenWorkTime(User,SourceItem);
		User:startAction( entrailscutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Eingeweide zu zerschneiden.", "#me starts to cut entrails.")
		return
	end

	-- since we're here, we're working

	if entrailscutting:FindRandomItem(User) then
		return
	end

	User:learn( entrailscutting.LeadSkill, entrailscutting.SavedWorkTime[User.id], entrailscutting.LearnLimit);
	User:eraseItem( 63, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 50, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 50, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",63)>0) then  -- there are still items we can work on
			entrailscutting.SavedWorkTime[User.id] = entrailscutting:GenWorkTime(User,SourceItem);
			User:startAction( entrailscutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast keine Eingeweide mehr.",
			"You have no entrails anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schere zerbricht.",
		"Your old scissors break.");
		return
	end
end
