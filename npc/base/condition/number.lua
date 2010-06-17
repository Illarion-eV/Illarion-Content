require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.number", package.seeall)

number = class(npc.base.condition.condition.condition,
function(self, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"] = value + 1 - 1;
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

function _number_helper_equal(self, _)
    return (self.npc._saidNumber ~= nil and self.value == self.npc._saidNumber)
end;

function _number_helper_notequal(self, _)
    return (self.npc._saidNumber ~= nil and self.value ~= self.npc._saidNumber)
end;

function _number_helper_lesserequal(self, _)
    return (self.npc._saidNumber ~= nil and self.value <= self.npc._saidNumber)
end;

function _number_helper_greaterequal(self, _)
    return (self.npc._saidNumber ~= nil and self.value >= self.npc._saidNumber)
end;

function _number_helper_lesser(self, _)
    return (self.npc._saidNumber ~= nil and self.value < self.npc._saidNumber)
end;

function _number_helper_greater(self, _)
    return (self.npc._saidNumber ~= nil and self.value > self.npc._saidNumber)
end;