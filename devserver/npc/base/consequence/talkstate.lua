-- $Id$
require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.talkstate", package.seeall)

talkstate = base.class.class(npc.base.consequence.consequence.consequence,
function(self, mode)
    npc.base.consequence.consequence.consequence:init(self);
    
    if (mode == "begin") then
        self["perform"] = _talkstate_helper_begin;
    elseif (mode == "end") then
        self["perform"] = _talkstate_helper_end;
    else
        -- invalid mode
    end;
end);

function _talkstate_helper_begin(self, npcChar, player)
    self.npc._parent.state = npc.base.basic.baseNPC.stateBusyTalking;
end;

function _talkstate_helper_end(self, npcChar, player)
    self.npc._parent.state = npc.base.basic.baseNPC.stateNormal;
end;
