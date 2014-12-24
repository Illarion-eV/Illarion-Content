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
--ID 201, Demon Skeleton, Level: 6, Armourtype: medium, Weapontype: slashing
--ID 203, Unholy Akolyth, Level: 7, Armourtype: heavy,  Weapontype: concussion

local demonSkeletons = require("monster.race_20_demon_skeleton.base")
return demonSkeletons.generateCallbacks()