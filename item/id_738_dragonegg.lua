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
-- UPDATE items SET itm_script='item.id_738_dragonegg' WHERE itm_id IN (738);

module("item.id_738_dragonegg", package.seeall)


function MoveItemBeforeMove(User, SourceItem, TargetItem)

	if SourceItem:getData("spawnSpiders") == "true" then
		User:inform("Das schleimige Spinnenei rutscht dir aus der Hand.","The slimy spider egg slips from your hands.")
		return false
	end

	return true

end