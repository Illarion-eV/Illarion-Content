require("base.class")

module("handler.createplayeritem", package.seeall)

createItem = base.class.class(function(creplitem, ply, ID, qual, dta, amnt)
    creplitem.player=ply;
    creplitem.itemId=ID;
    creplitem.quality=qual;
    creplitem.data=dta;
    creplitem.amount=amnt;
end);

function createItem:execute()
    person=self.player
    person:createItem(self.itemId, self.amount,self.quality,self.data);
end
