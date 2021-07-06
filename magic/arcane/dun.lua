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
local M = {}

function M.increaseArea(targetPosition)
local positionTable = {}
table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y+1,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y-1,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y-1,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y+1,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y+1,targetPosition.z)})
table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y-1,targetPosition.z)})

return positionTable
end

function M.getMultipleTargets(targeted)
local targetedPosition = targeted.pos
local positionTable = M.increaseArea(targetedPosition)
local targetTable = {}
    for _, posi in pairs(positionTable) do
        if world:isCharacterOnField(posi.position) then
            local char = world:getCharacterOnField(posi.position)
            table.insert(targetTable, {target = char })
        end
    end
return targetTable
end

function M.getMultipleItems(targetPosition)
local positionTable = M.increaseArea(targetPosition)
local itemTable = {}
    for _, posi in pairs(positionTable) do
        local field = world:getField(posi.position)
        if field:countItems() ~= 0 then
            table.insert(itemTable, {position = posi.position})
        end
    end
return itemTable
end

return M
