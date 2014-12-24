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
--ID 31, Elf,           Level: 5, Armourtype: light, Weapontype: distance
--ID 32, Elven Warrior, Level: 6, Armourtype: light, Weapontype: slashing
--ID 35, Elven Hunter,  Level: 5, Armourtype: light, Weapontype: distance
--ID 36, Friendly Elf,  Level: 0, Not hostile

local elves = require("monster.race_3_elf.base")
return elves.generateCallbacks()