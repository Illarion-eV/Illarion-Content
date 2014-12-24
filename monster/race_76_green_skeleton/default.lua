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
--ID 761, Armored Swamphorror,  Level: 4, Armourtype: heavy,  Weapontype: distance
--ID 762, Crippled Swamphorror, Level: 2, Armourtype: light,  Weapontype: slashing
--ID 763, Scruffy Swamphorror,  Level: 3, Armourtype: light,  Weapontype: distance
--ID 764, Mystic Swamphorror,   Level: 4, Armourtype: medium, Weapontype: concussion

local greenSkeletons = require("monster.race_76_green_skeleton.base")
return greenSkeletons.generateCallbacks()