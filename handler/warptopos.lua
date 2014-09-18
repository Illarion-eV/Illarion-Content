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

module("handler.warptopos", package.seeall)

warpToPos = class.class(function(warptopos, startpos,destpos)
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
