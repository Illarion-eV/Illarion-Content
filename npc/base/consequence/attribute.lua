require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.attribute", package.seeall)

attribute = base.class.class(npc.base.consequence.consequence.consequence,
function(self, name, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    self["name"] = name;
    if (mode == "=") then
        self["perform"] = _attribute_helper_set;
    elseif (mode == "+") then
        self["perform"] = _attribute_helper_add;
    elseif (mode == "-") then
        self["perform"] = _attribute_helper_sub;
    else
        -- unkonwn comparator
    end;
end);

function _attribute_helper_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local currAttrib = player:increaseAttrib(self.name, 0);
    local modAttrib = value - currAttrib;
    player:increaseAttrib(self.name, modAttrib);
end;

function _attribute_helper_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    player:increaseAttrib(self.name, value);
end;

function _attribute_helper_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    player:increaseAttrib(self.name, -value);
end;
