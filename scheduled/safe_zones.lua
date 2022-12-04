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

local common = require("base.common")

local M = {}

M.trollsHaven = {
    {pos = position(682, 303, 0), range = 26},
    {pos = position(651, 322, 0), range = 10},
    {pos = position(712, 303, 0), range = 27},
    {pos = position(678, 324, 0), range = 22}
}

function M.sweepMonsters()
    local monsters = common.getCharactersInRangeOfMultiplePositions("monsters", M.trollsHaven)
    local playersInTrollsHavenSafeZone = common.getCharactersInRangeOfMultiplePositions("players", M.trollsHaven)

    local monstersKilled = 0

    local singularInform = {}

    local pluralInform = {}

    pluralInform.english = "As they spot the incoming threat, a group of Half-Hung Bryans hired guards rush out and swiftly dispose of it."
    pluralInform.german = "Half-Hung Bryans Handlanger machen mit den Angreifern kurzen Prozess."

    if (#monsters > 0) then
        for _, Monster in pairs(monsters) do
            if  Monster:getMonsterType() ~= 1111 then -- Orchard rats are not sweeped.
                singularInform.english = "As they spot the "..Monster.name.." a group of Half-Hung Bryans hired guards rush out and swiftly dispose of it."
                singularInform.german = "Half-Hung Bryans Handlanger machen mit dem Angreifer kurzen Prozess."
                monstersKilled = monstersKilled + 1
                world:gfx(41, Monster.pos)
                Monster:warp(position(1,1,0)) -- Warp it out of sight
                Monster:increaseAttrib("hitpoints", -10000) -- Kill it
            end
        end
    end

    if monstersKilled > 0 then
        for _, player in pairs(playersInTrollsHavenSafeZone) do
            if monstersKilled == 1 then
                player:inform(singularInform.german, singularInform.english)
            else
                player:inform(pluralInform.german, pluralInform.english)
            end
        end
    end


end

return M
