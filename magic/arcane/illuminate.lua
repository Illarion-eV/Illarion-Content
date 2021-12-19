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
local staticObjects = require("magic.arcane.staticObjects")

local M = {}

local function checkForPreExistingIlluminate(myPosition, wear)
    local field = world:getField(myPosition)
    local numberOfItems = field:countItems()
    if numberOfItems > 0 then
        for i = 1, numberOfItems do
            local theItem = field:getStackItem(i)
            if theItem.id == 3518 then
                theItem.wear = wear
                world:changeItem(theItem)
                return true
            end
        end
    end
return false
end

local function fieldIsntEmpty(myPosition)
    local field = world:getField(myPosition)
    local numberOfItems = field:countItems()
    if numberOfItems > 0 then
        return true
    end
return false
end

local function illuminate(user, myPosition, spell, earthTrap, target)
local wear
    if earthTrap then
        wear = tonumber(earthTrap:getData("illuminateWear"))
    else
        wear = staticObjects.getWearBasedOnDuration(user, target, spell)
    end
    if checkForPreExistingIlluminate(myPosition, wear) then
        return
    end
    if fieldIsntEmpty(myPosition) then
        return
    end
local item = world:createItemFromId(3518, 1, myPosition, true, 999, {})
    item.wear = wear
    world:changeItem(item)
end

function M.CheckIfIlluminate(user, targets, spell, earthTrap)
local Mes = runes.checkSpellForRuneByName("Mes", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)

    if not Mes or (JUS or PEN) then
        return
    end

    for _, target in pairs(targets.targets) do
        local myPosition = target.pos
        illuminate(user, myPosition, spell, earthTrap, target)
    end
    for _, position in pairs (targets.positions) do
        illuminate(user, position, spell, earthTrap, position)
    end
end

return M
