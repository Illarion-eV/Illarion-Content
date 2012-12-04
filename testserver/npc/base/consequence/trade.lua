require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.trade", package.seeall)

trade = base.class.class(npc.base.consequence.consequence.consequence,
function(self, tradeNPC)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["tradeNPC"] = tradeNPC;
    self["perform"] = _trade_helper;
end);

function _trade_helper(self, npcChar, player)
	if (self["tradeNPC"] == nil) then
		player:inform("This NPC has a bug, no trading items were set. Please inform a developer so he can beat the person responsible.");
		return;
	end;
    self.tradeNPC:showDialog(npcChar, player); 
end;
