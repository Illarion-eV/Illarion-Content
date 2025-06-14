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
local moreUtility = require("housing.moreUtility")

local M = {}

local seeds = {

    {id = Item.grain, plant = 246, yield = 3},
    {id = Item.tomatoSeeds, plant = 538, yield = 3},
    {id = Item.cucumberSeeds, plant = 4331, yield = 2.5},
    {id = Item.lettuceSeeds, plant = 4826, yield = 2.5},
    {id = Item.hopSeeds, plant = 729, yield = 2.5},
    {id = Item.onionSeeds, plant = 535, yield = 2.5},
    {id = Item.carrotSeeds, plant = 2490, yield = 2.1},
    {id = Item.potatoSeeds, plant = 3562, yield = 2.1},
    {id = Item.witheredCabbage, plant = 288, yield = 2},
    {id = Item.cornSeeds, plant = 4334, yield = 1.9},
    {id = Item.sugarcaneSeeds, plant = 780, yield = 1.7},
    {id = Item.tobaccoSeeds, plant = 774, yield = 1.65},
    {id = Item.bellpepperSeeds, plant = 4328, yield = 1.6},
    {id = Item.pumpkinSeeds, plant = 4831, yield = 1.5},
}


M.seeds = seeds

local function getAmountAndPlant(theSeed)

    for _, seed in pairs(seeds) do
        if seed.id == theSeed.id then

            local amount = math.floor(seed.yield)

            local random = math.random()

            if random <= seed.yield-amount then
                amount = amount + 1
            end

            return amount, seed.plant
        end
    end

end

-- gets the free position for seeds
local function getFreeFieldPosition(user)

    local frontField = common.GetFrontPosition(user)
    local field = world:getField(frontField)
    local groundType = common.GetGroundType(field:tile())
    local itemOnField = world:isItemOnField(frontField)

    if not itemOnField and groundType == 1 then
        return frontField;
    end

    local Radius = 1

    for x=-Radius,Radius do
        for y=-Radius,Radius do
            local checkPos = position(user.pos.x + x, user.pos.y + y, user.pos.z)
            if not world:isItemOnField(checkPos) then
                field = world:getField(checkPos);
                groundType = common.GetGroundType(field:tile())
                if groundType == 1 then
                    return checkPos
                end
            end
        end
    end
end

local function passesLevelReq(user, theSeed)

    local farmingLevel = user:getSkill(Character.farming)

    local itemCommon = world:getItemStatsFromId(theSeed.id)

    local level = itemCommon.Level

    if farmingLevel < level then
        user:inform("Dein Ackerbaulevel ist nicht hoch genug, um diese Samen zu säen." , "Your level of farming is not high enough to sow these seeds.")
        return false
    end

    return true
end

function M.StartGathering(user, theSeed, actionState)

    local propertyName = moreUtility.fetchPropertyName(user)

    if propertyName then --It is on a housing property! To avoid players renting it once then making use of its fields for free after, we disable fields on unrented properties.

        local propertyDeed = moreUtility.getPropertyDeed(propertyName)

        if moreUtility.checkOwner(propertyDeed) == "Unowned" then
            common.HighInformNLS(user,
            "Leider hat diese Immobilie keinen Mieter, der ihr Feld pflegt, wodurch es austrocknet und nicht mehr fruchtbar für die Aussaat ist.",
            "Sadly this property has no tenant to maintain its field, causing them to dry up and no longer be fertile for seeds to be planted in.")
            return false, false
        end
    end

    local itemCommon = world:getItemStatsFromId(theSeed.id)

    local level = itemCommon.Level

    local sowing = gathering.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = level+20 }

    if theSeed.number < 1 then
        user:inform("Du hast das Saatgut aufgebraucht.","You used all the seeds.", Character.lowPriority)
        return
    end

    local targetPos = getFreeFieldPosition(user)

    if targetPos == nil then
        targetPos = common.GetFrontPosition(user)
    end

    common.ResetInterruption( user, actionState)

    if actionState == Action.abort then -- work interrupted
        return
    end

    if not common.FitForWork(user) then -- check minimal food points
        return
    end

    if not passesLevelReq(user, theSeed) then
        return
    end

    common.TurnTo(user, targetPos) -- turn if necessary

    -- should not stack plants on top of anything

    if world:isItemOnField(targetPos) then
        common.TempInformNLS(user,
        "Du kannst nur auf einem freien Feld Saatgut aussäen.",
        "Sowing seeds is only possible at a free spot.")
        return
    end

  -- only on farm land

    local Field = world:getField(targetPos)
    local groundType = common.GetGroundType( Field:tile() )

    if ( groundType ~= 1 ) then
        common.TempInformNLS(user,
        "Du kannst nur auf Ackerboden Saatgut aussäen.",
        "Sowing seeds is only possible on farm land.")
        return
    end

    local GFX = 21

    if actionState == Action.none then -- currently not working -> let's go

        sowing.SavedWorkTime[user.id] = sowing:GenWorkTime(user)

        user:startAction( sowing.SavedWorkTime[user.id], GFX, sowing.SavedWorkTime[user.id], 0, 0)

    -- this is no batch action => no emote message, only inform player

        if sowing.SavedWorkTime[user.id] > 15 then
            common.TempInformNLS(user, "Du säst Saatgut aus.","You sow seeds.")
        end

        return
    end

    local nextField = getFreeFieldPosition(user)
    if (nextField~=nil) then  -- there are still free fields
        common.TurnTo( user, nextField) -- turn
        sowing.SavedWorkTime[user.id] = sowing:GenWorkTime(user)
        user:startAction( sowing.SavedWorkTime[user.id], GFX, sowing.SavedWorkTime[user.id], 0, 0)
    end

    -- since we're here, we're working

    user:learn( sowing.LeadSkill, sowing.SavedWorkTime[user.id], sowing.LearnLimit)

    -- you always get at least one

    local amount, plantId = getAmountAndPlant(theSeed)


    world:createItemFromId( plantId, 1, targetPos, true, 333 , {["amount"] = tostring(amount)})
    world:erase( theSeed, 1 ) -- erase the seed
    theSeed.number = theSeed.number - 1
    user:changeSource(theSeed)
end

return M
