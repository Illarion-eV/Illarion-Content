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
-- INSERT INTO scheduledscripts VALUES('scheduled.itemEffects', 1, 1, 'itemEffects');

-- That script should be used for something like "item long time effects".
-- Let a certain effect for a certain item happen after a certain time

local common = require("base.common")

module("scheduled.itemEffects", package.seeall)


function itemEffects()

	spiderEgg()
	pileOfBones()

end

function doFunctionIfPositionAndCounter(theList, neededCounter, theFunction)
	
	local removedCounter = 0
	for i=1,#theList do
	    if theList[i-removedCounter]["itemCounter"] < neededCounter then
			theList[i-removedCounter]["itemCounter"] = theList[i-removedCounter]["itemCounter"]+1
		else
			theFunction(theList[i-removedCounter]["itemPosition"])
			table.remove(theList,i-removedCounter)
			removedCounter = removedCounter + 1
		end
	end

end

PILE_OF_BONES = {}
function pileOfBones()
	
	doFunctionIfPositionAndCounter(PILE_OF_BONES, 8, function(pilePosition) riseWeakLich(pilePosition) end)
	
end

function riseWeakLich(pilePosition)
	
	local itemProperties = {itemId = 498}
	if not common.DeleteItemFromStack(pilePosition, itemProperties) then
	    return
	end
	
	local weakenedLich = world:createMonster(117,pilePosition,-5)
	weakenedLich:talk(Character.say,"#me erhebt sich aus dem Knochenhaufen.","#me rises from the pile of bones.")

end

SPIDER_EGGS = {}
function spiderEgg()

	doFunctionIfPositionAndCounter(SPIDER_EGGS, 8, function(pilePosition) hatchingSpiders(pilePosition) end)

end


function hatchingSpiders(eggPosition)

	local itemProperties = {itemId = 738, deleteAmount = 1, quality = false, data = {{dataKey = "spawnSpiders", dataValue = "true"}}}
	if not common.DeleteItemFromStack(eggPosition, itemProperties) then
	    return
	end
	
	world:gfx(1,eggPosition)
	local players = world:getPlayersInRangeOf(eggPosition,5)
	for i=1,#players do
		players[i]:inform("Das Ei zerspringt und kleine Spinnen schlüpfen.","The egg breaks and small spiders hatch.")
	end
	
	for i=1,Random.uniform(3,5) do
	    local spawnPosition = eggPosition
		for j=-1,1 do
			for k=-1,1 do
				local checkPosition = position(spawnPosition.x + j, spawnPosition.y+k, spawnPosition.z)
				if checkPosition ~= eggPosition and world:getField(checkPosition):isPassable() and not world:isCharacterOnField(checkPosition) then	
				    spawnPosition = checkPosition
				end
			end
		end
		world:createMonster(196,spawnPosition,-5)
	end	
end