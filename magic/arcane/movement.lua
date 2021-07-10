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

local runes = require("magic.arcane.runes")
local targeting = require("magic.arcane.targeting")
local magicDamage = require("magic.arcane.magicDamage")

local M = {}

M.KelVars = {applied = false, finalTarget = false}

local townEntrances = {
{lowerX = 116, upperX = 119, lowerY = 641, upperY = 641, z = 0},
{lowerX = 417, upperX = 417, lowerY = 249, upperY = 250, z = 0},
{lowerX = 385, upperX = 385, lowerY = 331, upperY = 331, z = 0},
{lowerX = 866, upperX = 866, lowerY = 814, upperY = 818, z = 0}
}

local function checkIfItemMovable(item)
local id = item.id
local wear = item.wear
local weight = world:getItemStatsFromId(id).Weight
    if weight >= 30000 or wear == 255 then
        return false
    end
return true
end

local function getListOfTownEntrancePositions()
local retList = {}
    for _, entrance in pairs(townEntrances) do
        for x = entrance.lowerX, entrance.upperX do
            for y = entrance.lowerY, entrance.upperY do
                local z = entrance.z
                table.insert(retList, {pos = position(x, y, z)})
            end
        end
    end
return retList
end

local function checkForCollisionAndFreeSpace(lx, ly, tx, ty, tz)
local entrancePositions = getListOfTownEntrancePositions()
local positionToCheck
local lastClearedPosition = position(lx, ly, tz)
local x
local y
    if ty > ly then
        y = ly+1
    elseif ty < ly then
        y = ly-1
    else
        y = ly
    end
    if tx > lx then
        x = lx+1
    elseif tx < lx then
        x = lx-1
    else
        x = lx
    end
    positionToCheck = position(x, y, tz)
local field = world:getField(positionToCheck)
    for _, entrance in pairs(entrancePositions) do
        if entrance.pos == positionToCheck then
            return true, lastClearedPosition
        end
    end
    if not field then
        return true, lastClearedPosition
    elseif not field:isPassable() then
        return true, lastClearedPosition
    end
    if x == tx and y == ty then
        return true, positionToCheck
    end
return false, positionToCheck
end

local function getRangeOfMovement(spell, target, character, Orl)
local range = 4
local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
local Kel = runes.checkSpellForRuneByName("Kel", spell)
local Taur = runes.checkSpellForRuneByName("Taur", spell)
local Ura = runes.checkSpellForRuneByName("Ura", spell)
local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local rune
    if Taur then
        rune = "Taur"
    elseif Ura then
        rune = "Ura"
    elseif Yeg then
        rune = "Yeg"
    end
