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
--INSERT INTO triggerfields VALUES (891, 770, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 770, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 770, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 770, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (891, 771, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 771, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 771, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 771, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 772, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 772, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 772, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (887, 772, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (885, 775, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (885, 776, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (885, 777, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (886, 773, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (886, 774, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (886, 775, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (886, 776, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (886, 777, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (886, 778, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (887, 773, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (887, 774, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (887, 775, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (887, 776, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (887, 777, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (887, 778, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 773, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 774, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 775, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 776, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 777, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (888, 778, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 773, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 774, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 775, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 776, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 777, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (889, 778, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 773, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 774, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 775, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 776, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 777, 0,'triggerfield.oldSlimeFeeding');
--INSERT INTO triggerfields VALUES (890, 778, 0,'triggerfield.oldSlimeFeeding');

local oldSlimeFeeding = require("content.oldSlimeFeeding")

local M = {}

function M.PutItemOnField(item, user)
    oldSlimeFeeding.refuseItem(item)
end

function M.MoveToField(user)
    oldSlimeFeeding.warpCharacterAway(user)
end

return M