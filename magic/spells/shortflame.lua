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

local scheduledFunction = require("scheduled.scheduledFunction")

local listOfFlames = {}
-- {item, remaining cycles}

local CYCLE_TIME = 1

local FIRE_FLAME_ID = 359
local ICE_FLAME_ID = 360
local POISON_ID = 372
local permittedId = {FIRE_FLAME_ID,
                     ICE_FLAME_ID,
                     POISON_ID}

local function removeFlame(listId)
    local item = listOfFlames[listId][1]
    if item ~= nil then
        world:erase(item,item.number)
    end
    table.remove(listOfFlames, listId)
end

local function manageFlames()
    for i=#listOfFlames, 1, -1 do
        if listOfFlames[i][2] < 1 then
            removeFlame( i )
        else
            listOfFlames[i][2] = listOfFlames[i][2] - 1
        end
        
    end
    if #listOfFlames > 0 then
        scheduledFunction.registerFunction(CYCLE_TIME, function() manageFlames() end)
    end
end

local M = {}

function M.cast(position, extDuration, extFlameId)
    local duration = extDuration or 6
    local flameId = extFlameId or FIRE_FLAME_ID

    local cycles = math.floor(duration / CYCLE_TIME)
    local item = world:createItemFromId(flameId, 1, position, true, 333, nil)
    item.wear = 1
    world:changeItem(item)
    table.insert(listOfFlames,{item,cycles})

    if #listOfFlames == 1 then
        scheduledFunction.registerFunction(CYCLE_TIME, function() manageFlames() end)
    end

end

return M