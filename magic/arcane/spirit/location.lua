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

M.directionsList = {
    {direction = {english = "east", german = "Osten"}},
    {direction = {english = "west", german = "Westen"}},
    {direction = {english = "north", german = "Norden"}},
    {direction = {english = "south", german = "Süden"}},
    {direction = {english = "southeast", german = "Südosten"}},
    {direction = {english = "northeast", german = "Nordosten"}},
    {direction = {english = "southwest", german = "Südwesten"}},
    {direction = {english = "northwest", german = "Nordwesten"}}
    }

M.locationTexts = {
    {english = "Target's position is ", german = "Die Position deines Ziels ist "},
    {english = " steps to the ", german = " Schritte in Richtung "},
    }

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

local function getDistanceBetweenUserAndTarget(user, target)

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
    local X = userX - targetX
    local Y = userY - targetY

        if userX < targetX then
            X = -X
        end

        if userY < targetY then
            Y = -Y
        end

    local retVal = X+Y

    return retVal

end

function M.getLocationText(user, information, spell)

    local locationTexts = M.locationTexts
    local MES = runes.checkSpellForRuneByName("MES", spell)

    if not MES then
        return information
    end

    for _, target in pairs(information) do
        local direction = M.getDirectionRelativeToUser(user, target.target)
        local germanDirection = M.getGermanDirection(direction)
        local distance = getDistanceBetweenUserAndTarget(user, target.target)
        local germanText = locationTexts[1].german..distance..locationTexts[2].german..germanDirection
        local englishText = locationTexts[1].english..distance..locationTexts[2].english..direction
        target.location = {}
        target.location.english = englishText
        target.location.german = germanText
    end
    return information
end

return M
