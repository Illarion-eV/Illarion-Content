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

local texts = require("magic.arcane.base.texts")
local myTexts = texts.windPuzzle

local M = {}

local locations = {
{origin = position(341, 150, 1), destination = position(318, 150, 1)},
{origin = position(340, 151, 1), destination = position(340, 166, 1)},
{origin = position(338, 152, 1), destination = position(332, 152, 1)},
{origin = position(339, 153, 1), destination = position(340, 152, 1)},
{origin = position(350, 153, 1), destination = position(340, 152, 1)},
{origin = position(340, 156, 1), destination = position(340, 152, 1)},
{origin = position(339, 156, 1), destination = position(340, 152, 1)},
{origin = position(336, 157, 1), destination = position(334, 157, 1)},
{origin = position(336, 158, 1), destination = position(334, 157, 1)},
{origin = position(342, 168, 1), destination = position(342, 151, 1)},
{origin = position(342, 157, 1), destination = position(352, 151, 1)},
{origin = position(340, 165, 1), destination = position(340, 166, 1)},
{origin = position(338, 165, 1), destination = position(338, 166, 1)},
{origin = position(337, 166, 1), destination = position(324, 166, 1)},
{origin = position(37, 168, 1), destination = position(315, 168, 1)},
{origin = position(330, 150, 1), destination = position(318, 150, 1)},
{origin = position(321, 152, 1), destination = position(329, 152, 1)},
{origin = position(319, 152, 1), destination = position(329, 152, 1)},
{origin = position(316, 150, 1), destination = position(318, 150, 1)},
{origin = position(331, 154, 1), destination = position(321, 154, 1)},
{origin = position(330, 154, 1), destination = position(321, 154, 1)},
{origin = position(329, 154, 1), destination = position(321, 154, 1)},
{origin = position(328, 154, 1), destination = position(321, 154, 1)},
{origin = position(327, 155, 1), destination = position(327, 156, 1)},
{origin = position(326, 155, 1), destination = position(326, 156, 1)},
{origin = position(323, 156, 1), destination = position(321, 156, 1)},
{origin = position(319, 161, 1), destination = position(317, 161, 1)},
{origin = position(315, 165, 1), destination = position(315, 155, 1)},
{origin = position(316, 166, 1), destination = position(323, 166, 1)},
{origin = position(315, 167, 1), destination = position(315, 155, 1)},
{origin = position(322, 166, 1), destination = position(323, 166, 1)},
{origin = position(325, 164, 1), destination = position(338, 164, 1)},
{origin = position(328, 162, 1), destination = position(335, 162, 1)},
{origin = position(328, 161, 1), destination = position(335, 161, 1)},
{origin = position(330, 159, 1), destination = position(329, 158, 1)},
{origin = position(330, 158, 1), destination = position(329, 158, 1)},
{origin = position(322, 154, 1), destination = position(320, 154, 1)}
}

function M.MoveToField(user)

    local destination

    for _, location in pairs(locations) do
        if user.pos ==  location.origin then
            destination = location.destination
            break
        end
    end

    world:gfx(7, user.pos)
    world:makeSound(27, user.pos)
    user:inform(myTexts.blasted.german, myTexts.blasted.english)
    user:forceWarp(destination)
    --forceWarp may result in two players on the same tile, but it is either that or the entire puzzle being destroyed by people cheating

end

return M
