require("base.class")

module("handler.sendmessage", package.seeall)

sendMessage = base.class.class(function(sndMsg, posi, msg, rad)
    sndMsg.pos=posi;
    sndMsg.message=msg;
    sndMsg.radius=rad;
end);

function sendMessage:execute()
    plyList=world:getPlayersInRangeOf(self.pos, self.radius);
    debug("      FOUND: "..#plyList)
    for i, player in pairs(plyList) do
    debug("   NOW LOOPING THROUGH THEM: "..i)
    debug("   NAME: "..player.name);
        player:talk(Character.say,"TESTING THIS!")
        player:inform(self.msg)
    end
end
