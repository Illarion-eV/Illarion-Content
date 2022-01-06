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

local seafaring = require("base.seafaring")

local M = {}

local harbours = seafaring.harborList

local teleporters = {
    --Hemptie teleporter
    position(685, 307, 0),
    --Prison Mine Teleporter (destination and teleporter)
    position(-484, -455, -40), position(-474, -455, -40),
    --Runewick teleporter
    position(836, 813, 0),
    --Cadomyr Teleporter
    position(127, 647, 0),
    --Galmair Teleporter
    position(424, 246, 0),
}

local items = { "window", "door", "open door", "stairs", "ladder", "Trap Door", "gate", "open gate"}


local function increaseArea(targetPosition, positionTable)

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

local function checkForIllegalItems(myPosition)

    local myItem = world:getItemOnField(myPosition)
    local myItemId = myItem.id
    local itemStats = world:getItemStatsFromId(myItemId)
    local nameEnglish = itemStats.English

    for _, item in pairs(items) do
        if item == nameEnglish then
            return true
        end
    end

    return false

end

local function checkForIllegalLocations(myPosition)

    local positionTable = {}

    for _, teleporter in pairs(teleporters) do
        positionTable = increaseArea(teleporter, positionTable)
    end

    for _, harbour in pairs(harbours) do
        positionTable = increaseArea(harbour.pos, positionTable)
    end

    for _, myPos in pairs(positionTable) do
        if myPos.position == myPosition then
            return true
        end
    end

    return false

end

function M.passesAntiTrollCheck(target)

    local myPosition

    if target.pos then
        myPosition = target.pos
    else
        myPosition = target
    end

    if checkForIllegalItems(myPosition) or  checkForIllegalLocations(myPosition) then
        return false
    end

    return true

end



return M
