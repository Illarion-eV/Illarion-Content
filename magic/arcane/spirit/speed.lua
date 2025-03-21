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

M.speedTexts = {
    normal = {english = "Target is not under the effect of any hastening or slowing spells.", german = "Dein Ziel steht nicht unter dem Einfluss von beschleunigenden oder verlangsamenden Zaubern. "},
    high = {english = "Target is under the effect of a hastening spell.", german = "Dein Ziel steht unter dem Einfluss eines beschleunigenden Zaubers."},
    low =  {english = "Target is under the effect of a slowing spell.", german = "Dein Ziel steht unter dem Einfluss einen verlangsamenden Zaubers."}
}

function M.getSpeedText(information, spell)
    local speedTexts = M.speedTexts
    local SUL = runes.checkSpellForRuneByName("SUL", spell)
    if not SUL then
        return information
    end
    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            local germanText
            local englishText
            local speed = target.target.speed
            if speed == 1 then
                germanText = speedTexts.normal.german
                englishText = speedTexts.normal.english
            elseif speed > 1 then
                germanText = speedTexts.high.german
                englishText = speedTexts.high.english
            elseif speed < 1 then
                germanText = speedTexts.low.german
                englishText = speedTexts.low.english
            end
            target.spd = {}
            target.spd.german = germanText
            target.spd.english = englishText
        end
    end
    return information
end

return M

