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
local class = require("base.class")
local common = require("base.common")
local consequence = require("npc.base.consequence.consequence")

local _spawn_helper

local spawn = class(consequence,
function(self, id, count, radius, x, y, z)
	consequence:init(self)

	self["id"] = tonumber(id)
	self["count"] = tonumber(count)
	self["radius"] = tonumber(radius)
	self["x"] = tonumber(x)
	self["y"] = tonumber(y)
	self["z"] = tonumber(z)
	self["perform"] = _warp_helper
end)

function _spawn_helper(self, npcChar, player)
	for i = 1, self.count do
		local monPos = common.getFreePos(position(self.x, self.y, self.z), self.radius)
		world:createMonster(self.id, monPos, 0)
	end
end

return spawn
