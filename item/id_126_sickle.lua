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
-- harvesting herbs and field crops

-- UPDATE items SET itm_script='item.id_126_sickle' WHERE itm_id=126;

require("base.common")
require("content.gatheringcraft.farming")
require("content.gatheringcraft.herbgathering")
require("item.general.metal")

module("item.id_126_sickle", package.seeall)

LookAtItem = item.general.metal.LookAtItem

function UseItem(User, SourceItem, ltstate)

	local plant;

	-- field grops (and seeds)
	plant = content.gatheringcraft.farming.getFarmingItem(User);
	if plant ~= nil then
		content.gatheringcraft.farming.StartGathering(User, plant, ltstate);
		return;
	end

	-- handle herbs which are harvestable first
	plant = content.gatheringcraft.herbgathering.getHerbItem(User, true);
	if plant ~= nil then
		content.gatheringcraft.herbgathering.StartGathering(User, plant, ltstate);
		return;
	end

	-- try herbs which wont give a harvest as well
	plant = content.gatheringcraft.herbgathering.getHerbItem(User, false);
	if plant ~= nil then
		content.gatheringcraft.herbgathering.StartGathering(User, plant, ltstate);
		return;
	end

	base.common.HighInformNLS( User,
	"Hier ist nichts, wofür du die Sichel benutzen kannst.",
	"There is nothing for which you can use the sickle." );

end
