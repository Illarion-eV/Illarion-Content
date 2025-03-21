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

M.manaTexts = {
    {english = "Target is brimming with mana.", german = "Dein Ziel ist �bervoll mit Mana. ", mana = 10000},
    {english = "Target is nearly satiated with mana.", german = "Dein Ziel ist nahezu voll mit Mana. ", mana = 8000},
    {english = "Target has moderate amount of mana.", german = "Dein Ziel hat eine durchschnittliche Menge an Mana. ", mana = 5000},
    {english = "Target is running low on mana.", german = "Dein Ziel hat nur mehr wenig Mana.", mana = 2000},
    {english = "Target is almost out of mana.", german = "Dein Ziel hat fast kein Mana mehr.", mana = 1},
    {english = "Target only has enough mana to survive.", german = "Dein Ziel hat gerade genug Mana um zu Leben.", mana = 0},
    }

function M.getManaText(information, spell)
    local IRA = runes.checkSpellForRuneByName("IRA", spell)

    if not IRA then
        return information
    end

    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            local mana = target.target:increaseAttrib("mana", 0)
            local englishText
            local germanText
            for _, manaText in ipairs(M.manaTexts) do
                if mana >= manaText.mana then
                    germanText = manaText.german
                    englishText = manaText.english
                    break
                end
            end
            target.MP = {}
            target.MP.english = englishText
            target.MP.german = germanText
        end
    end
return information
end

return M
