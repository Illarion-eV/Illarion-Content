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

module("triggerfield.salavesh_firetrap", package.seeall)

--This script shoots a fireball down the hall in the "Errant Crusade" quest map
--Can be used with various triggerfields, players shall "abuse" this to fight the monsters down there

function MoveToField(User)

	if User:getType() ~= Character.player then
		return
	end

		base.common.InformNLS(User,"Ein Feuerball schießt aus einem kleinen Loch in der Wand die Halle entlang!","A firewall is shot from a small hole in the wall down the hallway!"); --sending a message

		xcord=User.pos.x; --The x-coordinate of the triggerfield

		for i=399,415 do --replace with proper coordinates

		    if world:isCharacterOnField(position(xcord,i,-3)) then --there is someone!

		        target=world:getCharacterOnField(position(xcord,i,-3)); --and who is it?

                if (target:increaseAttrib("hitpoints",0)>0) then --ghosts do not get hit

				    world:gfx(9,position(xcord,i,-3)); --Fireball!
				    world:makeSound(5,position(xcord,i,-3)); --BOOM!
			        target:increaseAttrib("hitpoints",math.random(-1000,-500)); --damaging the target
                    return; --got one, bailing out.

				else --it's a ghost

				world:gfx(10,position(xcord,i,-3)); --Smokecloud!

				end

			else --there is no one

				world:gfx(10,position(xcord,i,-3)); --Smokecloud!

			end

		end --next tile

	    --No one got hit! Fireball hits the other wall. VERY unlikely.
	    world:gfx(9,position(xcord,415,-3)); --Fireball!
	    world:makeSound(5,position(xcord,415,-3)); --BOOM!

end

