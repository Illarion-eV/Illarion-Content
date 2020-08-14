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

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

function M.StartGathering(User, SourceItem, ltstate)

    local claydigging = gathering.GatheringCraft:new{LeadSkill = Character.digging, LearnLimit = 100}
    local toolID = 24 --shovel (24)
    local maxAmount = 20
    local GFX = 22
    local SFX = 0
    local resourceID = 26 --clay
    local depletedSourceID = 3633
    local restockWear = 4 --15 minutes
    
    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(User, SourceItem, toolID, maxAmount, claydigging.LeadSkill)
    
    if not success then
        return 
    end
    
    claydigging:AddRandomPureElement(User,gathering.prob_element*gatheringBonus) -- Any pure element
    claydigging:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Von einer Lederhülle umgeben, findest du eine alte Karte. Die hat definitiv niemand absichtlich hier hinterlassen.","Covered in a leather hide you find an old map.")
    claydigging:AddMonster(User,104,gathering.prob_monster/gatheringBonus,"Im Morast stößt du auf eine bedauernswerte Moorleiche. Jedoch scheinst du derjenige zu sein, den man fortan betrauern wird.","In the mud your shovel digs unintentionally into a feculent bog body. The stench is atrocious, but what's worse is the undead creature rises to attack.",4,7)
    claydigging:AddRandomItem(2658,1,333,{},gathering.prob_rarely,"Du findest eine Knochenhand im Matsch. Sie umklammert ein altes Breitschwert.","You find a boney hand in the mud clutching an old broadsword.")
    claydigging:AddRandomItem(51,1,333,{},gathering.prob_occasionally,"Du ziehst einen alten Eimer aus dem Schlick.","You draw an old bucket from the silt.") --bucket
    claydigging:AddRandomItem(2184,1,333,{},gathering.prob_frequently,"Ein Tonkrug offenbahrt sich im Matsch. Die Überreste einer alten Zivilisation oder einfach nur vom letzten Saufgelage?","A clay mug reveals itself in the mud. Perhaps the remains of an ancient civilization or just a littering traveller, who knows?")
    
    --Case 1: Interrupted
    if (ltstate == Action.abort) then -- work interrupted
        return
    end

    --Case 2: Initialise action
    if (ltstate == Action.none) then
        claydigging.SavedWorkTime[User.id] = claydigging:GenWorkTime(User)
        User:startAction(claydigging.SavedWorkTime[User.id], GFX, claydigging.SavedWorkTime[User.id], SFX, claydigging.SavedWorkTime[User.id])
        return
    end

    --Case 3: Action executed
    User:learn(claydigging.LeadSkill, claydigging.SavedWorkTime[User.id], claydigging.LearnLimit)

    if claydigging:FindRandomItem(User) then
        return
    end

    local created, newAmount = gathering.FindResource(User, SourceItem, amount, resourceID)

    if created then 
        User:changeSource(SourceItem)
        if newAmount > 0 and not shared.toolBreaks(User, toolItem, claydigging:GenWorkTime(User)) then
            claydigging.SavedWorkTime[User.id] = claydigging:GenWorkTime(User)
            User:startAction(claydigging.SavedWorkTime[User.id], GFX, claydigging.SavedWorkTime[User.id], SFX, claydigging.SavedWorkTime[User.id])
        end
    end

    if newAmount <= 0 then
        gathering.SwapSource(SourceItem, depletedSourceID, restockWear)
        User:inform( "An dieser Stelle gibt es nichts mehr zu holen.", "There isn't anything left in this pit.", Character.highPriority)
        return
    end

end

return M
