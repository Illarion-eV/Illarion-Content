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
		RewardInElstree=0; --nothing will be created
		elseif math.random(1,100) < 91 then --chance check if lte=0 and character is player
		RewardInElstree=0; --no, thus nothing will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
--		char:inform("Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.", "It does not look like as any fairy would drop an element today.") --player get informed s/he missed chance
		else
		RewardInElstree=1; --yes, something will be created 
		createItemID=2552; --pure earth will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
--		char:inform("Ah! Eine Fee hat pure Erde verloren.", "Ah! A fairy lost pure earth.") --player get informed that fairy lost element
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
		createItemText=3 --select text-set 2 .lte.createaftertime.lua
		end		
	createItemAmountA=1; --amount of element min
	createItemAmountB=1; --amount of element max
	createItemXA=823; --area X min
	createItemXB=836; --area X max
	createItemYA=473; --area Y min
	createItemYB=488; --area Y max
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
