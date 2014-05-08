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

-- UPDATE common SET com_script='item.harvest' WHERE com_itemid IN (14,300,387, 1195, 1809);

require("base.common")
require("content.gatheringcraft.fruitgathering")

module("item.harvest", package.seeall)

function UseItem(User, SourceItem, ltstate)

	content.gatheringcraft.fruitgathering.StartGathering(User, SourceItem, ltstate);

end
