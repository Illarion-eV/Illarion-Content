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
--ID 121, Gazer,         Level: 6, Armourtype: medium, Weapontype: wrestling
--ID 122, Googly,        Level: 6, Armourtype: light,  Weapontype: puncture
--ID 123, Eye of Horror, Level: 7, Armourtype: heavy,  Weapontype: wrestling
--ID 125, Terror Eye,    Level: 8, Armourtype: heavy,  Weapontype: dagger

local beholders = require("monster.race_12_beholder.base")
return beholders.generateCallbacks()