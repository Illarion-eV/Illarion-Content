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
local effectScaling = require("magic.arcane.effectScaling")
local antiTroll = require("magic.base.antiTroll")

local M = {}

function M.durationInfluence(user, target, spell, baseWear)

    local scaling = effectScaling.getEffectScaling(user, target, spell)

    local wear = baseWear * scaling

    if runes.checkSpellForRuneByName("SUL",spell) then
        wear = wear + 1 -- 3 minutes added by SUL
    end

    return wear
end

local function checkIfNeedAnth(targetType)
    if targetType == "item" then
        return true
    end
return false
end

local function checkIfNeedOrl(targetType)
    if targetType == "position" or targetType == "character" then
        return true
    end
return false
end

local function checkIfObjectShouldBeSpawned(spell, targetType)
local needAnth = checkIfNeedAnth(targetType)
local needOrl = checkIfNeedOrl(targetType)
local retVal = false
    if needAnth then
        if runes.checkSpellForRuneByName("ANTH", spell) or runes.checkSpellForRuneByName("ORL", spell) then
            retVal = true
        end
    end
    if needOrl then
        if runes.checkSpellForRuneByName("ORL", spell) then
            retVal = true
        end
    end
return retVal
end

local function getObjectID(spell)
local objectID

    if runes.checkSpellForRuneByName("RA", spell) then
        objectID = 359
    elseif runes.checkSpellForRuneByName("CUN", spell) then
        objectID = 360
    elseif runes.checkSpellForRuneByName("SOLH", spell) then
        objectID = 372
    end

return objectID
end

function M.getWearBasedOnDuration(user, target, spell)

    local baseWear = 2 -- 3-6 min, base cant be 1 as with bad luck it could be 0-3 min
    local wear = M.durationInfluence(user, target, spell, baseWear)
    local maxWear = 10 --A flame will at most last between 27-30 minutes

    return math.min(maxWear, math.max(baseWear, wear))
end

function M.spawnStaticObjects(user, targets, spell, level)
    for _, item in pairs(targets.items) do
        M.spawnStaticObject(user, item, "item", spell, item.pos, level)
    end
    for _, position in pairs(targets.positions) do
        M.spawnStaticObject(user, position, "position", spell, position, level)
    end
    for _, character in pairs(targets.targets) do
        M.spawnStaticObject(user, character, "character", spell, character.pos, level)
    end
end

local function checkForRelevantRunes(spell)
local ANTH = runes.checkSpellForRuneByName("ANTH", spell)
local ORL = runes.checkSpellForRuneByName("ORL", spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local LUK = runes.checkSpellForRuneByName("LUK", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)

    if (RA or CUN) and (ANTH or ORL) then
        return true
    elseif SOLH and ANTH and not (LUK or ORL) then
        return true
    end
return false
end

function M.checkForPreExistingTraps(myPosition)
    local field = world:getField(myPosition)
    local numberOfItems = field:countItems()
    if numberOfItems > 0 then
        for i = 1, numberOfItems do
            local theItem = field:getStackItem(i)
            if theItem:getData("spell") ~= "" then
                return true
            end
        end
    end
return false
end

function M.spawnStaticObject(user, target, targetType, spell, targetPos, level)
local relevantRunes = checkForRelevantRunes(spell)
    if not relevantRunes then
        return
    end
local spawnObject = checkIfObjectShouldBeSpawned(spell, targetType)
local objectID = getObjectID(spell)
local wear = M.getWearBasedOnDuration(user, target, spell)
local illusion = "false"
local earthCloud = "false"
local scaling = effectScaling.getEffectScaling(user, target, spell)

    if not antiTroll.passesAntiTrollCheck(target) then
        return
    end

    if runes.checkSpellForRuneByName("LHOR", spell) then
        illusion = "true"
    end

    if runes.checkSpellForRuneByName("SOLH", spell) then
        earthCloud = "true"
    end

    if not objectID or not spawnObject then
        return
    end

    if user then
        if user.pos == targetPos then
            return
        end
    end
    if M.checkForPreExistingTraps(targetPos) then
        return
    end
world:createItemFromId(objectID, 1, targetPos, true, 999, {["illusion"] = illusion,["spell"] = spell,["earthCloud"] = earthCloud, ["scaling"] = scaling, ["level"] = level})
local item = world:getItemOnField(targetPos)
item.wear = wear
world:changeItem(item)
end

return M
