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
local treasure = require("base.treasure")
local consequence = require("npc.base.consequence.consequence")

module("npc.base.consequence.treasure", package.seeall)

treasure = class.class(consequence.consequence,
function(self, level)
    consequence.consequence:init(self);
    
    self["value"], self["valuetype"] = npc.base.talk._set_value(level);
    self["perform"] = _treasure_helper;
end);

function _treasure_helper(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    treasure.createMap(player, value)
end;
