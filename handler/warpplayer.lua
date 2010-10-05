require("base.class")

module("handler.warpplayer", package.seeall)

warpPlayer = base.class.class(function(warppl, startpos,destpos)
    warppl.startpos=startpos;
    warppl.destpos=destpos;
end);

function warpPlayer:execute()   --warps a player from position startpos to the position destpos
    local player = world:getCharacterOnField(self.startpos);
    if player~= nil then
    	world:gfx(46,self.startpos); -- "sun" graphic
    	player:warp(self.destpos);
    end
end