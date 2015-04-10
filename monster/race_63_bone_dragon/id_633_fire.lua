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
--ID 633, Undead Firedragon, Level: 7, Armourtype: heavy, Weapontype: slashing
local monsterId = 633

local base = require("monster.base.base")
local monstermagic = require("monster.base.monstermagic")
local boneDragons = require("monster.race_63_bone_dragon.base")
local firefield = require("item.id_359_firefield")
local M = boneDragons.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    base.setColor{monster = monster, target = base.SKIN_COLOR, red = 255, green = 100, blue = 120}
end

local magic = monstermagic()
magic.addFirecone{probability = 0.13, damage = {from = 1500, to = 1800}, range = 6,
    itemProbability = 0.055, quality = {from = 2, to = 3}}
magic.addFirecone{probability = 0.009, damage = {from = 1700, to = 2000}, range = 6,
    itemProbability = 0.025, quality = {from = 3, to = 4}}
magic.addFirecone{probability = 0.001, damage = {from = 1900, to = 2300}, range = 6,
    itemProbability = 0.012, quality = {from = 4, to = 5}}

firefield.setFlameImmunity(monsterId)

return magic.addCallbacks(M)