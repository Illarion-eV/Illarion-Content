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
local castingSpeed = require("magic.arcane.castingSpeed")
local common = require("base.common")

local M = {}

local skillTable = {
{name = "fireMagic", element = "Fire"},
{name = "earthMagic", element = "Earth"},
{name = "waterMagic", element = "Water"},
{name = "windMagic", element = "Air"},
{name = "spiritMagic", element = "Spirit"}
}

local balanceLearningSpeed = 3 --Will need changing according to how the cast time gets balanced in order to balance learning speed

function M.getMagicSkillSpellBelongsTo(spell)

    local spellElement = runes.fetchElement(spell)

    for _, skill in pairs(skillTable) do
        if skill.element == spellElement then
            return skill.name
        end
    end

end

function M.increaseExperience(user, spell)

    local castTime = castingSpeed.arcaneSpellCastSpeed(user, spell)
    local skillName = M.getMagicSkillSpellBelongsTo(spell)
    local theSkill = Character[skillName]
    local leadAttrib = common.GetLeadAttrib(user, theSkill)
    local leadAttribBonus = common.GetAttributeBonus(leadAttrib, 10)
    user:learn(theSkill, (castTime/balanceLearningSpeed)*(1+leadAttribBonus), 100)
end

function M.increaseExperiencePortalMagic(user, duration)
    local theSkill = Character.spatialMagic
    local leadAttrib = common.GetLeadAttrib(user, theSkill)
    local leadAttribBonus = common.GetAttributeBonus(leadAttrib, 10)
    user:learn(theSkill, (duration/balanceLearningSpeed)*(1+leadAttribBonus), 100)
end







return M
