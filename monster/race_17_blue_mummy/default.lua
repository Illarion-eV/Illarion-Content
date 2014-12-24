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
--ID 171, Mummiefied Priest,        Level: 3, Armourtype: light, Weapontype: slashing
--ID 172, Mummiefied Templeservant, Level: 2, Armourtype: light, Weapontype: slashing
--ID 173, Mummiefied Highpriest,    Level: 4, Armourtype: light, Weapontype: concussion

local blueMummies = require("monster.race_17_blue_mummy.base")
return blueMummies.generateCallbacks()