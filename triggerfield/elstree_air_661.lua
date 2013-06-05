-- INSERT INTO triggerfields VALUES (799,422,0,'triggerfield.elstree_air_661');
-- INSERT INTO triggerfields VALUES (799,423,0,'triggerfield.elstree_air_661');
-- INSERT INTO triggerfields VALUES (798,422,0,'triggerfield.elstree_air_661');
-- INSERT INTO triggerfields VALUES (798,423,0,'triggerfield.elstree_air_661');

require("base.common")
require("lte.createaftertime");
require("lte.longterm_cooldown");
module("triggerfield.elstree_air_661", package.seeall)


function MoveToField(char)
	if char:getQuestProgress(661) ~= 0 or char:getType() ~= Character.player then --lte check and character is monster
		RewardInElstree=0; --nothing will be created
		elseif math.random(1,100) < 0 then --chance check if lte=0 and character is player
		RewardInElstree=0; --no, thus nothing will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
--		char:inform("Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.", "It does not look like as any fairy would drop an element today.") --player get informed s/he missed chance
		else
		RewardInElstree=1; --yes, something will be created
		createItemID=2551; --pure air will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
--		char:inform("Ah! Eine Fee hat pure Luft verloren.", "Ah! A fairy lost pure air.") --player get informed that fairy lost element
	end
	if RewardInElstree==0 then	--check if something will be created
		createItemTimeBB=math.random(10,20);  --use var2; nothing, thus more lights appear
		createItemTimeB=0;
		createGfx=53 --light (blue glitter)
		createRepeatA=3 --min three lights at the same time
		createRepeatB=7 --up to five lights at the same time
		createItemText=1 --select text-set 1 in .lte.createaftertime.lua
		else
		createItemTimeB=1 --use var1; yes, thus light onle one time
		createGfx=46 --light (beam me up)
		createRepeatA=1 --only one light 
		createRepeatB=1 --only one light
		createItemText=2 --select text-set 2 .lte.createaftertime.lua
		end		
	createItemAmountA=1; --amount of element min
	createItemAmountB=1; --amount of element max
	createItemXA=797; --area X min
	createItemXB=812; --area X max
	createItemYA=417; --area Y min
	createItemYB=428; --area Y max
	createItemZA=0; --area Z min
	createItemZB=0; --area z max
	createItemQualA=999; --quality min
	createItemQualB=999; --quality max
	createAfterA=20; --delay min
	createAfterB=100; --delay max
--	createGfx=nil; --gfx; moved to top
--	createSound=nil; --sfx; moved to top
--	createRepeatA=1 --min repeat; moved to top
--	createRepeatB=5 --max repeat; moved to top
	createItemPos=1 --check of position set
	base.character.CreateAfterTime (char,createItemTimeB,createItemTimeBB,createItemID,createItemIDB,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB,createItemText,createItemPos) -- call .lte.createaftertime

end
