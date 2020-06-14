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
-- Generic Routine Collection
local common = require("base.common")
local gems = require("base.gems")

local M = {}

--- Damage an item (tool)
-- @param user The character who has the item
-- @param item The item that gets damaged
-- @param workTime The time the item is used
-- @return true if the item breaks, false if not
function M.toolBreaks(user, item, workTime)

    if not user or not item or not workTime then
        return false
    end
    local timePerPoint = 360 --Each durability point equals 36 seconds of crafting time. Hence, a new tool lasts 60 minutes.
    if user:isNewPlayer() then
        timePerPoint = timePerPoint * 2
    end

    local loss = math.floor(workTime/timePerPoint)
    local remainder = workTime - loss

    if (math.random(1, 100) < (remainder/(timePerPoint/100))) then
        loss=loss+1
    end

    local durability = math.fmod(item.quality, 100)
    local quality = (item.quality - durability) / 100

    durability = durability - loss

    if durability < 0 then
        durability = 0
    end

    item.quality = quality * 100 + durability
    world:changeItem(item)

    if (durability == 0) then
        local germanExtension
        local germanExtensionBroken
        germanExtension,germanExtensionBroken = M.getGermanExtension(item.id)
        common.HighInformNLS(user,"Dein"..germanExtensionBroken.." "..world:getItemName(item.id, Player.german).." zerbricht.","Your "..world:getItemName(item.id, Player.english).." breaks.")
        return true
    end

    --[[if (durability <= 10) and (loss > 0) then
      common.InformNLS(user,
      "Das Werkzeug wird nicht mehr lange halten. Du solltest dich nach einem neuen umschauen oder es reparieren lassen.",
      "The tool looks like it could break soon. You should try to get a new one or get it repaired.")
    end]]

    return false

end

--Checks if the user has a specific tool in a hand slot
function M.hasTool(User, id)

    local toolItem = User:getItemAt(Character.left_tool)
    
    if ( toolItem.id ~=id ) then
        toolItem = User:getItemAt(Character.right_tool)
        if ( toolItem.id ~= id ) then
            return false
        end
    end
    
    return true
    
end

function M.getTool(User, id)

    local germanExtension
    local germanExtensionBroken
    
    germanExtension,germanExtensionBroken = M.getGermanExtension(id)
    
    if M.hasTool(User, id) then
        local leftToolItem = User:getItemAt(Character.left_tool)
        local rightToolItem = User:getItemAt(Character.right_tool)
        if leftToolItem.id == id and common.isBroken(leftToolItem) == false then
            return leftToolItem
        elseif rightToolItem.id == id and common.isBroken(rightToolItem) == false then
            return rightToolItem
        else
            common.HighInformNLS(User,"Dein"..germanExtensionBroken.." "..world:getItemName(id, Player.german).." ist kaputt.","Your "..world:getItemName(id, Player.english).." is broken.")
            return false
        end
    else
        common.HighInformNLS(User,"Du musst ein"..germanExtension.." "..world:getItemName(id, Player.german).." in der Hand halten.","You need to hold the "..world:getItemName(id, Player.english).." in your hand.")
        return false
    end
    
    return false

end

function M.getGermanExtension(id)

    local germanExtension="e" --most tools are female in German
    local germanExtensionBroken="e"
    
    -- 74:hatchet;121:peel;2781:dyeing rod;122:finesmithing hammer;311:glass blow pipe;23:hammer;2709:armourer's hammer;227:cooking spoon;737:chisel;2752:carving tools;2715:plane
    local maleToolList = {121,2781,122,23,2709,227,737,2715}
    local neuterToolList = {74,311,2752}    
    
    for i in pairs(maleToolList) do
        if id == maleToolList[i] then
            germanExtensionBroken=""
            germanExtension="en"
        end
    end

    for i in pairs(neuterToolList) do
        if id == neuterToolList[i] then
            germanExtensionBroken=""
            germanExtension=""
        end
    end
    
    return germanExtension,germanExtensionBroken
    
end

function M.getGatheringBonus(user, toolItem)

    local gemScaling = 500 --Percentage divided by 100 (100 % = 1) and by 5 to match crafting quality calculation
    local gatheringBonus = 1 --Default
    
    if toolItem then
        gatheringBonus=gatheringBonus+common.GetAttributeBonusHigh(user:increaseAttrib("constitution", 0))+common.GetQualityBonusStandard(toolItem)+gems.getGemBonus(toolItem)/gemScaling
    else
        gatheringBonus=gatheringBonus+common.GetAttributeBonusHigh(user:increaseAttrib("constitution", 0))
    end

    return gatheringBonus
    
end

return M