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
--ID 391, Wolf,       Level: 3, Armourtype: light, Weapontype: puncture
--ID 392, Welp,       Level: 2, Armourtype: cloth, Weapontype: wrestling
--ID 393, Young wolf, Level: 2, Armourtype: light, Weapontype: slashing
--ID 394, Giant wolf, Level: 3, Armourtype: light, Weapontype: concussion
--ID 395, Packleader, Level: 4, Armourtype: light, Weapontype: puncture
--ID 396, Peaceful Wolf

local wolves = require("monster.race_39_wolf.base")
local hostileWildlife = require("monster.base.behaviour.hostileWildlife")

local M = wolves.generateCallbacks()
--return hostileWildlife.addCallbacks(M)
return M