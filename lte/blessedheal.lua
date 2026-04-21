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
local character = require("base.character")
function M.addEffect( myEffect, Target )
    world:gfx( 16, Character.pos )
    world:makeSound( 13, Character.pos )
    character.ChangeHP(Target, 500 * ( Target:increaseAttrib( "intelligence", 0 ) + math.random( -2, 2 ) ) )
    Target:talk( Target.say, "#me is encircled with revitalizing light emitted by the wielded sword." )
end

function M.callEffect( myEffect, Target )
    local item1 = Target:getItemAt( 5 )
    local item2 = Target:getItemAt( 6 )
    if ( ( ( item1.id == 2701 ) and ( tonumber(item1:getData("healData")) == 100 ) ) or
         ( ( item2.id == 2701 ) and ( tonumber(item2:getData("healData")) == 100 ) ) ) then
        Target:inform( "Your sword seems to have regained the energy." )
    end
    return false
end

return M

