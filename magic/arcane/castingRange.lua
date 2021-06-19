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
local wandList = {
{id = 323, element = "Neutral"},
{id = 2782, element = "Earth"},
{id = 2783, element = "Fire"},
{id = 2784, element = "Water"},
{id = 2785, element = "Air"},
{id = 3608, element = "Spirit"}
}
function M.getWandBonus(User, element)
local wandItem
    if getWand(User) then
        wandItem = getWand(User)
    else
        return 0
    end 
    for _, wand in pairs(wandList) do
        if wand.id == wandItem.id then
            if wand.element == element then
                return 3
            elseif wand.element == "Neutral" then
                return 2
            else
                return 1
            end
        end
    end
end

function M.getCastingRange(User, spell, element)
local baseRange = 5
local wandbonus = M.getWandBonus(User, element)
local range = baseRange+wandbonus
    if runes.checkSpellForRuneByName(User, "Kel", spell) then
        range = range + 3
    end

return range
end

return M