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
--ID 871, Crippled Swampbeast, Level: 3, Armourtype: light,  Weapontype: puncture
--ID 872, Swampbeast,          Level: 4, Armourtype: medium, Weapontype: slashing
--ID 873, Giant Swampbeast,    Level: 5, Armourtype: heavy,  Weapontype: concussion

local greenHellhounds = require("monster.race_87_green_hellhound.base")
return greenHellhounds.generateCallbacks()