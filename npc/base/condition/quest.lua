require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.quest", package.seeall)

quest = class(npc.base.condition.condition.condition,
function(self, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"] = value + 1 - 1;
    
    if (comp == "=") then
        self["check"] = _quest_helper_equal;
    elseif (comp == "<>" or comp == "!=" or comp == "~=") then
        self["check"] = _quest_helper_notequal;
    elseif (comp == "<=" or comp == "=<") then
        self["check"] = _quest_helper_lesserequal;
    elseif (comp == ">=" or comp == "=>") then
        self["check"] = _quest_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _quest_helper_greater;
    elseif (comp == "<") then
        self["check"] = _quest_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _quest_helper_equal(self, player)
    if (self.npc._quest <= 0) then
        return false;
    end;
    return player:getQuestProgress(self.npc._quest) == self.value;
end;

function _quest_helper_notequal(self, player)
    if (self.npc._quest <= 0) then
        return false;
    end;
    return player:getQuestProgress(self.npc._quest) ~= self.value;
end;

function _quest_helper_lesserequal(self, player)
    if (self.npc._quest <= 0) then
        return false;
    end;
    return player:getQuestProgress(self.npc._quest) <= self.value;
end;

function _quest_helper_greaterequal(self, player)
    if (self.npc._quest <= 0) then
        return false;
    end;
    return player:getQuestProgress(self.npc._quest) >= self.value;
end;

function _quest_helper_lesser(self, player)
    if (self.npc._quest <= 0) then
        return false;
    end;
    return player:getQuestProgress(self.npc._quest) < self.value;
end;

function _quest_helper_greater(self, player)
    if (self.npc._quest <= 0) then
        return false;
    end;
    return player:getQuestProgress(self.npc._quest) > self.value;
end;