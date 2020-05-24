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

-- sheep (monster 18) --> wool (170)

-- additional tool: scissors (6)

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

function M.StartGathering(User, SourceAnimal, ltstate)

    local woolcutting = gathering.GatheringCraft:new{LeadSkill = Character.tanningAndWeaving, LearnLimit = 100}; -- id_6_scissors
    woolcutting:AddRandomPureElement(gathering.prob_element); -- Any pure element
    woolcutting:AddRandomMagicGem(1, gathering.prob_extremely_rarely); -- Any latent magical gem
    woolcutting:SetShard(gathering.prob_rarely,"Ein Splitter eines magischen Artefaktes hat sich in der Wolle des Schafes verfangen.", "A shard of a magical artifact was tangled in the wool of the sheep."); -- Any shard
    woolcutting:AddRandomItem(222,1,333,{},gathering.prob_extremely_rarely,"Dieses Schaf trägt ein merkwürdiges Amulett um den Hals. Wer kommt auf solch eine Idee?","This sheep is bearing a strange amulet around its neck. Who had such an idea?"); --Amulet
    woolcutting:AddRandomItem(153,1,333,{},gathering.prob_occasionally,"Ein großes Blatt hat sich im Fell des Schafes verfangen. Du betreibst zunächst ein wenig Fellpflege, bevor du weiter scherst.","A large leaf was tangled in the fur of the sheep. You do a little grooming before you continue shearing."); --Foot leaf
    woolcutting:AddRandomItem(156,1,333,{},gathering.prob_frequently,"Etwas Gras hat sich im Fell des Schafs verfangen. Du entfernst das klebrige Grünzeug.","Some grass was ensnared in the fur of the sheep. Before you can continue shearing you have to remove the sticky green weed."); --Steppe fern
    woolcutting:SetTreasureMap(gathering.prob_rarely,"Mit einem lauten 'Mäh' kratzt und schnüffelt das Schaf am Boden. Dort findest du eine seltsame Karte.","With a loud 'Baa' the sheep scratches and sniffs on the ground. Then, as if by magic a strange map appears on the ground.");
    woolcutting:AddMonster(271,gathering.prob_rarely,"Während du die Wolle einsammelst, umschwirrt dich eine ungewöhnlich agressive Wespe.","While you gather some wool a annoyingly aggressive wasp comes after you!",4,7);
    woolcutting:AddInterruptMessage("Du wischst dir den Schweiß von der Stirn.", "You wipe sweat off your forehead.");

    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

--  if not common.CheckItem( User, SourceItem ) then -- security check
--      return
--  end

    if shared.ToolCheck(User, 6) == false then --scissors (6)
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceAnimal.pos ); -- turn if necessary

    -- Sheep should actually be already a sheep character struct, but check it nevertheless
    if ( SourceAnimal == nil or (SourceAnimal ~= nil and SourceAnimal:getRace()~=18) ) then
        common.HighInformNLS( User,
        "Du musst vor einem Schaf stehen, um es zu scheren.",
        "You have to stand in front of a sheep for shearing it." );
        return;
    end

    -- check if sheep still gives wool
    local foundEffect, shearingEffect = SourceAnimal.effects:find(402);
    if (not foundEffect) then
        shearingEffect = LongTimeEffect(402, 7200); -- call every 12 minutes
        shearingEffect:addValue("gatherAmount", 0);
        SourceAnimal.effects:addEffect(shearingEffect);
    end
    local foundAmount, gatherAmount = shearingEffect:findValue("gatherAmount");

    if ( ltstate == Action.none ) then -- currently not working -> let's go

        if gatherAmount >= 20 then
            common.HighInformNLS( User,
            "Dieses Schaf wurde kürzlich erst geschoren und gibt momentan keine Wolle.",
            "This sheep has been sheared recently and doesn't give wool right now." );
            return;
        end

        woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User, toolItem);
        User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 2, 20);
        User:talk(Character.say, "#me beginnt ein Schaf zu scheren.", "#me starts to shear a sheep.")

        -- make sure the sheep doesn't move away
        SourceAnimal.movepoints = math.min(SourceAnimal.movepoints, -1*woolcutting.SavedWorkTime[User.id]);
        return;

    end

    -- since we're here, we're working

    if woolcutting:FindRandomItem(User) then
        return
    end

    User:learn( woolcutting.LeadSkill, woolcutting.SavedWorkTime[User.id], woolcutting.LearnLimit);

    gatherAmount = gatherAmount + 1
    shearingEffect:addValue("gatherAmount", gatherAmount);

    local created = common.CreateItem(User, 170, 1, 333, nil) -- create the new produced items
    if created then --charcter can still carry something
        if gatherAmount < 20 then -- more wool is available
            woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User, toolItem);

            User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 2, 20);
            -- make sure the sheep doesn't move away
            SourceAnimal.movepoints = math.min(SourceAnimal.movepoints, -1*woolcutting.SavedWorkTime[User.id]);
        else
            common.HighInformNLS( User,
            "Dieses Schaf ist nun geschoren und gibt keine Wolle mehr.",
            "This sheep is now sheared properly and doesn't give any more wool." );
        end
    end

    if shared.ToolBreaks( User, toolItem, woolcutting:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
        common.HighInformNLS(User,
        "Deine alte Schere zerbricht.",
        "Your old scissors break.");
        return
    end
end

return M
