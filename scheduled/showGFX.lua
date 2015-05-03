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
local granorsHut = require("content.granorsHut")

local M = {}

-- INSERT INTO scheduledscripts VALUES('scheduled.showGFX', 10, 10, 'CreateGFX');

local function NargunBlinkenlights()
    local lamps = {}
    lamps[1] = position(294, 259, -5)
    lamps[2] = position(291, 259, -5)
    lamps[3] = position(299, 263, -5)
    lamps[4] = position(299, 267, -5)
    lamps[5] = position(293, 264, -5)

    -- if math.random(1, 1) == 1 then
        local lampIdx = math.random(1, #lamps)
        local lamp = world:getItemOnField(lamps[lampIdx])

        if lamp.id == 395 then
            lamp.id = 396
        elseif lamp.id == 396 then
            lamp.id = 395
        end
        world:changeItem(lamp)
    -- end
end

function M.CreateGFX()
    granorsHut.spawnPoisonClouds()

    -- flickering lamps at NArgun altar in Galmair underground
    NargunBlinkenlights()

    world:gfx(1, position(75, 651, 0)) -- thinking stone
	world:gfx(11, position(873, 878, 0)) -- recognizing spring
    world:gfx(7, position(432, 238, 0)) -- knowing tree

	-- Glutinous Seedling
	local myPos = position(math.random(375, 377), math.random(287, 289), 0)
	world:gfx(11, myPos)
    world:makeSound(9, myPos)
	if world:isCharacterOnField(myPos) then
		local myChar = world:getCharacterOnField(myPos)
		if character.IsPlayer(myChar) then
			myChar:talk(Character.say, "#mes Füße werden von einem großen Schleimtropfen, der sich vom schleimigen Setzling gelöst hat, getroffen.","#me's feet are hit by a big drop of slime, which has come off from the glutinous seedling.")
		end
	end
	-- Glutinous Seedling end

	--Lake of Life water drip
	world:gfx(11, position(707, 279, -10)) -- water drip
	world:makeSound(9, position(707, 279, -10)) -- sound effect
	-- Lake of Life water drip end
end

return M
