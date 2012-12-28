require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.rune", package.seeall)

rune = base.class.class(npc.base.consequence.consequence.consequence,
function(self, group, id)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["id"] = tonumber(id);
    self["group"] = tonumber(group);
    self["perform"] = _rune_helper;
end);

function _rune_helper(self, npcChar, player)
    player:teachMagic(self.group, self.rune);
end;
