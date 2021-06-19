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

local function castingSpeedByRuneSize(size) -- Just basic temporary values
    if size == "Short" then
        return 1
    elseif size == "Medium" then
        return 2
    elseif size == "Long" then
        return 3
    end
end
function M.arcaneSpellCastSpeed(User,TargetItem, spellnumber) -- Should return total cast time required to cast a spell
local castSpeed = 0
    for i = 1,#runes.Runes do
        if runes.checkIfLearnedRune(User, TargetItem, i, "isSpell", "spell"..spellnumber) then
            castSpeed = castSpeed+castingSpeedByRuneSize(runes.Runes[i][4])
        end
    end
return castSpeed
end


return M
