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
--ID 41, Orc,          Level: 5, Armourtype: medium, Weapontype: concussion
--ID 42, Orc Warrior,  Level: 6, Armourtype: heavy,  Weapontype: slashing
--ID 43, Orc Thief,    Level: 4, Armourtype: light,  Weapontype: puncture
--ID 44, Orc Hunter,   Level: 5, Armourtype: light,  Weapontype: distance
--ID 46, Friendly Orc, Level: 0, Not hostile

local orcs = require("monster.race_4_orc.base")
return orcs.generateCallbacks()