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
--ID 635, Undead Swampdragon, Level: 7, Armourtype: medium, Weapontype: distance

local monstermagic = require("monster.base.monstermagic")
local boneDragons = require("monster.race_63_bone_dragon.base")
local M = boneDragons.generateCallbacks()

local orgOnSpawn = M.onSpawn
function M.onSpawn(monster)
    if orgOnSpawn ~= nil then
        orgOnSpawn(monster)
    end

    monster:setSkinColor(20, 255, 50)
end

local magic = monstermagic()
magic.addPoisoncone{probability = 0.02, damage = {from = 1500, to = 3000}, range = 6,
    itemProbability = 0.2, quality = {from = 2, to = 5}}

return magic.addCallbacks(M)