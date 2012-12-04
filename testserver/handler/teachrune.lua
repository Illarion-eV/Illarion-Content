require("base.class")

module("handler.teachrune", package.seeall)

teachRune = base.class.class(function(tchrune, ply, mtype, rID)
    tchrune.player=ply;
    tchrune.magictype=mtype;
    tchrune.runeID=rID;
end);

function teachRune:execute()
  (self.player):teachMagic(self.magictype,2^(self.runeID));
end
