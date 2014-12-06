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
local common = require("base.common")
local character = require("base.character")

local M = {}

-- INSERT INTO scheduledscripts VALUES('scheduled.showGFX', 10, 10, 'CreateGFX');

function M.CreateGFX()
    world:gfx(1, position(75, 651, 0)) -- thinking stone
	world:gfx(11, position(873, 878, 0)) -- recognizing spring
    world:gfx(7, position(432, 238, 0)) -- knowing tree

	-- Glutinous Seedling
	local myPos = position(math.random(375, 377), math.random(287, 289), 0)
	world:gfx(11, myPos)
	if world:isCharacterOnField(myPos) then
		local myChar = world:getCharacterOnField(myPos)
		if character.IsPlayer(myChar) then
			myChar:talk(Character.say, "#mes Füße werden von einem großen Schleimtropfen, der sich vom schleimigen Setzling gelöst hat, getroffen.","#me's feet are hit by a big drop of slime, which has come off from the glutinous seedling.")
		end
	end
	-- Glutinous Seedling end
end

return M