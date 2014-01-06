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
require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.attribute", package.seeall)

attribute = base.class.class(npc.base.condition.condition.condition,
function(self, name, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    self["attrib"] = name;
    if (comp == "=") then
        self["check"] = _attrib_helper_equal;
    elseif (comp == "<>" or comp == "!=" or comp == "~=") then
        self["check"] = _attrib_helper_notequal;
    elseif (comp == "<=" or comp == "=<") then
        self["check"] = _attrib_helper_lesserequal;
    elseif (comp == ">=" or comp == "=>") then
        self["check"] = _attrib_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _attrib_helper_greater;
    elseif (comp == "<") then
        self["check"] = _attrib_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _attrib_helper_equal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value == (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value == player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_notequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value ~= (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value ~= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_lesserequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value <= (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value <= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_greaterequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value >= (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
		
    return (value >= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_lesser(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value < (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
		
    return (value < player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_greater(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
	
	--Check for mage attributs in sum
	if self["attrib"] == "mage" then
		return (value > (player:increaseAttrib("willpower", 0) + player:increaseAttrib("essence", 0) + player:increaseAttrib("intelligence", 0)))
	end
	
    return (value > player:increaseAttrib(self.attrib, 0))
end;
