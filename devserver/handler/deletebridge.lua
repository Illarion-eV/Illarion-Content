require("base.class")

module("handler.deletebridge", package.seeall);

deleteBridge = base.class.class(function(delbrg, posi)
    delbrg.pos=posi;
end);

function deleteBridge:execute()
    if (world:isItemOnField(self.pos)==true) then
        item=world:getItemOnField(self.pos);
        if(item.id==618 or item.id==621 or item.id==614 or item.id==617) then
            t=0;
            if item:getData("deleteBridgeDir") == "north" then
                keepGoing=1;
                while keepGoing==1 do
                    delPos=position(self.pos.x,self.pos.y-t,self.pos.z)
                    if (world:isItemOnField(delPos)==true) then
                        item=world:getItemOnField(delPos);
                        if (item:getData("deleteBridgeDir") == "north" and (item.id==617 or item.id==615 or item.id==614)) then
                            world:erase(item,1);
                            t=t+1;
                        else
                            keepGoing=0;
                        end
                    else
                        keepGoing=0;
                    end
                end
            elseif item:getData("deleteBridgeDir") == "east" then
                keepGoing=1;
                while keepGoing==1 do
                    delPos=position(self.pos.x+t,self.pos.y,self.pos.z)
                    if (world:isItemOnField(delPos)==true) then
                        item=world:getItemOnField(delPos);
                        if (item:getData("deleteBridgeDir") == "east" and (item.id==621 or item.id==619 or item.id==618)) then
                            world:erase(item,1);
                            t=t+1;
                        else
                            keepGoing=0;
                        end
                    else
                        keepGoing=0;
                    end
                end
            elseif item:getData("deleteBridgeDir") == "south" then
                keepGoing=1;
                while keepGoing==1 do
                    delPos=position(self.pos.x,self.pos.y+t,self.pos.z)
                    if (world:isItemOnField(delPos)==true) then
                        item=world:getItemOnField(delPos);
                        if (item:getData("deleteBridgeDir") == "south" and (item.id==617 or item.id==615 or item.id==614)) then
                            world:erase(item,1);
                            t=t+1;
                        else
                            keepGoing=0;
                        end
                    else
                        keepGoing=0;
                    end
                end
            elseif item:getData("deleteBridgeDir") == "west" then
                keepGoing=1;
                while keepGoing==1 do
                    delPos=position(self.pos.x-t,self.pos.y,self.pos.z)
                    if (world:isItemOnField(delPos)==true) then
                        item=world:getItemOnField(delPos);
                        if (item:getData("deleteBridgeDir") == "west" and (item.id==621 or item.id==619 or item.id==618)) then
                            world:erase(item,1);
                            t=t+1;
                        else
                            keepGoing=0;
                        end
                    else
                        keepGoing=0;
                    end
                end
            end
        end
    end
end
