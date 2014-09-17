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
-- Gras tiles are shown as snow tiles at winter. Copy the function of the snow
-- tiles during this time.

-- UPDATE tiles SET til_script='tile.id_11_gras' WHERE til_id = 11;
local id_10_snow = require("tile.id_10_snow")

module("tile.id_11_gras", package.seeall)

function useTile(User,Position)
	if (world:getTime("month") <= 13) then
		id_10_snow.useTile(User, Position)
		return;
	end;
end
