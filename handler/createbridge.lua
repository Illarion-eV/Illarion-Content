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
local M = {}


M.createBridge = class(function(crebrg, posi, dire, lng)
    crebrg.pos = posi;
    crebrg.direction = dire;
    crebrg.length = lng;
end);

function M.createBridge:execute()
    if self.length > 2 then
        if self.direction == 0 then       -- to north
            local strBridge = world:getItemOnField(self.pos)
            if strBridge.id ~= 617 then
                strBridge = world:createItemFromId(617, 1, self.pos, true, 999, {deleteBridgeDir = "north"})
                strBridge.wear = 255
                world:changeItem(strBridge)
            end
            for t = 1, self.length - 2 do
                local actPos = position(self.pos.x, self.pos.y - t, self.pos.z)
                local Bridge = world:getItemOnField(actPos)
                if Bridge.id ~= 615 then
                    Bridge = world:createItemFromId(615, 1, actPos, true, 999, {deleteBridgeDir = "north"})
                    Bridge.wear = 255
                    world:changeItem(Bridge)
                end
            end
            local endPos = position(self.pos.x, self.pos.y - self.length + 1, self.pos.z)
            local endBridge = world:getItemOnField(endPos)
            if endBridge.id ~= 614 then
                endBridge = world:createItemFromId(614, 1, endPos, true, 999, {deleteBridgeDir = "north"})
                endBridge.wear = 255
                world:changeItem(endBridge)
            end
        elseif self.direction == 1 then   -- to east
            local strBridge = world:getItemOnField(self.pos)
            if strBridge.id ~= 621 then
                strBridge = world:createItemFromId(621, 1, self.pos, true, 999, {deleteBridgeDir = "east"})
                strBridge.wear = 255
                world:changeItem(strBridge)
            end
            for t = 1, self.length - 2 do
                local actPos = position(self.pos.x + t, self.pos.y, self.pos.z)
                local Bridge = world:getItemOnField(actPos)
                if Bridge.id ~= 619 then
                    Bridge = world:createItemFromId(619, 1, actPos, true, 999, {deleteBridgeDir = "east"})
                    Bridge.wear = 255
                    world:changeItem(Bridge)
                end
            end
            local endPos = position(self.pos.x + self.length - 1, self.pos.y, self.pos.z)
            local endBridge = world:getItemOnField(endPos)
            if endBridge.id ~= 618 then
                endBridge = world:createItemFromId(618, 1, endPos, true, 999, {deleteBridgeDir = "east"})
                endBridge.wear = 255
                world:changeItem(endBridge)
            end
        elseif self.direction == 2 then   -- to south
            local strBridge = world:getItemOnField(self.pos)
            if strBridge.id ~= 614 then
                strBridge = world:createItemFromId(614, 1, self.pos, true, 999, {deleteBridgeDir = "south"})
                strBridge.wear = 255
                world:changeItem(strBridge)
            end
            for t = 1, self.length - 2 do
                local actPos = position(self.pos.x, self.pos.y + t, self.pos.z)
                local Bridge = world:getItemOnField(actPos)
                if Bridge.id ~= 615 then
                    Bridge = world:createItemFromId(615, 1, actPos, true, 999, {deleteBridgeDir = "south"})
                    Bridge.wear = 255
                    world:changeItem(Bridge)
                end
            end
            local endPos = position(self.pos.x, self.pos.y + self.length - 1, self.pos.z)
            local endBridge = world:getItemOnField(endPos)
            if endBridge.id ~= 617 then
                endBridge = world:createItemFromId(617, 1, endPos, true, 999, {deleteBridgeDir = "south"})
                endBridge.wear = 255
                world:changeItem(endBridge)
            end
        elseif self.direction == 3 then   -- to west
            local strBridge = world:getItemOnField(self.pos)
            if strBridge.id ~= 618 then
                strBridge = world:createItemFromId(618, 1, self.pos, true, 999, {deleteBridgeDir = "west"})
                strBridge.wear = 255
                world:changeItem(strBridge)
            end
            for t = 1, self.length - 2 do
                local actPos = position(self.pos.x - t, self.pos.y, self.pos.z)
                local Bridge = world:getItemOnField(actPos)
                if Bridge.id ~= 619 then
                    Bridge = world:createItemFromId(619, 1, actPos, true, 999, {deleteBridgeDir = "west"})
                    Bridge.wear = 255
                    world:changeItem(Bridge)
                end
            end
            local endPos = position(self.pos.x - self.length + 1, self.pos.y, self.pos.z)
            local endBridge = world:getItemOnField(endPos)
            if endBridge.id ~= 621 then
                endBridge = world:createItemFromId(621, 1, endPos, true, 999, {deleteBridgeDir = "west"})
                endBridge.wear = 255
                world:changeItem(endBridge)
            end
        else
            return -1
        end
     else
        return -2
     end
end

return M
