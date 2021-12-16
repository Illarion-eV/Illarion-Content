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

function M.checkForObstacles(user, spell, element, pos)
local startingpos = user.pos
local Fhan = runes.checkSpellForRuneByName("Fhan", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local obstacleBypass = Fhan and not PEN and not JUS
local blockList = world:LoS(startingpos, pos)
local next = next
    if (next(blockList)~=nil) then
        if not obstacleBypass then
            return true
        else
            local listIndex = next(blockList)
            local object = blockList[listIndex].OBJECT
            local objectPos = object.pos
            local objectX = objectPos.x
            local objectY = objectPos.y
            local objectZ = objectPos.z
            local tileToCheck1 = position(objectX, objectY+2, objectZ)
            local tileToCheck2 = position(objectX, objectY-2, objectZ)
            local tileToCheck3 = position(objectX+2, objectY, objectZ)
            local tileToCheck4 = position(objectX-2, objectY, objectZ)
            local newBlockList = {}
            newBlockList[1] = world:LoS(objectPos, tileToCheck1)
            newBlockList[2] = world:LoS(objectPos, tileToCheck2)
            newBlockList[3] = world:LoS(objectPos, tileToCheck3)
            newBlockList[4] = world:LoS(objectPos, tileToCheck4)
            local count = 0
            for i = 1, #newBlockList do
                if next(newBlockList[i]) then
                    if newBlockList[i][next(newBlockList[i])].TYPE == "ITEM" then
                        count = count+1
                    end
                end
            end
            if count >= 2 then -- if more than two solid objects are found directly adjacent to the first, obstacle will not be ignored to prevent shooting through walls
                return true
            end
        end
    end

return false
end

return M
