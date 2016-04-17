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
--ID 1171, Ettin,             Level: 4, Armourtype: medium, Weapontype: puncture
--ID 1172, Deformed Ettin,    Level: 4, Armourtype: light, Weapontype: range
--ID 1173, Sorcerer Ettin,    Level: 5, Armourtype: medium, Weapontype: concussion
--ID 1174, Canibal Ettin,     Level: 5, Armourtype: heavy, Weapontype: slashing
--ID 1175, Evil Crazed Ettin, Level: 6, Armourtype: heavy, Weapontype: concussion

local ettins = require("monster.race_117_ettin.base")
return ettins.generateCallbacks()
