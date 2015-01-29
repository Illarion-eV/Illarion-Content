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
-- Mudslide triggerfield in Akaltutschamber

-- INSERT INTO triggerfields VALUES (481,812,-9,'triggerfield.akaltutschamber_mudwarp');
-- INSERT INTO triggerfields VALUES (482,812,-9,'triggerfield.akaltutschamber_mudwarp');

local common = require("base.common")

local M = {}

function M.MoveToField(Character)

    -- mudslide: 481 812 -9  and 482 812 -9

    local destination
    if Character.pos == position(481, 812, -9) or Character.pos == position(482, 812, -9) then --mudslide

        destination = position(484, 821, -9)

        common.HighInformNLS(Character,
            "Du stolperst und fällst von der Brücke und rutscht in den Schlamm.",
            "You stumble, falling down the bridge, sliding and slipping into the mud.")
    end

    --Warping the character
    world:gfx(41, Character.pos)
    world:makeSound(13, Character.pos)
    Character:warp(destination)
    world:makeSound(13, destination)
    world:gfx(41, Character.pos)
end

return M
