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

-- scythe ( 271 )

-- (fully grown) grain (248) --> bundle of grain (249)

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

    -- @return TargetItem The fully grown grain or nil if nothing was found
    -- @return foundYoungGrain True if not fully grown grain was found (not reliable if TargetItem~=nil !!!)
local function GetNearbyGrain(User)
    local TargetItem
    local foundYoungGrain = false; -- check if we only find not fully grown grain
    for x=-1,1 do
        for y=-1,1 do
            local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
            if ( world:isItemOnField(pos) ) then
                TargetItem = world:getItemOnField(pos);
                if ( TargetItem.id == 248 ) then
                    -- got it!
                    return TargetItem, foundYoungGrain;
                elseif ( TargetItem.id == 246 or TargetItem.id == 247 ) then
                    foundYoungGrain = true;
                end
                TargetItem = nil;
            end
        end
    end
    return TargetItem, foundYoungGrain;
end

function M.StartGathering(User, SourceItem, ltstate)

    local toolItem=shared.getTool(User, 271) --scythe (271)

    if not toolItem then
        return
    end

    local gatheringBonus=shared.getGatheringBonus(User, toolItem)

    local grainharvesting = gathering.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = 100}; -- id_271_scythe;
    grainharvesting:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    grainharvesting:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"In einer Ackerfurche findest du ein altes Pergament mit einem Kreuz darauf. Ob sie dich zu einem vergrabenen Schatz weisen wird?","In a furrow you find an old parchment with a cross on it. Will it show you the way to a buried treasure?");
    grainharvesting:AddMonster(User,114,gathering.prob_monster/gatheringBonus,"Du stößt bei der Erdarbeit auf alte Knochen. Leider hat sie kein Hund hier vergraben und die Störung der Totenruhe bleibt nicht ungesühnt.","While ploughing, you find some old bones. Unfortunately, no dog has buried them here, and the disturbance of the dead unleashes Cherga's wrath.",4,7);
    grainharvesting:AddRandomItem(1840,1,333,{},gathering.prob_rarely,"Im Ackerboden ist ein angelaufender Kupferkelch zu finden.","In the arable soil you find a tarnished copper goblet."); --copper goblet
    grainharvesting:AddRandomItem(2935,1,333,{},gathering.prob_occasionally,"Da hat wohl jemand eine Schüssel verloren, mit der er Saatgut augestreut hat. Nun gehört sie dir.","You dig up an old bowl. Now it belongs to you."); --soup bowl
    grainharvesting:AddRandomItem(2760,1,333,{},gathering.prob_frequently,"Zwischen den Feldfrüchten findest du ein altes Seil. Nützlich, oder?","Among the crops you find an old rope. Can never have enough rope!"); --rope
    
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

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        grainharvesting.SavedWorkTime[User.id] = grainharvesting:GenWorkTime(User);
        User:startAction( grainharvesting.SavedWorkTime[User.id], 0, 0, 0, 0);
        -- this is no batch action => no emote message, only inform player
        if grainharvesting.SavedWorkTime[User.id] > 15 then
            common.InformNLS(User,
            "Du schneidest das Getreide mit der Sense.",
            "You harvest the grain with the scythe.");
        end
        return
    end

    -- since we're here, we're working

    if grainharvesting:FindRandomItem(User) then
        return
    end

    User:learn( grainharvesting.LeadSkill, grainharvesting.SavedWorkTime[User.id], grainharvesting.LearnLimit);
    local amount = SourceItem:getData("amount");
    if ( amount == "" ) then
        -- this should never happen...
        User:inform("[ERROR] Grain has no amount set. Please inform a developer.");
        -- but continue anyway, just set the amount
        amount = 1;
    else
        amount = tonumber(amount);
    end
    world:erase(SourceItem, SourceItem.number); -- erase the item we're working on
    local created = common.CreateItem(User, 249, amount, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        local a,b = GetNearbyGrain(User);
        if (a~=nil) then  -- there are still items we can work on
            grainharvesting.SavedWorkTime[User.id] = grainharvesting:GenWorkTime(User);
            if not shared.toolBreaks( User, toolItem, grainharvesting:GenWorkTime(User) ) then -- damage and possibly break the tool
                User:startAction( grainharvesting.SavedWorkTime[User.id], 0, 0, 0, 0);
            end
        end
    end
end

-- used by item.id_272_scythe
M.GetNearbyGrain = GetNearbyGrain

return M
