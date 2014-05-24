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

require("base.common")
require("content.gathering")

module("content.gatheringcraft.sowing", package.seeall)

seedPlantList = {};
seedPlantList[259] = 246; -- grain
seedPlantList[291] = 288; --cabbage
seedPlantList[534] = 535; --onions
seedPlantList[2494] = 2490; --carrots
seedPlantList[2917] = 538; --tomatoes
seedPlantList[728] = 729; --hop
seedPlantList[773] = 774; --tobacco
seedPlantList[779] = 780; --sugarcane

-- gets the free position for seeds
function getFreeFieldPosition(User)
	local frontField = base.common.GetFrontPosition(User);
	local field = world:getField(frontField);
	local groundType = base.common.GetGroundType(field:tile());
	local itemOnField = world:isItemOnField(frontField);

	if not itemOnField and groundType == 1 then
		return frontField;
	end
	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local checkPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if not world:isItemOnField(checkPos) then
				field = world:getField(checkPos);
				groundType = base.common.GetGroundType(field:tile())
				if groundType == 1 then
					return checkPos;
				end
			end
		end
	end
	return nil;
end

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local farming = content.gathering.farming;

	local seed = User:getItemAt(5);
    if ( seedPlantList[seed.id] == nil ) then
		seed = User:getItemAt(6);
		if ( seedPlantList[seed.id] == nil ) then
			base.common.HighInformNLS( User,
				"Du musst das Saatgut in der Hand haben!",
				"You have to hold the seeds in your hand!" );
			return;
		end
    end

	local TargetPos = getFreeFieldPosition(User);
	if TargetPos == nil then
		TargetPos = base.common.GetFrontPosition(User);
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

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, TargetPos ); -- turn if necessary

	-- should not stack plants on top of anything
	if (world:isItemOnField(TargetPos)) then
		base.common.HighInformNLS(User,
		"Du kannst nur auf einem freien Feld Saatgut aussäen.",
		"Sowing seeds is only possible at a free spot.");
		return;
	end

  -- only on farm land
	local Field = world:getField( TargetPos )
	local groundType = base.common.GetGroundType( Field:tile() );
	if ( groundType ~= 1 ) then
		base.common.HighInformNLS(User,
			"Du kannst nur auf Ackerboden Saatgut aussäen.",
		"Sowing seeds is only possible on farm land.");
		return
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,nil);
		User:startAction( farming.SavedWorkTime[User.id], 0, 0, 0, 0);
    -- this is no batch action => no emote message, only inform player
		if farming.SavedWorkTime[User.id] > 15 then
			base.common.InformNLS(User, "Du säst Saatgut aus.","You sow seeds.");
		end
		return
	end

	local nextField = getFreeFieldPosition(User);
	if (nextField~=nil) then  -- there are still free fields
		base.common.TurnTo( User, nextField); -- turn
		farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,nil);
		User:startAction( farming.SavedWorkTime[User.id], 0, 0, 0, 0);
	end

	-- since we're here, we're working

	if farming:FindRandomItem(User) then
		return
	end

	User:learn( farming.LeadSkill, farming.SavedWorkTime[User.id], farming.LearnLimit);
	-- you always get at least one
  local amount = 1;
  -- in 50% of all cases one more
  if (math.random(1,2) == 1) then
    amount = amount + 1;
  end
  -- and another one depending on the skill
  if (User:getSkill(farming.LeadSkill) > math.random(1,100)) then
    amount = amount + 1;
  end
	world:createItemFromId( seedPlantList[seed.id], 1, TargetPos, true, 333 ,{["amount"] = "" .. amount});
	world:erase( seed, 1 ); -- erase the seed
end
