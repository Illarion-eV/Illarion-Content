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
-- $Id$
local class = require("base.class")
local consequence = require("npc.base.consequence.consequence")

module("npc.base.consequence.warp", package.seeall)

warp = class.class(consequence.consequence,
function(self, x, y, z)
    consequence.consequence:init(self);
    
    self["x"] = tonumber(x);
    self["y"] = tonumber(y);
    self["z"] = tonumber(z);
    self["perform"] = _warp_helper;
end);

function _warp_helper(self, npcChar, player)
    player:warp(position(self.x,self.y,self.z));
end;
