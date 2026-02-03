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

M.statText = {
    {stat = "intelligence", germanStat = "Intelligenz", adjective = {english = "intelligent.", german = "intelligent."}},
    {stat = "strength", germanStat = "Stärke", adjective = {english = "strong.", german = "stark."}},
    {stat = "constitution", germanStat = "Ausdauer", adjective = {english = "sturdy.", german = "ausdauernd."}},
    {stat = "dexterity", germanStat = "Geschicklichkeit", adjective = {english = "dexterous.", german = "geschickt."}},
    {stat = "agility", germanStat = "Schnelligkeit", adjective = {english = "nimble.", german = "flink."}},
    {stat = "willpower", germanStat = "Willenskraft", adjective = {english = "strong-minded.", german = "willensstark."}},
    {stat = "perception", germanStat = "Wahrnehmung", adjective = {english = "perceptive.", german = "aufmerksam."}},
    {stat = "essence", germanStat = "Essenz", adjective = {english = "spiritual.", german = "spirituell."}}
    }

M.statValuesText = {
    {value = 14, english = "The target is very ", german = "Das Ziel ist sehr "},
    {value = 8, english = "The target is somewhat ", german = "Das Ziel ist einigermaßen "},
    {value = 0, english = "The target is not very ", german = "Das Ziel ist nicht sehr "}
    }



function M.getAttributeText(information, spell)
    local QWAN = runes.checkSpellForRuneByName("QWAN", spell)

    if not QWAN then
        return information
    end

    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            for _, attribute in ipairs(M.statText) do
                local stat = target.target:increaseAttrib(attribute.stat, 0)
                for _, value in ipairs(M.statValuesText) do
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
