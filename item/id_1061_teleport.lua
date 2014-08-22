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
-- UPDATE items SET itm_script='item.id_1061_teleport' WHERE itm_id=1061;

require("base.common")

module("item.id_1061_teleport", package.seeall)

function UseItem(User, SourceItem, ltstate)
    if User.pos.z == -40 then
		User:inform("Nichts passiert.", "Nothing happens.")
	end
	
	local destCoordX; local destCoordY; local destCoordZ
	local loc
	local success
	local radius
	local myPortal
	
	destCoordX = SourceItem:getData("destinationCoordsX")
	destCoordY = SourceItem:getData("destinationCoordsY")
	destCoordZ = SourceItem:getData("destinationCoordsZ")
	if (destCoordX ~= "") and (destCoordY ~= "") and (destCoordZ ~= "") then
	    success = false;
		radius = 4;

		for i = 1, 10 do
			loc = position( User.pos.x - radius + math.random( 2*radius ), User.pos.y - radius + math.random( 2*radius ), User.pos.z )

			-- never create it on people
			-- never create it on items
			if not world:isCharacterOnField( loc ) and not world:isItemOnField( loc ) and (world:getField( loc ):tile()~=6) then

				-- create a gate 
				myPortal = world:createItemFromId( 10, 1, loc, true, 933 ,nil);
				myPortal:setData("destinationCoordsX",destCoordX)
				myPortal:setData("destinationCoordsY",destCoordY)
				myPortal:setData("destinationCoordsZ",destCoordZ)
				world:changeItem(myPortal)
				world:makeSound( 4, loc )

				success = true;
				break
			end

		end

		if not success then -- no free space found
			base.common.InformNLS( User,
			"Rings um Dich erzittern Boden und Gegenstände!",
			"All around you ground and items are trembling!" );
		end	
			
        world:erase( SourceItem, 1 );
    else
	   -- no portal book
	end	
end