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
    return (value == player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_notequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (value ~= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_lesserequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (value <= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_greaterequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (value >= player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_lesser(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (value < player:increaseAttrib(self.attrib, 0))
end;

function _attrib_helper_greater(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (value > player:increaseAttrib(self.attrib, 0))
end;
