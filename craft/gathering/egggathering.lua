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
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

local function preventGathering(user, theNest)

    local effectType = theNest:getData("eggProtectionType")

    if effectType == "ssigus" then

        world:gfx(21, user.pos)

        world:makeSound(31, user.pos)

        user:inform(
            "Als du versuchst, seine Eier zu stehlen, dreht sich Ssigus um und schlägt mit einer Klaue nach dir.",
            "As you attempt to steal his eggs, Ssigus turns and swipes at you with a claw.")

        user:increaseAttrib("hitpoints",-2000)
    end

end

M.skill = "husbandry"

M.nestList = {
    {id = Item.chickenNest, depletedId = Item.emptyChickenNest, productId = Item.whiteEgg, maxAmount = 20, monster = 622, monsterName = {english = "chicken", german = "Hühnchen"}},
    {id = Item.pigeonNest, depletedId = Item.emptyPigeonNest, productId = Item.pigeonEgg, maxAmount = 20, monster = 391, monsterName = {english = "wolf", german = "Wolf"}},
    {id = Item.seagullNest, depletedId = Item.emptySeagullNest, productId = Item.seagullEgg, maxAmount = 10, monster = 1171, monsterName = {english = "ettin", german = "Ettin"}},
    {id = Item.raptorNest, depletedId = Item.emptyRaptorNest, productId = Item.raptorEgg, maxAmount = 5, monster = 521, monsterName = {english = "raptor", german = "Raptor"}},
    {id = Item.spiderNest, depletedId = Item.emptySpiderNest, productId = Item.spiderEgg, maxAmount = 5, monster = 193, monsterName = {english = "spider", german = "Spinne"}},
    {id = Item.dragonNest, depletedId = Item.emptyDragonNest, productId = Item.dragonEgg, maxAmount = 5, monster = 1121, monsterName = {english = "dragon", german = "Drache"}}
}

local nestList = M.nestList

local function getMonster(sourceItem)

    for _, nest in pairs(nestList) do
        if nest.id == sourceItem.id then
            return nest.monster, nest.monsterName
        end
    end

end

function M.StartGathering(user, sourceItem, actionState)

    if not common.IsNilOrEmpty(sourceItem:getData("eggProtectionType")) then
        preventGathering(user, sourceItem)
        return
    end

    local egggathering = gathering.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}; -- egg collecting
    local maxAmount = gathering.getMaxAmountFromResourceList(nestList, sourceItem.id)
    local resourceID = gathering.getProductId(nestList, sourceItem.id)
    local depletedResourceID = gathering.getDepletedObject(nestList, sourceItem.id)
    local restockWear = 4 -- 15 minutes

    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(user, sourceItem, nil, maxAmount, egggathering.LeadSkill, depletedResourceID)

    if not success then
        return
    end

    if not gathering.isDepletableResource(user, sourceItem, nestList) then
        return
    end

    local monster, monsterName = getMonster(sourceItem)

    egggathering:AddRandomPureElement(user,gathering.prob_element*gatheringBonus) -- Any pure element
    egggathering:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"Unter dem Nest findest du eine Karte. Kein gutes Versteck!","Under the nest, you find a map. Not a good hiding place.")


    if sourceItem.id ~= Item.spiderNest then -- The spider nest is just a cluster of eggs, unlike the others that are actual nests.
        egggathering:AddRandomItem(249, 1, 333, {}, gathering.prob_occasionally,
        "Für dieses Nest wurde ein ganzes Bündel Getreide als Nistmaterial verwendet.",
        "A bundle of grain was used as nesting material for this nest.") --bundle of grain
    end

    if sourceItem.id ~= Item.spiderNest and sourceItem.id ~= Item.raptorNest and sourceItem.id ~= Item.dragonNest then -- They do not have feathers
        egggathering:AddRandomItem(463, 1, 333, {}, gathering.prob_frequently,
        "Du findest eine besonders große Feder, mit der man sicher auch gut schreiben kann.",
        "You find a big feather that looks suitable for writing.")
    end

    if sourceItem.id == Item.chickenNest then
        egggathering:AddRandomItem(259, 1, 333, {}, gathering.prob_rarely,
        "Du stibitzt etwas Hühnerfutter aus dem Nest.",
        "You snatch some chicken food from the nest.") --grain
    end

    if sourceItem.id == Item.pigeonNest or sourceItem.id == Item.seagullNest then -- No corresponding monster to guard the egg, replaced with a hungry wolf/ettin

        egggathering:AddMonster(user, monster, gathering.prob_monster/gatheringBonus, "Während du die Eier stiehlst, nähert sich ein hungriger "..monsterName.german.." um dir die Eier streitig zu machen.","While you steal eggs a hungry "..monsterName.english.." hops out from the surroundings of the nest to contest you for the eggs!",4,7)

    else
        egggathering:AddMonster(user, monster, gathering.prob_monster/gatheringBonus, "Während du die Eier stiehlst, hüpft ein wütendes "..monsterName.german.." zurück zum Nest.","While you steal eggs an angry "..monsterName.english.." hops out from the surroundings of the nest!",4,7)
    end

    if actionState == Action.abort then -- work interrupted
        return
    end

    if not common.CheckItem(user, sourceItem) then -- security check
        return
    end

    if not common.FitForWork(user) then -- check minimal food points
        return
    end

    common.TurnTo(user, sourceItem.pos) -- turn if necessary

    if (actionState == Action.none ) then -- currently not working -> let's go
        egggathering.SavedWorkTime[user.id] = egggathering:GenWorkTime(user)
        user:startAction( egggathering.SavedWorkTime[user.id], 21, 10, 0, 0)
        return
    end

    user:learn( egggathering.LeadSkill, egggathering.SavedWorkTime[user.id], egggathering.LearnLimit)

    egggathering:FindRandomItem(user, toolItem)

    local created, newAmount = gathering.FindResource(user, sourceItem, amount, resourceID, egggathering.LeadSkill, toolItem)

    if created then
        user:changeSource(sourceItem)
        if newAmount > 0 and not shared.toolBreaks( user, toolItem, egggathering:GenWorkTime(user)) then
            egggathering.SavedWorkTime[user.id] = egggathering:GenWorkTime(user)
            user:startAction( egggathering.SavedWorkTime[user.id], 21, 10, 0, 0)
        end
    end

    if newAmount and newAmount <= 0 then
        gathering.SwapSource(sourceItem, depletedResourceID, restockWear)
        common.TempInformNLS(user,"Dieses Nest ist leer.","This nest is empty.")
        return
    end
end

return M
