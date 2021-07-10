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
local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
    if Lhor and JUS then
        return
    end
local theText = ""
    for i = 1, #runes.Runes do
        local rune = runes.Runes[i][2]
        if runes.checkSpellForRuneByName(rune, spell) then
            if theText == "" then
                theText = rune
            else
                theText = theText.." "..rune
            end
            if i == #runes.Runes then
                theText = theText.."."
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
