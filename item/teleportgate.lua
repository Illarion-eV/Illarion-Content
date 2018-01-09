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

local common = require("base.common")

local M = {}

function M.CharacterOnField( user )

    if (user:getType() ~= 0) then -- only players, else end of script
        return
    end

    local sourceItem = world:getItemOnField( user.pos );
    local destCoordX, destCoordY, destCoordZ
    local dest
    local destFound = false

    destCoordX = sourceItem:getData("destinationCoordsX")
    destCoordY = sourceItem:getData("destinationCoordsY")
    destCoordZ = sourceItem:getData("destinationCoordsZ")
    if (destCoordX ~= "") and (destCoordY ~= "") and (destCoordZ ~= "") then
        destCoordX = tonumber(destCoordX)
        destCoordY = tonumber(destCoordY)
         destCoordZ = tonumber(destCoordZ)
        dest = position(destCoordX,destCoordY,destCoordZ)
        destFound = true
    end
    
    if destFound then -- destination was defined
    
        world:makeSound( 13, dest )
        world:gfx( 41, user.pos )
        user:warp( dest );
        world:gfx( 41, user.pos )

        common.InformNLS( user,
        "Du machst eine magische Reise.",
        "You travel by the realm of magic." );

        if ( sourceItem.wear ~= 255 ) then
            local numberOfTraveller = sourceItem:getData("traveller")
            numberOfTraveller = tonumber(numberOfTraveller)
            if common.IsNilOrEmpty(numberOfTraveller) then
                numberOfTraveller = 8
            end
            if ( numberOfTraveller > 1 ) then
                    numberOfTraveller = numberOfTraveller - 1
                    sourceItem:setData("traveller", numberOfTraveller)
                    world:changeItem( sourceItem )
            else
                world:erase( sourceItem, sourceItem.number )
            end
        end
    end
end

return M

