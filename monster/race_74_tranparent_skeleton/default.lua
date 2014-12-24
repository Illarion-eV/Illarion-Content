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
--ID 741, Phantom Skeleton, Level: 5, Armourtype: heavy,  Weapontype: slashing
--ID 742, Bone Schemes,     Level: 6, Armourtype: medium, Weapontype: conussion
--ID 743, Bone Ghost,       Level: 7, Armourtype: heavy,  Weapontype: puncture
--ID 744, Phantom Archer,   Level: 6, Armourtype: medium, Weapontype: distance

local transparentSkeletons = require("monster.race_74_tranparent_skeleton.base")
return transparentSkeletons.generateCallbacks()