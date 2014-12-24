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
--ID 93, Forest Troll Shaman, Level: 5, Armourtype: cloth, Weapontype: concussion (wrestling)

local monstermagic = require("monster.base.monstermagic")
local trolls = require("monster.race_9_foresttroll.base")

local magic = monstermagic()
magic.addWarping{probability = 0.03, usage = magic.ONLY_NEAR_ENEMY}

magic.addFireball{   probability = 0.045, damage = {from = 1000, to = 2000}}
magic.addFlamestrike{probability = 0.005, damage = {from = 1600, to = 3000}}

magic.addFireball{probability = 0.02, damage = {from =  500, to = 1000}, targetCount = 3}
magic.addLighting{probability = 0.01, damage = {from =  400, to =  800}, targetCount = 5}

magic.addHealing{probability = 0.05, damage = {from = 1000, to = 2000}}
magic.addHealing{probability = 0.05, damage = {from =  500, to = 1000}, targetCount = 3}

local M = trolls.generateCallbacks()
return magic.addCallbacks(M)