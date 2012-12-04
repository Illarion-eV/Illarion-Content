require("base.class")
require("base.common")

module("handler.sendmessagetoplayer", package.seeall)

sendMessageToPlayer = base.class.class(function(sndMsgToPl, ply, msgde, msgen)
    sndMsgToPl.player=ply;
    sndMsgToPl.messageDe=msgde;
    sndMsgToPl.messageEn=msgen;
end);

function sendMessageToPlayer:execute()
    base.common.InformNLS(self.player,self.messageDe,self.messageEn);
end
