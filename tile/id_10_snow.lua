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
-- Getting a snowball from a snow tile

-- UPDATE tiles SET til_script='tile.id_10_snow' WHERE til_id = 10;

local M = {}

function M.useTile(User,Position)
    User:talk(Character.say, "#me formt einen Schneeball.", "#me makes a snowball.")
    User:createItem(456,1,333,nil);
end

return M
