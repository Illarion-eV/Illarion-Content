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
local doors = require("base.doors")

local M = {}

-- A door is locked if its quality is 333 and unlocked if it is 233. Data has to be ~=0.
-- it makes sound 19 (world:makeSound(19, Door.pos);) when the door locks.
-- A key with the same data than a door lock/unlocks it (not important here).

M.openDoor = class(function(door, posi)
    door.pos=posi;
end);

function M.openDoor:execute()
    --[[lst=world:getPlayersOnline();
    for i,ply in pairs(lst) do
        if ply.id==42 then
            char=ply;
        end
    end
    char:inform("in exe");--]]
    if (world:isItemOnField(self.pos)==true) then
        local item = world:getItemOnField(self.pos)
        doors.OpenDoor(item);
    else
        return -1;
    end
end

return M
