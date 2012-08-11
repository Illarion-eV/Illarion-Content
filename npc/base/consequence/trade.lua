require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.trade", package.seeall)

trade = base.class.class(npc.base.consequence.consequence.consequence,
function(self, tradeNPC)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["tradeNPC"] = tradeNPC;
    self["perform"] = _trade_helper;
end);

function _trade_helper(self, player)
    self.tradeNPC:showDialog(player); 
end;
