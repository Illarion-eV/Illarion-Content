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
--ID 521, Snapper,     Level: 4, Armourtype: heavy, Weapontype: wrestling
--ID 522, Terrorbeast, Level: 5, Armourtype: light, Weapontype: slashing
--ID 523, Scalebeast,  Level: 5, Armourtype: medium, Weapontype: concussion
--ID 525, Rippertooth, Level: 6, Armourtype: heavy, Weapontype: puncture

local raptors = require("monster.race_52_raptor.base")
return raptors.generateCallbacks()