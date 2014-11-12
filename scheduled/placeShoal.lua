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
-- INSERT INTO scheduledscripts VALUES('scheduled.placeShoal', 60, 60, 'placeShoal')

local M = {}

shoalPositions = {}

function M.placeShoal()

	if #shoalPositions == 0 then
		return
	end
	for i=#shoalPositions,1,-1 do
		if shoalPositions[i]["counter"] == 0 then
			if not world:isItemOnField(shoalPositions[i]["shoalPosition"]) or world:getItemOnField(shoalPositions[i]["shoalPosition"]).id ~= 1170 then
				local shoal = world:createItemFromId(1170,1,shoalPositions[i]["shoalPosition"],true,333,{amount = 20})
			end
			table.remove(shoalPositions,i)
		else
			shoalPositions[i]["counter"] = shoalPositions[i]["counter"] - 1
		end
	end
end

return M
