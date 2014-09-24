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
local tools = require("npc.base.tools")

local _attrib_helper_equal
local _attrib_helper_notequal
local _attrib_helper_lesserequal
local _attrib_helper_greaterequal
local _attrib_helper_lesser
local _attrib_helper_greater

local attribute = class(condition,
function(self, name, comp, value)
    condition:init(self)
    self["value"], self["valuetype"] = tools.set_value(value)
    self["attrib"] = name
    if (comp == "=") then
        self["check"] = _attrib_helper_equal
    elseif (comp == "<>" or comp == "!=" or comp == "~=") then
        self["check"] = _attrib_helper_notequal
    elseif (comp == "<=" or comp == "=<") then
        self["check"] = _attrib_helper_lesserequal
    elseif (comp == ">=" or comp == "=>") then
        self["check"] = _attrib_helper_greaterequal
    elseif (comp == ">") then
        self["check"] = _attrib_helper_greater
    elseif (comp == "<") then
        self["check"] = _attrib_helper_lesser
    else
        -- unkonwn comparator
    end
end)

function _attrib_helper_equal(self, npcChar, texttype, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
	
	return (value == player:increaseAttrib(self.attrib, 0))
end

function _attrib_helper_notequal(self, npcChar, texttype, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
	
	return (value ~= player:increaseAttrib(self.attrib, 0))
end

function _attrib_helper_lesserequal(self, npcChar, texttype, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
	
	return (value <= player:increaseAttrib(self.attrib, 0))
end

function _attrib_helper_greaterequal(self, npcChar, texttype, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
	
	return (value >= player:increaseAttrib(self.attrib, 0))
end

function _attrib_helper_lesser(self, npcChar, texttype, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
	
	return (value < player:increaseAttrib(self.attrib, 0))
end

function _attrib_helper_greater(self, npcChar, texttype, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
	
	return (value > player:increaseAttrib(self.attrib, 0))
end

return attribute