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

-- About the Weakened Lich.
-- Appears from a pile of bones dropped by a normal lich. That lich hasnt droped anything except this bones.
-- You get the loot for the normal lich if you kill that weakened lich. Therefore, this loot is more expensive than
-- a monster of this category would normally drop.

local skeletons = require("monster.race_11_skeleton.base")
return skeletons.generateCallbacks()