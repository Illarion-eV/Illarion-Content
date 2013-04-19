require("base.common")

module("scheduled.showGFX", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.showGFX', 10, 10, 'CreateGFX');


-- this script is used to show a ceratin graphic effect on a certain position every ten seconds


function CreateGFX()
    world:gfx(1,position(75,651,0)) -- thinking stone
	world:gfx(11,position(873,878,0)) -- recognizing spring
    world:gfx(7,position(432,238,0)) -- knowing tree
end