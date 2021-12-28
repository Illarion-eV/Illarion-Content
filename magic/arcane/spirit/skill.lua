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
local texts = require("magic.arcane.base.texts")

local M = {}

M.skillTexts = texts.skillTexts

local skillNames = gmTool.skillNames

local function getTotalSkillValue(target)
    local skillValue = 0
    for _, skill in pairs(skillNames) do
        skillValue = skillValue + target:getSkill(skill)
    end
    return skillValue
end

function M.skillValueIntoText(information, spell)
    local Orl = runes.checkSpellForRuneByName("Orl", spell)

    if not Orl then
        return information
    end

    for _, target in pairs(information) do
        local player = target.type == "player"
        if player then
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
