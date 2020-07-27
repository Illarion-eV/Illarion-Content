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

-- SAND_PIT = 1208

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

    local sanddigging = gathering.GatheringCraft:new{LeadSkill = Character.digging, LearnLimit = 100}; -- id_24_shovel
    sanddigging:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    sanddigging:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Der Sand gibt eine gut erhaltene Karte frei. Die Hitze konnte dem Pergament nichts anhaben.","Deep in the sand sheltered from the desert heat you discover a treasure map!");
    sanddigging:AddMonster(User,982,gathering.prob_monster/gatheringBonus,"Tief im Sand stößt du auf etwas schwarzes, krabbelndes. Eine vorschnellende Klaue ist nur der Vorbote dessen, was du gerade erweckt hast.","To your dismay you unearth a beetle's hiding place. He furiously lashes his claws trying to defend his home.",4,7);
    sanddigging:AddRandomItem(3077,1,333,{},gathering.prob_rarely,"Eine funkelnde Münze liegt auf deinem Schaufelblatt. Hat sich die harte Arbeit doch gelohnt!","A tink of your shovel blade causes you to pause. Then to your surprise it turns out you struck a silver coin!"); --Silver coin
    sanddigging:AddRandomItem(21,1,333,{},gathering.prob_occasionally,"Du findest einige noch heiße Kohlen im Sand. Ein Glück, dass du nicht auf diese Überreste einer nächtlichen Grillfeier getreten bist.","As your shovel digs through the sand you unearth an unused lump of coal and discover an abandoned campfire."); --Coal
    sanddigging:AddRandomItem(1266,1,333,{},gathering.prob_frequently,"Deine Schaufel stößt auf einen runden Kieselstein.","Your shoulder locks as your shovel drives into a hard stone."); --Rock
   
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
    local amountStr = SourceItem:getData("amount");
    local amount = 0;
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr);
    elseif ( SourceItem.wear == 255 ) then
        amount = MaxAmount;
    end


    -- currently not working -> let's go
    if ( ltstate == Action.none ) then
        sanddigging.SavedWorkTime[User.id] = sanddigging:GenWorkTime(User);
        User:startAction( sanddigging.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talk(Character.say, "#me beginnt nach Sand zu graben.", "#me starts to dig for sand.")
        return
    end

    -- since we're here, we're working

    if sanddigging:FindRandomItem(User) then
        return
    end

    User:learn( sanddigging.LeadSkill, sanddigging.SavedWorkTime[User.id], sanddigging.LearnLimit);
    amount = amount - 1;
    -- update the amount
    SourceItem:setData("amount", "" .. amount);
    world:changeItem(SourceItem)

    local created = common.CreateItem(User, 726, 1, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        if amount > 0 then
            sanddigging.SavedWorkTime[User.id] = sanddigging:GenWorkTime(User)
            User:changeSource(SourceItem);
            if not shared.toolBreaks( User, toolItem, sanddigging:GenWorkTime(User) ) then -- damage and possibly break the tool
                User:startAction( sanddigging.SavedWorkTime[User.id], 0, 0, 0, 0)
            end
        end
    end

    if amount == 0 then
        SourceItem:setData("amount","")
        SourceItem.id = 3632
        SourceItem.wear = 4
        world:changeItem(SourceItem)
        User:inform( "An dieser Stelle gibt es nichts mehr zu holen.", "There isn't anything left in this pit.", Character.highPriority);
        return
    end

end

return M
