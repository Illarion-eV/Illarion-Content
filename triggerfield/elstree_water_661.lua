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
-- INSERT INTO triggerfields VALUES (801,449,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,450,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,451,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,452,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (801,453,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (805,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (806,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (807,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (808,459,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,462,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,463,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,464,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,465,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (800,466,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (795,461,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (795,462,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (794,462,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (794,463,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,463,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,464,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,464,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,465,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (794,456,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,456,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (793,455,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,455,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (792,454,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (791,454,0,'triggerfield.elstree_water_661');
-- INSERT INTO triggerfields VALUES (790,454,0,'triggerfield.elstree_water_661');

require("base.common")
require("lte.createaftertime");
require("lte.longterm_cooldown");
module("triggerfield.elstree_water_661", package.seeall)


function MoveToField(char)
	if char:getQuestProgress(661) ~= 0 or char:getType() ~= Character.player then --lte check and character is monster
		RewardInElstree=0; --nothing will be created
		elseif math.random(1,100) < 91 then --chance check if lte=0 and character is player
		RewardInElstree=0; --no, thus nothing will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
--		char:inform("Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.", "It does not look like as any fairy would drop an element today.") --player get informed s/he missed chance
		else
		RewardInElstree=1; --yes, something will be created 
		createItemID=2554; --pure water will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
--		char:inform("Ah! Eine Fee hat pures Wasser verloren.", "Ah! A fairy lost pure water.") --player get informed that fairy lost element
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
		createItemText=5 --select text-set 5 .lte.createaftertime.lua
		end		
	createItemAmountA=1; --amount of element min
	createItemAmountB=1; --amount of element max
	createItemXA=793; --area X min
	createItemXB=806; --area X max
	createItemYA=450; --area Y min
	createItemYB=464; --area Y max
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
	createItemFieldAccess=nil
	base.character.CreateAfterTime (char,createItemTimeB,createItemTimeBB,createItemID,createItemIDB,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB,createItemText,createItemPos,createItemFieldAccess) -- call .lte.createaftertime

end
