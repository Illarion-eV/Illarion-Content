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

-- This function regenerates monsters slowly

function regeneration( Monster )

    if ( Monster:increaseAttrib("hitpoints", 0 ) < 10000 ) and (math.random(1,3)==1) then --Once each 3rd second in average

		con=Monster:increaseAttrib("constitution", 0 );
		healAmount=2*con; --A very strong Monster with 50 CON would regenerate 20% health/minute. A weak monster with 10 CON would regenerate 4% health/minute
		Monster:increaseAttrib("hitpoints", healAmount );

    end

end

-- This function teleports the monster away  few fields

function SuddenWarp(Monster, Enemy, rndTry)
    if rndTry == nil then
        rndTry = 30;
    end

    if (math.random(1, rndTry) == 1) then
        local XOffset = math.random(-5,5);
        local YOffset = math.random(-5,5);
        if (math.sqrt((XOffset*XOffset) + (YOffset*YOffset)) < 2) then
            XOffset = 2;
        end
        world:gfx(41,Monster.pos);
        Monster:warp(position(Enemy.pos.x+XOffset,Enemy.pos.y+YOffset,Enemy.pos.z));
        world:gfx(41,Monster.pos);
        Monster.movepoints = Monster.movepoints - 10;
        return true;
    end
    return false;
end
