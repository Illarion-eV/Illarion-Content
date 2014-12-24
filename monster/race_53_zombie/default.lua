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
--ID 531, Walking Dead,   Level: 5, Armourtype: heavy,  Weapontype: puncture
--ID 532, Limping Zombie, Level: 5, Armourtype: midium, Weapontype: concussion
--ID 533, Zombie,         Level: 6, Armourtype: light,  Weapontype: slashing
--ID 534, Zombiegiant,    Level: 7, Armourtype: medium, Weapontype: concussion

local zombies = require("monster.race_53_zombie.base")
return zombies.generateCallbacks()