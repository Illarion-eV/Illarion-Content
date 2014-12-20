--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
--ID 110, Dead King, Level: 7, Armourtype: medium, Weapontype: slashing

local monstermagic = require("monster.base.monstermagic")
local mummies = require("monster.race_10_mummy.base")
local M = mummies.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    monster:setSkinColor(255, 255, 120)
end

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addSummon{probability = 0.03, monsters = {103, 593, 822}} -- summon mummy, skeleton and scarab

magic.addVioletFlame{probability = 0.02, damage = {from = 1500, to = 2500}}

return magic.addCallbacks(M)