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

local doors = require("base.doors")
local common = require("base.common")
local housingUtility = require("housing.utility")

local M = {}

--[[
    Checks if the key is a master key and in the hands of an admin. A master key
    can open and close all doors.
    @param User - character struct to check if the owner of the key is an admin
    @param key - ItemStruct of the key that shall be checked
    @return boolean - true in case of a master key else false
]]
local function checkForMasterKey(User, key)

    if User:isAdmin() and key:getData("lockId")=="666" then
        return true
    else
        return false
    end
end

--[[
    LockDoor
    Lock a door. This function checks if that item is a closed on that can be
    locked.
    It does not check if the player has a fitting key.
    @param ItemStruct - the item that is the closed door that shall be locked
    @return boolean - true in case the door got locked, false if anything went
    wrong
]]
function M.LockDoor(Door, user)
    if doors.CheckClosedDoor(Door.id) then
        if (Door:getData("doorLock") == "unlocked") then

            if housingUtility.getStairsTrapDoor(Door.pos, false) then
                if not M.lockTrapDoor(user, Door) then
                    return false
                end
            end


            Door:setData("doorLock","locked")
            world:changeItem(Door)
            world:makeSound(19, Door.pos)

            return true
        else
            return false
        end
    else
        if user then -- this function is also called by a script where user is not present
            user:inform("GERMAN TRANSLATION", "The door must be closed for you to lock it.")
        end
        return false
    end
end

--[[
    UnlockDoor
    Unlock a door. This function checks if the item is a closed locked door and
    unlocks it.
    It does not check if the player has a fitting key.
    @param ItemStruct - the item that is the closed door that shall be unlocked
    @return boolean - true in case the door got locked, false if anything went
    wrong
]]
function M.UnlockDoor(Door, user)
    if doors.CheckClosedDoor(Door.id) then
        if (Door:getData("doorLock") == "locked" or Door:getData("lockId")~="") then

            if housingUtility.getStairsTrapDoor(Door.pos, false) then
                if not M.unlockTrapDoor(user, Door) then
                    return false
                end
            end


            Door:setData("doorLock","unlocked")
            world:changeItem(Door)
            world:makeSound(20, Door.pos)

            return true
        else
            return false
        end
    else
        return false
    end
end

--To make use of the lock stair/trapdoor function outside of housing, a trapDoor position must be added to the item data of the stairs and vice versa

local function isHousingEstate(pos)

    local propertyName = housingUtility.fetchPropertyName(nil, pos)

    if not propertyName then
        return false
    end

    return housingUtility.checkIfEstateViaName(propertyName)
end

function M.UnlockStairs(Door, user)

    if Door.id ~= 4339 then
        return false
    end

    world:erase(Door, 1) -- Erase the invisible blockade that blocks the stairs

    local stair = housingUtility.getStairsTrapDoor(Door.pos, true)

    local trapDoorPosition

    local X = stair:getData("trapdoorX")
    local Y = stair:getData("trapdoorY")
    local Z = stair:getData("trapdoorZ")

    if not common.IsNilOrEmpty(X) then -- The position was supplied by the stair item itself, meaning it was put in by GM, map editor or script outside of housing
        trapDoorPosition = position(tonumber(X), tonumber(Y), tonumber(Z))
    elseif isHousingEstate(Door.pos) then --It belongs to housing so we can determine where the position is based on how housing places them
        trapDoorPosition = housingUtility.getTrapDoorOrStairPosition(stair)
    end

    local trapDoor = housingUtility.getStairsTrapDoor(trapDoorPosition, false)

    if trapDoor:getData("doorLock") == "locked" then
        trapDoor:setData("doorLock", "unlocked")
        stair:setData("doorLock", "unlocked")
        world:changeItem(trapDoor)
        world:changeItem(stair)
        world:makeSound(20, trapDoor.pos)
        world:makeSound(20, stair.pos)
    end

    return true
end

