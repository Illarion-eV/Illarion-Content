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
-- Location: -29 193 -8
-- Purpose: react on by mirror expandable ladder

local common = require("base.common")

module("triggerfield.aq001_mirror", package.seeall)

function MoveFromField( user )

    if( common.isItemIdInFieldStack( 35, position(-32, 193, -8) ) ) then
	    common.InformNLS(user,"Als du dich entfernst ist die Leiter verschwunden...","As you turn away, the ladder has vanished...");
        common.removeItemIdFromFieldStack( 35, position(-32, 193, -8) );
    end;
    
end


function CharacterOnField( user )

    if( common.isItemIdInFieldStack( 35, position(-32, 193, -8) ) and ( user:getFaceTo() ~= 2 ) ) then
        common.InformNLS(user,"Als du dich wegdrehst ist die Leiter verschwunden...","As you turn away, the ladder has vanished...");
        common.removeItemIdFromFieldStack( 35, position(-32, 193, -8) );
    end;

end
