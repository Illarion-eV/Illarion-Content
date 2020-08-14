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

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

function M.StartGathering(User, SourceItem, ltstate)

    local sanddigging = gathering.GatheringCraft:new{LeadSkill = Character.digging, LearnLimit = 100}
    local toolID = 24 --shovel (24)
    local maxAmount = 20
    local GFX = 22
    local SFX = 0
    local resourceID = 726 --coarse sand
    local depletedSourceID = 3632
    local restockWear = 4 --15 minutes
    
    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(User, SourceItem, toolID, maxAmount, sanddigging.LeadSkill)
    
    if not success then
        return 
    end
    
    sanddigging:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    sanddigging:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Der Sand gibt eine gut erhaltene Karte frei. Die Hitze konnte dem Pergament nichts anhaben.","Deep in the sand sheltered from the desert heat you discover a treasure map!");
    sanddigging:AddMonster(User,982,gathering.prob_monster/gatheringBonus,"Tief im Sand stößt du auf etwas schwarzes, krabbelndes. Eine vorschnellende Klaue ist nur der Vorbote dessen, was du gerade erweckt hast.","To your dismay you unearth a beetle's hiding place. He furiously lashes his claws trying to defend his home.",4,7);
    sanddigging:AddRandomItem(3077,1,333,{},gathering.prob_rarely,"Eine funkelnde Münze liegt auf deinem Schaufelblatt. Hat sich die harte Arbeit doch gelohnt!","A tink of your shovel blade causes you to pause. Then to your surprise it turns out you struck a silver coin!"); --Silver coin
    sanddigging:AddRandomItem(21,1,333,{},gathering.prob_occasionally,"Du findest einige noch heiße Kohlen im Sand. Ein Glück, dass du nicht auf diese Überreste einer nächtlichen Grillfeier getreten bist.","As your shovel digs through the sand you unearth an unused lump of coal and discover an abandoned campfire."); --Coal
    sanddigging:AddRandomItem(1266,1,333,{},gathering.prob_frequently,"Deine Schaufel stößt auf einen runden Kieselstein.","Your shoulder locks as your shovel drives into a hard stone."); --Rock
   
   --Case 1: Interrupted
    if (ltstate == Action.abort) then -- work interrupted
        return
    end

    --Case 2: Initialise action
    if (ltstate == Action.none) then
        sanddigging.SavedWorkTime[User.id] = sanddigging:GenWorkTime(User)
        User:startAction(sanddigging.SavedWorkTime[User.id], GFX, sanddigging.SavedWorkTime[User.id], SFX, sanddigging.SavedWorkTime[User.id])
        return
    end

    --Case 3: Action executed
    User:learn(sanddigging.LeadSkill, sanddigging.SavedWorkTime[User.id], sanddigging.LearnLimit)

    if sanddigging:FindRandomItem(User) then
        return
    end

    local created, newAmount = gathering.FindResource(User, SourceItem, amount, resourceID)

    if created then 
        User:changeSource(SourceItem)
        if newAmount > 0 and not shared.toolBreaks(User, toolItem, sanddigging:GenWorkTime(User)) then
            sanddigging.SavedWorkTime[User.id] = sanddigging:GenWorkTime(User)
            User:startAction(sanddigging.SavedWorkTime[User.id], GFX, sanddigging.SavedWorkTime[User.id], SFX, sanddigging.SavedWorkTime[User.id])
        end
    end

    if newAmount <= 0 then
        gathering.SwapSource(SourceItem, depletedSourceID, restockWear)
        User:inform( "An dieser Stelle gibt es nichts mehr zu holen.", "There isn't anything left in this pit.", Character.highPriority)
        return
    end

end

return M