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
local magicResistance = require("magic.arcane.magicResistance")

local M = {}

M.MRtexts = {
    low = {english = "The target has low magic resistance.", german = "Dein Ziel hat eine geringe Magieresistenz."},
    average = {english = "The target has average magic resistance.", german = "Dein Ziel hat eine durchschnittliche Magieresistenz."},
    high = {english = "The target has high magic resistance.", german = "Dein Ziel hat eine hohe Magieresistenz."}
    }

function M.getMRText(information, spell)
local MRtexts = M.MRtexts
    local PHERC = runes.checkSpellForRuneByName("PHERC", spell)
    if not PHERC then
        return information
    end
    for _, target in pairs(information) do
        local player = target.type == "player"
        local creature = target.type == "creature"
        if player or creature then
            local MR = magicResistance.getMagicResistance(target.target, spell)
            local germanText
            local englishText
            if MR then
                if MR < 33 then
                    germanText = MRtexts.low.german
                    englishText = MRtexts.low.english
                elseif MR < 66 then
                    germanText = MRtexts.average.german
                    englishText = MRtexts.average.english
                elseif MR >= 66 then
                    germanText = MRtexts.high.german
                    englishText = MRtexts.high.english
                end
                target.MR = {}
                target.MR.german = germanText
                target.MR.english = englishText
            end
        end
    end
return information
end

return M
