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
--ID 1041, Wandering Garbage, Level: 2, Armourtype: light, Weapontype: concussion
--ID 1042, Wandering Sewage,  Level: 3, Armourtype: light, Weapontype: puncture
--ID 1043, Corpsebile,        Level: 4, Armourtype: light, Weapontype: slashing

local blackSlime = require("monster.race_104_black_slime.base")
return blackSlime.generateCallbacks()