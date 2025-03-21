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

function M.getIncantationText(user, spell)

    local LHOR = runes.checkSpellForRuneByName("LHOR", spell)
    local JUS = runes.checkSpellForRuneByName("JUS", spell)
    local PEN = runes.checkSpellForRuneByName("PEN", spell)

    if LHOR and JUS then
        return
    end
    local theText = ""

    if runes.checkSpellForRuneByName("BHONA", spell) then
        theText = "BHONA"
    end

    for i = 1, 5 do -- The primary runes are IDd 1-5, BHONA is id 6

        local rune = runes.runeNumberToName(i)

        if runes.checkSpellForRuneByName(rune, spell) then
            if not (PEN and rune == "LHOR") then
                if theText == "" then
                    theText = rune
                else
                    theText = theText.." "..rune
                end
            end
        end
    end

    for i = 7, #runes.runes do --All runes after 6 is a secondary rune

        local rune = runes.runeNumberToName(i)

        if runes.checkSpellForRuneByName(rune, spell) then
            if not(PEN and (rune == "LHOR")) then
                if theText == "" then
                    theText = rune
                else
                    theText = theText.." "..rune
                end
            end
        end
    end

    return theText
end

function M.speakIncantation(user, spell)
local text = M.getIncantationText(user, spell)
    if not text then
        return
    end
    user:talk(Character.say, text)
end

return M
