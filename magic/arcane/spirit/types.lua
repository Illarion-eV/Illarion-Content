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
local Anth = runes.checkSpellForRuneByName("Anth", spell)
local information = {}
    for _, item in ipairs(targets.items) do
        if Anth then
            local insertTable = {
            target = item,
            type = "item"
            }
            information[#information+1] = insertTable
        end
    end
    for _, tar in ipairs(targets.targets) do
        local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
        local Ura = runes.checkSpellForRuneByName("Ura", spell)
        local Fhen = runes.checkSpellForRuneByName("Fhen", spell)
        local Taur = runes.checkSpellForRuneByName("Taur", spell)
        local undead = checkIfTypeOf(tar, "undead")
        local sentient = checkIfTypeOf(tar, "sentient")
        local animal = checkIfTypeOf(tar, "animal")
        local foundType = ""
        if tar:getType() == Character.player then
            if Fhen then
                foundType = "player"
            end
        elseif tar:getType() == Character.monster then
            if (Yeg and undead) or (Taur and sentient) or (Ura and animal) then
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
