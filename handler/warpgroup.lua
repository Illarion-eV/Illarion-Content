--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local class = require("base.class")
local common = require("base.common")

module("handler.warpgroup", package.seeall)

warpGroup = class.class(function(warpgr, centerpos, radius, destpos,gfx)
    warpgr.startpos=centerpos;
    warpgr.destpos=destpos;
    warpgr.range = radius;
    warpgr.gfx = gfx;
end);

function warpGroup:execute()   --warps all players within a range radius from centerpos to destpos
    plyList = common.ExtgetPlayersInRangeOf(self.startpos, self.range);

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
