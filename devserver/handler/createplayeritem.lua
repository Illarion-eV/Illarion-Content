require("base.class")

module("handler.createplayeritem", package.seeall)

createPlayerItem = base.class.class(function(creplitem, ply, ID, qual, amnt)
    creplitem.player=ply;
    creplitem.itemId=ID;
    creplitem.quality=qual;
    creplitem.amount=amnt;
end);

function createPlayerItem:execute()
    person=self.player
    person:createItem(self.itemId, self.amount,self.quality,nil);
end
