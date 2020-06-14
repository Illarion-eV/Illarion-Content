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

local function preventGathering(User, theNest)

    local effectType = theNest:getData("eggProtectionType")

    if effectType == "ssigus" then
        world:gfx(21,User.pos)
        world:makeSound(31,User.pos)
        User:inform("", "As you attempt to steal his eggs, Ssigus turns and swipes at you with a claw.", Character.highPriority)
        User:increaseAttrib("hitpoints",-2000)
    end

end

function M.StartGathering(User, SourceItem, ltstate)
    local EMPTY_NEST = 1172
    local FILLED_NEST = 1171
    local EGG = 1150

    local gatheringBonus=shared.getGatheringBonus(User, nil)
    
    local egggathering = gathering.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}; -- egg collecting
    egggathering:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    egggathering:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Unter dem Nest findest du eine Karte. Kein gutes Versteck!","Under the nest, you find a map. Not a good hiding place.");
    egggathering:AddMonster(User,622,gathering.prob_monster/gatheringBonus,"Während du die Eier stiehlst, hüpft ein wütendes Hühnchen aus dem Nest.","While you steal eggs an angry chickens hops out of the nest!",4,7);
    egggathering:AddRandomItem(249,1,333,{},gathering.prob_occasionally,"Für dieses Nest wurde ein ganzes Bündel Getreide als Nistmaterial verwendet.","A bundle of grain was used as nesting material for this nest."); --bundle of grain
    egggathering:AddRandomItem(463,1,333,{},gathering.prob_frequently,"Du findest eine besonders große Feder, mit der man sicher auch gut schreiben kann.","You find a big feather that looks suitable for writing."); --Quill
    egggathering:AddRandomItem(259,1,333,{},gathering.prob_rarely,"Du stibitzt etwas Hühnerfutter aus dem Nest.","You snitch some chicken food from the nest."); --grain
    
    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    -- Disabled in order to give a hungry player a chance to strengthen.
    -- if not common.FitForWork( User ) then -- check minimal food points
        -- return
    -- end
    common.TurnTo( User, SourceItem.pos ); -- turn if necessary

        -- check if it is a special and therefore unharvestable nest
    if SourceItem:getData("eggProtectionType") ~= "" then
        preventGathering(User, SourceItem)
        return
    end

    if SourceItem.id == EMPTY_NEST  then
      User:inform("Hier befinden sich keine Eier.","There are no eggs here.",Player.highPriority)
      return;
    end
    -- check the amount
    local amountStr = SourceItem:getData("amount");
    local amount = 0;
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr);
    else
        -- first time that this item is harvested
        amount = 10;
        SourceItem:setData("amount","" .. amount);
        world:changeItem(SourceItem);
    User:changeSource(SourceItem);
    end
    if ( amount < 0 ) then
        -- this should never happen...
        User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
        return;
    end
    if ( amount == 0 ) then
        -- this should never happen...
        User:inform("[ERROR] Zero amount for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
        return;
    end

    -- since we're here, there is something we can harvest

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        egggathering.SavedWorkTime[User.id] = egggathering:GenWorkTime(User);
        User:startAction( egggathering.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talk(Character.say, "#me beginnt Eier zu sammeln.", "#me starts to gather eggs.")
        return
    end

    -- since we're here, we're working

    if egggathering:FindRandomItem(User) then
        return
    end

    User:learn( egggathering.LeadSkill, egggathering.SavedWorkTime[User.id], egggathering.LearnLimit);
    amount = amount - 1;
    local created = common.CreateItem(User, EGG, 1, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        if (amount>0) then  -- there are still fruits we can gather
            egggathering.SavedWorkTime[User.id] = egggathering:GenWorkTime(User);
            User:startAction( egggathering.SavedWorkTime[User.id], 0, 0, 0, 0);
        end
    end
    if (amount<=0) then
      common.HighInformNLS(User,
      "Dieses Nest ist leer.",
      "This nest is empty." );
      -- reset amount
        amount = 10;
        SourceItem:setData("amount","" .. amount);
        world:changeItem(SourceItem);
            -- change item id
        world:swap(SourceItem, EMPTY_NEST, 333);
        return;
    end

    SourceItem:setData("amount","" .. amount);
    world:changeItem(SourceItem);
    User:changeSource(SourceItem);
end

return M
