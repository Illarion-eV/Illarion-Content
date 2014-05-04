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

module("monster.base.monstermagic", package.seeall)

--This function regenerates monsters slowly

function regeneration( Monster )

    if ( Monster:increaseAttrib("hitpoints", 0 ) < 10000 ) and (math.random(1,3)==1) then --Once each 3rd second in average
    
		con=Monster:increaseAttrib("constitution", 0 );
		healAmount=2*con; --A very strong Monster with 50 CON would regenerate 20% health/minute. A weak monster with 10 CON would regenerate 4% health/minute
		Monster:increaseAttrib("hitpoints", healAmount );
    
	end
	
end