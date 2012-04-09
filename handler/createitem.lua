require("base.class")

module("handler.createitem", package.seeall)



createItem = base.class.class(function(creitem, posi, ID, qual, amnt)
    creitem.pos=posi;
    creitem.itemId=ID;
    creitem.quality=qual;
    creitem.amount=amnt;
end);

function createItem:execute()
    world:createItemFromId(self.itemId, self.amount, self.pos,true,self.quality,0);
end