local raceBonus
    if rune and character then
        raceBonus = magicDamage.checkIfRaceBonus(target, rune)
    end
    if raceBonus and JUS then
        range = range + 1
    end
    if Qwan then
        range = range + 2
    end
    if Kel then
        if not M.KelVars.applied then
            local options = {false, true}
            local fiftyfifty = options[math.random(#options)]
            if fiftyfifty then
                M.KelVars.applied = true
                range = range + 1
            elseif M.KelVars.finalTarget then
                range = range + 1
            end
        end
    end
    if Orl and JUS then
        range = range/2
    end
return range
end

local function checkIfWindSpell(spell)
    if not runes.checkSpellForRuneByName("JUS", spell) then
        return false
    end
return true
end

local function checkForMovableItems(target, spell)
    if target.category == "item" then
        if not runes.checkSpellForRuneByName("Anth", spell) then
            return false
        end
    end
return true
end

local function getDirection(user, target, reverse)
local userX = user.pos.x
local userY = user.pos.y
local targetX = target.x
local targetY = target.y
    if reverse then
        userX = target.x
        userY = target.y
        targetX = user.pos.x
        targetY = user.pos.y
    end
local direction
    if userX > targetX then
        direction = "west"
        if userY > targetY then
            direction = "northwest"
        elseif userY < targetY then
            direction = "southwest"
        end
    elseif userX < targetX then
        direction = "east"
        if userY > targetY then
            direction = "northeast"
        elseif userY < targetY then
            direction = "southeast"
        end
    elseif userY > targetY then
        direction = "north"
    else
        direction = "south"
    end
return direction
end

local directionCorrection = {}
table.insert(directionCorrection, {away = "west", toward = "east", X = 1, Y = 0})
table.insert(directionCorrection, {away = "east", toward = "west", X = -1, Y = 0})
table.insert(directionCorrection, {away = "north", toward = "south", X = 0, Y = 1})
table.insert(directionCorrection, {away = "south", toward = "north", X = 0, Y = -1})
table.insert(directionCorrection, {away = "southwest", toward = "northeast", X = 1, Y = -1})
table.insert(directionCorrection, {away = "southeast", toward = "northwest", X = -1, Y = -1})
table.insert(directionCorrection, {away = "northwest", toward = "southeast", X = 1, Y = 1})
table.insert(directionCorrection, {away = "northeast", toward = "southwest", X = -1, Y = 1})

local function moveTargets(user, target, spell, Orl)
local Fhen = runes.checkSpellForRuneByName("Fhen", spell)
local Fhan = runes.checkSpellForRuneByName("Fhan", spell)
local Sav = runes.checkSpellForRuneByName("Sav", spell)
local items = target.category == "item"
local characters = target.category == "character"
    if not items and not characters then
        return
    end
    if not Fhan and not Fhen and not Sav then
        return
    end
    if items then
        if not checkIfItemMovable(target.target) then
            return
        end
    end
local myTarget
    if items then
        myTarget = target.position
    elseif characters then
        myTarget = target.target.pos
    end
local direction = getDirection(user, myTarget)
local directionReverse = getDirection(user, myTarget, Sav)
local range = getRangeOfMovement(spell, target.target, characters, Orl)
local Z = myTarget.z
local landingX
local landingY
local directionToMove
local informEN = "A blast of air magic sends you flying."
local informDE = ""
local targetPosition
local landingXReverse
local landingYReverse
local targetPositionReverse
    if Fhan and not Fhen then
        directionToMove = "toward"
    end
    if Fhen and not Fhan  then
        directionToMove = "away"
    end
    for _, directions in pairs(directionCorrection) do
        if directions[directionToMove] == direction then
            landingX = myTarget.x + (directions.X*range)
            landingY = myTarget.y + (directions.Y*range)
            targetPosition = position(landingX, landingY, Z)
        end
        if directions.toward == directionReverse then
            landingXReverse = user.pos.x + (directions.X*range)
            landingYReverse = user.pos.y + (directions.Y*range)
            targetPositionReverse = position(landingXReverse, landingYReverse, Z)
        end

    end
local proceed = false
local lastX = myTarget.x
local lastY = myTarget.y
local lastXReverse = user.pos.x
local lastYReverse = user.pos.y
local proceedReverse = false
    if Fhan or Fhen then
        repeat
            local positionCleared, thePosition = checkForCollisionAndFreeSpace(lastX, lastY, landingX, landingY, Z)
            if not positionCleared then
                lastX = thePosition.x
                lastY = thePosition.y
            else
                targetPosition = thePosition
                proceed = true
            end
        until proceed
    end
    if Sav then
        repeat
            local positionCleared, thePosition = checkForCollisionAndFreeSpace(lastXReverse, lastYReverse, landingXReverse, landingYReverse, Z)
            if not positionCleared then
                lastXReverse = thePosition.x
                lastYReverse = thePosition.y
            else
                targetPositionReverse = thePosition
                proceedReverse = true
            end
        until proceedReverse
    end
    if items then
        local field = world:getField(myTarget)
        local foundItems = field:countItems()
        local targetItem = field:getStackItem(foundItems - 1)
        world:erase(targetItem, 1)
        world:createItemFromItem(targetItem, targetPosition, true)
    elseif characters then
        if Fhan or Fhen then
            local targetedChar = world:getCharacterOnField(myTarget)
            targetedChar:forceWarp(targetPosition)
            targetedChar:inform(informDE, informEN)
        end
        if Sav then
            user:forceWarp(targetPositionReverse)
            user:inform(informDE, informEN)
        end
    end
end

local function forceWalkTarget(target, spell)
local possibleDirections = {"North", "North-east", "East", "South-east", "South", "South-west", "West", "North-west"}
local direction = math.random(#possibleDirections)
local Lev = runes.checkSpellForRuneByName("Lev", spell)
    if Lev and target.category == "character" then
        target.target:move(direction, true)
        target.target:inform("","A strong wind forces you to step aside.")
    end
end

local turningTargetsDirections = {

{direction = "west", to = 6},
{direction = "east", to = 2},
{direction = "north", to = 0},
{direction = "south", to = 4},
{direction = "southwest", to = 5},
{direction = "southeast", to = 3},
{direction = "northwest", to = 7},
{direction = "northeast", to = 1},
}

local function turnTarget(user, target, spell)
local Luk = runes.checkSpellForRuneByName("Luk", spell)
local Tah = runes.checkSpellForRuneByName("Tah", spell)
    if target.category ~= "character" then
        return
    end
local direction = getDirection(user, target.target.pos)
    if Luk and Tah then
        return
    end
    if Tah then
        target.target:turn(user.pos)
    end
    if Luk then
        for _, turning in pairs(turningTargetsDirections) do
            if direction == turning.direction then
                target.target:turn(turning.to)
            end
        end
    end
    if Luk or Tah then
        target.target:inform("","A sudden burst of wind turns you around.")
    end
end

function M.applyMovementSpells(user, spell, Orl)
local targets = targeting.refreshTargets(user, spell)
local targetAmount = 0
local currentTarget = 0
    for _, target in pairs(targets) do
        if target.category == "item" or target.category == "character" then
            targetAmount = targetAmount + 1
        end
    end
    for _, target in pairs(targets) do
        currentTarget = currentTarget + 1
        if currentTarget == targetAmount then
            M.KelVars.finalTarget = true
        end
        if checkIfWindSpell(spell) and checkForMovableItems(target, spell) then
            moveTargets(user, target, spell, Orl)
            forceWalkTarget(target, spell)
            turnTarget(user, target, spell)
        end
    end
end

return M
