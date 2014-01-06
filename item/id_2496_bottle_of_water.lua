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
-- UPDATE common SET com_script='item.id_2496_bottle_of_water' WHERE com_itemid IN (2496);

require("triggerfield.evilrock");
require("base.common");
module("item.id_2496_bottle_of_water", package.seeall)

function UseItem(User, SourceItem, ltstate)

  local checkBucket = world:getItemOnField(position(997,199,3))
  if checkBucket.id == 51 then

	local foundSource
	-- check for empty bucket
	TargetItem = base.common.GetItemInArea(User.pos, 51);
	if (TargetItem ~= nil) then
		if not base.common.IsLookingAt( User, position(997,199,3) ) then -- check looking direction
			base.common.TurnTo( User, position(997,199,3) ); -- turn if necessary
		end
		foundSource=true
	end


	if not foundSource then
	-- nothing found to fill the bucket.
	base.common.InformNLS(User,"Du solltest schon einen anderen Eimer zum Umfüllen haben.","You should have another container to transfer the water.");
	return
	end

	if ( ltstate == Action.none ) then 
		User:startAction( 20, 21, 5, 10, 25);
		User:talk(Character.say, "#me beginnt den Eimer zu befüllen.", "#me starts to fill bucket.")
		return
	end

		world:swap(checkBucket,52,999)
--[[		local checkFullBucket = world:getItemOnField(position(997,199,3))
		if checkFullBucket.id == 52 then
			checkFullBucket.wear=255
			world:changeItem(checkFullBucket)
		end ]]
		triggerfield.evilrock.RemoveEntranceTrap(User)
	

	local notCreated = User:createItem( 2498, 1, 999, nil ); -- create the new produced items
	if SourceItem.number == 1 then
		world:erase(SourceItem,1)
		return
	end
  end
end

