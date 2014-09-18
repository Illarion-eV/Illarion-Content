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
-- Location: 33 195 -12
-- Purpose: switch for secret passage to well

local common = require("base.common")

module("triggerfield.aq001_wcso", package.seeall)

function MoveToField( user )

    if( world:isCharacterOnField(position( 33, 185, -12)) ) then
        common.removeItemIdFromFieldStack( 287, position( 28, 190, -12) );
    end;

end


function MoveFromField( user )

    if( not common.isItemIdInFieldStack( 287, position( 28, 190, -12) ) ) then
        world:createItemFromId( 287, 1, position( 28, 190, -12 ), true, 333, 0 );
    end;

end
