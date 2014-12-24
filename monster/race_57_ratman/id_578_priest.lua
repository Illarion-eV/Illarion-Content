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
--ID 578, Ratpriest, Level: 3, Armourtype: light, Weapontype: concussion

local base = require("monster.base.base")
local monstermagic = require("monster.base.monstermagic")
local ratmen = require("monster.race_57_ratman.base")
local M = ratmen.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR,
        hue = {min = 195, max = 205}, -- 200° +- 5° --> blueish
        saturation = {min = 0.58, max = 0.62},
        value = {min = 0.98, max = 1.00}}
end

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addIcestrike{probability = 0.05, damage = {from = 500, to = 750}}
magic.addIceball{  probability = 0.03, damage = {from = 100, to = 300}, targetCount = 5}

return magic.addCallbacks(M)