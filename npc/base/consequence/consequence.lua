require("base.class")

module("npc.base.consequence.consequence", package.seeall)

--- Basic class for all consequences. Its never needed to create a instance of
--  this class. Its just a collection of methods the specific consequences
--  share.
consequence = base.class.class(function(self)
    self["perform"] = _consequence_helper_empty;
end);

function consequence:setNPC(npc)
    self["npc"] = npc;
end;

function _consequence_helper_empty(self, npcChar, player)
    -- by default nothing is done
end;
