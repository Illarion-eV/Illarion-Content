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

-- CLAY_PIT (1206)

-- additional tool: shovel ( 24 )

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

function M.StartGathering(User, SourceItem, ltstate)

    local toolItem=shared.getTool(User, 24) --shovel (24)

    if not toolItem then
        return
    end
    
    local gatheringBonus=shared.getGatheringBonus(User, toolItem)
    
    local claydigging = gathering.GatheringCraft:new{LeadSkill = Character.digging, LearnLimit = 100}; -- id_24_shovel
    claydigging:AddRandomPureElement(User,gatheringBonus*gathering.prob_element*gatheringBonus); -- Any pure element
    claydigging:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Von einer Lederhülle umgeben, findest du eine alte Karte. Die hat definitiv niemand absichtlich hier hinterlassen.","Covered in a leather hide you find an old map.");
    claydigging:AddMonster(User,104,gathering.prob_monster/gatheringBonus,"Im Morast stößt du auf eine bedauernswerte Moorleiche. Jedoch scheinst du derjenige zu sein, den man fortan betrauern wird.","In the mud your shovel digs unintentionally into a feculent bog body. The stench is atrocious, but what's worse is the undead creature rises to attack.",4,7);
    claydigging:AddRandomItem(2658,1,333,{},gathering.prob_rarely,"Du findest eine Knochenhand im Matsch. Sie umklammert ein altes Schwert.","You find a boney hand in the mud clutching an old sword."); --broadsword
    claydigging:AddRandomItem(51,1,333,{},gathering.prob_occasionally,"Du ziehst einen alten Eimer aus dem Schlick.","You draw an old bucket from the silt."); --bucket
    claydigging:AddRandomItem(2184,1,333,{},gathering.prob_frequently,"Ein Tonkrug offenbahrt sich im Matsch. Die Überreste einer alten Zivilisation oder einfach nur vom letzten Saufgelage?","A clay mug reveals itself in the mud. Perhaps the remains of an ancient civilization or just a littering traveller, who knows?"); --clay cup
    
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
    local MaxAmount = 20
    local changeItem = false;
    local amountStr = SourceItem:getData("amount");
    local amount = 0;
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr);
    elseif ( SourceItem.wear == 255 ) then
        amount = MaxAmount
    end

  -- currently not working -> let's go

    if ( ltstate == Action.none ) then
        claydigging.SavedWorkTime[User.id] = claydigging:GenWorkTime(User)
        User:startAction( claydigging.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talk(Character.say, "#me beginnt nach Lehm zu graben.", "#me starts to dig for clay.")
        return
    end

    -- since we're here, we're working

    if claydigging:FindRandomItem(User) then
        if ( changeItem ) then
            world:changeItem(SourceItem);
        end
        return
    end

    User:learn( claydigging.LeadSkill, claydigging.SavedWorkTime[User.id], claydigging.LearnLimit);
    amount = amount - 1;
    -- update the amount
    SourceItem:setData("amount", "" .. amount);
    world:changeItem(SourceItem)

    local created = common.CreateItem(User, 26, 1, 333, nil) -- create the new produced items
    if created then -- char can still carry
        if amount > 0 then -- still items to dig
            claydigging.SavedWorkTime[User.id] = claydigging:GenWorkTime(User)
            User:changeSource(SourceItem)
            if not shared.toolBreaks( User, toolItem, claydigging:GenWorkTime(User) ) then -- damage and possibly break the tool
                User:startAction(claydigging.SavedWorkTime[User.id], 0, 0, 0, 0)
            end
        end
    end
    if amount == 0 then
        SourceItem:setData("amount","")
        SourceItem.id = 3633
        SourceItem.wear = 4
        world:changeItem(SourceItem)
        User:inform( "An dieser Stelle gibt es nichts mehr zu holen.", "There isn't anything left in this pit.", Character.highPriority);
        return
    end

end

return M
