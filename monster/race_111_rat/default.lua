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
--ID 1111, Rat,            Level: 1
--ID 1112, Small Rat,      Level: 1
--ID 1113, Aggressive Rat, Level: 2
--ID 1114, Muskrat,        Level: 2
--ID 1115, Plague Rat,     Level: 3
--ID 1116, Sewer Rat,      Level: 3

local rats = require("monster.race_111_rat.base")
return rats.generateCallbacks()