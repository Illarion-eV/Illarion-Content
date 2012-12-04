require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.introduce", package.seeall)

introduce = base.class.class(npc.base.consequence.consequence.consequence,
function(self, text)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["perform"] = _introduce_helper;
end);

function _introduce_helper(self, npcChar, player)
    player:introduce(npcChar);
end;
