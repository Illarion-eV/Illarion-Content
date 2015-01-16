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
--ID 795, Firespitter, Level: 6, Armourtype: medium, Weapontype: distance
local monsterId = 795

local base = require("monster.base.base")
local monstermagic = require("monster.base.monstermagic")
local trolls = require("monster.race_79_trolls.base")
local firefield = require("item.id_359_firefield")
local M = trolls.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 255, green = 100, blue = 100}
end

local magic = monstermagic()
magic.addFirecone{probability = 0.005, damage = {from = 700, to = 1000}, range = 4, angularAperture = 60,
    itemProbability = 0.08, quality = {from = 2, to = 3}}
    
firefield.setFlameImmunity(monsterId)

return magic.addCallbacks(M)