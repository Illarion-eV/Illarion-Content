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

local M = {}

--- Damage an item (tool)
-- @param user The character who has the item
-- @param item The item that gets damaged
-- @param workTime The time the item is used
-- @return true if the item breaks, false if not
function M.ToolBreaks(user, item, workTime)

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
function M.HasTool(User, id)

    local toolItem = User:getItemAt(Character.left_tool)
    
    if ( toolItem.id ~=id ) then
        toolItem = User:getItemAt(Character.right_tool)
        if ( toolItem.id ~= id ) then
            return false
        end
    end
    
    return true
    
end

function M.ToolCheck(User, id)

    local germanGenderExtension

    if id == 74 then
        germanGenderExtension=""
    else --most tools are femasle in German
        germanGenderExtension="e"    
    end
    
    if M.HasTool(User, id) then
        local leftToolItem = User:getItemAt(Character.left_tool)
        local rightToolItem = User:getItemAt(Character.right_tool)
        if leftToolItem.id == id and common.isBroken(leftToolItem) == false then
            return true
        elseif rightToolItem.id == id and common.isBroken(rightToolItem) == false then
            return true
        else
            common.HighInformNLS(User,"Dein"..germanGenderExtension.." "..world:getItemName(id, Player.german).." ist kaputt.","Your "..world:getItemName(id, Player.english).." is broken.")
            return false
        end
    else
        common.HighInformNLS(User,"Du musst ein"..germanGenderExtension.." "..world:getItemName(id, Player.german).." in der Hand halten.","You need to hold the "..world:getItemName(id, Player.english).." in your hand.")
        return false
    end
    
    return false

end

return M