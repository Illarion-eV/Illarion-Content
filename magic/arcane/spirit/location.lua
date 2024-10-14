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

local texts = require("magic.base.texts")

local M = {}

M.directionsList = texts.directionsList

M.locationTexts = texts.locationTexts

function M.getDirectionRelativeToUser(user, target)
    local userX = user.pos.x
    local userY = user.pos.y
    local targetX
    local targetY
    if not target.pos then
        targetX = target.x
        targetY = target.y
    else
        targetY = target.pos.y
        targetX = target.pos.x
    end
    local direction
        if userX > targetX then
            direction = "west"
            if userY > targetY then
                direction = "northwest"
            elseif userY < targetY then
                direction = "southwest"
            end
        elseif userX < targetX then
            direction = "east"
            if userY > targetY then
                direction = "northeast"
            elseif userY < targetY then
                direction = "southeast"
            end
        elseif userY > targetY then
            direction = "north"
        else
            direction = "south"
        end
    return direction
end

function M.getGermanDirection(englishDirection)
    for _, direction in pairs(M.directionsList) do
        if englishDirection == direction.direction.english then
            return direction.direction.german
        end
    end
end

return M
