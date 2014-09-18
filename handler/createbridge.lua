--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local class = require("base.class")

module("handler.createbridge", package.seeall)

createBridge = class.class(function(crebrg, posi, dire, lng)
    crebrg.pos=posi;
    crebrg.direction=dire;
    crebrg.length=lng;
end);

function createBridge:execute()
    if self.length>2 then
        if self.direction==0 then       -- to north
            strBridge=world:createItemFromId(617, 1, self.pos, true, 999, {deleteBridgeDir = "north"});
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x,self.pos.y-t,self.pos.z);
                Bridge=world:createItemFromId(615, 1, actPos, true, 999, {deleteBridgeDir = "north"});
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x,self.pos.y-self.length+1,self.pos.z);
            endBridge=world:createItemFromId(614, 1, endPos, true, 999, {deleteBridgeDir = "north"});
            endBridge.wear=255;
            world:changeItem(endBridge);
        elseif self.direction==1 then   -- to east
            strBridge=world:createItemFromId(621, 1, self.pos, true, 999, {deleteBridgeDir = "east"});
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x+t,self.pos.y,self.pos.z);
                Bridge=world:createItemFromId(619, 1, actPos, true, 999, {deleteBridgeDir = "east"});
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x+self.length-1,self.pos.y,self.pos.z);
            endBridge=world:createItemFromId(618, 1, endPos, true, 999, {deleteBridgeDir = "east"});
            endBridge.wear=255;
            world:changeItem(endBridge);
        elseif self.direction==2 then   -- to south
            strBridge=world:createItemFromId(614, 1, self.pos, true, 999, {deleteBridgeDir = "south"});
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x,self.pos.y+t,self.pos.z);
                Bridge=world:createItemFromId(615, 1, actPos, true, 999, {deleteBridgeDir = "south"});
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x,self.pos.y+self.length-1,self.pos.z);
            endBridge=world:createItemFromId(617, 1, endPos, true, 999, {deleteBridgeDir = "south"});
            endBridge.wear=255;
            world:changeItem(endBridge);
        elseif self.direction==3 then   -- to west
            strBridge=world:createItemFromId(618, 1, self.pos, true, 999, {deleteBridgeDir = "west"});
            strBridge.wear=255;
            world:changeItem(strBridge);
            for t=1,self.length-2 do
                actPos=position(self.pos.x-t,self.pos.y,self.pos.z);
                Bridge=world:createItemFromId(619, 1, actPos, true, 999, {deleteBridgeDir = "west"});
                Bridge.wear=255;
                world:changeItem(Bridge);
            end
            endPos=position(self.pos.x-self.length+1,self.pos.y,self.pos.z);
            endBridge=world:createItemFromId(621, 1, endPos, true, 999, {deleteBridgeDir = "west"});
            endBridge.wear=255;
            world:changeItem(endBridge);
        else
            return -1;
        end
     else
        return -2;
     end
end
