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

-- UPDATE items SET itm_script='item.id_2079_fountain' WHERE itm_id IN (2079);

local common = require("base.common")
local lookat = require("base.lookat")

local M = {}

local lakeOfLifeFountainPos = {
    position(660, 238, -9),
	position(744, 203, -9),
	position(777, 186, -9),
	position(705, 262, -9),
	position(725, 286, -9),
	position(759, 303, -9),
	position(777, 283, -9),
	position(763, 262, -9)
	}

function M.UseItem(User, SourceItem, ltstate)

for i = 1, #lakeOfLifeFountainPos do
        if (SourceItem.pos == lakeOfLifeFountainPos[i]) then
            world:gfx(16, User.pos) -- nice GFX
	        world:makeSound(10, User.pos) -- nice SFX
	        common.InformNLS(User, "Du wäschst dich.", "You start to cleanse.")
			User:setQuestProgress(508,1)
			User:setQuestProgress(509,2) -- timer
        end
    end
end

function M.LookAtItem(User, Item)

  local lookAt = lookat.GenerateLookAt(User, Item)

  for i = 1, #lakeOfLifeFountainPos do
        if (Item.pos == lakeOfLifeFountainPos[i]) then
        lookAt.name = common.GetNLS(User, "Badebrunnen", "Cleansing Fountain")
       end
    return lookAt
    end
end
return M
