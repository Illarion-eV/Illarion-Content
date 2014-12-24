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
--ID 782, Golden Legionnaire, Level: 5, Armourtype: medium, Weapontype: concussion
--ID 784, Golden Archer, Level: 5, Armourtype: heavy, Weapontype: distance

local goldenSkeletons = require("monster.race_78_golden_skeleton.base")
return goldenSkeletons.generateCallbacks()