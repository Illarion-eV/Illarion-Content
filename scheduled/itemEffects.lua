-- INSERT INTO scheduledscripts VALUES('scheduled.itemEffects', 1, 1, 'itemEffects');

-- That script should be used for something like "item ltes".
-- Let a certain effect for a certain item happen after a certain time

require("base.common")

module("scheduled.itemEffects", package.seeall)


function itemEffects()

	spiderEgg()

end


SPIDER_EGGS = {}
function spiderEgg()

	local removedCounter = 0
	for i=1,#SPIDER_EGGS do
	    if SPIDER_EGGS[i-removedCounter]["eggCounter"] < 8 then
		    SPIDER_EGGS[i-removedCounter]["eggCounter"] = SPIDER_EGGS[i-removedCounter]["eggCounter"]+1
		else
			spawnSpiders(SPIDER_EGGS[i-removedCounter]["eggPosition"])
			table.remove(SPIDER_EGGS,i-removedCounter)
			removedCounter = removedCounter + 1
		end
	end
end

function spawnSpiders(eggPosition)

	local itemProperties = {itemId = 738, deleteAmount = 1, quality = false, data = {{dataKey = "spawnSpiders", dataValue = "true"}}}
	if not base.common.DeleteItemFromStack(eggPosition, itemProperties) then
	    return
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