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
--ID 1051, Ectoplasm,           Level: 1, Armourtype: cloth, Weapontype: wrestling
--ID 1052, Malicious Ectoplasm, Level: 2, Armourtype: cloth, Weapontype: wrestling
--ID 1053, Doomed Ectoplasm,    Level: 3, Armourtype: light, Weapontype: puncture
--ID 1054, Friendly Slime,      Level: 0, Not hostile

local transparentSlime = require("monster.race_105_transparent_slime.base")
return transparentSlime.generateCallbacks()