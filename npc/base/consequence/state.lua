-- $Id$
require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.state", package.seeall)

state = base.class.class(npc.base.consequence.consequence.consequence,
function(self, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    if (mode == "=") then
        self["perform"] = _state_helper_set;
    elseif (mode == "+") then
        self["perform"] = _state_helper_add;
    elseif (mode == "-") then
        self["perform"] = _state_helper_sub;
    else
        -- unkonwn comparator
    end;
end);

function _state_helper_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    self.npc._state = value;
end;

function _state_helper_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    self.npc._state = self.npc._state + value;
end;

function _state_helper_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    self.npc._state = self.npc._state - value;
end;
