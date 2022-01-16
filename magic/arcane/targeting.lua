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
local texts = require("magic.arcane.base.texts")

local M = {}

M.playerTargets = {}

local function addDunTargets(user, targetsPositions, spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local targetPosition = targetsPositions.thePosition
    if M[user.name.."LevDunPos"] then
        targetPosition = M[user.name.."LevDunPos"]
    end
local possiblePositions =
    {position(targetPosition.x+1,targetPosition.y,targetPosition.z), position(targetPosition.x,targetPosition.y+1,targetPosition.z),
    position(targetPosition.x-1,targetPosition.y,targetPosition.z), position(targetPosition.x,targetPosition.y-1,targetPosition.z),
    position(targetPosition.x+1,targetPosition.y-1,targetPosition.z), position(targetPosition.x-1,targetPosition.y+1,targetPosition.z),
    position(targetPosition.x+1,targetPosition.y+1,targetPosition.z), position(targetPosition.x-1,targetPosition.y-1,targetPosition.z)}
    for _, possiblePosition in pairs(possiblePositions) do
        local field = world:getField(possiblePosition)
        local foundItems = field:countItems()
        local foundChar = world:isCharacterOnField(possiblePosition)
        if (RA or CUN) and Sul then
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
    M[user.name.."LevDunPos"] = false
    return targetsPositions
end

local function addPENLukDunTargets(user, targetsPositions)
    local targetPosition = targetsPositions.thePosition
    if M[user.name.."LevDunPos"] then
        targetPosition = M[user.name.."LevDunPos"]
    end
    local possiblePositions =
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
    M[user.name.."LevDunPos"] = false
    return targetsPositions
end

local function FhenGetTarget(user, position, rangeNum)
    local targets = world:getCharactersInRangeOf(position, rangeNum)
    local returnTarget = false
        for i = 1, #targets do
            local target = targets[i]
            local userPosCheck = true
                if user then
                    if user.pos == target.pos then
                        userPosCheck = false
                    end
                end
            if userPosCheck and target:getType() ~= Character.npc then
                returnTarget = target
            end
        end
    return returnTarget
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

local function getWeakestNearTarget(user, position, rangeNum, Lev)
    if Lev then
        if not world:isCharacterOnField(position) then
            return
        end
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

local function getPosition(user, spell, positionsAndTargets, delayed, trap)
local element = runes.fetchElement(spell)
local rangeNum = range.getCastingRange(user, spell, element)
local Tah = runes.checkSpellForRuneByName("Tah", spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local Hept = runes.checkSpellForRuneByName("Hept", spell)
local Lev = runes.checkSpellForRuneByName("Lev", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)
local Fhen = runes.checkSpellForRuneByName("Fhen", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local earthTrap = SOLH and Orl and not trap
local dodgable = (CUN or RA) and Sul
local thePosition
local setPos = true


    if not delayed then
        if user.attackmode then
            local name = user.name
            local targeted = M.playerTargets[name]
            if not targeted then --onAttack did not load the target yet, very rarely happens
                return
            end
            if not isValidChar(targeted) then
                return
            end
            thePosition = targeted.pos
            if not dodgable and not (PEN and Lev) then
                positionsAndTargets.targets[#positionsAndTargets.targets+1] = targeted
                positionsAndTargets.targetToTeach = targeted
                setPos = false
            end
        else
            thePosition = common.GetFrontPosition(user) --later replace with entry point that returns boolean(to determine success of whether player selected a tile) and position of selected tile
            local foundCharacter = world:isCharacterOnField(thePosition)
            if foundCharacter and not dodgable and not (PEN and Lev) then
                local target = world:getCharacterOnField(thePosition)
                if target:getType() == Character.player or target:getType() == Character.monster then
                    positionsAndTargets.targets[#positionsAndTargets.targets+1] = target
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

    if (Tah or Lev) and (RA or CUN) then
        local target = getWeakestNearTarget(user, thePosition, rangeNum, Lev)
        if target then
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

    if Lev and SOLH and not earthTrap then
        local target = getSlowestNearTarget(user, thePosition, rangeNum)
        if target then
            if target:getType() == Character.player or target:getType() == Character.monster then
                positionsAndTargets.targets[#positionsAndTargets.targets+1] = target
                setPos = false
            end
        end
    end

    if PEN and Hept then
        local name = user.name
        M.playerTargets["Hept"..name] = thePosition
        M.playerTargets["Hept"..name.."time"] = tonumber(world:getTime("unix"))
    end

    if PEN and Lev then
        local timeLimit = 1800
        local currentTime = world:getTime("unix")
        local name = user.name
        local heptPosition = M.playerTargets["Hept"..name]
        local heptTime = M.playerTargets["Hept"..name.."time"]

        if heptTime then
            if currentTime-heptTime > timeLimit then
                user:inform(texts.levText.german, texts.levText.english)
            elseif heptPosition then
                setPos = false
                local targetExists = world:isCharacterOnField(heptPosition)
                local setLevPos = true
                M[name.."LevDunPos"] = heptPosition
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

    if Fhen and (RA or CUN or SOLH) and not earthTrap then
        local fhenTarget = FhenGetTarget(user, thePosition, rangeNum)
        if fhenTarget then
            if fhenTarget:getType() == Character.player or fhenTarget:getType() == Character.monster then
                if not dodgable then
                    positionsAndTargets.targets[#positionsAndTargets.targets+1] = fhenTarget
                    setPos = false
                else
                    positionsAndTargets.positions[#positionsAndTargets.positions+1] = fhenTarget.pos
                end
            end
        end
    end

    positionsAndTargets.thePosition = thePosition

    local field = world:getField(thePosition)
    local foundItems = field:countItems()

    if foundItems >= 1 then
        local item = field:getStackItem(foundItems - 1)
        if item.id ~= 0 and item.id ~= 3518 then
            positionsAndTargets.items[#positionsAndTargets.items+1] = item
            setPos = false
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
local Dun = runes.checkSpellForRuneByName("Dun", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)
local Luk = runes.checkSpellForRuneByName("Luk", spell)

    if Dun and PEN and Luk then
        positionsAndTargets = addPENLukDunTargets(user, positionsAndTargets)
    elseif (PEN and Luk) or Dun then
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
