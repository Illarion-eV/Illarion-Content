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

M.createItem = class(function(creitem, posi, ID, qual, amnt)
    creitem.pos=posi;
    creitem.itemId=ID;
    creitem.quality=qual;
    creitem.amount=amnt;
end);

function M.createItem:execute()
    world:createItemFromId(self.itemId, self.amount, self.pos,true,self.quality,nil);
end

return M