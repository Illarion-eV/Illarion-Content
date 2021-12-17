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
local magicDamage = require("magic.arcane.magicDamage")
local effectScaling = require("magic.arcane.effectScaling")

local M = {}

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
    elseif world:isCharacterOnField(positionToCheck) then
        return true, lastClearedPosition
    end
    if x == tx and y == ty then
        return true, positionToCheck
    end
return false, positionToCheck
end

local function getRangeOfMovement(user, spell, target, character, Orl, targetAmount, currentTarget)
local range = 4
local scaling = effectScaling.getEffectScaling(user, target, spell)
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
            local rand = math.random(tonumber(currentTarget), tonumber(targetAmount))
            if rand == tonumber(currentTarget) then
                M.KelVars.applied = true
                range = range + 1
            end
        end
    end
    if Orl and JUS then
        range = range/2
    end
return range*scaling
end

local function checkIfWindSpell(spell)
    if not runes.checkSpellForRuneByName("JUS", spell) then
        return false
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

local function moveTargets(user, target, spell, Orl, items, targetAmount, currentTarget)
local Fhen = runes.checkSpellForRuneByName("Fhen", spell)
local Fhan = runes.checkSpellForRuneByName("Fhan", spell)
local Sav = runes.checkSpellForRuneByName("Sav", spell)
local characters = not items

    if not Fhan and not Fhen and not Sav then
        return
    end

    if items then
        if not checkIfItemMovable(target) then
            return
        end
    end

local myTarget = target.pos
local direction = getDirection(user, myTarget)
local directionReverse = getDirection(user, myTarget, Sav)
local range = getRangeOfMovement(user, spell, target, characters, Orl, targetAmount, currentTarget)
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
local lastX = myTarget.x
local lastY = myTarget.y
local lastXReverse = user.pos.x
local lastYReverse = user.pos.y
    if Fhan or Fhen then
        for i = 1, range+1 do
            local positionCleared, thePosition = checkForCollisionAndFreeSpace(lastX, lastY, landingX, landingY, Z)

            if not positionCleared then
                lastX = thePosition.x
                lastY = thePosition.y
            else
                targetPosition = thePosition
            end
        end
    end
    if Sav then
        for i = 1, range do
            local positionCleared, thePosition = checkForCollisionAndFreeSpace(lastXReverse, lastYReverse, landingXReverse, landingYReverse, Z)

            if not positionCleared then
                lastXReverse = thePosition.x
                lastYReverse = thePosition.y
            else
                targetPositionReverse = thePosition
            end
        end
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
    if Lev then
        target:move(direction, true)
        target:inform("","A strong wind forces you to step aside.")
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
local direction = getDirection(user, target.pos)
    if Luk and Tah then
        return
    end
    if Tah then
        target:turn(user.pos)
    end
    if Luk then
        for _, turning in pairs(turningTargetsDirections) do
            if direction == turning.direction then
                target:turn(turning.to)
            end
        end
    end
    if Luk or Tah then
        target:inform("","A sudden burst of wind turns you around.")
    end
end

function M.applyMovementSpells(user, targets, spell, Orl)
    if not checkIfWindSpell(spell) then
        return
    end
M.KelVars = {applied = false}
local targetAmount = #targets.targets + #targets.items
local currentTarget = 0
local Anth = runes.checkSpellForRuneByName("Anth", spell)

    for _, target in pairs(targets.targets) do
        currentTarget = currentTarget + 1
        moveTargets(user, target, spell, Orl, false, targetAmount, currentTarget)
        forceWalkTarget(target, spell)
        turnTarget(user, target, spell)
    end
    for _, item in pairs(targets.items) do
        currentTarget = currentTarget + 1
        if Anth then
            moveTargets(user, item, spell, Orl, true, targetAmount, currentTarget)
        end
    end
end

return M
