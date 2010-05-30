require("base.class")

module("handler.createbridge", package.seeall)

createBridge = base.class.class(function(crebrg, posi, dire, lng)
    crebrg.pos=posi;
    crebrg.direction=dire;
    crebrg.length=lng;
end);

function createBridge:execute()
    if self.length>2 then
        if self.direction==0 then       -- to north
            strBridge=world:createItemFromId(617, 1, self.pos, true, 999,1);
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x,self.pos.y-t,self.pos.z);
                Bridge=world:createItemFromId(615, 1, actPos, true, 999,1);
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x,self.pos.y-self.length+1,self.pos.z);
            endBridge=world:createItemFromId(614, 1, endPos, true, 999,1);
            endBridge.wear=255;
            world:changeItem(endBridge);
        elseif self.direction==1 then   -- to east
            strBridge=world:createItemFromId(621, 1, self.pos, true, 999,2);
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x+t,self.pos.y,self.pos.z);
                Bridge=world:createItemFromId(619, 1, actPos, true, 999,2);
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x+self.length-1,self.pos.y,self.pos.z);
            endBridge=world:createItemFromId(618, 1, endPos, true, 999,2);
            endBridge.wear=255;
            world:changeItem(endBridge);
        elseif self.direction==2 then   -- to south
            strBridge=world:createItemFromId(614, 1, self.pos, true, 999,3);
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x,self.pos.y+t,self.pos.z);
                Bridge=world:createItemFromId(615, 1, actPos, true, 999,3);
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x,self.pos.y+self.length-1,self.pos.z);
            endBridge=world:createItemFromId(617, 1, endPos, true, 999,3);
            endBridge.wear=255;
            world:changeItem(endBridge);
        elseif self.direction==3 then   -- to west
            strBridge=world:createItemFromId(618, 1, self.pos, true, 999,4);
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x-t,self.pos.y,self.pos.z);
                Bridge=world:createItemFromId(619, 1, actPos, true, 999,4);
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x-self.length+1,self.pos.y,self.pos.z);
            endBridge=world:createItemFromId(621, 1, endPos, true, 999,4);
            endBridge.wear=255;
            world:changeItem(endBridge);
        else
            return -1;
        end
     else
        return -2;
     end
end
