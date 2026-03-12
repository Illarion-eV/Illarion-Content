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
local telepathy = require("magic.arcane.spirit.telepathy")
local convertInfoToDialogue = require("magic.arcane.spirit.convertInfoToDialogue")
local fakeInfo = require("magic.arcane.spirit.fakeInfo")

local M = {}

local function onlyTelepathyRunes(spell)

    local PEN = runes.checkSpellForRuneByName("PEN", spell)

    if not PEN then
        return false
    end

    local TAH = runes.checkSpellForRuneByName("TAH", spell)
    local KEL = runes.checkSpellForRuneByName("KEL", spell)

    if not (TAH or KEL) then --not a telepathy spell
        return false
    end

    local totalNumberOfRunes = 0

    for _, rune in pairs(runes.runes) do
        if runes.checkSpellForRuneByName(rune.name, spell) then
            totalNumberOfRunes = totalNumberOfRunes + 1
        end
    end

    local numberOfRunes = 1

    local exceptions = {"TAH", "KEL", "DUN", "LEV", "TAUR"}

    for _, exception in pairs(exceptions) do
        if runes.checkSpellForRuneByName(exception, spell) then
            numberOfRunes = numberOfRunes + 1
        end
    end

    if numberOfRunes < totalNumberOfRunes then --Theres more than the telepathy runes in the spell
        return false
    end

    return true
end

function M.invokeSpiritSpells(user, targets, spell)
    local LHOR = runes.checkSpellForRuneByName("LHOR", spell)
    local PEN = runes.checkSpellForRuneByName("PEN", spell)
    local FHAN = runes.checkSpellForRuneByName("FHAN", spell)

    if not PEN then
        return
    end

    telepathy.invoke(user, targets, spell)

    if not onlyTelepathyRunes(spell) then

        if not LHOR then
            convertInfoToDialogue.getDialogue(user, targets, spell)
        end

        if LHOR then
            fakeInfo.fakeDialogue(user, targets, spell)
        elseif FHAN then
            convertInfoToDialogue.getDialogue(false, targets, spell)
        end
    end
end

return M
