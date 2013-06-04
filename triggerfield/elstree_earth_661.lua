-- INSERT INTO triggerfields VALUES (823,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (822,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (821,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (820,484,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,486,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,487,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,488,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,489,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (830,490,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (832,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (833,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (834,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (835,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (836,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (837,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (838,480,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,471,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,472,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,473,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,474,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,475,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,476,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,477,0,'triggerfield.elstree_earth_661');
-- INSERT INTO triggerfields VALUES (829,478,0,'triggerfield.elstree_earth_661');

require("base.common")
require("lte.createaftertime");
require("lte.longterm_cooldown");
module("triggerfield.elstree_earth_661", package.seeall)


function MoveToField(char)
	if char:getQuestProgress(661) ~= 0 or char:getType() ~= Character.player then --lte check and character is monster
		createItemID=0; --nothing will be created
		elseif math.random(1,100) < 0 then --chance check if lte=0 and character is player
		createItemID=0; --no, thus nothing will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
		char:inform("Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.", "It does not look like as any fairy would drop an element today.") --player get informed s/he missed chance
		else 
		createItemID=2552; --yes, thus pure earth will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
	end
	if createItemID==0 then	--check if something will be created
		createItemTimeB=math.random(10,20);  --nothing, thus more lights appear
		createGfx=53 --light (blue glitter)
		createRepeatB=5 --up to five lights at same time
		else
		createItemTimeB=1 --yes, thus light onle one time
		createGfx=46 --light (beam me up)
		createRepeatB=1 --only one light
		end		
	createItemAmountA=1; --amount of element min
	createItemAmountB=1; --amount of element max
	createItemXA=820; --area X min
	createItemXB=840; --area X max
	createItemYA=470; --area Y min
	createItemYB=490; --area Y max
	createItemZA=0; --area Z min
	createItemZB=0; --area z max
	createItemQualA=999; --quality min
	createItemQualB=999; --quality max
	createAfterA=20; --delay min
	createAfterB=100; --delay max
--	createGfx=nil; --gfx; moved to top
--	createSound=nil; --sfx; moved to top
	createRepeatA=1 --at least one repeat
--	createRepeatB=5 --max repeat; moved to top
	base.character.CreateAfterTime (char,createItemTimeB,createItemID,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB) -- call .lte.createaftertime

end

function MoveFromField(char)
	base.character.CreateAfterTime (char,createItemTimeB,createItemID,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB) -- call .lte.createaftertime
end
