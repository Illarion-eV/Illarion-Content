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

--[[
Existing mine locations and their proper lore names.

Galmair - Dark Hole Mine / Dunkellochmine
Warp position: 389, 158, -3

Galmair - Malachite Mine / Malachitmine
Warp position: 437, 354, 0

Cadomyr - Liberty Quarry / Freiheitsbruch
Warp position: 168, 609, 0

Cadomyr - Cornerstone of Candour / Grundstein der Aufrichtigkeit
Warp position: 142, 687, 0

Neutral - Hammerfall Mine / Hammerfallmine
Warp position: 31, 440, -6

Neutral - Glittering Cave / Funkelhöhle
Warp position: 546, 369, 0

Neutral - Skewer Drift / Spießstollen
Warp position: 933, 466, 0

Neutral - Prison Mine / Gefängnismine
Warp position: -469, -490, -40
]]

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")

local M = {}

M.oreList = {
{id = 232, depletedId = 233, productId = 735, maxAmount = 20},
{id = 1234, depletedId = 3578, productId = 21, maxAmount = 20},
{id = 1236, depletedId = 3580, productId = 22, maxAmount = 10},
{id = 1235, depletedId = 3579, productId = 2536, maxAmount = 10},
{id = 1238, depletedId = 3718, productId = 1062, maxAmount = 10},
{id = 1237, depletedId = 3717, productId = 234, maxAmount = 10},
{id = 1239, depletedId = 3719, productId = 2534, maxAmount = 3}
}

local oreList = M.oreList

local gemList = {
{id = 251, level = 10, chance = 0.04},
{id = 255, level = 20, chance = 0.02},
{id = 252, level = 30, chance = 0.0133},
{id = 253, level = 40, chance = 0.01},
{id = 256, level = 50, chance = 0.008},
{id = 257, level = 70, chance = 0.0057},
{id = 254, level = 90, chance = 0.0044}
}

local function checkIfGemMine(orePosition)

    local upperCorner = position(957, 458, 0)
    local lowerCorner = position(924, 426, 0)

    if orePosition.z ~= upperCorner.z then
        return false
    end

    if upperCorner.y < orePosition.y or upperCorner.x < orePosition.x then
        return false
    end

    if lowerCorner.y > orePosition.y or lowerCorner.x > orePosition.x then
        return false
    end

    return true

end

local function gotGem(user, sourceItem)
    local gemMine = checkIfGemMine(sourceItem.pos)
    local rand = math.random()
    local cumulatedChance = 0
    local miningLevel = user:getSkill(Character.mining)
    for _, gems in pairs(gemList) do
        local gem = gems.id
        if miningLevel >= gems.level then
            local chance = gems.chance
                if gemMine then
                    chance = chance*2
                end
            cumulatedChance = cumulatedChance + chance
            if rand <= cumulatedChance then
                return gem
            end
        end
    end
return false
end

function M.StartGathering(user, sourceItem, ltstate)

    local mining = gathering.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}
    local toolID = Item.pickaxe
    local maxAmount = gathering.getMaxAmountFromResourceList(oreList, sourceItem.id)
    local GFX = 14
    local resourceID = gotGem(user, sourceItem)
    local depletedResourceID = gathering.getDepletedObject(oreList, sourceItem.id)
    local restockWear = 4 -- 15 minutes

    if not resourceID then
        resourceID = gathering.getProductId(oreList, sourceItem.id)
    end

    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(user, sourceItem, toolID, maxAmount, mining.LeadSkill)

    if not success then
        return
    end

    if not gathering.isDepletableResource(user, sourceItem, oreList) then
        return
    end

    local miningLevel = user:getSkill(Character.mining)

    local passesLevelRequirement, levelReq = gathering.passesLevelReq(user, sourceItem, miningLevel)

    if not passesLevelRequirement then
        user:inform(common.GetNLS(user,"Du musst Level "..levelReq.." in Bergbau haben, um hier arbeiten zu können.","You must be level "..levelReq.." in mining to mine here."))
        return
    end

    if not common.isInPrison(sourceItem.pos) then --Prisoners don't get rewards
        mining:AddRandomPureElement(user,gathering.prob_element*gatheringBonus) -- Any pure element
        mining:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"In einer engen Felsspalte findest du ein altes Pergament, das wie eine Karte aussieht. Kein Versteck ist so sicher, dass es nicht gefunden wird.","In a narrow crevice you find an old parchment that looks like a map. No hiding place is too safe that it cannot be found.")
        mining:AddMonster(user,1052,gathering.prob_monster/gatheringBonus,"Als du den Fels malträtierst, läuft etwas Schleim aus einer Felsspalte...","As you slam your pick-axe on the rock, some slime flows out of the fissure...",4,7)
        mining:AddRandomItem(310,1,333,{},gathering.prob_rarely,"Zwerge scheinen alten Krügen keine Beachtung beizumessen, insbesondere, wenn sie leer sind. Auch hier liegt einfach einer herum.","Dwarves seem to pay no attention to old pitchers, especially if they are empty. As you work one catches your eye.") --mug with lid
        mining:AddRandomItem(2183,1,333,{},gathering.prob_occasionally,"Diese Mine wurde offensichtlich kürzlich von Zwergen aufgesucht. Wie sonst erklärt sich der Krug, den du zwischen dem Geröll findest?","This mine was occupied recently. How else would you explain the mug at your feet?") --clay mug
        mining:AddRandomItem(391,1,333,{},gathering.prob_frequently,"In einer Felsspalte liegt eine alte Fackel. Hier ist wohl jemanden ein Licht aufgegangen.","In a crevice you spot an old torch.") --torch
    end

    --Case 1: Interrupted
    if ( ltstate == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( user, sourceItem ) then -- security check
        return
    end

    if not common.FitForWork( user ) then -- check minimal food points
        return
    end

    common.TurnTo( user, sourceItem.pos ) -- turn if necessary

    -- user feedback per nice animation
    user:performAnimation(GFX)

    --Case 2: Initialise action
    if ( ltstate == Action.none ) then -- currently not working -> let's go
        mining.SavedWorkTime[user.id] = mining:GenWorkTime(user)
        user:startAction( mining.SavedWorkTime[user.id], 0, 0, 18, 15)
        return
    end

    --Case 3: Action executed

    user:learn( mining.LeadSkill, mining.SavedWorkTime[user.id], mining.LearnLimit)

    if mining:FindRandomItem(user) then
        return
    end

    local created, newAmount = gathering.FindResource(user, sourceItem, amount, resourceID) -- create the new produced items

    if created then
        user:changeSource(sourceItem)
        if newAmount > 0 and not shared.toolBreaks( user, toolItem, mining:GenWorkTime(user) ) then -- there are still items we can work on and tool is not broken
            mining.SavedWorkTime[user.id] = mining:GenWorkTime(user)
            user:startAction( mining.SavedWorkTime[user.id], 0, 0, 18, 15)
        end
    end

    if newAmount <= 0 then
        gathering.SwapSource(sourceItem, depletedResourceID, restockWear)
        user:inform( "Hier gibt es keine Steine mehr, an denen du arbeiten kannst.", "There are no stones for mining anymore.", Character.lowPriority)
        return
    end
end

return M
