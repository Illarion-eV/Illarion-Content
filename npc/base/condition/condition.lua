require("base.class")

module("npc.base.condition.condition", package.seeall)

--- Basic class for all conditions. Its never needed to create this class in any
--  NPC since this is just a collection of methods the actual condition classes
--  share.
condition = base.class.class(function(self)
    self["check"] = _condition_helper_empty;
end);

function _condition_helper_empty(self, npcChar, player)
    -- by default nothing is done
end;
