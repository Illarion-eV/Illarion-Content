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
local texts = require("magic.arcane.base.texts")

local M = {}

M.staminaTexts = texts.staminaTexts

function M.getStaminaText(information, spell)
    local Kah = runes.checkSpellForRuneByName("Kah", spell)

    if not Kah then
        return information
    end

    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            local food = target.target:increaseAttrib("foodlevel", 0)
            local germanText
            local englishText
            for _, foodText in ipairs(M.staminaTexts) do
                if food >= foodText.food then
                    germanText = foodText.german
                    englishText = foodText.english
                    break
                end
            end
            target.FP = {}
            target.FP.english = englishText
            target.FP.german = germanText
        end
    end
return information
end

return M