function M.LockStairs(user, stair)

    local stairFound = false

    for index , stairId in pairs(housingUtility.stairs) do
        if stair.id == stairId then
            stairFound = true
        end
    end

    if not stairFound then
        return
    end

    local trapDoorPosition

    local X = stair:getData("trapdoorX")
    local Y = stair:getData("trapdoorY")
    local Z = stair:getData("trapdoorZ")

    if not common.IsNilOrEmpty(X) then -- The position was supplied by the stair item itself, meaning it was put in by GM, map editor or script outside of housing
        trapDoorPosition = position(tonumber(X), tonumber(Y), tonumber(Z))
    elseif isHousingEstate(stair.pos) then --It belongs to housing so we can determine where the position is based on how housing places them
        trapDoorPosition = housingUtility.getTrapDoorOrStairPosition(stair)
    end

    if not trapDoorPosition and user then
        user:inform("GERMAN TRANSLATION", "This staircase has no assigned trap door.") --Should only happen if a master key is used or someone fucked up implementation
    elseif not trapDoorPosition then
        return
    end

    local trapDoor = housingUtility.getStairsTrapDoor(trapDoorPosition, false)

    if not trapDoor and user then
        user:inform("The trap door above the stairs appears to be obstructed by something.")
        return false
    elseif not trapDoor then
        return false
    end

    local closed = doors.CheckClosedDoor(trapDoor.id)

    if not closed then
        doors.CloseDoor(trapDoor)
        trapDoor = housingUtility.getStairsTrapDoor(trapDoorPosition, false) -- refresh the item since it was changed above
    end

    if trapDoor:getData("doorLock") == "unlocked" then
        trapDoor:setData("doorLock", "locked")
        stair:setData("doorLock", "locked")
        world:changeItem(trapDoor)
        world:changeItem(stair)
        world:makeSound(20, trapDoor.pos)
        world:makeSound(20, stair.pos)
    end

    world:createItemFromId(4339, 1, stair.pos, true, 333, {lockId = trapDoor:getData("lockId")})

    return true
end

function M.unlockTrapDoor(user, trapDoor)

    local stairPosition

    local X = trapDoor:getData("stairX")
    local Y = trapDoor:getData("stairY")
    local Z = trapDoor:getData("stairZ")

    if not common.IsNilOrEmpty(X) then -- The position was supplied by the trap door item itself, meaning it was put in by GM, map editor or script outside of housing
        stairPosition = position(tonumber(X), tonumber(Y), tonumber(Z))
    elseif isHousingEstate(trapDoor.pos) then --It belongs to housing so we can determine where the position is based on how housing places them
        stairPosition = housingUtility.getTrapDoorOrStairPosition(nil, trapDoor)
    end

    local potentialStairBlockade

    if world:isItemOnField(stairPosition) then
        potentialStairBlockade = world:getItemOnField(stairPosition)
    end

    if potentialStairBlockade then
        if potentialStairBlockade.id == 4339 then
            world:erase(potentialStairBlockade, 1)
        end
    end

    local stair = housingUtility.getStairsTrapDoor(stairPosition, true)

    if not stair then
        return
    end

    if stair:getData("doorLock") == "locked" then
        stair:setData("doorLock", "unlocked")
        world:changeItem(stair)
        world:makeSound(20, stair.pos)
    end

    return true

end

function M.lockTrapDoor(user, trapDoor)
    local stairPosition

    local X = trapDoor:getData("stairX")
    local Y = trapDoor:getData("stairY")
    local Z = trapDoor:getData("stairZ")

    if not common.IsNilOrEmpty(X) then -- The position was supplied by the trap door item itself, meaning it was put in by GM, map editor or script outside of housing
        stairPosition = position(tonumber(X), tonumber(Y), tonumber(Z))
    elseif isHousingEstate(trapDoor.pos) then --It belongs to housing so we can determine where the position is based on how housing places them
        stairPosition = housingUtility.getTrapDoorOrStairPosition(nil, trapDoor)
    end

    if not stairPosition and user then
        user:inform("GERMAN TRANSLATION", "This trap door has no assigned staircase.") --Should only happen if a master key is used or someone fucked up implementation
    elseif not stairPosition then
        return
    end

    local stair = housingUtility.getStairsTrapDoor(stairPosition, true)

    if not stair and user then
        user:inform("GERMAN TRANSLATION", "Something is obstructing the stairs below.")
        return
    end

    if stair:getData("doorLock") == "unlocked" then
        stair:setData("doorLock", "locked")
        world:changeItem(stair)
        world:makeSound(20, stair.pos)
    end

    world:createItemFromId(4339, 1, stair.pos, true, 333, {lockId = trapDoor:getData("lockId")})

    return true
end

--[[
    CheckKey
    Check if a key fits into a door. This function does not check if the item is
    really a key. It assumes that it is one and checks the lock that is encoded
    in the data value.
    How ever it checks if the door item is a opened or a closed door.
    @param ItemStruct - the item that is the key for a door
    @param ItemStruct - the item that is the door that shall be checked
    @param CharacterStruct - the user that has the key
    @return boolean - true in case the key item would fit to the door, false if
    it does not fit
]]
function M.CheckKey(Key, Door, User)
    if Door == nil then
        return false
    end
    if doors.CheckClosedDoor(Door.id) or doors.CheckOpenDoor(Door.id) or Door.id == 4339 or housingUtility.doorIsAStair(Door.id) then
        if (Key:getData("lockId") == Door:getData("lockId") and Door:getData("lockId") ~= "") or checkForMasterKey(User, Key) then
            return true
        else
            return false
        end
    else
        return false
    end
end

return M
