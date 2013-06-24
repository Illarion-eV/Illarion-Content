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
		myChar = world:getCharacterOnField(myPos)
		User:talk(Character.say, "#mes Füße werden von einem großen Schleimtropfen, der sich vom schleimigen Setzling gelöst hat, getrofefen.","#me's feet are hit by a big drop of slime, which has come off from the glutinous seedling.")
	else
        SpawnSlime(myPos)	
	end
	-- Glutinous Seedling end
end

function SpawnSlime(thePos)

	if checkSlime(SlimeList.Slime1) then
		CreateSlime(SlimeList.Slime1,thePos,1)
	end
	if checkSlime(SlimeList.Slime2) then
		CreateSlime(SlimeList.Slime2,thePos,2)
	end

end

function CreateSlime(ListSlime,thePos,slimeNumber)
	local mon = world:createMonster(615,thePos,-10)
    ListSlime.Monster = mon
	base.character.DeathAfterTime(mon,50,11,9,false)
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
	
	if not ListSlime.Monster:increaseAttrib("hitpoints") > 0 then
	    if (ListSlime.Time - world:getTime("unix")) >= 15 then
			return true
		end
	end

	return false
end