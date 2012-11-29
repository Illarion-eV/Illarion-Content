require("base.class")
require("npc.base.consequence.consequence")
require("item.gems")

module("npc.base.consequence.gemcraft", package.seeall)

craft = base.class.class(npc.base.consequence.consequence.consequence,
function(self)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["perform"] = _craft_helper;
end);

function _craft_helper(self, npcChar, player)
	if (self["craftNPC"] == nil) then
		player:inform("This gem crafting NPC has a bug. Please inform a developer so he can beat the person responsible.");
		return;
	end;
    item.gems.gemCraft:showDialog(player, npcChar) 
end;
