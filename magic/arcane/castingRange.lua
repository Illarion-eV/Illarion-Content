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

function M.getCastingRange(user, spell, element)

    local baseRange = 7
    local wandbonus = 0

    if user then
        wandbonus = magic.checkElementBonus(user, element)
    end

    local range = baseRange

    if wandbonus == 0.1 then -- Only elemental wands of the correct element for the spell get a range bonus
        range = range + 1
    end

    if runes.checkSpellForRuneByName("Kel", spell) then
        range = range + 1
    end

    return range
end

function M.isTargetInRange(user, spell, element, target, newTarget, wandAim)

    local range = M.getCastingRange(user, spell, element)
    local pos1 = user.pos
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
            local tileToCheck1 = position(objectPos.x, objectPos.y+2, objectPos.z)
            local tileToCheck2 = position(objectPos.x, objectPos.y-2, objectPos.z)
            local tileToCheck3 = position(objectPos.x+2, objectPos.y, objectPos.z)
            local tileToCheck4 = position(objectPos.x-2, objectPos.y, objectPos.z)
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
