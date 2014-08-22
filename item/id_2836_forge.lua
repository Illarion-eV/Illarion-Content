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

-- UPDATE items SET itm_script='item.id_2836_forge' WHERE itm_id IN (2834,2835,2836,2837);
-- UPDATE items SET com_objectafterrot=2836 WHERE itm_id = 2835;
-- UPDATE items SET com_objectafterrot=2837 WHERE itm_id = 2834;

require("base.licence")
require("content.gatheringcraft.oremelting")

module("item.id_2836_forge", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end

	content.gatheringcraft.oremelting.StartGathering(User, SourceItem, ltstate);
end
