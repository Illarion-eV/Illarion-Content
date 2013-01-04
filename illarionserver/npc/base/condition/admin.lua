require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.admin", package.seeall)

admin = base.class.class(npc.base.condition.condition.condition,
function(self)
    npc.base.condition.condition.condition:init(self);
    self["check"] = _admin_helper_equal;
end);

function _admin_helper_equal(self, npcChar, texttype, player)
    return player:isAdmin();
end;
