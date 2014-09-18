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

module("handler.sendmessage", package.seeall)

sendMessage = class.class(function(sndMsg, posi, msgde, msgen, rad)
    sndMsg.pos=posi;
    sndMsg.messageDe=msgde;
    sndMsg.messageEn=msgen;
    sndMsg.radius=rad;
end);

function sendMessage:execute()
    plyList=world:getPlayersInRangeOf(self.pos, self.radius);
    for i, player in pairs(plyList) do
        common.InformNLS(player,self.messageDe,self.messageEn)
    end
end
