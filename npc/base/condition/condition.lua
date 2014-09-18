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

module("npc.base.condition.condition", package.seeall)

--- Basic class for all conditions. Its never needed to create this class in any
--  NPC since this is just a collection of methods the actual condition classes
--  share.
condition = class.class(function(self)
    self["check"] = _condition_helper_empty;
end);

function condition:setNPC(npc)
    self["npc"] = npc;
end;

function _condition_helper_empty(self, npcChar, texttype, player)
    -- by default nothing is done
end;
