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
function M.ToolBreaks(user, item, workTime)

    if not user or not item or not workTime then
        return false
    end
    local timePerPoint = 180 --Each durability point equals 18 seconds of crafting time. Hence, a new tool lasts 30 minutes.
    if user:isNewPlayer() then
        timePerPoint = timePerPoint * 2
    end
    
    loss=math.floor(workTime/timePerPoint)
    remainder=workTime-loss
    
    if (math.random(1, 100) < (remainder/1.8)) then 
        loss=loss+1
    end

    local durability = math.fmod(item.quality, 100)
    local quality = (item.quality - durability) / 100

    durability = durability - loss
    
    if (durability <= 0) then
        gems.returnGemsToUser(user, item)
        world:erase(item, 1)
        return true
      
    end

    item.quality = quality * 100 + durability
    world:changeItem(item)
    

    if (durability <= 10) and (loss > 0) then
      common.InformNLS(user,
      "Das Werkzeug wird nicht mehr lange halten. Du solltest dich nach einem neuen umschauen oder es reparieren lassen.",
      "The tool looks like it could break soon. You should try to get a new one or get it repaired.")
    end

    return false

end

return M
