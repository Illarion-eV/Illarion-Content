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
--ID 221, Gynkese Widow,         Level: 6, Armourtype: light, Weapontype: puncture
--ID 222, Juvenile Gynk Spider,  Level: 4, Armourtype: heavy, Weapontype: concussion
--ID 223, Giant Enforcer Spider, Level: 8, Armourtype: heavy, Weapontype: concussion

local greenSpiders = require("monster.race_22_green_spider.base")
return greenSpiders.generateCallbacks()