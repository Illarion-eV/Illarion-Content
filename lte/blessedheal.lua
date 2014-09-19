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
local M = {}

function M.addEffect( myEffect, Character )
    world:gfx( 16, Character.pos );   
    world:makeSound( 13, Character.pos );
    Character:increaseAttrib( "hitpoints", 500 * ( Character:increaseAttrib( "intelligence", 0 ) + math.random( -2, 2 ) ) );
    Character:talk( Character.say, "#me is encircled with revitalizing light emitted by the wielded sword." );
end;

function M.callEffect( myEffect, Character )
    item1 = Character:getItemAt( 5 );
    item2 = Character:getItemAt( 6 );
    if ( ( ( item1.id == 2701 ) and ( tonumber(item1:getData("healData")) == 100 ) ) or
         ( ( item2.id == 2701 ) and ( tonumber(item2:getData("healData")) == 100 ) ) ) then
        Character:inform( "Your sword seems to have regained the energy." );
    end;
    return false;
end;

return M

