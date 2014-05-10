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
require("content.gatheringcraft.egggathering")

module("item.nests", package.seeall)

-- UPDATE common SET com_script='item.nests' WHERE com_itemid IN (1171,1172);

function UseItem(User, SourceItem, ltstate)

	content.gatheringcraft.egggathering.StartGathering(User, SourceItem, ltstate);
end
