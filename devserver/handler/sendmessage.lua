require("base.class")
require("base.common")

module("handler.sendmessage", package.seeall)

sendMessage = base.class.class(function(sndMsg, posi, msgde, msgen, rad)
    sndMsg.pos=posi;
    sndMsg.messageDe=msgde;
    sndMsg.messageEn=msgen;
    sndMsg.radius=rad;
end);

function sendMessage:execute()
    plyList=world:getPlayersInRangeOf(self.pos, self.radius);
    for i, player in pairs(plyList) do
        base.common.InformNLS(player,self.messageDe,self.messageEn)
    end
end
