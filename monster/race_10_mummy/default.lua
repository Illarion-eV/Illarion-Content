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
--ID 101, Mummy,            Level: 2, Armourtype: -, Weapontype: slashing
--ID 102, Enbalmed Slave,   Level: 3, Armourtype: -, Weapontype: concussion
--ID 103, Enbalmed Servant, Level: 2, Armourtype: -, Weapontype: concussion
--ID 104, Poisonous Mummy,  Level: 2, Armourtype: -, Weapontype: puncture

local mummies = require("monster.race_10_mummy.base")
return mummies.generateCallbacks()