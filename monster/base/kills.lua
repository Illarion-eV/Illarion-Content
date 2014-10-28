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
local M = {}

lastAttacker={};

function M.setLastAttacker(monster, enemy)
    lastAttacker[monster.id] = enemy;
end;

function M.getLastAttacker(monster)
	return lastAttacker[monster.id];
end;

function M.hasLastAttacker(monster)
	return lastAttacker[monster.id] ~= nil;
end;

function M.isLastAttacker(monster, enemy)
	return lastAttacker[monster.id] == enemy;
end;

return M