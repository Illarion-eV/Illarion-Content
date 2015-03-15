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
--ID 511, Grizzly Bear, Level: 5, Armourtype: heavy, Weapontype: concussion
--ID 512, Young Grizzly Bear, Level: 4, Armourtype: heavy, Weapontype: wrestling

local bears = require("monster.race_51_bear.base")
local hostileWildlife = require("monster.base.behaviour.hostileWildlife")

local M = bears.generateCallbacks()
return hostileWildlife.addCallbacks(M)