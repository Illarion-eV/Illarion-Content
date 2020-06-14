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

local function isMilkable(targetCharacter)

    local milkableAnimals = {181, 371}; -- sheep, cow

    for i=1, #milkableAnimals do
        if targetCharacter:getMonsterType() == milkableAnimals[i] then
            return true;
        end
    end
    return false;
end


function M.StartGathering(User, SourceAnimal, ltstate)

    local gatheringBonus=shared.getGatheringBonus(User, nil)

    local milking = gathering.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}; -- id_2498_empty_bottle
    milking:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    milking:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Das Tier kratzt und schnüffelt aufgeregt am Boden. Dort findest du eine seltsame Karte.","The animal scratches and sniffs on the ground excitdly. You find a strange map there.");
    milking:AddMonster(User,271,gathering.prob_monster/gatheringBonus,"Während du das Tier melkst, umschwirrt dich eine ungewöhnlich agressive Wespe.","While you milk the animal an annoyingly aggressive wasp comes after you!",4,7);
    milking:AddRandomItem(3558,1,333,{},gathering.prob_rarely,"Was ist das? Dieses Schaf trägt eine kostbare Kette um den Hals.","Lo! This sheep has a precious necklace around its neck."); --Copper amulet    
    milking:AddRandomItem(153,1,333,{},gathering.prob_occasionally,"Ein großes Blatt hat sich im Fell des Tieres verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter melkst.","A large leaf was tangled in the fur of the animal. You do a little grooming before you continue milking."); --Foot leaf
    milking:AddRandomItem(156,1,333,{},gathering.prob_frequently,"Etwas Gras hat sich im Fell des Tieres verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the animal. Before you can continue milking you have to remove the sticky green weed."); --Steppe fern
   
    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceAnimal.pos ); -- turn if necessary

    if (User:countItemAt("all",2498) == 0) then -- check for items to work on
        common.HighInformNLS( User,
        "Du brauchst eine große leere Flasche um zu melken.",
        "You need a large empty bottle for milking." );
        return;
    end

    -- should be fine already, but check it nevertheless
    if ( SourceAnimal == nil or (SourceAnimal ~= nil and not isMilkable(SourceAnimal) )) then
        common.HighInformNLS( User,
        "Du musst vor einem Tier stehen, um es zu melken.",
        "You have to stand in front of an animal for milk it." );
        return;
    end

    -- check if animal still gives milk
    local foundEffect, milkingEffect = SourceAnimal.effects:find(401);
    if (not foundEffect) then
        milkingEffect = LongTimeEffect(401, 7200); -- call every 12 minutes
        milkingEffect:addValue("gatherAmount", 0);
        SourceAnimal.effects:addEffect(milkingEffect);
    end
    local foundAmount, gatherAmount = milkingEffect:findValue("gatherAmount");

    -- currently not working, let's go
    if ( ltstate == Action.none ) then

        if gatherAmount >= 2 then
            common.HighInformNLS( User,
            "Dieses Tier wurde erst kürzlich gemolken und gibt momentan keine Milch.",
            "This animal was milked recently and doesn't give milk right now." );
            return;
        end
        milking.SavedWorkTime[User.id] = milking:GenWorkTime(User);
        SourceAnimal.movepoints = -1 * milking.SavedWorkTime[User.id]; -- make sure the animal doesn't move away
        User:startAction(milking.SavedWorkTime[User.id], 21, 5, 10, 25);
        User:talk(Character.say, "#me beginnt ein Tier zu melken.", "#me starts to milk an animal.")
        return;
    end

    -- since we're here, we're working
    if milking:FindRandomItem(User) then
        return
    end

    User:learn( milking.LeadSkill, milking.SavedWorkTime[User.id], milking.LearnLimit);

    gatherAmount = gatherAmount + 1
    milkingEffect:addValue("gatherAmount", gatherAmount);

    User:eraseItem(2498, 1);
    local created = common.CreateItem(User, 2502, 1, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        if gatherAmount < 2 then -- more milk is available
            if User:countItemAt("all",2498) == 0 then -- no empty bottles left
                return
            end
            milking.SavedWorkTime[User.id] = milking:GenWorkTime(User);
            SourceAnimal.movepoints = -1 * milking.SavedWorkTime[User.id]; -- make sure the animal doesn't move away
            User:startAction(milking.SavedWorkTime[User.id], 21, 5, 10, 25);
        else
            common.HighInformNLS( User,
            "Dieses Tier ist ausreichend gemolken und gibt keine Milch mehr.",
            "This animal is milked properly and doesn't give any more milk." );
        end
    end
end

-- Used by item/id_2498_empty_bottle
M.isMilkable = isMilkable

return M
