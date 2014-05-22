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
require("base.character")

module("scheduled.showGFX", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.showGFX', 10, 10, 'CreateGFX');


-- this script is used to show a ceratin graphic effect on a certain position every ten seconds

SlimeList = {}
SlimeList.Slime1 = {}
SlimeList.Slime2 = {}


function CreateGFX()
    world:gfx(1,position(75,651,0)) -- thinking stone
	world:gfx(11,position(873,878,0)) -- recognizing spring
    world:gfx(7,position(432,238,0)) -- knowing tree

	-- Glutinous Seedling
	local myPos = position(376+math.random(-1,1), 288+math.random(-1,1), 0)
	world:gfx(11,myPos)
	if world:isCharacterOnField(myPos) then
		local myChar = world:getCharacterOnField(myPos)
		if base.character.IsPlayer(myChar) then
			myChar:talk(Character.say, "#mes Füße werden von einem großen Schleimtropfen, der sich vom schleimigen Setzling gelöst hat, getroffen.","#me's feet are hit by a big drop of slime, which has come off from the glutinous seedling.")
		end
	else
        SpawnSlime(myPos)
	end
	-- Glutinous Seedling end
end

function SpawnSlime(thePos)

	if checkSlime(SlimeList.Slime1) then
		CreateSlime(SlimeList.Slime1,thePos,1)
		return;
	end
	if checkSlime(SlimeList.Slime2) then
		CreateSlime(SlimeList.Slime2,thePos,2)
		return;
	end

end

function CreateSlime(ListSlime,thePos,slimeNumber)
	local mon = world:createMonster(615,thePos,-10)
    ListSlime.Monster = true
	base.character.DeathAfterTime(mon,18000,11,9,false)
	find, Effect = mon.effects:find(36)
	if not find then
		debug("Error: Effect not found.")
	else
		Effect:addValue("GlutinousSeedling",slimeNumber)
	end
end

function checkSlime(ListSlime)

    if ListSlime.Monster == nil then
		return true
	end

	if ListSlime.Monster == false then
		if (world:getTime("unix") - ListSlime.Time) >= 900 then
			return true
		end
	end
	return false
end
