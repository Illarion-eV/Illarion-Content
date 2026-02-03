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

local M = {}

local skillTable = {
{name = "fireMagic", element = "Fire"},
{name = "earthMagic", element = "Earth"},
{name = "waterMagic", element = "Water"},
{name = "windMagic", element = "Air"},
{name = "spiritMagic", element = "Spirit"}
}

function M.getMagicSkillSpellBelongsTo(spell)

    local spellElement = runes.fetchElement(spell)

    for _, skill in pairs(skillTable) do
        if skill.element == spellElement then
            return skill.name
        end
    end

end

function M.increaseExperience(user, spell, castTime, targets)

    local targetLevel = 0

    for _, target in pairs(targets.targets) do --Find the target with the highest magic resistance if any

        if isValidChar(target) then

            local checkLevel = target:getSkill(Character.magicResistance)

            if checkLevel > targetLevel then
                targetLevel = checkLevel
            end
        end
    end

    local PEN = runes.checkSpellForRuneByName("PEN", spell)

    if PEN then targetLevel = 100 end --PEN doesnt need a target to level

    local skillName = M.getMagicSkillSpellBelongsTo(spell)
    local theSkill = Character[skillName]
    user:learn(theSkill, castTime, targetLevel+20)

end

return M
