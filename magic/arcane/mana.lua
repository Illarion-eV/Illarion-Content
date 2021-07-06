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
local magic = require("base.magic")
local M = {}

local function manaCostByRuneSize(size) -- Just basic temporary values until a proper mana script is made that accounts for skill levels and what not.
    if size == "Small" then
        return 100
    elseif size == "Medium" then
        return 200
    elseif size == "Large" then
        return 300
    end
end
function M.arcaneSpellCost(User, spell) -- Should return a total mana cost for a spell by checking every rune present in the spell and returning the additive mana value
local manaCost = 0
    for i = 1,#runes.Runes do
        if runes.checkIfLearnedRune(User, nil, i, nil, nil, spell) then
            manaCost = manaCost+manaCostByRuneSize(runes.Runes[i][3])
        end
    end
return manaCost
end

function M.checkIfEnoughMana(User, spell)
local mana = M.arcaneSpellCost(User, spell)
    if magic.hasSufficientMana(User, mana) then
        return true
    end
return false
end

function M.removedUsedMana(User, spell)
local mana = M.arcaneSpellCost(User, spell)
User:increaseAttrib("mana", -mana)
end
return M
