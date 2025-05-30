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
local gmTool = require("gm.items.id_99_lockpicks")

local M = {}

M.skillTexts = {
    {value = 3200, english = "Target is highly experienced in many professions.", german = "Dein Ziel hat besonders viel Erfahrung in vielen Fähigkeiten. "},
    {value = 2200, english = "Target is very experienced in many professions", german = "Dein Ziel hat sehr viel Erfahrung in vielen Fähigkeiten."},
    {value = 700, english = "Target is experienced in many professions.", german = "Dein Ziel hat viel Erfahrung in unterschiedlichen Fähigkeiten."},
    {value = 450, english = "Target is experienced in some professions.", german = "Dein Ziel ist hat Erfahrung in unterschiedlichen Fähigkeiten."},
    {value = 300, english = "Target has some experience in multiple professions.", german = "Dein Ziel hat etwas Erfahrung in unterschiedlichen Fähigkeiten."},
    {value = 200, english = "Target has at least some experience in a profession.", german = "Dein Ziel hat zumindest etwas Erfahrung in einer Fähigkeit. "},
    {value = 0, english = "Target has little to no experience in a profession.", german = "Dein Ziel hat wenig bis keine Erfahrung in einer Fähigkeit."}
   }

local skillNames = gmTool.skillNames

local function getTotalSkillValue(target)
    local skillValue = 0
    for _, skill in pairs(skillNames) do
        skillValue = skillValue + target:getSkill(skill)
    end
    return skillValue
end

function M.skillValueIntoText(information, spell)
    local ORL = runes.checkSpellForRuneByName("ORL", spell)

    if not ORL then
        return information
    end

    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            local skill = getTotalSkillValue(target.target)
            local englishText
            local germanText
            for _, skillText in ipairs(M.skillTexts) do
                if skill  >= skillText.value then
                    germanText = skillText.german
                    englishText = skillText.english
                    break
                end
            end
            target.skill = {}
            target.skill.english = englishText
            target.skill.german = germanText
        end
    end
    return information
end

return M
