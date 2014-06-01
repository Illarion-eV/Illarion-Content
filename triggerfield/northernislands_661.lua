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

-- INSERT INTO triggerfields VALUES (488,13,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (496,7,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (499,14,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (502,21,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (499,28,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (480,27,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (419,72,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (423,61,0,'triggerfield.northernislands_661');
-- INSERT INTO triggerfields VALUES (420,75,0,'triggerfield.northernislands_661');


require("base.common")
require("lte.createaftertime");
require("lte.longterm_cooldown");
module("triggerfield.northernislands_661", package.seeall)


NorthPos={}
NorthPos[1]={position(364,49,0),position(363,56,0),position(364,56,0),position(363,65,0),position(360,73,0),position(356,71,0),position(359,66,0)}
NorthPos[2]={position(415,85,0),position(415,79,0),position(416,79,0),position(419,72,0),position(423,61,0),position(420,75,0)}
NorthPos[3]={position(478,34,0),position(478,30,0),position(479,30,0),position(488,13,0),position(496,7,0),position(499,14,0),position(502,21,0),position(499,28,0),position(480,27,0)}

createNorthItemID={2553,2554,2551}
createNorthItemIDB={359,360,372}
createNorthGfx={9,4,8}
createNorthItemXA={354,410,477}
createNorthItemXB={369,430,501}
createNorthItemYA={59,49,7}
createNorthItemYB={78,79,30}

function MoveFromField(char)
	if char:getType() ~= Character.player then
		return
	end

	for i = 1,3 do
		local AmountPos = table.getn(NorthPos[i])
		for j = 1,AmountPos do
	   		if (char.pos == NorthPos[i][j]) then
				NorthitemsID = createNorthItemID[i]
				NorthItemIDB = createNorthItemIDB[i]
				NorthGfx = createNorthGfx[i]
				NorthItemXA = createNorthItemXA[i]
				NorthItemXB = createNorthItemXB[i]
				NorthItemYA = createNorthItemYA[i]
				NorthItemYB = createNorthItemYB[i]
       			end
		end
	end
	if char:getQuestProgress(661) ~= 0 or char:getType() ~= Character.player then --lte check and character is monster
		RewardInNorth=0; --nothing will be created
		elseif math.random(1,100) < 96 then --chance check if lte=0 and character is player
		RewardInNorth=0; --no, thus nothing will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
		else
		RewardInNorth=1; --yes, something will be created
		createItemID=NorthitemsID; --pure element will be created
		char:setQuestProgress(661,math.random(60,100)) --lte set
		char:inform("Ist das dort ein pures Element? Du solltest nachsehen gehen.", "Is that a pure element there? You should take a look.") --player gets informed about element
	end
	if RewardInNorth==0 then	--check if something will be created
		createItemTimeBB=math.random(5,20);  --use var2; nothing, thus more lights appear
		createItemTimeB=0;
		createItemIDB=NorthItemIDB; -- flame will be created
		createGfx=NorthGfx --light
		createRepeatA=2 --min three lights at the same time
		createRepeatB=5 --up to five lights at the same time
		createItemText=nil --no text-set 1 in .lte.createaftertime.lua
		else
		createItemTimeB=1 --use var1; yes, thus light only one time
		createGfx=46 --light (beam me up)
		createRepeatA=1 --only one light
		createRepeatB=1 --only one light
		createItemText=nil --no text-set 2 .lte.createaftertime.lua
		end
	createItemAmountA=1; --amount of element min
	createItemAmountB=1; --amount of element max
	createItemXA=NorthItemXA; --area X min
	createItemXB=NorthItemXB; --area X max
	createItemYA=NorthItemYA; --area Y min
	createItemYB=NorthItemYB; --area Y max
	createItemZA=0; --area Z min
	createItemZB=0; --area z max
	createItemQualA=333; --quality min
	createItemQualB=333; --quality max
	createAfterA=50; --delay min
	createAfterB=1500; --delay max
--	createGfx=nil; --gfx; moved to top
--	createSound=nil; --sfx; moved to top
--	createRepeatA=1 --min repeat; moved to top
--	createRepeatB=5 --max repeat; moved to top
	createItemPos=1 --check of position set
	createItemFieldAccess=nil
	base.character.CreateAfterTime (char,createItemTimeB,createItemTimeBB,createItemID,createItemIDB,createItemAmountA,createItemAmountB,createItemXA,createItemXB,createItemYA,createItemYB,createItemZA,createItemZB,createItemQualA,createItemQualB,createAfterA,createAfterB,createGfx,createSound,createRepeatA,createRepeatB,createItemText,createItemPos,createItemFieldAccess) end
