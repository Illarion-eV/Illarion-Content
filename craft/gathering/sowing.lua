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

local common = require("base.common")
local gathering = require("craft.base.gathering")

local M = {}

local seedPlantList = {};
seedPlantList[259] = 246; -- grain
seedPlantList[291] = 288; --cabbage
seedPlantList[534] = 535; --onions
seedPlantList[2494] = 2490; --carrots
seedPlantList[2917] = 538; --tomatoes
seedPlantList[728] = 729; --hop
seedPlantList[773] = 774; --tobacco
seedPlantList[779] = 780; --sugarcane
seedPlantList[3566] = 3562; -- potatoes

-- gets the free position for seeds
local function getFreeFieldPosition(User)
    local frontField = common.GetFrontPosition(User);
    local field = world:getField(frontField);
    local groundType = common.GetGroundType(field:tile());
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
                groundType = common.GetGroundType(field:tile())
                if groundType == 1 then
                    return checkPos;
                end
            end
        end
    end
    return nil;
end

function M.StartGathering(User, SourceItem, ltstate)

    local sowing = gathering.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = 100 }

    local seed = SourceItem
    if seed.number < 1 then
        User:inform("Du hast das Saatgut aufgebraucht.","You used all the seeds.", Character.lowPriority)
        return
    end

    local TargetPos = getFreeFieldPosition(User);
    if TargetPos == nil then
        TargetPos = common.GetFrontPosition(User);
    end

    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, TargetPos ); -- turn if necessary

    -- should not stack plants on top of anything
    if (world:isItemOnField(TargetPos)) then
        common.TempInformNLS(User,
        "Du kannst nur auf einem freien Feld Saatgut auss�en.",
        "Sowing seeds is only possible at a free spot.");
        return;
    end

  -- only on farm land
    local Field = world:getField( TargetPos )
    local groundType = common.GetGroundType( Field:tile() );
    if ( groundType ~= 1 ) then
        common.TempInformNLS(User,
            "Du kannst nur auf Ackerboden Saatgut auss�en.",
        "Sowing seeds is only possible on farm land.");
        return
    end

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        sowing.SavedWorkTime[User.id] = sowing:GenWorkTime(User);
        User:startAction( sowing.SavedWorkTime[User.id], 0, 0, 0, 0);
    -- this is no batch action => no emote message, only inform player
        if sowing.SavedWorkTime[User.id] > 15 then
            common.TempInformNLS(User, "Du s�st Saatgut aus.","You sow seeds.");
        end
        return
    end

    local nextField = getFreeFieldPosition(User);
    if (nextField~=nil) then  -- there are still free fields
        common.TurnTo( User, nextField); -- turn
        sowing.SavedWorkTime[User.id] = sowing:GenWorkTime(User);
        User:startAction( sowing.SavedWorkTime[User.id], 0, 0, 0, 0);
    end

    -- since we're here, we're working

    if sowing:FindRandomItem(User) then
        return
    end

    User:learn( sowing.LeadSkill, sowing.SavedWorkTime[User.id], sowing.LearnLimit);
    -- you always get at least one
  local amount = 1;
  -- in 50% of all cases one more
  if (math.random(1,2) == 1) then
    amount = amount + 1;
  end
  -- and another one depending on the skill
  if (User:getSkill(sowing.LeadSkill) > math.random(1,100)) then
    amount = amount + 1;
  end
    world:createItemFromId( seedPlantList[seed.id], 1, TargetPos, true, 333 ,{["amount"] = "" .. amount});
    world:erase( seed, 1 ); -- erase the seed
    seed.number = seed.number - 1
    User:changeSource(seed)
end

return M
