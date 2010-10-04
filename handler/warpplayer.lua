require("base.class")

module("handler.warpplayer", package.seeall)

createEffect = base.class.class(function(warpplayer, startpos,destpos)
    warpplayer.startpos=startpos;
    warpplayer.destpos=destpos;
end);

function createEffect:execute()   --warps a player from position startpos to the position destpos
    local player = world:getCharacterOnField(self.startpos);
    if player~= nil then
    	player:warp(self.destpos);
    end
end