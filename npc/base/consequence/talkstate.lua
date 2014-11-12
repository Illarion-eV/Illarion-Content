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
local baseNPC = require("npc.base.basic")
local consequence = require("npc.base.consequence.consequence")

local _talkstate_helper_begin
local _talkstate_helper_end

local talkstate = class(consequence,
function(self, mode)
    consequence:init(self)
    
    if (mode == "begin") then
        self["perform"] = _talkstate_helper_begin
    elseif (mode == "end") then
        self["perform"] = _talkstate_helper_end
    else
        -- invalid mode
    end
end)

function _talkstate_helper_begin(self, npcChar, player)
    self.npc._parent.state = baseNPC.stateBusyTalking
end

function _talkstate_helper_end(self, npcChar, player)
    self.npc._parent.state = baseNPC.stateNormal
end

return talkstate