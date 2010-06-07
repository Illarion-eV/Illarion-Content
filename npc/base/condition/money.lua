require("base.class")
require("base.money")
require("npc.base.condition.condition")

module("npc.base.condition.money", package.seeall)

money = class(npc.base.condition.condition.condition,
function(self, comp, value)
    npc.base.condition.condition.condition:init(self);
    self["value"] = value + 1 - 1;
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

function _money_helper_greaterequal(self, player)
    return base.money.CharHasMoney(player, self.value);
end;

function _money_helper_greater(self, player)
    return base.money.CharHasMoney(player, self.value + 1);
end;

function _money_helper_lesser(self, player)
    return not base.money.CharHasMoney(player, self.value);
end;