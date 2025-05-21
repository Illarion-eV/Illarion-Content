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
local common = require("base.common")
local runes = require("magic.arcane.runes")
local range = require("magic.arcane.castingRange")
local magic = require("base.magic")
local effectScaling = require("magic.arcane.effectScaling")

local M = {}

M.playerTargets = {}

local function addDunTargets(user, targetsPositions, spell)

    local RA = runes.checkSpellForRuneByName("RA", spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    local SUL = runes.checkSpellForRuneByName("SUL", spell)
    local targetPosition = targetsPositions.thePosition

    if user then
        if M[user.id.."LevDunPos"] then
            targetPosition = M[user.id.."LevDunPos"]
        end
        if M[user.id.."FhenPos"] then
            targetPosition = M[user.id.."FhenPos"]
        end
    end

    local possiblePositions =  --This is terrible code and should have used a for loop or something, but I am too lazy to redo it at the moment as it is functional anyways. I had just started learning to code back when I wrote this.
    {position(targetPosition.x+1,targetPosition.y,targetPosition.z), position(targetPosition.x,targetPosition.y+1,targetPosition.z),
    position(targetPosition.x-1,targetPosition.y,targetPosition.z), position(targetPosition.x,targetPosition.y-1,targetPosition.z),
    position(targetPosition.x+1,targetPosition.y-1,targetPosition.z), position(targetPosition.x-1,targetPosition.y+1,targetPosition.z),
    position(targetPosition.x+1,targetPosition.y+1,targetPosition.z), position(targetPosition.x-1,targetPosition.y-1,targetPosition.z)}

    for _, possiblePosition in pairs(possiblePositions) do

        local field = world:getField(possiblePosition)
        local foundItems = field:countItems()
        local foundChar = world:isCharacterOnField(possiblePosition)

        if (RA or CUN) and SUL then
            foundChar = false
        end

        if foundChar then
            local char =  world:getCharacterOnField(possiblePosition)
            if char:getType() ~= Character.npc then
                targetsPositions.targets[#targetsPositions.targets+1] = char
            end
        end

        local foundItem = false

        if foundItems >= 1 then
            local item = field:getStackItem(foundItems - 1)
            if item.id ~= 0 and item.id ~= 3518 then
                foundItem = true
                targetsPositions.items[#targetsPositions.items+1] = item
            end
        end

        if not foundItem and not foundChar then
            targetsPositions.positions[#targetsPositions.positions+1] = possiblePosition
        end
    end

    if user then
        M[user.id.."FhenPos"] = false
        M[user.id.."LevDunPos"] = false
    end

    return targetsPositions
end

local function addPENLukDunTargets(user, targetsPositions)

    local targetPosition = targetsPositions.thePosition

    if M[user.id.."LevDunPos"] then
        targetPosition = M[user.id.."LevDunPos"]
    end

    local possiblePositions = --This is terrible code and should have used a for loop or something, but I am too lazy to redo it at the moment as it is functional anyways. I had just started learning to code back when I wrote this.
    {position(targetPosition.x+2,targetPosition.y,targetPosition.z),
    position(targetPosition.x+2,targetPosition.y+1,targetPosition.z),
    position(targetPosition.x+2,targetPosition.y-1,targetPosition.z),
    position(targetPosition.x,targetPosition.y+2,targetPosition.z),
    position(targetPosition.x+1,targetPosition.y+2,targetPosition.z),
    position(targetPosition.x-1,targetPosition.y+2,targetPosition.z),
    position(targetPosition.x-2,targetPosition.y,targetPosition.z),
    position(targetPosition.x-2,targetPosition.y+1,targetPosition.z),
    position(targetPosition.x-2,targetPosition.y-1,targetPosition.z),
    position(targetPosition.x,targetPosition.y-2,targetPosition.z),
    position(targetPosition.x-1,targetPosition.y-2,targetPosition.z),
    position(targetPosition.x+1,targetPosition.y-2,targetPosition.z),
    position(targetPosition.x+2,targetPosition.y-2,targetPosition.z),
    position(targetPosition.x-2,targetPosition.y+2,targetPosition.z),
    position(targetPosition.x+2,targetPosition.y+2,targetPosition.z),
    position(targetPosition.x-2,targetPosition.y-2,targetPosition.z)}

    for _, possiblePosition in pairs(possiblePositions) do

        local field = world:getField(possiblePosition)
        local foundItems = field:countItems()
        local foundChar = world:isCharacterOnField(possiblePosition)

        if foundChar then
            local char =  world:getCharacterOnField(possiblePosition)
            if char:getType() ~= Character.npc then
                targetsPositions.targets[#targetsPositions.targets+1] = char
            end
        end

        if foundItems >= 1 then
            local item = field:getStackItem(foundItems - 1)
            targetsPositions.items[#targetsPositions.items+1] = item
        end

        if not (foundItems >= 1) and not foundChar then
            targetsPositions.positions[#targetsPositions.positions+1] = possiblePosition
        end
    end

    M[user.id.."LevDunPos"] = false

    return targetsPositions
end

local function convertNegative(diff)

    if diff < 0 then
        diff = diff*-1
    end

    return diff
end

local function isCloser(finalTarget, target, position)

    local XDiff1 = position.x - finalTarget.x
    local YDiff1 = position.y - finalTarget.y
    local XDiff2 = position.x - target.x
    local YDiff2 = position.y - target.y

    XDiff1 = convertNegative(XDiff1)
    YDiff1 = convertNegative(YDiff1)
    XDiff2 = convertNegative(XDiff2)
    YDiff2 = convertNegative(YDiff2)

    local diff1 = XDiff1+YDiff1
    local diff2 = XDiff2+YDiff2

    if diff2 < diff1 then
        return true
    end

    return false
end

local function getValidTargets(user, originalTarget, targets, spell)

    local validTargets = {}

    for _, target in pairs(targets) do
        --Check that it isnt the user themself, it is not the original target and it is on the same layer
        if target ~= user and (not originalTarget or originalTarget ~= target) and target.pos.z == user.pos.z then
            if not range.checkForObstacles(user, spell, target.pos) then -- checking obstacles to avoid shooting through a wall
                table.insert(validTargets, target)
            end
        end
    end

    if #validTargets == 0 then
        return false
    end

    return validTargets

end

local function FhenGetTarget(user, rangeNum, originalTarget, spell)

    if not user.attackmode or (originalTarget and not isValidChar(originalTarget)) then
        originalTarget = false
    end

    local monsterTargets = world:getMonstersInRangeOf(user.pos, rangeNum)

    local playerTargets = world:getPlayersInRangeOf(user.pos, rangeNum)

    local validPlayerTargets = getValidTargets(user, originalTarget, playerTargets, spell)

    local validMonsterTargets = getValidTargets(user, originalTarget, monsterTargets, spell)

    if not validMonsterTargets and not validPlayerTargets then
        return false
    end

    local targets = {}

    if not originalTarget or originalTarget:getType() == Character.monster then
        if validMonsterTargets then
            targets = validMonsterTargets
        elseif not originalTarget then
            targets = validPlayerTargets
        end
    elseif originalTarget:getType() == Character.player then
        if validPlayerTargets then
            targets = validPlayerTargets
        else
            targets = validMonsterTargets
        end
    end

    local finalTarget = false

    for _, target in pairs(targets) do

         if not finalTarget and isValidChar(target) then
            finalTarget = target
        elseif isCloser(finalTarget.pos, target.pos, user.pos) and isValidChar(target) then
            finalTarget = target
        end
    end

    return finalTarget
end

local function  positionHasNPC(thePosition)

    local targetIsOnTile = world:isCharacterOnField(thePosition)

    if targetIsOnTile then
        local targeted = world:getCharacterOnField(thePosition)
        if targeted:getType() == Character.npc then
            return true
        end
    end

end

local function getSlowestNearTarget(user, target, rangeNum)

    local position = target

    if target.pos then
        position = target.pos
    end

    local targets = world:getCharactersInRangeOf(position, rangeNum)

    local returnTarget = false

    local lowestSpeed

        for i = 1, #targets do
            local newTarget = targets[i]
            local userPosCheck = true
                if user then
                    if user.pos == newTarget.pos then
                        userPosCheck = false
                    end
                end
            if position ~= newTarget.pos and userPosCheck and newTarget:getType() ~= Character.npc then
                if returnTarget == false then
                    returnTarget = newTarget
                    lowestSpeed = newTarget.speed
                elseif newTarget.speed < lowestSpeed then
                    returnTarget = newTarget
                    lowestSpeed = newTarget.speed
                end
            end
        end

    return returnTarget

end

local function getWeakestNearTarget(user, position, rangeNum, LEV)

    if LEV and not world:isCharacterOnField(position) then
        return
    end

    local targets = world:getCharactersInRangeOf(position, rangeNum)
    local returnTarget = false
    local lowestHealth

    for i = 1, #targets do

        local newTarget = targets[i]

        if position ~= newTarget.pos and user.pos ~= newTarget.pos and newTarget:getType() ~= Character.npc then

            if returnTarget == false then

                returnTarget = newTarget
                lowestHealth = newTarget:increaseAttrib("hitpoints", 0)

            elseif newTarget:increaseAttrib("hitpoints", 0) < lowestHealth then

                returnTarget = newTarget
                lowestHealth = newTarget:increaseAttrib("hitpoints", 0)

            end
        end
    end

    return returnTarget

end

local function getPositionWhenNotTargetingACharacter(user)

    --[[
        If attack mode is not in use to target, the spell still needs a target.
        This defaults to the front position of the user, but a custom range can be set from 1-7,
        via an inconvenient method using the grimoire but it is better than nothing.
        To be replaced with a proper targeting point-and-click mechanic when we have
        someone who can implement the server and client side support for such.
    ]]

    local frontPos = common.GetFrontPosition(user)

    local wand = magic.getWand(user)

    if not wand then
        return frontPos
    end

    local customRange = wand:getData("range")

    if common.IsNilOrEmpty(customRange) then
        return frontPos
    end

    customRange = tonumber(customRange)

    local xDiff = frontPos.x- user.pos.x
    local yDiff = frontPos.y - user.pos.y

    local newX = user.pos.x + xDiff*customRange
    local newY = user.pos.y + yDiff*customRange

    return position(newX, newY, user.pos.z)

end

local function getTimeLimit(user, spell)

    --based on spirit spell level and scaling up to approx 60 min time limit

    local scaling = effectScaling.getEffectScaling(user, nil, spell)

    local base = 300

    return base*(scaling*6)

end

local function getPosition(user, spell, positionsAndTargets, delayed, trap)

    local element = runes.fetchElement(spell)
    local rangeNum = range.getCastingRange(user, spell, element)
    local TAH = runes.checkSpellForRuneByName("TAH", spell)
    local RA = runes.checkSpellForRuneByName("RA", spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    local HEPT = runes.checkSpellForRuneByName("HEPT", spell)
    local LEV = runes.checkSpellForRuneByName("LEV", spell)
    local PEN = runes.checkSpellForRuneByName("PEN", spell)
    local FHEN = runes.checkSpellForRuneByName("FHEN", spell)
    local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    local SUL = runes.checkSpellForRuneByName("SUL", spell)
    local ORL = runes.checkSpellForRuneByName("ORL", spell)
    local earthTrap = SOLH and ORL and not trap
    local dodgable = (CUN or RA) and SUL
    local thePosition
    local setPos = true


    if not delayed then
        if user.attackmode and magic.getWand(user) then --wand required to aim
            local id = user.id
            local targeted = M.playerTargets[id]
            if not targeted then --onAttack did not load the target yet, very rarely happens
                return
            end
            if not isValidChar(targeted) then
                return
            end
            thePosition = targeted.pos
            if not dodgable and not (PEN and LEV) then
                table.insert(positionsAndTargets.targets, targeted)
                positionsAndTargets.targetToTeach = targeted
                setPos = false
            end
        else
            thePosition = getPositionWhenNotTargetingACharacter(user) -- To be replaced with a proper targeting entry point when we have someone who can write the server and client support for point-and-click targeting :)
            local foundCharacter = world:isCharacterOnField(thePosition)
            if foundCharacter and not dodgable and not (PEN and LEV) then
                local target = world:getCharacterOnField(thePosition)
                if target:getType() == Character.player or target:getType() == Character.monster then
                    table.insert(positionsAndTargets.targets, target)
                    positionsAndTargets.targetToTeach = target
                    setPos = false
                end
            end
        end
    else
        thePosition = delayed
        local foundCharacter = world:isCharacterOnField(thePosition)
        if foundCharacter and not dodgable then
            local target = world:getCharacterOnField(thePosition)
            if target:getType() == Character.player or target:getType() == Character.monster then
                positionsAndTargets.targets[#positionsAndTargets.targets+1] = target
                setPos = false
            end
        end
    end

    if (TAH or LEV) and (RA or CUN) then
        local target = getWeakestNearTarget(user, thePosition, rangeNum, LEV)
        local proceed = true

        if LEV and not world:isCharacterOnField(thePosition) then --LEV only targets the weakest nearby character to a targeted character. TAH doesn't care.
            proceed = false
        end

        if target and proceed then
            if target:getType() == Character.player or target:getType() == Character.monster then
                if not dodgable then
                    positionsAndTargets.targets[#positionsAndTargets.targets+1] = target
                    setPos = false
                else
                    positionsAndTargets.positions[#positionsAndTargets.positions+1] = target.pos
                end
            end
        end
    end

    if LEV and SOLH and not earthTrap then
        local target = getSlowestNearTarget(user, thePosition, rangeNum)
        if target then
            if target:getType() == Character.player or target:getType() == Character.monster then
                positionsAndTargets.targets[#positionsAndTargets.targets+1] = target
                setPos = false
            end
        end
    end

    if PEN and HEPT then
        local id = user.id
        M.playerTargets["HEPT"..id] = thePosition

        if user.attackmode and magic.getWand(user) then --wand required to aim
            local targeted = M.playerTargets[id]
            M.playerTargets["HEPT"..id] = targeted
        end

        M.playerTargets["HEPT"..id.."time"] = tonumber(world:getTime("unix"))
    end

    if PEN and LEV then
        local timeLimit = getTimeLimit(user, spell)
        local currentTime = world:getTime("unix")
        local id = user.id
        local heptPosition = M.playerTargets["HEPT"..id]
        local heptTime = M.playerTargets["HEPT"..id.."time"]

        if heptTime then
            if currentTime-heptTime > timeLimit then
                user:inform("Du bemerkst, dass es zu lange her ist, das du das letzte Mal einen Zauberspruch mit HEPT genutzt hast, denn du spürst wie das Mana aus deinem Körper fließt und kein Ziel findet.", "You realise it's been too long since you last cast this spell with HEPT, as you feel the mana draining from your body finds no target.")
                    -- targeting.lua
            elseif heptPosition then

                if heptPosition.pos then
                    heptPosition = heptPosition.pos
                end

                setPos = false
                local targetExists = world:isCharacterOnField(heptPosition)
                local setLevPos = true
                M[id.."LevDunPos"] = heptPosition
                if targetExists then
                    local LevTarget = world:getCharacterOnField(heptPosition)
                    if LevTarget:getType() == Character.player or LevTarget:getType() == Character.monster then
                        positionsAndTargets.targets[#positionsAndTargets.targets+1] = LevTarget
                        setLevPos = false
                    end
                end
                if setLevPos then
                    positionsAndTargets.positions[#positionsAndTargets.positions+1] = heptPosition
                end
            end
        end
    end

    if FHEN and (RA or CUN or SOLH) and not earthTrap then
        local fhenTarget = FhenGetTarget(user, rangeNum, M.playerTargets[user.id], spell)
        if fhenTarget and isValidChar(fhenTarget) then
            if fhenTarget:getType() == Character.player or fhenTarget:getType() == Character.monster then
                if not dodgable then
                    M[user.id.."FhenPos"] = fhenTarget.pos
                    table.insert(positionsAndTargets.targets, fhenTarget)
                    setPos = false
                else
                    table.insert(positionsAndTargets.positions, fhenTarget.pos)
                end
            end
        end
    end

    positionsAndTargets.thePosition = thePosition

    local field = world:getField(thePosition)

    if field then
        local foundItems = field:countItems()

        if foundItems >= 1 then
            local item = field:getStackItem(foundItems - 1)
            if item.id ~= 0 and item.id ~= 3518 and setPos then --last check is so it doesnt double cast on item and target character
                positionsAndTargets.items[#positionsAndTargets.items+1] = item
                setPos = false
            end
        end
    end

    if positionHasNPC(thePosition) then
        setPos = false
    end

    if setPos then
        positionsAndTargets.positions[#positionsAndTargets.positions+1] = thePosition
    end

    return positionsAndTargets
end



local function addTargets(user, spell, positionsAndTargets)

    local DUN = runes.checkSpellForRuneByName("DUN", spell)
    local PEN = runes.checkSpellForRuneByName("PEN", spell)
    local LUK = runes.checkSpellForRuneByName("LUK", spell)

    if DUN and PEN and LUK then
        positionsAndTargets = addPENLukDunTargets(user, positionsAndTargets)
    elseif (PEN and LUK) or DUN then
        positionsAndTargets = addDunTargets(user, positionsAndTargets, spell)
    end

    return positionsAndTargets
end

function M.getPositionsAndTargets(user, spell, delayed, trap)

    local positionsAndTargets = {positions = {}, targets = {}, items = {}}
    positionsAndTargets = getPosition(user, spell, positionsAndTargets, delayed, trap)
    positionsAndTargets = addTargets(user, spell, positionsAndTargets)

    return positionsAndTargets
end

function M.refreshTargets(targets)

    for _, pos in pairs(targets.positions) do
        local foundCharacter = world:isCharacterOnField(pos)
        if foundCharacter then
            local target = world:getCharacterOnField(pos)
            if target:getType() == Character.player or target:getType() == Character.monster then
                targets.targets[#targets.targets+1] = target
            end
        end
    end

    for _, item in pairs(targets.items) do
        local foundCharacter = world:isCharacterOnField(item.pos)
        if foundCharacter then
            local target = world:getCharacterOnField(item.pos)
            if target:getType() == Character.player or target:getType() == Character.monster then
                targets.targets[#targets.targets+1] = target
            end
        end
    end

    return targets
end

return M
