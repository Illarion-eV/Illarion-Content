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


-- This script handles most of a pet's movements

local common = require("base.common")
local base = require("petsystem.base")

local M = {}

local MAX_DISTANCE = 12

local formerDistanceOwnersToPets = {}
local petsFarAwayMessageWasSent = {}

local function walkWithOwner(pet, owner, allowedDistance, tooFarAwayCry, distanceOwnerToPet)

    local wasWarped = false
    -- Assume the player was warped by some means if the z position suddnely changed or the distance is too high for walking
    if (owner.pos.z ~= pet.pos.z or distanceOwnerToPet > 4) then
        -- Warp the pet as well, if it was within a distance of <= 2 before the player was warped
        if formerDistanceOwnersToPets[owner.id] <= 2 then
            pet:warp(common.getFreePos(owner.pos, 1, true))
            wasWarped = true
        end
    end

    if distanceOwnerToPet > MAX_DISTANCE and not wasWarped then
        if not petsFarAwayMessageWasSent[pet.id] then
            pet.waypoints:clear()
            pet:setOnRoute(false)
            pet:talk(Character.yell, tooFarAwayCry, tooFarAwayCry)
            owner:inform("Deine tierische Begleitung ist zu weit von dir entfernt. Sie kann dir nicht mehr folgen.","Your animal companion is too far away from you. It cannot follow you.",Character.highPriority)
            petsFarAwayMessageWasSent[pet.id] = true
        end
    elseif distanceOwnerToPet > allowedDistance then
        if (not pet:getOnRoute()) or (pet:getOnRoute() and (pet.waypoints:getWaypoints())[1] ~= owner.pos) then
            pet.waypoints:clear()
            pet.waypoints:addWaypoint(owner.pos)
            pet:setOnRoute(true)
        end
    end

end

local function petDown(pet)
    pet.movepoints = 0
end

local timeSinceLastPositionSave = {}
function M.handleMovement(pet, tooFarAwayCry)

    local owner = base.getOwnerByPet(pet)
    if not owner then
        pet:increaseAttrib("hitpoints", -10000)
        return
    end

    local distanceOwnerToPet = owner:distanceMetric(pet)
    if not formerDistanceOwnersToPets[owner.id] then
        formerDistanceOwnersToPets[owner.id] = distanceOwnerToPet
    end

    if distanceOwnerToPet < MAX_DISTANCE and petsFarAwayMessageWasSent[pet.id] then
        petsFarAwayMessageWasSent[pet.id] = nil
    end

    local command = base.getCommand(owner)
    if command == base.follow then
        walkWithOwner(pet, owner, 3, tooFarAwayCry, distanceOwnerToPet)
    elseif command == base.heel then
        walkWithOwner(pet, owner, 0, tooFarAwayCry, distanceOwnerToPet)
    elseif command == base.nearBy then
        walkWithOwner(pet, owner, 7, tooFarAwayCry, distanceOwnerToPet)
    elseif command == base.down then
        petDown(pet, owner)
    end

    formerDistanceOwnersToPets[owner.id] = distanceOwnerToPet

    local currentTime = world:getTime("unix")
    if not timeSinceLastPositionSave[pet.id] then
        timeSinceLastPositionSave[pet.id] = currentTime
    elseif currentTime - timeSinceLastPositionSave[pet.id] >= 10 then
        base.savePetPosition(owner, pet.pos)
    end

end

return M