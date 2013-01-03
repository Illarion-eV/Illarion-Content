require("base.class")
require("base.treasure")
require("npc.base.consequence.consequence")

module("npc.base.consequence.treasure", package.seeall)

treasure = base.class.class(npc.base.consequence.consequence.consequence,
function(self, level)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["value"], self["valuetype"] = npc.base.talk._set_value(level);
    self["perform"] = _treasure_helper;
end);

function _treasure_helper(self, npcChar, player)
    local value = npc.base.talk._get_value(self.npc, self.value, self.valuetype);
    base.treasure.createMap(player, value)
end;
