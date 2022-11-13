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
local consequence = require("npc.base.consequence.consequence")
local npc_base_attribtrainer = require("npc.base.attribute_trainer")

local _attribtrainer_helper

local attribtrainer = class(consequence,
function(self)
    consequence:init(self)
    self["perform"] = _attribtrainer_helper
end)

function _attribtrainer_helper(self, npcChar, player)
    npc_base_attribtrainer.train(player)
end

return attribtrainer
