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
local effectScaling = require("magic.arcane.effectScaling")

local M = {}

function M.durationInfluence(user, target, spell)
local retVal = 0
local scaling = effectScaling.getEffectScaling(user, target, spell)
    if runes.checkSpellForRuneByName("Sul",spell) then
        retVal = retVal + 120 -- 2 minutes
    end
return retVal*scaling
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
        if runes.checkSpellForRuneByName("Anth", spell) or runes.checkSpellForRuneByName("Orl", spell) then
            retVal = true
        end
    end
    if needOrl then
        if runes.checkSpellForRuneByName("Orl", spell) then
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
    end

return objectID
end

function M.getWearBasedOnDuration(user, target, spell)
local wearInSeconds = 180
local baseDuration = wearInSeconds*2 --A flame at base duration will last between 3-6 minutes
local durationInf = M.durationInfluence(user, target, spell)
local maxDuration = wearInSeconds*10 --A flame will at most last between 27-30 minutes
local duration = baseDuration+durationInf
    if duration > maxDuration then
        duration = maxDuration
    end
local wear = duration/wearInSeconds
    if wear >= 255 then
        wear = 254
    end
return wear
end

function M.spawnStaticObjects(user, targets, spell)
    for _, target in pairs(targets) do
        local position = targeting.getPositionByTarget(target)
        M.spawnStaticObject(user, target.target, target.category, spell, position)
    end
end

function M.spawnStaticObject(user, target, targetType, spell, position)
local spawnObject = checkIfObjectShouldBeSpawned(spell, targetType)
local objectID = getObjectID(spell)
local wear = M.getWearBasedOnDuration(user, target, spell)
local illusion = "false"
    if runes.checkSpellForRuneByName("Lhor", spell) then
        illusion = "true"
    end

    if not objectID or not spawnObject then
        return
    end
world:createItemFromId(objectID, 1, position, true, 999, {["illusion"] = illusion})
local item = world:getItemOnField(position)
item.wear = wear
world:changeItem(item)
end

return M
