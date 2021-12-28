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
local texts = require("magic.arcane.base.texts")

local M = {}

M.MRtexts = texts.MRtexts

function M.getMRText(information, spell)
local MRtexts = M.MRtexts
    local Pherc = runes.checkSpellForRuneByName("Pherc", spell)
    if not Pherc then
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
                if MR < 0.33 then
                    germanText = MRtexts.low.german
                    englishText = MRtexts.low.english
                elseif MR < 0.66 then
                    germanText = MRtexts.average.german
                    englishText = MRtexts.average.english
                elseif MR > 0.66 then
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
