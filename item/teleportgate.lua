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
-- UPDATE items SET itm_script='item.teleportgate' WHERE itm_id IN (10,792,794,795)

require("base.common")

module("item.teleportgate", package.seeall)

function CharacterOnField( User )

	if (User:getType() ~= 0) then -- only players, else end of script
        return
    end

    local SourceItem = world:getItemOnField( User.pos );
	local destCoordX, destCoordY, destCoordZ
	local dest
	local destFound = false

    destCoordX = SourceItem:getData("destinationCoordsX")
	destCoordY = SourceItem:getData("destinationCoordsY")
	destCoordZ = SourceItem:getData("destinationCoordsZ")
	if (destCoordX ~= "") and (destCoordY ~= "") and (destCoordZ ~= "") then
	    destCoordX = tonumber(destCoordX)
	    destCoordY = tonumber(destCoordY)
 	    destCoordZ = tonumber(destCoordZ)
		dest = position(destCoordX,destCoordY,destCoordZ)
        destFound = true
	end

	if destFound then -- destination was defined
		world:makeSound( 13, dest )
		world:gfx( 41, User.pos )
		User:warp( dest );
		world:gfx( 41, User.pos )

		base.common.InformNLS( User,
		"Du machst eine magische Reise.",
		"You travel by the realm of magic." );

		if ( SourceItem.wear ~= 255 ) then
			if ( SourceItem.quality > 200 ) then
					SourceItem.quality = SourceItem.quality - 100;
					world:changeItem( SourceItem );
			else
				world:erase( SourceItem, SourceItem.number );
			end
		end
	end
end
