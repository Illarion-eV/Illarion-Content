-- This script spawns treasure chests (2830) whereever needed
-- Estralis

require("base.common")

module("scheduled.spawn_treasure", package.seeall)

function spawnTreasure()

	treasurePos=position(703,422,-3); --Salavesh dungeon
	
    if table.getn(world:getPlayersInRangeOf(treasurePos,20)) == 0 and world:isItemOnField(treasurePos) == false then --only spawn a treasure if nobody is around and there is no item on the tile
	
		world:createItemFromId(2830,1,treasurePos,false,333,{trsCat=math.random(0,4)}); --spawn the chest only if the tile is empty
		
	end
	
end