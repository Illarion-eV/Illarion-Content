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
--ID 1, Human,          Level: 5, Armourtype: medium, Weapontype: slashing
--ID 2, Human Warrior,  Level: 6, Armourtype: heavy,  Weapontype: slashing
--ID 5, Human Thief,    Level: 4, Armourtype: light,  Weapontype: puncture
--ID 6, Friendly Human, Level: 0, Not hostile
--ID 9, Cursed Knight

local humans = require("monster.race_0_human.base")
return humans.generateCallbacks()