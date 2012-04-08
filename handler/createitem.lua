require("base.class")

module("handler.createitem", package.seeall)

createItem = base.class.class(function(creitem, posi, ID, qual, amnt, permanentwear)
    creitem.pos=posi;
    creitem.itemId=ID;
    creitem.quality=qual;
    creitem.amount=amnt;
	
end);

function createItem:execute()
    itemCr = world:createItemFromId(self.itemId, self.amount, self.pos,true,self.quality,0);
	if (permanentwear ~= nil) then
	itemCr.wear=255;
    world:changeItem(itemCr)
	end
end
