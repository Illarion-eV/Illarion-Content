require("base.class")
require("npc.base.consequence.consequence")
require("development.repair")

module("npc.base.consequence.repair", package.seeall)

repair = base.class.class(npc.base.consequence.consequence.consequence,
function(self)
    npc.base.consequence.consequence.consequence:init(self);
    self["perform"] = _repair_helper;
end);

function _repair_helper(self, npcChar, player)
    development.repair.repairDialog(npcChar, player); 
end;
