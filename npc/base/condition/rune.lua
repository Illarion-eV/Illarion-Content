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
local condition = require("npc.base.condition.condition")

local _rune_helper

local rune = class(condition,
function(self, value)
    condition:init(self)
    
    self["value"] = 2 ^ (value - 1)
    self["check"] = _rune_helper
end)

function _rune_helper(self, npcChar, texttype, player)
    local magicType = player:getMagicType()
    local magicFlags = player:getMagicFlags(magicType)
    return (LuaAnd(magicFlags, self.value) ~= 0)
end

return rune