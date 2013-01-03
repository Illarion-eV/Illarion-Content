require("base.class")
require("base.money")
require("npc.base.consequence.consequence")

module("npc.base.consequence.money", package.seeall)

money = base.class.class(npc.base.consequence.consequence.consequence,
function(self, mode, value)
    npc.base.consequence.consequence.consequence:init(self);
    self["value"], self["valuetype"] = npc.base.talk._set_value(value);
    if (mode == "+") then
        self["perform"] = _money_helper_add;
    elseif (mode == "-") then
        self["perform"] = _money_helper_sub;
    else
        -- unkonwn comparator
    end;
end);

function _money_helper_add(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    base.money.GiveMoneyToChar(player, value);
end;

function _money_helper_sub(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    base.money.TakeMoneyFromChar(player, value);
end;
