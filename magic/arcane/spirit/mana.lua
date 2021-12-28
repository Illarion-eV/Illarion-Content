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

M.manaTexts = texts.manaTexts

function M.getManaText(information, spell)
    local Ira = runes.checkSpellForRuneByName("Ira", spell)

    if not Ira then
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
