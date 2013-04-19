require("base.class")

module("handler.warpplayer", package.seeall)

warpPlayer = base.class.class(function(warppl, ply,destpos)
    warppl.player=ply;
    warppl.destpos=destpos;
end);

function warpPlayer:execute()   --warps a player to the position destpos
    (self.player):warp(self.destpos);
end
