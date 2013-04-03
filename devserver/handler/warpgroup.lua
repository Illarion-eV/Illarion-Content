require("base.class")
require("base.common")

module("handler.warpgroup", package.seeall)

warpGroup = base.class.class(function(warpgr, centerpos, radius, destpos,gfx)
    warpgr.startpos=centerpos;
    warpgr.destpos=destpos;
    warpgr.range = radius;
    warpgr.gfx = gfx;
end);

function warpGroup:execute()   --warps all players within a range radius from centerpos to destpos
    plyList = base.common.ExtgetPlayersInRangeOf(self.startpos, self.range);

	for i, player in pairs(plyList) do
		local dest = position(	self.destpos.x - (self.startpos.x - player.pos.x) ,
								self.destpos.y - (self.startpos.y - player.pos.y),
								self.destpos.z );
        if self.gfx~=nil then
			world:gfx(self.gfx,player.pos);--	world:gfx(self.gfx,player.pos); -- "sun" graphic
		end
		player:warp( dest );
    end
end
