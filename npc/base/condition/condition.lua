require("base.class")

module("npc.base.condition.condition", package.seeall)

--- Basic class for all conditions. Its never needed to create this class in any
--  NPC since this is just a collection of methods the actual condition classes
--  share.
condition = class(function(self)
end);

function condition:setNPC(npc)
    self["npc"] = npc;
    self["check"] = _condition_helper_empty;
end;

function _condition_helper_empty(self, player)
    -- by default nothing is done
end;