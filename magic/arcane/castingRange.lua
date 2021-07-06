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
local function getWand(User)
local left = User:getItemAt(5)
local right = User:getItemAt(6)
    for _, wand in pairs(wandList) do
        if left.id == wand.id then
            return left
        elseif right.id == wand.id then
            return right
        end
    end
return false
end

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
                return 2
            elseif wand.element == "Neutral" then
                return 0
            else
                return 1
            end
        end
    end
end

function M.getCastingRange(User, spell, element)
local baseRange = 4
local wandbonus = M.getWandBonus(User, element)
local range = baseRange+wandbonus
    if runes.checkSpellForRuneByName("Kel", spell) then
        range = range + 2
    end

return range
end

function M.isTargetInRange(User, spell, element, target, newTarget, wandAim)
local range = M.getCastingRange(User, spell, element)
local pos1 = User.pos
local pos2 = target
    if target.pos then
        pos2 = target.pos
    end
    if runes.checkSpellForRuneByName("Fhen", spell) then
        if wandAim then
            pos1 = target.pos
        else
            pos1 = target
        end
        if newTarget then
            pos2 = newTarget.pos
        end
    end

local xdif = pos1.x - pos2.x
local ydif = pos1.y - pos2.y

    if xdif > range or xdif < -range or ydif > range or ydif < -range or pos1.z ~= pos2.z then
        return false
    end
return true

end

function M.checkForObstacles(User, spell, element, target, newTarget, wandAim)
local targetpos = target
local startingpos = User.pos
    if target.pos then
        targetpos = target.pos
    end
    if runes.checkSpellForRuneByName("Fhen", spell) then
        if wandAim then
            startingpos = target.pos
        else
            startingpos = target
        end
        if newTarget then
            startingpos = newTarget.pos
        end
    end
    if runes.checkSpellForRuneByName("Fhan", spell) and not runes.checkSpellForRuneByName("PEN", spell) and not runes.checkSpellForRuneByName("JUS", spell) then
        return false
    else
        local blockList = world:LoS(startingpos, targetpos)
        local next = next
        if (next(blockList)~=nil) then
            return true , M.getCastingRange(User, spell, element)
        end
    end
return false
end

return M
