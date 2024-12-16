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
local gwynt = require("magic.arcane.enchanting.effects.gwynt")

local M = {}

local function isMilkable(sourceAnimal)

    local milkableAnimals = {
        {animals = {181}, milk = Item.bottleOfSheepMilk, maxAmount = 20, level = 30},
        {animals = {371}, milk = Item.bottleOfMilk, maxAmount = 20, level = 20},
        {animals = {1162, 1163, 1164, 1165}, milk = Item.bottleOfDeerMilk, maxAmount = 20, level = 50}
    }

    for _, animal in pairs(milkableAnimals) do
        for _, animalId in pairs(animal.animals) do
            if sourceAnimal:getMonsterType() == animalId then
                return true, animal.milk, animal.maxAmount, animal.level
            end
        end
    end

    return false
end

local function hasExtraBottle(user, bottleId)

    if user:countItemAt("all", bottleId) == 0 then -- check for items to work on
        return false
    end

    return true

end


function M.StartGathering(user, sourceAnimal, actionState)

    local gatheringBonus = shared.getGatheringBonus(user, nil)

    local milking = gathering.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}

    local isMilkAble, milkId, maxAmount, levelReq = isMilkable(sourceAnimal)

    if user:getSkill(Character.husbandry) < levelReq then
        user:inform("Deine Fertigkeit "..user:getSkillName(Character.husbandry).." ist zu niedrig, um das Tier zu melken.", "Your skill in "..user:getSkillName(Character.husbandry).." is not high enough to milk this animal.", Character.highPriority)
        return
    end

    if not sourceAnimal or not isMilkAble then
        common.TempInformNLS( user,
        "Du musst vor einem Tier stehen, um es zu melken.",
        "You have to stand in front of an animal for milk it." )
        return
    end

    if (user:countItemAt("all", Item.largeEmptyBottle) == 0) then
        common.TempInformNLS( user,
        "Du brauchst eine große leere Flasche um zu melken.",
        "You need a large empty bottle for milking." );
        return
    end

    milking:AddRandomPureElement(user,gathering.prob_element*gatheringBonus); -- Any pure element
    milking:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"Das Tier kratzt und schnüffelt aufgeregt am Boden. Dort findest du eine seltsame Karte.","The animal scratches and sniffs on the ground excitedly. You find a strange map there.")
    milking:AddMonster(user,271,gathering.prob_monster/gatheringBonus,"Während du das Tier melkst, umschwirrt dich eine ungewöhnlich agressive Wespe.","While you milk the animal an annoyingly aggressive wasp comes after you!",4,7)
    milking:AddRandomItem(3558,1,333,{},gathering.prob_rarely,"Was ist das? Dieses Schaf trägt eine kostbare Kette um den Hals.","Lo! This sheep has a precious necklace around its neck.") --Copper amulet
    milking:AddRandomItem(153,1,333,{},gathering.prob_occasionally,"Ein großes Blatt hat sich im Fell des Tieres verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter melkst.","A large leaf was tangled in the fur of the animal. You do a little grooming before you continue milking.") --Foot leaf
    milking:AddRandomItem(156,1,333,{},gathering.prob_frequently,"Etwas Gras hat sich im Fell des Tieres verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the animal. Before you can continue milking you have to remove the sticky green weed.") --Steppe fern

    if ( actionState == Action.abort ) then -- work interrupted
        return
    end

    if not common.FitForWork(user) then -- check minimal food points
        return
    end

    common.TurnTo(user, sourceAnimal.pos)

    local foundEffect, milkingEffect = sourceAnimal.effects:find(401)

    if not foundEffect then
        milkingEffect = LongTimeEffect(401, 7200) -- call every 12 minutes
        milkingEffect:addValue("gatherAmount", 0)
        sourceAnimal.effects:addEffect(milkingEffect)
    end

    local _, gatherAmount = milkingEffect:findValue("gatherAmount")

    -- currently not working, let's go
    if ( actionState == Action.none ) then

        if gatherAmount >= maxAmount then
            common.TempInformNLS( user,
            "Dieses Tier wurde erst kürzlich gemolken und gibt momentan keine Milch.",
            "This animal was milked recently and doesn't give milk right now." )
            return
        end

        milking.SavedWorkTime[user.id] = milking:GenWorkTime(user)
        sourceAnimal.movepoints = -1 * milking.SavedWorkTime[user.id] -- make sure the animal doesn't move away
        user:startAction(milking.SavedWorkTime[user.id], 21, 5, 10, 25)
        return
    end

    milking:FindRandomItem(user, nil)

    user:learn( milking.LeadSkill, milking.SavedWorkTime[user.id], milking.LearnLimit)

    gatherAmount = gatherAmount + 1
    milkingEffect:addValue("gatherAmount", gatherAmount)

    user:eraseItem(Item.largeEmptyBottle, 1)

    -- glyph effect since milking can not be streamlined like the crafts that use a sourceItem instead of an animal

    local productAmount = 1

    if hasExtraBottle(user, Item.largeEmptyBottle) and gwynt.includeExtraResource(user, 0) then
        productAmount = 2
        user:eraseItem(2498, 1)
    end

    -- end of glyph

    local created = common.CreateItem(user, milkId, productAmount, 333, nil) -- create the new produced items

    if created then -- character can still carry something
        if gatherAmount < maxAmount then -- more milk is available
            if user:countItemAt("all", Item.largeEmptyBottle) == 0 then -- no empty bottles left
                return
            end
            milking.SavedWorkTime[user.id] = milking:GenWorkTime(user)
            sourceAnimal.movepoints = -1 * milking.SavedWorkTime[user.id] -- make sure the animal doesn't move away
            user:startAction(milking.SavedWorkTime[user.id], 21, 5, 10, 25)
        else
            common.TempInformNLS( user,
            "Dieses Tier ist ausreichend gemolken und gibt keine Milch mehr.",
            "This animal is milked properly and doesn't give any more milk." )
        end
    end
end

M.isMilkable = isMilkable

return M
