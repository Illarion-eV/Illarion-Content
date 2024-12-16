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

M.hiveList = {
    { id = Item.firewaspHive, productId = Item.firewaspHoneycomb, monster = 278, maxAmount = 10},
    { id = Item.beeHouse, productId = Item.honeycomb, monster = 271, maxAmount = 20}
}

M.skill = "husbandry"

local hiveList = M.hiveList

local function getBee(sourceItem)

    for _, hive in pairs(hiveList) do
        if hive.id == sourceItem.id then
            return hive.monster
        end
    end

    return nil

end

local function emptyInform(user)
    common.TempInformNLS(user,
        "Dieser Bienenstock ist leer. Gib den Bienen einige Zeit neuen Honig zu machen.",
        "This beehive is empty. Give the bees some time to make new honey." )
end

function M.StartGathering(user, sourceItem, actionstate)

    local bee = getBee(sourceItem)

    if not bee then -- should never happen, but who knows
        log("No bee id was found for a hive at "..tostring(sourceItem.pos)..", please report this incident to a developer if you aren't one.")
        return
    end

    local honeygathering = gathering.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}
    local maxAmount = gathering.getMaxAmountFromResourceList(hiveList, sourceItem.id)
    local resourceID = gathering.getProductId(hiveList, sourceItem.id)
    local restockWear = 3 -- 15 minutes, it is one less than the other gathering skills as we don't rely on actual wear and thus do not have to account for when in the cycle it is

    local success, _, amount, gatheringBonus = gathering.InitGathering(user, sourceItem, nil, maxAmount, honeygathering.LeadSkill)

    if not success then
        return
    end

    honeygathering:AddRandomPureElement(user,gathering.prob_element*gatheringBonus); -- Any pure element
    honeygathering:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"Oh! Jemand hat eine Schatzkarte in diesem Bienenstock versteckt. Was für eine Überraschung!","Oh! Someone has hidden a treasure map in this hive. What a surprise!");
    honeygathering:AddMonster(user, bee, gathering.prob_monster/gatheringBonus,"Eine über deine Handlungen etwas erboste Wespe scheint sich dazu entschlossen zu haben, deinen Handlungen ein Ende zu setzten.","A wasp, unamused by your deeds, decides to attack!",4,7);
    honeygathering:AddRandomItem(2744,1,333,{},gathering.prob_rarely,"Ein Imkerkollege scheint hier seine Pfeife vergessen zu haben. Du nimmst sie an dich.","A beekeeper colleague must have forgotten his pipe for smoking out the bees. You take it with you."); --Pipe
    honeygathering:AddRandomItem(151,1,333,{},gathering.prob_occasionally,"Die Bienen haben offensichtlich Vorräte angelegt. Sogar eine ganze Erdbeere haben sie in ihren Stock geschleppt.","As you carefully pull honey from the hive you notice a sticky strawberry in your grasp!"); --Strawberry
    honeygathering:AddRandomItem(431,1,333,{},gathering.prob_frequently,"An deinen Händen bleibt klebriger Wachs hängen.","Your hands get stuck in sticky wax.", 0); --Wax

    if ( actionstate == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem(user, sourceItem ) then -- security check
        return
    end

    if not common.FitForWork(user ) then -- check minimal food points
        return
    end

    common.TurnTo(user, sourceItem.pos ) -- turn if necessary

    if amount < maxAmount then -- Since beehives have no depleted graphic, we make our own replenishment functionality in script

        local serverTime = world:getTime("unix")

        local savedTime = sourceItem:getData("lastHarvested")

        if not common.IsNilOrEmpty(savedTime) and serverTime >= tonumber(savedTime) + (restockWear*5*60) then
            amount = maxAmount
        end
    end

    if amount == 0 then
        emptyInform(user)
        return
    end

    if ( actionstate == Action.none ) then -- currently not working -> let's go
        honeygathering.SavedWorkTime[user.id] = honeygathering:GenWorkTime(user)
        user:startAction( honeygathering.SavedWorkTime[user.id], 21, 10, 0, 0)
        return
    end

    user:learn( honeygathering.LeadSkill, honeygathering.SavedWorkTime[user.id], honeygathering.LearnLimit);

    honeygathering:FindRandomItem(user, nil)

    local created, newAmount = gathering.FindResource(user, sourceItem, amount, resourceID)

    local serverTime = world:getTime("unix")

    sourceItem:setData("lastHarvested", serverTime)

    if created and newAmount > 0 then
        user:changeSource(sourceItem)
        honeygathering.SavedWorkTime[user.id] = honeygathering:GenWorkTime(user)
        user:startAction( honeygathering.SavedWorkTime[user.id], 21, 10, 0, 0)
    end

    if newAmount and newAmount <= 0 then
        emptyInform(user)
    end

end

return M
