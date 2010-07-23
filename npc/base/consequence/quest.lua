require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.quest", package.seeall)

quest = base.class.class(npc.base.consequence.consequence.consequence,
function(self, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    self["name"] = name;
    if (mode == "=") then
        self["perform"] = _quest_helper_set;
    elseif (mode == "+") then
        self["perform"] = _quest_helper_add;
    elseif (mode == "-") then
        self["perform"] = _quest_helper_sub;
    else
        -- unkonwn comparator
    end;
end);

function _quest_helper_set(self, player)
    if (self.npc._quest <= 0) then
        return false;
    end;
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    player:setQuestProgress(self.npc._quest, value);
end;

function _quest_helper_add(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local currState = player:getQuestProgress(self.npc._quest);
    
    player:setQuestProgress(self.npc._quest, currState + value);
end;

function _quest_helper_sub(self, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local currState = player:getQuestProgress(self.npc._quest);
    
    player:setQuestProgress(self.npc._quest, currState - value);
end;