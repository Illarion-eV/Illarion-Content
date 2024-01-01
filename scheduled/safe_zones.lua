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
local monsterHooks = require("monster.base.hooks")

local M = {}

M.trollsHaven = {
    {pos = position(682, 303, 0), range = 26},
    {pos = position(651, 322, 0), range = 10},
    {pos = position(712, 303, 0), range = 27},
    {pos = position(678, 324, 0), range = 22}
}

local function monsterIsInTrollshaven(monster)

    for _, havenPos in pairs(M.trollsHaven) do
        if common.isInRect(monster.pos, havenPos.pos, havenPos.range) then
            return true
        end
    end

    return false

end

function M.cheatingViaTrollshavenSafeZone(monster, diggingLocation, treasureHunter)

    if monsterHooks.isForcedDeath(monster) and monsterIsInTrollshaven(monster) then --The guardian was force killed by Half-Hung Bryan's crew
        local playersNearTreasure = world:getPlayersInRangeOf(diggingLocation, 12)
        local playersInTrollsHavenSafeZone = common.getCharactersInRangeOfMultiplePositions("players", M.trollsHaven)
        local english = "Having dealt with a guardian of the treasure site on your behalf, Half-Hung Bryan's crew spares no time to retrieve the treasure as payment. It is only fair, right?"
        local german = "Half-Hung Bryans Handlanger machen kurzen Prozess mit dem Wächter des Schatzes und machen sich auf, die Kiste zu plündern. Eine Hand wäscht die andere, nicht wahr?"

        for _, player in pairs(playersNearTreasure) do
            player:inform(german, english)
        end

        for _, player in pairs(playersInTrollsHavenSafeZone) do
            if player.id == treasureHunter.id then
                player:inform(german, english)
            end
        end

        return true -- no loot for cheaters
    end

    return false
end

function M.sweepMonsters()
    local monsters = common.getCharactersInRangeOfMultiplePositions("monsters", M.trollsHaven)
    local playersInTrollsHavenSafeZone = common.getCharactersInRangeOfMultiplePositions("players", M.trollsHaven)

    local monstersKilled = 0

    local singularInform = {}

    local pluralInform = {}

    pluralInform.english = "As they spot the incoming threat, a group of Half-Hung Bryan's hired guards rush out and swiftly dispose of it."
    pluralInform.german = "Half-Hung Bryans Handlanger machen mit den Angreifern kurzen Prozess."

    if (#monsters > 0) then
        for _, Monster in pairs(monsters) do
            if  Monster:getMonsterType() ~= 1111 then -- Orchard rats are not sweeped.
                singularInform.english = "As they spot the "..Monster.name.." a group of Half-Hung Bryan's hired guards rush out and swiftly dispose of it."
                singularInform.german = "Half-Hung Bryans Handlanger machen mit dem Angreifer kurzen Prozess."
                monstersKilled = monstersKilled + 1
                monsterHooks.setForcedDeath(Monster) -- Prevent madness creature respawns
                monsterHooks.setNoDrop(Monster) -- Half Hung Bryan's guards takes the loot
                Monster:increaseAttrib("hitpoints", -10000) -- Kill it
                monsterHooks.cleanHooks(Monster)
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
