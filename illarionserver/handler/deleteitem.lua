require("base.class")

module("handler.deleteitem", package.seeall)

deleteItem = base.class.class(function(delitem, posi, delID)
    delitem.pos=posi;
    delitem.deleteItemId=delID;
end);

function deleteItem:execute()
    if (world:isItemOnField(self.pos)==true) then
        item=world:getItemOnField(self.pos);
        if (item.id==self.deleteItemId or self.deleteItemId==0) then
            world:erase(item,1);
            return 1;
        else
            return -2;
        end
    else
        return -1;
    end
end
