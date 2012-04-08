require("base.class")

module("handler.createitem", package.seeall)

createItem = base.class.class(function(creitem, posi, ID, qual, amnt, wear)
    creitem.pos=posi;
    creitem.itemId=ID;
    creitem.quality=qual;
    creitem.amount=amnt;
	creitem.wear=wear;
end);

function createItem:execute()
    itemCr = world:createItemFromId(self.itemId, self.amount, self.pos,true,self.quality,0);
	if (wear ~= nil) then
	itemCr.wear=255;
    world:changeItem(itemCr)
	end
end
