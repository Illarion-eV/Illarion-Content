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
--ID 21, Halfling,         Level: 3, Armourtype: cloth, Weapontype: slashing
--ID 22, Halfling Warrior, Level: 4, Armourtype: light, Weapontype: slashing
--ID 23, Halfling Thief,   Level: 4, Armourtype: light, Weapontype: puncture
--ID 24, Halfling Peasant, Level: 3, Armourtype: cloth, Weapontype: slashing
--ID 25, Halfling Hunter,  Level: 4, Armourtype: light, Weapontype: distance
--ID 26, Friendly Halfling,  Level: 0, Not hostile

local halflings = require("monster.race_2_halfling.base")
return halflings.generateCallbacks()