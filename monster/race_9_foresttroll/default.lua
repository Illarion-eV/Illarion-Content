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
--ID 91, Forest Troll,          Level: 4, Armourtype: light, Weapontype: concussion
--ID 92, Forest Troll Warrior,  Level: 5, Armourtype: light, Weapontype: concussion
--ID 94, Forest Troll Hunter,   Level: 5, Armourtype: light, Weapontype: distance
--ID 95, Forest Troll Forester, Level: 6, Armourtype: light, Weapontype: distance

local trolls = require("monster.race_9_foresttroll.base")
return trolls.generateCallbacks()