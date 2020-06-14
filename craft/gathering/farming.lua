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

-- grops and seeds (grain is handled elsewhere)

-- additional tool: sickle ( 126 )

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

local FarmingItems = {}

-- field crops
FarmingItems[3890] = 290 -- cabbage -> cabbage
FarmingItems[537] = 201 -- onion plant -> onion
FarmingItems[540] = 200 -- tomato plant -> tomato
FarmingItems[731] = 154 -- hop plant -> hop
FarmingItems[732] = 728 -- old hops -> hop seeds
FarmingItems[2492] = 2493 -- greens -> carrots
FarmingItems[782] = 778 -- sugarcane plant -> sugarcane
FarmingItems[777] = 772 -- withered tobacco plant -> tabacco
FarmingItems[3565] = 3567                               -- Final stage potato plant -> Potatoes

-- TODO when bug in MoveItem functions is resolved, remove these
FarmingItems[779] = 779 -- sugarcane seeds
FarmingItems[773] = 773 -- tobacco seeds
FarmingItems[2917] = 2917 -- tomato seeds
FarmingItems[2494] = 2494 -- carrot seeds ("seeds")
FarmingItems[534] = 534 -- onion seeds
FarmingItems[291] = 291 -- withered cabbage (seeds)
FarmingItems[3566] = 3566                               -- Potato seeds

local function isFarmingItem(Plant)
    if (Plant ~= nil and FarmingItems[Plant.id] ~= nil and ((Plant:getData("amount") ~= "0" and Plant:getData("amount") ~= "") or Plant.wear == 255)) then
        return true;
    end
    return false;
end

local function getFarmingItem(User)

    local targetItem = common.GetFrontItem(User);
    if (isFarmingItem(targetItem)) then
        return targetItem;
    end

    local Radius = 1;
    for x=-Radius,Radius do
        for y=-Radius,Radius do
            local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
            if (world:isItemOnField(targetPos)) then
                local targetItem = world:getItemOnField(targetPos);
                if (isFarmingItem(targetItem)) then
                    return targetItem;
                end
            end
        end
    end
    return nil;
end

function M.StartGathering(User, SourceItem, ltstate)

    local toolItem=shared.getTool(User, 126) --sickle (126)

    if not toolItem then
        return
    end
    
    local gatheringBonus=shared.getGatheringBonus(User, toolItem)
    
    local theCraft = gathering.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = 100}; -- seeds, id_126_sickle
    theCraft:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    theCraft:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"In einer Ackerfurche findest du ein altes Pergament mit einem Kreuz darauf. Ob sie dich zu einem vergrabenen Schatz weisen wird?","In a furrow you find an old parchment with a cross on it. Will it show you the way to a buried treasure?");
    theCraft:AddMonster(User,114,gathering.prob_monster/gatheringBonus,"Du stößt bei der Erdarbeit auf alte Knochen. Leider hat sie kein Hund hier vergraben und die Störung der Totenruhe bleibt nicht ungesühnt.","While ploughing, you find some old bones. Unfortunately, no dog has buried them here, and the disturbance of the dead unleashes Cherga's wrath.",4,7);
    theCraft:AddRandomItem(1840,1,333,{},gathering.prob_rarely,"Im Ackerboden ist ein angelaufender Kupferkelch zu finden.","In the arable soil you find a tarnished copper goblet."); --copper goblet
    theCraft:AddRandomItem(2935,1,333,{},gathering.prob_occasionally,"Da hat wohl jemand eine Schüssel verloren, mit der er Saatgut augestreut hat.","Someone lost an old bowl for sowing here."); --soup bowl
    theCraft:AddRandomItem(51,1,333,{},gathering.prob_frequently,"Da hat wohl jemand einen Eimer verloren. Nun gehört er dir.","You dig up an old bucket. Now it belongs to you."); --bucket
    
    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ); -- turn if necessary

    -- check the amount
    local amountStr = SourceItem:getData("amount");
    local amount = 0;
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr);
    end

    if ( amount < 0 ) then
        -- this should never happen...
        User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
        return;
    end

    if ( amount == 0 ) then
        -- this is a farming item, it can't regrow
        common.HighInformNLS( User,
        "Hier kannst du nichts ernten.",
        "There is nothing you can harvest." );
        return;
    end

    -- currently not working -> let's go
    if ( ltstate == Action.none ) then
        theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User);
        User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talk(Character.say, "#me beginnt mit der Sichel zu ernten.", "#me starts to harvest with the sickle.")
        return;
    end

    -- since we're here, we're working

    if theCraft:FindRandomItem(User) then
        return
    end

    amount = amount - 1;

    if ( amount == 0 ) then
        -- nothing left, remove the farming item
        world:erase(SourceItem, SourceItem.number);
    else
        -- just update the amount
        SourceItem:setData("amount", "" .. amount);
        world:changeItem(SourceItem);
    end

    -- since we're here, everything should be alright
    User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
    local created = common.CreateItem(User, FarmingItems[SourceItem.id], 1, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        -- try to find a next item of the same farming type
        local nextItem = getFarmingItem(User);
        if ( amount > 0 or nextItem~=nil) then  -- there are still items we can work on
            if (amount < 1) then
                common.TurnTo( User, nextItem.pos ); -- turn, so we find this item in next call as first item
                SourceItem = nextItem;
            end
            theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User);
            User:changeSource(SourceItem);
            if not shared.toolBreaks( User, toolItem, theCraft:GenWorkTime(User) ) then -- damage and possibly break the tool
                User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
            end
        else
            common.HighInformNLS( User,
            "Hier ist nichts mehr, was du mit der Sichel ernten kannst.",
            "There is nothing anymore which you can harvest with the sickle." );
        end
    end
end

-- Used by item.id_126_sickle
M.getFarmingItem = getFarmingItem

return M
