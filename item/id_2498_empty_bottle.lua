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

-- UPDATE items SET itm_script='item.id_2498_empty_bottle' WHERE itm_id IN (2498);

local common = require("base.common")
local milking = require("craft.gathering.milking")
local genericRarenessLookat = require("item.base.genericRarenessLookat")

local M = {}


local function GetWaterTilePosition(User)
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local targetPos = position(User.pos.x + x, User.pos.y, User.pos.z);
      if (common.GetGroundType(world:getField(targetPos):tile()) == common.GroundType.water) then
        return targetPos;
      end
    end
  end
  return nil;
end

local function UseItemScooping(user, sourceItem, ltstate)

    common.ResetInterruption( user, ltstate )
    if ( ltstate == Action.abort ) then -- work interrupted
      return
    end

    if not common.CheckItem( user, sourceItem ) then -- security check
        return
    end

    if not common.FitForWork( user ) then -- check minimal food points
        return
    end

    -- currently not working, let's go
    if ( ltstate == Action.none ) then
        user:startAction( 20, 21, 5, 10, 25)
        return
    end

    -- actually do the work, but only once because nobody wants to fill multiple bottles

    local rareness = sourceItem:getData("rareness")

    world:erase(sourceItem, 1)

    if not common.IsNilOrEmpty(rareness) then
        common.CreateItem(user, 2496, 1, 999, {["rareness"] = rareness})
    else
        common.CreateItem(user, 2496, 1, 999, nil)
    end

end

local function getAnimal(user)

    -- check for a sheep, cow or deer in front
    local targetCharacter = common.GetFrontCharacter(user)
    if (targetCharacter ~= nil and milking.isMilkable(targetCharacter)) then
        return targetCharacter
    end

    -- look for a nearby sheep, cow or deer
    for x=-1,1 do
        for y=-1,1 do
            local pos = position(user.pos.x+x, user.pos.y+y, user.pos.z)
            if ( world:isCharacterOnField(pos) ) then
                targetCharacter = world:getCharacterOnField(pos)
                if (milking.isMilkable(targetCharacter)) then
                    return targetCharacter
                end
            end
        end
    end
    return nil
end

function M.UseItem(user, sourceItem, ltstate)

    local rareness = sourceItem:getData("rareness")
    -- milking
    local animal = getAnimal(user)
    if animal ~= nil then
        milking.StartGathering(user, animal, ltstate, rareness)
        return
    end

    -- water scooping

    -- check for well or fountain
    local targetItem = common.GetItemInArea(user.pos, 2207);
    if (targetItem == nil) then
        targetItem = common.GetItemInArea(user.pos, 631);
        if (targetItem == nil) then
            targetItem = common.GetItemInArea(user.pos, 2079);
        end
        if (targetItem == nil) then
            targetItem = common.GetItemInArea(user.pos, 1097);
        end
    end
    if (targetItem ~= nil) then
        common.TurnTo( user, targetItem.pos ); -- turn if necessary
        UseItemScooping(user, sourceItem, ltstate);
        return;
    end

    -- check for water tile
    local targetPos = GetWaterTilePosition(user)
    if (targetPos ~= nil) then
        common.TurnTo( user, targetPos ) -- turn if necessary
        UseItemScooping(user, sourceItem, ltstate)
        return
    end

    -- nothing found to fill the bottle
    common.InformNLS(user,
      "Du kannst Flaschen an einem Brunnen oder an einem Gewässer füllen, oder ein geeignetes Tier melken. Lämmer und Bullen können aus naheliegenden Gründen nicht gemolken werden.",
      "You can fill bottles at a well or at some waters, or milk an adequate domestic animal. Lambs and bulls cannot be milked, obviously.");

end

function M.LookAtItem(user, sourceItem)

    return genericRarenessLookat.LookAtItem(user, sourceItem)
end

return M

