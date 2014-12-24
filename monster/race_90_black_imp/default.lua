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
--ID 901, Shadow Wimp,   Level: 4, Armourtype: heavy, Weapontype: distance
--ID 902, Shadow Imp,    Level: 5, Armourtype: light, Weapontype: concussion

local blackImps = require("monster.race_90_black_imp.base")
return blackImps.generateCallbacks()