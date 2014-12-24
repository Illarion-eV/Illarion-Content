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
--ID 540, Undead Warlock, Level: 5, Armourtype: light, Weapontype: concussion

local base = require("monster.base.base")
local monstermagic = require("monster.base.monstermagic")
local zombies = require("monster.race_53_zombie.base")
local M = zombies.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 255, green = 140, blue = 190}
end

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addSummon{probability = 0.0249, monsters = {611, 1031}} -- slimes and red slimes
magic.addSummon{probability = 0.0050, monsters = {614, 1033}} -- more slimes, same color but stronger
magic.addSummon{probability = 0.0001, monsters = {540}} -- rare summon. Another warlock. Twice the fun.

magic.addVioletFlame{probability = 0.02, damage = {from = 800, to = 1600}}

return magic.addCallbacks(M)