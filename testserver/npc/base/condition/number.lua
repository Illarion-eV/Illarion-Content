require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.number", package.seeall)

number = base.class.class(npc.base.condition.condition.condition,
function(self, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    if (comp == "=") then
        self["check"] = _number_helper_equal;
    elseif (comp == "<>" or comp == "!=" or comp == "~=") then
        self["check"] = _number_helper_notequal;
    elseif (comp == "<=" or comp == "=<") then
        self["check"] = _number_helper_lesserequal;
    elseif (comp == ">=" or comp == "=>") then
        self["check"] = _number_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _number_helper_greater;
    elseif (comp == "<") then
        self["check"] = _number_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _number_helper_equal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (self.npc._saidNumber ~= nil and value == self.npc._saidNumber)
end;

function _number_helper_notequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (self.npc._saidNumber ~= nil and value ~= self.npc._saidNumber)
end;

function _number_helper_lesserequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (self.npc._saidNumber ~= nil and value <= self.npc._saidNumber)
end;

function _number_helper_greaterequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (self.npc._saidNumber ~= nil and value >= self.npc._saidNumber)
end;

function _number_helper_lesser(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (self.npc._saidNumber ~= nil and value < self.npc._saidNumber)
end;

function _number_helper_greater(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return (self.npc._saidNumber ~= nil and value > self.npc._saidNumber)
end;
