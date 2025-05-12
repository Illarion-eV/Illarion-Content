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

M.portals = {
    { location = position(684, 307, 0),
        english = "Portal to the Hemp Necktie Inn",
        german = "Portal zum Gasthof zur Hanfschlinge",
        level = 0,
        nameEn = "Hemp Necktie Inn",
        nameDe = "Gasthof zur Hanfschlinge"
    },
    { location = position(126, 647, 0),
      english = "Portal to Cadomyr",
      german = "Portal nach Cadomyr",
      level = 0,
      nameEn = "Cadomyr",
      nameDe = "Cadomyr"
    },
    { location = position(423, 246, 0),
      english = "Portal to Galmair",
      german = "Portal nach Galmair",
      level = 0,
      nameEn = "Galmair",
      nameDe = "Galmair"
    },
    { location = position(835, 813, 0),
      english = "Portal to Runewick",
      german = "Portal nach Runewick",
      level = 0,
      nameEn = "Runewick",
      nameDe = "Runewick"
    },
    { location = position(-484,-455,-40),
      english = "Portal to the Prison Mine",
      german = "Portal nach zur Gefängnismine",
      level = 0,
      nameEn = "Prison Mine",
      nameDe = "Gefängnismine",
      entrance = position(633, 374, 0)
    }
}

local portals = M.portals

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

    if not world:getField(myPosition) then --Can't cast a portal where there's no field
        return true
    end

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

    for _, portal in pairs(portals) do
        positionTable = increaseArea(portal.location, positionTable)
    end

    for _, myPos in pairs(positionTable) do
        if myPos.position == myPosition then
            return true
        end
    end

    return false

end

local function checkForNearbyPortals(target)

    local portalsIds = {10, 798}

    for _, portal in pairs(portalsIds) do
        for x = -1, 1 do
            for y = -1, 1 do
                if world:getField(position(target.x+x, target.y+y, target.z)) then
                    local myItem = world:getItemOnField(position(target.x+x, target.y+y, target.z))

                    if myItem.id == portal then
                        return true
                    end
                end
            end
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

    if checkForIllegalItems(myPosition) or  checkForIllegalLocations(myPosition) or checkForNearbyPortals(myPosition) then
        return false
    end

    return true

end



return M
