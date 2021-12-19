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

local function illuminate(user, myPosition, spell, earthTrap, target)
    debug("myPosition: "..tostring(myPosition))
    debug("spell: "..tostring(spell))
    debug("earthTrap: "..tostring(earthTrap))
    debug("target: "..tostring(target))
    debug("user: "..tostring(user))
local wear
    if earthTrap then
        wear = tonumber(earthTrap:getData("illuminateWear"))
    else
        wear = staticObjects.getWearBasedOnDuration(user, target, spell)
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
    for _, item in pairs(targets.items) do
        local myPosition = item.pos
        illuminate(user, myPosition, spell, earthTrap, item)
    end
    for _, position in pairs (targets.positions) do
        illuminate(user, position, spell, earthTrap, position)
    end
end

return M
