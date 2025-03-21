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

local M = {}

local monsterType = magicDamage.raceList

local function checkIfTypeOf(target, typeOf)
    for _, monster in pairs(monsterType) do
        if target:getRace() == monster.race then
            if monster.typeOf == typeOf then
                return true
            end
        end
    end
return false
end

function M.sortTargetsIntoTypes(targets, spell)
local ANTH = runes.checkSpellForRuneByName("ANTH", spell)
local information = {}
    for _, item in ipairs(targets.items) do
        if ANTH then
            local insertTable = {
            target = item,
            type = "item"
            }
            information[#information+1] = insertTable
        end
    end
    for _, tar in ipairs(targets.targets) do
        local YEG = runes.checkSpellForRuneByName("YEG", spell)
        local URA = runes.checkSpellForRuneByName("URA", spell)
        local FHEN = runes.checkSpellForRuneByName("FHEN", spell)
        local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
        local undead = checkIfTypeOf(tar, "undead")
        local sentient = checkIfTypeOf(tar, "sentient")
        local animal = checkIfTypeOf(tar, "animal")
        local foundType = ""
        if tar:getType() == Character.player then
            if FHEN then
                foundType = "player"
            end
        elseif tar:getType() == Character.monster then
            if (YEG and undead) or (TAUR and sentient) or (URA and animal) then
                foundType = "creature"
            end
        end

        if foundType == "creature" or foundType == "player" then
            local insertTable = {
            target = tar,
            type = foundType,
            gender = tar:increaseAttrib("sex", 0)
            }
            information[#information+1] = insertTable
        end
    end
    for _, pos in ipairs(targets.positions) do
        local insertTable = {
        target = pos,
        type = "position"
        }
        information[#information+1] = insertTable
    end


return information
end

return M
