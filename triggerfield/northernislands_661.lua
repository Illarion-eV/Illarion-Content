-- INSERT INTO triggerfields VALUES (364,49,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (363,56,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (364,56,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (363,65,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (360,73,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (356,71,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (359,66,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (415,85,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (415,79,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (416,79,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (478,34,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (478,30,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (479,30,0,'triggerfield.northernislands_661');

require("base.common")
require("lte.createaftertime");
require("lte.longterm_cooldown");
module("triggerfield.northernislands_661", package.seeall)


function MoveFromField(char)
	if char:getQuestProgress(661) ~= 0 or char:getType() ~= Character.player then --lte check and character is monster
		RewardInNorth=0; --nothing will be created
		elseif math.random(1,100) < 96 then --chance check if lte=0 and character is player
		RewardInNorth=0; --no, thus nothing will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
--		char:inform("Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.", "It does not look like as any fairy would drop an element today.") --player get informed s/he missed chance
		else
		RewardInNorth=1; --yes, something will be created
		createItemID=2553; --pure fire will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
		char:inform("Ist das dort ein pures Feuer? Du solltest nachsehen gehen.", "Is this a pure fire there? You should take a look.") --player get informed about element
	end
	if RewardInNorth==0 then	--check if something will be created
		createItemTimeBB=math.random(5,20);  --use var2; nothing, thus more lights appear
		createItemTimeB=0;
		createItemIDB=359; --fire flame will be created
		createGfx=44 --light (fire)
		createRepeatA=2 --min three lights at the same time
		createRepeatB=5 --up to five lights at the same time
		createItemText=nil --select text-set 1 in .lte.createaftertime.lua
		else
		createItemTimeB=1 --use var1; yes, thus light onle one time
		createGfx=46 --light (beam me up)
		createRepeatA=1 --only one light 
		createRepeatB=1 --only one light
		createItemText=nil --select text-set 2 .lte.createaftertime.lua
		end		
	createItemAmountA=1; --amount of element min
	createItemAmountB=1; --amount of element max
	createItemXA=354; --area X min
	createItemXB=369; --area X max
	createItemYA=59; --area Y min
	createItemYB=78; --area Y max
	createItemZA=0; --area Z min
	createItemZB=0; --area z max
	createItemQualA=333; --quality min
	createItemQualB=333; --quality max
	createAfterA=50; --delay min
	createAfterB=500; --delay max
--	createGfx=nil; --gfx; moved to top
--	createSound=nil; --sfx; moved to top
--	createRepeatA=1 --min repeat; moved to top
--	createRepeatB=5 --max repeat; moved to top
	createItemPos=1 --check of position set
	base.character.CreateAfterTime (char,createItemTimeB,createItemTimeBB,createItemID,createItemIDB,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB,createItemText,createItemPos) 
end
