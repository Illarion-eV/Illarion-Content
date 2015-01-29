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

-- INSERT INTO triggerfields VALUES (641, 266, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (640, 266, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (639, 245, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (731, 325, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (767, 305, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (666, 235, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (770, 293, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (769, 300, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (782, 293, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (779, 293, -9,'triggerfield.lakeoflife_triggers');
-- INSERT INTO triggerfields VALUES (786, 294, -9,'triggerfield.lakeoflife_triggers');

--Triggerfield events in the Lake of Life dungeon

local common = require("base.common")

local M = {}

function M.MoveToField( User )

	if User:getType() ~= Character.player then
		return
	end

    if Random.uniform(1, 4) == 1 then
	    if User.pos == position(641, 266, -9) then -- inform
	        common.InformNLS(User,"Wenn Du den Eisfluß umgangen hast kannst Du eine Stelle in der Eismauer ausmachen welche weggeschlagen wurde.","As you round the iceflow, you can see a section of ice wall has been chisled away.")
        elseif User.pos == position(640, 266, -9) then -- inform
	        common.InformNLS(User,"Ein unheimliches Glühen scheint aus dem Eisboden und den Eiswänden hervorzukommen.","An eerie glow seems to come up through the ice floor and emanate out the ice walls.")
        elseif User.pos == position(639, 245, -9) then -- inform
	        common.InformNLS(User,"Ein lautes Zerreißen ist aus einiger Entfernung zu hören, gefolgt von Knacken und Krachen.","A loud cracking can be heard in the distance, followed by some crashing and splashing.")
		    world:makeSound(5, User.pos)
            world:makeSound(9, User.pos)
	    elseif User.pos == position(731, 325, -9) then -- Knock out warp.
		    common.InformNLS(User,"Du rutscht ab und fällst ins Wasser. Du wirst weit vom Dock wieder an Land gespühlt.","You slip and fall into the water, washing ashore far from the dock.")
		    world:gfx(11, User.pos)
	        world:makeSound(9, User.pos)
            User:warp(position(767, 305, -9))
            world:gfx(11, User.pos)
            world:makeSound(9, User.pos)
        elseif User.pos == position(666, 235, -9) then -- inform
	        common.InformNLS(User,"In der Nähe hörst Du etwas laut etwas unter Wasser rutschen.","You hear something loud slip under the water nearby.")
		    world:makeSound(5, User.pos)
        elseif Character.pos == position(770, 293, -9) or Character.pos == position(769, 300, -9) then -- Ice Entrapment #1
            common.InformNLS(User,"Du hörst etwas laut unter deinem Fuß knacken. Eine Falle löst aus und Du bist plötzlich im Eis verschüttet. Bist Du klug genug um einen Weg heraus zu finden?","You hear something loud click under your foot. A trap springs and you are suddenly entombed in ice. Are you clever enough to find your way out?")		
            world:gfx(41, User.pos)
	        world:makeSound(5, User.pos)
            User:warp(position(770, 295, -9))
            world:gfx(41, User.pos)
            world:makeSound(13, User.pos)
		elseif Character.pos == position(782, 293, -9) or Character.pos == position(779, 293, -9) or Character.pos == position(786, 294, -9) then -- Ice Entrapment #2
            common.InformNLS(User,"Du hörst etwas laut unter deinem Fuß knacken. Eine Falle löst aus und Du bist plötzlich im Eis verschüttet. Bist Du klug genug um einen Weg heraus zu finden?","You hear something loud click under your foot. A trap springs and you are suddenly entombed in ice. Are you clever enough to find your way out?")		
            world:gfx(41, User.pos)
	        world:makeSound(5, User.pos)
            User:warp(position(784, 291, -9))
            world:gfx(41, User.pos)
            world:makeSound(13, User.pos)
        end
	end

end

return M
