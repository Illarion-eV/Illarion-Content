require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.inform", package.seeall)

inform = base.class.class(npc.base.consequence.consequence.consequence,
function(self, text)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["text"] = tostring(text);
    self["perform"] = _inform_helper;
end);

function _inform_helper(self, npcChar, player)
    player:inform(self.text);
end;
