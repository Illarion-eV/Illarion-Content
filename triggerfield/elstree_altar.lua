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

-- INSERT INTO triggerfields VALUES (773,444,0,'triggerfield.elstree_altar');
-- INSERT INTO triggerfields VALUES (773,445,0,'triggerfield.elstree_altar');

local common = require("base.common")
local M = {}


function M.MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end

	queststatus = char:getQuestProgress(500);

	if (queststatus == 30) then
		char:setQuestProgress(500, 31);
		common.InformNLS(char,
		"Als du vor den Altar trittst, hörst du ein Lachen und aus dem Spiegel des Chaos wirft jemand eine Torte nach dir.",
		"Stepping into the Altar you hear laughter and a pie is thrown at you from the Mirror of Chaos");

		world:createItemFromId(353, 1, char.pos, true, 333, nil);
	end

end


return M

