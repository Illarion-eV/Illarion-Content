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
local treasure = require("base.treasure")
local common = require("base.common")

local M = {}

-- INSERT INTO scheduledscripts VALUES('scheduled.treasure', 4, 4, 'treasureCheck');



function M.treasureCheck()
    local treasurePositions = treasure.treasurePositions;
	local treasureCategory = treasure.treasureCategory
    
	for i=1,#treasurePositions do
	    local thePos = treasurePositions[i]
		if treasure.CheckMonsters( thePos ) then
			world:gfx(16,thePos);
			world:makeSound(13,thePos);
			--world:createItemFromId(2830,1,thePos,true,333,{trsCat=tostring(treasureCategory[thePos])});
			treasure.SpawnTreasure(treasureCategory[thePos], thePos)
		end
	end

end

return M
