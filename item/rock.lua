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
require("base.common")
require("base.lookat")
require("alchemy.base.teacher")
require("content.gatheringcraft.mining")

module("item.rock", package.seeall)

-- UPDATE common SET com_script='item.rock' WHERE com_itemid IN (1246,1245,232,914,1273,1276,1250);

function UseItem(User, SourceItem, ltstate)
    -- alchemy stuff
	if SourceItem.pos == position(75,651,0) or SourceItem.pos == position(873,878,0) then
		alchemy.base.teacher.UseItem(User, SourceItem, ltstate)
		return
	end
	-- alchemy end

	local areaId = content.gatheringcraft.mining.GetAreaId(User.pos);
	if (areaId == nil) then
		base.common.HighInformNLS(User,
		"Die Gegend sieht nicht so aus, als könnte man hier etwas finden.",
		"The area doesn't look like a good place to mine.");
		return;
	end

	if (content.gatheringcraft.mining.isMinableRock(areaId, SourceItem) == false) then
		base.common.HighInformNLS(User,
		"Du musst neben einem Felsen stehen um Bergbau zu betreiben.",
		"You have to stand next to a rock to mine.");
		return
	end
	content.gatheringcraft.mining.StartGathering(User, SourceItem, ltstate);

end

function LookAtItem(User,Item)
    -- alchemy stuff
	if Item.pos == position(75,651,0) or Item.pos == position(873,878,0) then
		alchemy.base.teacher.LookAtItem(User, Item)
		return
	end
	-- alchemy end

	-- tbd: custom loockat for minable rocks
    local lookAt = base.lookat.GenerateLookAt(User, Item)
	world:itemInform(User, Item, lookAt)

end
