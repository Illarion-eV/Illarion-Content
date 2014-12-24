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
--ID 611, Stinky Slime,      Level: 3, Armourtype: cloth, Weapontype: wrestling
--ID 612, Slimey Slime,      Level: 3, Armourtype: cloth, Weapontype: wrestling
--ID 613, Smouldy Slime,     Level: 4, Armourtype: cloth, Weapontype: wrestling
--ID 614, Cauterizing Slime, Level: 5, Armourtype: cloth, Weapontype: wrestling
--ID 615, Friendly Slime,    Level: 0, Not hostile

local slimes = require("monster.race_61_slime.base")
return slimes.generateCallbacks()