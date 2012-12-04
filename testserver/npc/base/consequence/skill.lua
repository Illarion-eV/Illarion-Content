require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.skill", package.seeall)

skill = base.class.class(npc.base.consequence.consequence.consequence,
function(self, name, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    self["name"] = name;
    if (mode == "=") then
        self["perform"] = _skill_helper_set;
    elseif (mode == "+") then
        self["perform"] = _skill_helper_add;
    elseif (mode == "-") then
        self["perform"] = _skill_helper_sub;
    else
        -- unkonwn comparator
    end;
end);

function _skill_helper_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local currSkill = player:getSkill(self.name);
    local modSkill = value - currSkill;
    player:increaseSkill(self.name, modSkill);
end;

function _skill_helper_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    player:increaseSkill(self.name, value);
end;

function _skill_helper_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    player:increaseSkill(self.name, -value);
end;
