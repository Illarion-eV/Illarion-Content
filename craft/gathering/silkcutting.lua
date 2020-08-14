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

-- Butterflies (3634, 3635, 3636, 3637)

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

function M.StartGathering(User, SourceItem, ltstate)

    local silkcutting = gathering.GatheringCraft:new{LeadSkill = Character.tanningAndWeaving, LearnLimit = 100}
    local toolID = 6 --scissors (6)
    local maxAmount = 3
    local GFX = 22
    local SFX = 0
    local resourceID = 3787 --silk
    local restockWear = 4 --15 minutes
    local depletedSourceID
    
    if SourceItem.id == 3634 then
        depletedSourceID = 3638
    elseif SourceItem.id == 3635 then
        depletedSourceID = 3639
    elseif SourceItem.id == 3636 then
        depletedSourceID = 3640
    elseif SourceItem.id == 3637 then
        depletedSourceID = 3641
    end
    
    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(User, SourceItem, toolID, maxAmount, silkcutting.LeadSkill)
    
    if not success then
        return 
    end
    
    silkcutting:AddRandomPureElement(User,gathering.prob_element*gatheringBonus) -- Any pure element
    silkcutting:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Eine Raupe nagt genüßlich an einer Karte mit einem großem X.","A caterpillar chews on a map with a big X.")
    silkcutting:AddMonster(User,1113,gathering.prob_monster/gatheringBonus,"Eine aggressive Ratte hat es sich in diesem Busch gemütlich gemacht.","An aggressive rat has made itself comfortable in this bush.",4,7)
    silkcutting:AddRandomItem(549,1,333,{},gathering.prob_rarely,"Ein vergifteter Pfeil steckt in diesem Busch. Sei vorsichtig damit.","A poisoned arrow sticks in this bush. Handle with care.")
    silkcutting:AddRandomItem(3555,1,333,{},gathering.prob_occasionally,"Diebesgut? Ein abgelehnter Verlobungsantrag? Wen kümmert's, der Ring im GebÃ¼sch ist jetzt deiner.","Stolen goods? A rejected proposal? Who cares, the ring in the bush is now yours.")
    silkcutting:AddRandomItem(3631,1,333,{},gathering.prob_frequently,"Ein altes Wurstbrot wurde wohl achtlos in diesen Busch geworfen. Wohl bekommt's.","An old sausage bread has been cast into this bush carelessly. Enjoy.")
    
    --Case 1: Interrupted
    if (ltstate == Action.abort) then -- work interrupted
        return
    end

    --Case 2: Initialise action
    if (ltstate == Action.none) then
        silkcutting.SavedWorkTime[User.id] = silkcutting:GenWorkTime(User)
        User:startAction(silkcutting.SavedWorkTime[User.id], GFX, silkcutting.SavedWorkTime[User.id], SFX, silkcutting.SavedWorkTime[User.id])
        return
    end

    --Case 3: Action executed
    User:learn(silkcutting.LeadSkill, silkcutting.SavedWorkTime[User.id], silkcutting.LearnLimit)

    if silkcutting:FindRandomItem(User) then
        return
    end

    local created, newAmount = gathering.FindResource(User, SourceItem, amount, resourceID)

    if created then 
        User:changeSource(SourceItem)
        if newAmount > 0 and not shared.toolBreaks(User, toolItem, silkcutting:GenWorkTime(User)) then
            silkcutting.SavedWorkTime[User.id] = silkcutting:GenWorkTime(User)
            User:startAction(silkcutting.SavedWorkTime[User.id], GFX, silkcutting.SavedWorkTime[User.id], SFX, silkcutting.SavedWorkTime[User.id])
        end
    end

    if newAmount <= 0 then
        gathering.SwapSource(SourceItem, depletedSourceID, restockWear)
        User:inform( "Du findest hier keine Seidenspinnerraupen mehr.", "You can't find any silkworms here anymore.", Character.highPriority)
        return
    end

end

return M