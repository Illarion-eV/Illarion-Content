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



function M.getAttributeText(information, spell)
    local Qwan = runes.checkSpellForRuneByName("Qwan", spell)

    if not Qwan then
        return information
    end

    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            for _, attribute in ipairs(texts.statText) do
                local stat = target.target:increaseAttrib(attribute.stat, 0)
                for _, value in ipairs(texts.statValuesText) do
                    if stat >= value.value then
                        local germanText = value.german..attribute.adjective.german
                        local englishText = value.english..attribute.adjective.english
                        target[attribute.stat] = {}
                        target[attribute.stat].german = germanText
                        target[attribute.stat].english = englishText
                        break
                    end
                end
            end
        end
    end
return information
end

return M
