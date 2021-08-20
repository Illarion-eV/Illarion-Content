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

local function getPENLukDunPositionTable(targetPosition)
    local positionTable = {}
    table.insert(positionTable, {position = position(targetPosition.x+2,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y+2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-2,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y-2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+2,targetPosition.y-2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-2,targetPosition.y+2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+2,targetPosition.y+2,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-2,targetPosition.y-2,targetPosition.z)})
    return positionTable
end

function M.getPosition(user, spell)
local element = runes.fetchElement(spell)
local rangeNum = range.getCastingRange(user, spell, element)
local Tah = runes.checkSpellForRuneByName("Tah", spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local retPos = common.GetFrontPosition(user)
local foundTarget, getTarget = ScriptVars:find("onMagicAttackTargetFor"..user.name)
    if foundTarget then
        if user.attackmode then
            local _, _, x, y, z = string.find(getTarget, "(%d+), (%d+), (%d+)")
            retPos = position(tonumber(x), tonumber(y), tonumber(z))
        end
    end

    if Tah and (RA or CUN) then
        local target = M.getWeakestNearTarget(user, retPos, rangeNum)
        if target then
            retPos = target.pos
        end
    end
return retPos
end

function M.refreshTargets(user, spell)
    local myPosition = M.getPosition(user, spell)
    local targets = M.getTargets(user, spell, myPosition)
    return targets
end

function M.getTargets(user, spell, targeted)
local name = user.name
local element = runes.fetchElement(spell)
local rangeNum = range.getCastingRange(user, spell, element)
local targetPosition = targeted
local Fhen = runes.checkSpellForRuneByName("Fhen", spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local Dun = runes.checkSpellForRuneByName("Dun", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)
local Luk = runes.checkSpellForRuneByName("Luk", spell)
local Hept = runes.checkSpellForRuneByName("Hept", spell)
local Lev = runes.checkSpellForRuneByName("Lev", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    if Fhen and (RA or CUN or SOLH) then
        if M.FhenGetTarget(user, targetPosition, rangeNum) then
            targetPosition = M.FhenGetTarget(user, targetPosition, rangeNum).pos
        end
    end
    if PEN and Hept then
        ScriptVars:set("Hept"..name, targetPosition)
        ScriptVars:save()
        user:setQuestProgress(7004, tonumber(world:getTime("unix")))
    end
    if PEN and Lev then
        local storedTime = user:getQuestProgress(7004)
        local timeLimit = 1800
        local currentTime = world:getTime("unix")
        if storedTime ~= 0 then
            local foundTarget, getTarget = ScriptVars:find("Hept"..name)
            if currentTime-storedTime > timeLimit then
                ScriptVars:remove("Hept"..name)
                ScriptVars:save()
                user:setQuestProgress(7004, 0)
                user:inform("","It's been too long since you last cast this spell with Hept.")
                return
            elseif foundTarget then
                targetPosition = getTarget
                ScriptVars:remove("Hept"..name)
                ScriptVars:save()
                user:setQuestProgress(7004, 0)
            end
        end
    end
local positions
    if Dun and not (PEN and Luk) then
        positions = M.increaseArea(targetPosition)
    elseif Dun and PEN and Luk then
        positions = getPENLukDunPositionTable(targetPosition)
    elseif PEN and Luk then
        positions = M.increaseArea(targetPosition)
    else
        positions = {}
        table.insert(positions, {position = targetPosition})
    end
return M.positionsIntoTargets(positions)
end

function M.positionsIntoTargets(positions)
local targets = {}
    for _, posi in pairs(positions) do
        local field = world:getField(posi.position)
        local foundItems = field:countItems()
        if world:isCharacterOnField(posi.position) then
            local char = world:getCharacterOnField(posi.position)
            if char:getType() ~= Character.npc then
                table.insert(targets, {target = char , category = "character"})
            end
        elseif foundItems ~= 0 then
            local item = field:getStackItem(foundItems - 1)
            table.insert(targets, {target = item, category = "item", position = posi.position})
        else
            table.insert(targets, {target = posi.position, category = "position"})
        end
    end
return targets
end

function M.getPositionByTarget(target)
local myPosition
    if target.category == "position" then
        myPosition = target.target
    elseif target.category == "character" then
        myPosition = target.target.pos
    elseif target.category == "item" then
        myPosition = target.position
    end
return myPosition
end

function M.FhenGetTarget(user, position, rangeNum)
local targets = world:getCharactersInRangeOf(position, rangeNum)
local returnTarget = false
    for i = 1, #targets do
        local target = targets[i]
        if target.pos ~= user.pos and target:getType() ~= Character.npc then
            returnTarget = target
        end
    end
return returnTarget
end

function M.getWeakestNearTarget(user, target, rangeNum)
local position = target
    if target.pos then
        position = target.pos
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

function M.getSlowestNearTarget(user, target, rangeNum)
    local position = target
        if target.pos then
            position = target.pos
        end
    local targets = world:getCharactersInRangeOf(position, rangeNum)
    local returnTarget = false
    local lowestSpeed
        for i = 1, #targets do
            local newTarget = targets[i]
            if position ~= newTarget.pos and user.pos ~= newTarget.pos and newTarget:getType() ~= Character.npc then
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

return M
