require("base.class")

module("handler.createitem", package.seeall)

-- Last Updated: April 08 2012
-- By: Faladron
-- Added: permanentwear, if permanentwear ~= nil then a permanent item is created!

createItem = base.class.class(function(creitem, posi, ID, qual, amnt, permanentwear)
    creitem.pos=posi;
    creitem.itemId=ID;
    creitem.quality=qual;
    creitem.amount=amnt;
	
end);

function createItem:execute()
    itemCr = world:createItemFromId(self.itemId, self.amount, self.pos,true,self.quality,0);
	if permanentwear ~= nil then
		if permanentwear == 254 then -- 254 wear = Unrottable but able to be picked up
			itemCr.wear=254;
			world:changeItem(itemCr)
		else
			itemCr.wear=255;         -- 255 wear = Unrottable, can not be picked up
			world:changeItem(itemCr)
		end
	end
end
