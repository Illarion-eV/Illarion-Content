require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.quest", package.seeall)

quest = base.class.class(npc.base.consequence.consequence.consequence,
function(self, questid, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    self["questid"] = questid;
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

function _quest_helper_set(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    player:setQuestProgress(self.questid, value);
end;

function _quest_helper_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local currState = player:getQuestProgress(self.questid);
    
    player:setQuestProgress(self.questid, currState + value);
end;

function _quest_helper_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    local currState = player:getQuestProgress(self.questid);
    
    player:setQuestProgress(self.questid, currState - value);
end;
