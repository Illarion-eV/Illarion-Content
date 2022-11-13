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

local M = {}

M.trollsHaven = { posi = position(695, 310, 0), range = 40}

function M.sweepMonsters()
    local Monsters = world:getMonstersInRangeOf(M.trollsHaven.posi, M.trollsHaven.range);

    local monstersKilled = 0

    local singularInform = {}

    local pluralInform = {}

    pluralInform.english = "As they spot the incoming threat, a group of Half-Hung Bryans hired guards rush out and swiftly dispose of it."
    pluralInform.german = "Half-Hung Bryans Handlanger machen mit den Angreiferen kurzen Prozess."

    if (#Monsters > 0) then
        for _, Monster in pairs(Monsters) do
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

    local playersInTrollsHavenSafeZone = world:getPlayersInRangeOf(M.trollsHaven.posi, M.trollsHaven.range)

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
