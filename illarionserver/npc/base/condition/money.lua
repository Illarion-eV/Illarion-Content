require("base.class")
require("base.money")
require("npc.base.condition.condition")

module("npc.base.condition.money", package.seeall)

money = base.class.class(npc.base.condition.condition.condition,
function(self, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    if (comp == ">=" or comp == "=>") then
        self["check"] = _money_helper_greaterequal;
    elseif (comp == ">") then
        self["check"] = _money_helper_greater;
    elseif (comp == "<") then
        self["check"] = _money_helper_lesser;
    else
        -- unkonwn comparator
    end;
end);

function _money_helper_greaterequal(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return base.money.CharHasMoney(player, value);
end;

function _money_helper_greater(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return base.money.CharHasMoney(player, value + 1);
end;

function _money_helper_lesser(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    return not base.money.CharHasMoney(player, value);
end;
