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
-- medicine (since illness will be a postVBU project, this will also be postVBU)
local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")

local M = {}

-- UPDATE common SET com_script='alchemy.item.id_167_yellow_bottle' WHERE com_itemid = 167;

local function DrinkPotion(User,SourceItem)
    User:inform("Der Trank scheint keine Wirkung zu haben.","The potion seems to have no effect.")
end

function M.UseItem(User, SourceItem, ltstate)
    -- repair potion in case it's broken
	alchemy.repairPotion(SourceItem)
	-- repair end
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.FillIntoCauldron(User,SourceItem,cauldron,ltstate)
	
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			User:talk(Character.say, "#me trinkt eine gelbe Flüssigkeit.", "#me drinks a yellow liquid.")
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
			alchemy.EmptyBottle(User,SourceItem)
	    end
	end
end
return M

