require("base.class")
require("npc.base.consequence.consequence")
require("item.gems")

module("npc.base.consequence.gemcraft", package.seeall)

gemcraft = base.class.class(npc.base.consequence.consequence.consequence,
function(self)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["perform"] = _craft_helper;
end);

function _craft_helper(self, npcChar, player)
    item.gems.gemCraft:showDialog(player, npcChar) 
end;
