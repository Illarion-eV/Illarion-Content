require("base.class")
require("npc.base.condition.condition")

module("npc.base.condition.basestate", package.seeall)

basestate = base.class.class(npc.base.condition.condition.condition,
function(self, value)
    npc.base.condition.condition.condition:init(self);
    if (value == "busy") then
        self["value"] = npc.base.basic.baseNPC.stateBusyTalking;
    elseif (value == "idle") then
        self["value"] = npc.base.basic.baseNPC.stateNormal;
    else
        self["value"] = -1;
    end;
    self["check"] = _basestate_helper_equal;
end);

function _basestate_helper_equal(self, npcChar, player)
    return (self.npc._parent.state == self.value)
end;
