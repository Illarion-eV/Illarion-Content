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
--ID 1031, Bloodslime,              Level: 1, Armourtype: cloth, Weapontype: wrestling
--ID 1032, Wandering Pool of Blood, Level: 2, Armourtype: light, Weapontype: wrestling
--ID 1033, Wandering Demonblood,    Level: 3, Armourtype: light, Weapontype: slashing

local redSlime = require("monster.race_103_red_slime.base")
return redSlime.generateCallbacks()