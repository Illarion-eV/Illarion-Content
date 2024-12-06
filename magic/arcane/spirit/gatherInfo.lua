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

local mana = require("magic.arcane.spirit.mana")
local health = require("magic.arcane.spirit.health")
local stamina = require("magic.arcane.spirit.stamina")
local creatures = require("magic.arcane.spirit.creatures")
local items = require("magic.arcane.spirit.items")
local location = require("magic.arcane.spirit.location")
local speed = require("magic.arcane.spirit.speed")
local terrain = require("magic.arcane.spirit.terrain")
local equipment = require("magic.arcane.spirit.equipment")
local types = require("magic.arcane.spirit.types")
local magicResistance = require("magic.arcane.spirit.magicResistance")
local attributes = require("magic.arcane.spirit.attributes")
local skill = require("magic.arcane.spirit.skill")

local M = {}

function M.invoke(user, targets, spell)
    local information = types.sortTargetsIntoTypes(targets, spell)
    information = mana.getManaText(information, spell)
    information = health.getHealthText(information, spell)
    information = stamina.getStaminaText(information, spell)
    information = creatures.getCharacterText(information, spell)
    information = items.getItemText(information, spell)
    information = location.getLocationText(user, information, spell)
    information = speed.getSpeedText(information, spell)
    information = terrain.getTerrainText(information, spell)
    information = equipment.getEquipmentText(information, spell)
    information = attributes.getAttributeText(information, spell)
    information = magicResistance.getMRText(information, spell)
    information = skill.skillValueIntoText(information, spell)
    return information
end

return M
