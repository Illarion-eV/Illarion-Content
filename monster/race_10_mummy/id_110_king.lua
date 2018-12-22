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

local base = require("monster.base.base")
local mageBehaviour = require("monster.base.behaviour.mage")
local monstermagic = require("monster.base.monstermagic")
local mummies = require("monster.race_10_mummy.base")

local M = mummies.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 255, green = 255, blue = 120}
end

local magic = monstermagic()
magic.addWarping{probability = 0.05, usage = magic.ONLY_NEAR_ENEMY}

magic.addSummon{probability = 0.045, monsters = {103, 593, 172, 102}} -- summon mummy and scarab
magic.addSummon{probability = 0.008, monsters = {108, 109,}} -- palace guard and forgotten mummy
magic.addSummon{probability = 0.0001, monsters = {110}} -- clone spell

M = magic.addCallbacks(M)
return mageBehaviour.addCallbacks(magic, M)