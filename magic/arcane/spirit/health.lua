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

M.healthTexts = {
    {english = "Target is perfectly healthy.", german = "Dein Ziel ist kerngesund.", health = 10000},
    {english = "Target is slightly wounded.", german = "Dein Ziel ist leicht verletzt.", health = 8000},
    {english = "Target is wounded.", german = "Dein Ziel ist verletzt.", health = 5000},
    {english = "Target is heavily wounded.", german = "Dein Ziel ist schwer verletzt.", health = 2000},
    {english = "Target is near death.", german = "Dein Ziel ist dem Tode nahe.", health = 1},
    {english = "Target is dead.", german = "Dein Ziel ist tot.", health = 0}
    }

function M.getHealthText(information, spell)
    local SIH = runes.checkSpellForRuneByName("SIH", spell)

    if not SIH then
        return information
    end

    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            local health = target.target:increaseAttrib("hitpoints", 0)
            local englishText
            local germanText
            for _, heal in ipairs(M.healthTexts) do
                if health >= heal.health then
                    germanText = heal.german
                    englishText= heal.english
                    break
                end
            end
            target.HP = {}
            target.HP.english = englishText
            target.HP.german = germanText
        end
    end
return information
end



return M
