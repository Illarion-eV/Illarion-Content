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


-- This LTE handles most of the pet's movements.

local common = require("base.common")
local base = require("petsystem.base")
local petScript = require("petsystem.pet")
local fightingutil = require("base.fightingutil")

local M = {}

local maxDistance = 12
local formerPositionOfOwners = {}
local petsFarAwayMessageWasSent = {}

function M.addEffect( theEffect, pet)
    local owner = base.getOwner(pet)
    
    if not formerPositionOfOwners[owner.id] then
        formerPositionOfOwners[owner.id] = position(owner.pos.x, owner.pos.y, owner.pos.z)
    end
end

local petsFarAwayMessageWasSent = {}

local function walkWithOwner(pet, owner, allowedDistance)
    
    -- Assume the player was warped by some means if the z position suddnely changed or the distance is unusually high for walking
    if (owner.pos.z ~= pet.pos.z or pet:distanceMetricToPosition(owner.pos) > 4) then
        
        -- Warp the pet as well, if it was within a distance of <= 2 before the player was warped
        if pet:distanceMetricToPosition(formerPositionOfOwners[owner.id]) <= 2 then 
            pet:warp(common.getFreePos(owner.pos, 1, true))
        end
    end
    
    if pet:distanceMetric(owner) > maxDistance then
        if not petsFarAwayMessageWasSent[pet.id] then
            pet.waypoints:clear()
            pet:setOnRoute(false)
            local monsterType = pet:getMonsterType()
            pet:talk(Character.yell, petScript.tooFarAwayCry[monsterType].german, petScript.tooFarAwayCry[monsterType].german)
            owner:inform("Deine tierische Begleitung ist zu weit von dir entfernt. Sie kann dir nicht mehr folgen.","Your animal companion is too far away from you. It cannot follow you.",Character.highPriority)
            petsFarAwayMessageWasSent[pet.id] = true
        end
    elseif pet:distanceMetric(owner) > allowedDistance then
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

function M.callEffect(petEffect, pet)
    
    local owner = base.getOwner(pet)
    if not owner then
        return false
    end
    
    if pet:distanceMetric(owner) < maxDistance and petsFarAwayMessageWasSent[pet.id] then
        petsFarAwayMessageWasSent[pet.id] = nil
    end
    
    local command = base.getCommand(owner)
    if command == base.follow or (command == base.attack and fightingutil.getSelectedEnemyId(pet.id) == false) then
        walkWithOwner(pet, owner, 3)
    elseif command == base.heel then
        walkWithOwner(pet, owner, 0)
    elseif command == base.nearBy then
        walkWithOwner(pet, owner, 7)
    elseif command == base.down then
        petDown(pet, owner)
    end
    
    formerPositionOfOwners[owner.id] = position(owner.pos.x, owner.pos.y, owner.pos.z)
    
    base.savePetPosition(owner, position(pet.pos.x, pet.pos.y, pet.pos.z))
    local hp = pet:increaseAttrib("hitpoints", 0)
    base.savePetHitpoints(owner, hp)     
    
    petEffect.nextCalled = 3
    return true
end

function M.removeEffect(petEffect, pet)
    pet:increaseAttrib("hitpoints", -10000)
end

return M