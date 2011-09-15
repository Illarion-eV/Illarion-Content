-- $Id$
require("base.class")
require("npc.base.consequence.consequence")

module("npc.base.consequence.warp", package.seeall)

inform = base.class.class(npc.base.consequence.consequence.consequence,
function(self, x, y, z)
    npc.base.consequence.consequence.consequence:init(self);
    
    self["x"] = tonumber(x);
    self["y"] = tonumber(y);
    self["z"] = tonumber(z);
    self["perform"] = _warp_helper;
end);

function _warp_helper(self, player)
    player:warp(self.x,self.y,self.z);
end;
