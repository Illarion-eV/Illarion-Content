require("base.treasure")

module("scheduled.treasure", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.treasure', 4, 4, 'treasureCheck');



function treasureCheck()

    local treasurePositions = base.treasure.treasurePostions;

	for i=1,#treasurePositions do
	    local thePos = treasurePositions[i]
		if base.treasure.CheckMonsters( thePos ) then
			world:gfx(16,thePos);
			world:makeSound(13,thePos);
			base.treasure.SpawnTreasure(treasureCategory[thePos], thePos)
		end
	end

end