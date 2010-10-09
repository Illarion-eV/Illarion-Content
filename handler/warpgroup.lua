require("base.class")
require("base.common")

module("handler.warpgroup", package.seeall)

warpGroup = base.class.class(function(warpgr, centerpos, radius, destpos)
    warpgr.startpos=centerpos;
    warpgr.destpos=destpos;
    warpgr.range = radius;
end);

function warpGroup:execute()   --warps all players within a range radius from centerpos to destpos
    local plylist = base.common.ExtgetPlayersInRangeOf(self.startpos, self.range);

	for i, player in pairs(plyList) do
		local dest = position(	self.destpos.x - (self.startpos.x - player.pos.x) ,
								self.destpos.y - (self.startpos.y - player.pos.y),
								self.destpos.z );
        world:gfx(46,dest); -- "sun" graphic
		player:warp( dest );
    end
end