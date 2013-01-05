require("base.class")
require("base.factions")
require("npc.base.condition.condition")

module("npc.base.condition.rank", package.seeall)

rank = base.class.class(npc.base.condition.condition.condition,
function(self, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    if (comp == ">=" or comp == "=>") then
        self["check"] = _rank_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _rank_helper_greater;
    elseif (comp == "<") then
        self["check"] = _rank_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _rank_helper_greaterequal(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return base.factions.getRankAsNumber(player) >= value;
end;

function _rank_helper_greater(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return base.factions.getRankAsNumber(player) > value;
end;

function _rank_helper_lesser(self, npcChar, texttype, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return base.factions.getRankAsNumber(player) < value;
end;
