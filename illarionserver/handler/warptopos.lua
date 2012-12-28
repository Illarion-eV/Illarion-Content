require("base.class")

module("handler.warptopos", package.seeall)

warpToPos = base.class.class(function(warptopos, startpos,destpos)
    warptopos.startpos=startpos;
    warptopos.destpos=destpos;
end);

function warpToPos:execute()   --warps a player from position startpos to the position destpos
    local player = world:getCharacterOnField(self.startpos);
    if player~= nil then
    	world:gfx(46,self.startpos); -- "sun" graphic
    	player:warp(self.destpos);
    end
end
