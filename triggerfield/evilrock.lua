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
-- INSERT INTO triggerfields VALUES (990,253,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (989,253,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (988,253,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (987,253,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (986,253,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (985,253,0,'triggerfield.evilrock');

-- INSERT INTO triggerfields VALUES (990,253,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (989,252,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (988,252,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (987,252,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (986,252,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (985,252,0,'triggerfield.evilrock');

-- INSERT INTO triggerfields VALUES (995,228,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (994,228,0,'triggerfield.evilrock');

-- INSERT INTO triggerfields VALUES (990,201,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (990,202,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (990,203,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (990,204,0,'triggerfield.evilrock');

-- INSERT INTO triggerfields VALUES (952,206,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (952,207,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (963,177,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (962,177,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (920,200,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (921,200,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (912,250,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (912,251,0,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (963,203,1,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (964,203,1,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (966,209,1,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (966,210,1,'triggerfield.evilrock');

-- INSERT INTO triggerfields VALUES (977,173,-6,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (952,173,-6,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (964,172,-6,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (964,173,-6,'triggerfield.evilrock');
-- INSERT INTO triggerfields VALUES (964,174,-6,'triggerfield.evilrock');

-- INSERT INTO triggerfields VALUES (970,171,2,'triggerfield.evilrock');

require("base.common")
require("base.class")
module("triggerfield.evilrock", package.seeall)


triggerFlameFire={position(990,252,0),position(989,253,0),position(988,252,0),position(987,253,0),position(986,252,0),position(985,253,0)}
triggerFlameIce={position(990,253,0),position(989,252,0),position(988,253,0),position(987,252,0),position(986,253,0),position(985,252,0)}
triggerFlamePoison={position(994,228,0),position(995,228,0)}
triggerEntranceTrap={position(990,201,0),position(990,202,0),position(990,203,0),position(990,204,0)}

triggerVision={position(952,206,0),position(952,207,0),position(963,177,0),position(962,177,0),position(920,200,0),position(921,200,0),position(912,250,0),position(912,251,0),position(963,203,1),position(964,203,1),position(966,209,1),position(966,210,1),position(964,172,-6),position(964,173,-6),position(964,174,-6)}
VisionStory={1,1,2,2,3,3,4,4,5,5,5,5,6,6,6}
EvilRockAreaNames={"evilrock1","evilrock2","evilrock3","evilrock4","evilrock5","evilrock6"}

attendants={}
attendants2={}
--evilrockStory={}



function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if (char.pos == triggerFlameFire[i]) then
		if player:getQuestProgress(680) ~= 0 then
			return true
		end	
	end

	local AmountFlameFire = table.getn(triggerFlameFire)	
	for i = 1,AmountFlameFire do	
		if (char.pos == triggerFlameFire[i]) then
			base.character.CreateAfterTime (char,100,120,359,nil,1,1,988,998,225,235,0,0,600,600,1,1,nil,4,4,7,nil,nil,1)
			if char:getQuestProgress(680) ~= 0 then
				base.common.InformNLS(char,"Denkst du wirklich, du hättest heute mehr Glück?","Do you really think you will have more luck today?")
			end
		end
	end

	local AmountFlameIce = table.getn(triggerFlameIce)	
	for i = 1,AmountFlameIce do	
		if (char.pos == triggerFlameIce[i]) then
			base.character.CreateAfterTime (char,100,120,360,nil,1,1,988,998,225,235,0,0,600,600,1,1,nil,5,4,7,nil,nil,1) 
		end
	end

	local AmountFlamePoison = table.getn(triggerFlamePoison)	
	for i = 1,AmountFlamePoison do	
		if (char.pos == triggerFlamePoison[i]) then
			base.character.CreateAfterTime (char,100,120,372,nil,1,1,986,998,211,223,0,0,600,600,1,1,nil,13,4,7,nil,nil,1) 
		end
	end

	local AmountEntranceTrap = table.getn(triggerEntranceTrap)
	for i = 1,AmountEntranceTrap do
		if (char.pos == triggerEntranceTrap[i]) then
			for xx=992,996 do
				world:createItemFromId( 3097, 1, position(xx,195,0), false, 333, nil)
				world:makeSound(4,char.pos)
				world:makeSound(5,char.pos)
			end
			local CheckBucket = world:getItemOnField(position(997,199,2))
--debug("CheckBucket: "..CheckBucket.id)
			if CheckBucket.id == 51 then
			else
				world:erase(CheckBucket,CheckBucket.number)
				world:createItemFromId(51, 1, position(997,199,2), true, 333, nil)
				local CreateBucket = world:getItemOnField(position(997,199,2))				
				CreateBucket.wear=255
				base.lookat.SetSpecialDescription(CreateBucket,"Wie viel Wasser wohl in diesen Eimer passt?","How much water might fit into this bucket?")
				world:changeItem(CreateBucket)
			end
		end
	end

	local AmountVision = table.getn(triggerVision)	
	for i = 1,AmountVision do	
		if (char.pos == triggerVision[i]) and math.random(1,100)< 81 then
			AmountStory = table.getn(content.vision.VisionTextDE[VisionStory[i]])
			TypeStory = VisionStory[i]
			attendants[char.name] = world:getPlayersInRangeOf(position(940,200,0), 90)
			for k,player in ipairs(attendants[char.name]) do
--				if (content.areas.PointInArea(player.pos,EvilRockAreaNames[VisionStory[i]])) and player:getQuestProgress(664) >= 2 then
				if player:getQuestProgress(665) == 0 then
					player:setQuestProgress(665,2)
				else
					return					
				end

			end
			attendants2[char.name] = world:getPlayersInRangeOf(position(940,200,-6), 90)
			for k,player in ipairs(attendants2[char.name]) do
--				if (content.areas.PointInArea(player.pos,EvilRockAreaNames[VisionStory[i]])) and player:getQuestProgress(664) >= 2 then
				if player:getQuestProgress(665) == 0 then
					player:setQuestProgress(665,2)
				else
					return					
				end

			end
			char:setQuestProgress(664,1)
			StartVision(char,AmountStory,TypeStory)
-- debug("StartVision: "..char.name)
		end
	end
	if char.pos == position(977,173,-6) and world:getItemOnField(position(977,173,-6)).id == 10 then
		local checkRedPortal = world:getItemOnField(position(970,171,2))
		if checkRedPortal.id == 798 then
			world:erase(checkRedPortal,checkRedPortal.number)
		end 
		if char:getFaceTo() == 1 or char:getFaceTo() == 2 or char:getFaceTo() == 3 then
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
			char:warp(position(929,187,1))
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
		elseif char:getFaceTo() == 5 or char:getFaceTo() == 6 or char:getFaceTo() == 7 then
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
			char:warp(position(966,171,2))
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
		end
	end
	if char.pos == position(970,171,2) and world:getItemOnField(position(970,171,2)).id == 798 then
		if CheckPortalLeverRiddle1(char) == true then
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
			char:warp(position(836,813,0))
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
		elseif CheckPortalLeverRiddle2(char) == true then
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
			char:warp(position(127,647,0))
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
		elseif CheckPortalLeverRiddle3(char) == true then
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
			char:warp(position(684,307,0))
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
		elseif CheckPortalLeverRiddle4(char) == true then
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
			char:warp(position(424,245,0))
			world:gfx(41,char.pos);
			world:makeSound(13,char.pos);
		end
	end
	if char.pos == position(952,173,-6) then
		local weightOfPlayer = char:increaseAttrib("weight",0)	
--debug("weightOfPlayer: "..weightOfPlayer)
		local heightOfPlayer = char:increaseAttrib("body_height",0)	
--debug("heightOfPlayer: "..heightOfPlayer)
		local strengthOfPlayer = char:increaseAttrib("strength",0)	
--debug("strengthOfPlayer: "..strengthOfPlayer)
		local ageOfPlayer = char:increaseAttrib("age",0)	
--debug("ageOfPlayer: "..ageOfPlayer)


		local ItemsInBackPack = char:getBackPack()
		local weightofItemsInBackPack = ItemsInBackPack:weight()

		local ItemsOnBodyBelt = 0
		local itemsOnChar = {};
		local itemPosOnChar = {};
		for i=17,0,-1 do
			local item = char:getItemAt(i);
			if (item.id > 0) then
				table.insert(itemsOnChar, item);
			end
		end
		local language = char:getPlayerLanguage();
	
		for i,item in ipairs(itemsOnChar) do
			local statsofItemsOnChar = world:getItemStatsFromId(item.id)
			local statsofItemsOnCharWeight = statsofItemsOnChar.Weight
			if item.itempos >= 11 and item.itempos <= 18 then	
				numberofItemsOnChar = char:countItemAt("belt",item.id)
			else
				numberofItemsOnChar = char:countItemAt("body",item.id)
			end
			local weightofItemsOnChar = numberofItemsOnChar * statsofItemsOnCharWeight
			ItemsOnBodyBelt = ItemsOnBodyBelt + weightofItemsOnChar
		end

--debug("weightOfPlayer: "..weightOfPlayer)
--debug("weightofItemsInBackPack: "..weightofItemsInBackPack)
--debug("ItemsOnBodyBelt: "..ItemsOnBodyBelt)
		local weightOfPlayerPlusItemsPlusBag = weightOfPlayer+weightofItemsInBackPack+ItemsOnBodyBelt
--debug("weightOfPlayerPlusItemsPlusBag: "..weightOfPlayerPlusItemsPlusBag)

		if weightOfPlayerPlusItemsPlusBag == nil  then		
			clicksAmountVar = 1
			WrongWeight(char,clicksAmountVar)
		elseif weightOfPlayerPlusItemsPlusBag <= 12400 then
			clicksAmountVar = 1
			WrongWeight(char,clicksAmountVar)
		elseif weightOfPlayerPlusItemsPlusBag >= 13500 then
			clicksAmountVar = 2
			WrongWeight(char,clicksAmountVar)		
		else			
			clicksAmountVar = 3
			RightWeight(char,clicksAmountVar)
		end
	end
	
end




stoneChamberStonePosition={position(957,170,-6),position(953,167,-6),position(948,168,-6),position(946,173,-6),position(948,178,-6),position(953,179,-6),position(957,176,-6)}
stoneChamberStoneKind={283,197,46,285,45,198,284}
playerWithWrongWeight={}
playerWithRightWeight={}
clicksAmountDe={"einmaliges","dreimaliges","zweimaliges"}
clicksAmountEn={"a click","three clicks","two clicks"}

function RightWeight(char,clicksAmountVar)
	playerWithRightWeight[char.name] = world:getPlayersInRangeOf(position(960,173,-6), 50)
	local AmountStoneChamberStones = table.getn(stoneChamberStonePosition)
	local ChanceForGemsToday = math.random(1,100)
	if ChanceForGemsToday <= 10 or char:getQuestProgress(681) == 0 then
		noLuckForGemsToday = true
	else
		noLuckForGemsToday = false
	end
	for m,player in ipairs(playerWithRightWeight[char.name]) do
		if (content.areas.PointInArea(player.pos,"evilrockstonechamber")) then
			base.common.InformNLS(player,"Der Thron sinkt ein wenig ein und du hörst ein "..clicksAmountDe[clicksAmountVar].." Klicken.","The throne sinks down slightly and you hear "..clicksAmountEn[clicksAmountVar].." .")
		end
	end

	if not StoneChamberQuestProgressCheck(char) then
		if noLuckForGemsToday == true then
			for i = 1,AmountStoneChamberStones do
				world:makeSound(27,stoneChamberStonePosition[i])
				world:gfx(46,stoneChamberStonePosition[i])
				world:createItemFromId(stoneChamberStoneKind[i],1,stoneChamberStonePosition[i],true,999,{["gemLevel"]="1"})
			end
		else
			for m,player in ipairs(playerWithRightWeight[char.name]) do
				world:makeSound(27,player.pos)
				base.common.InformNLS(player,"Zusätzlich siehst du noch ein kurzes Aufleuchten einer Lichtquelle, welches aber sogleich abstirbt. Hier scheint heute nichts zu funktionieren.","Furthermore, you see a light blinking for a second but nothing happens. It does not seem as though anything is working today.")
			end
		end
	else
		for m,player in ipairs(playerWithRightWeight[char.name]) do
			world:makeSound(27,player.pos)
			base.common.InformNLS(player,"Zusätzlich siehst du noch ein kurzes Aufleuchten einer Lichtquelle, welches aber sogleich abstirbt. Hier scheint heute nichts zu funktionieren.","Furthermore, you see a light blinking, which immediately disappears. It does not seem as though anything is working today.")
		end
	end
	
	world:createItemFromId(467,1,position(952,173,-6),true,333,nil)
	playerHasCorrectWeight = true
end



function WrongWeight(char,clicksAmountVar)
	playerWithWrongWeight[char.name] = world:getPlayersInRangeOf(position(960,173,-6), 50)
	for m,player in ipairs(playerWithWrongWeight[char.name]) do
		if (content.areas.PointInArea(player.pos,"evilrockstonechamber")) then
			base.common.InformNLS(player,"Du hörst ein "..clicksAmountDe[clicksAmountVar].." Klicken während der Thron leicht einsinkt und eine Stimme ruft: 'Narr, du bist nicht ich! Hinweg mit dir!' Anschließend füllt sich der Raum mit Flammen.","You hear "..clicksAmountEn[clicksAmountVar].." during which the throne sinks down slightly and a voice shouts: 'Fool, you are not me! Leave!' The room fills itself with flames afterwards.")
			world:makeSound(25,player.pos);
		end
	end
	for xx=943,960 do
		for yy=164,182 do
			local positionFlame = position(xx,yy,-6)
			world:createItemFromId(360,1,positionFlame,true,666,nil)
		end
	end
	playerHasCorrectWeight = false
end



stoneChamberAttendants={}

function StoneChamberQuestProgressCheck(char)
	stoneChamberAttendants[char.name] = world:getPlayersInRangeOf(position(952,173,-6), 50)
	for m,player in ipairs(stoneChamberAttendants[char.name]) do
		if player:getQuestProgress(680) ~= 0 and player:getQuestProgress(681) ~= 0 then
			return true
		end
	end
end


function StoneChamberQuestProgress(char)
	stoneChamberAttendants[char.name] = world:getPlayersInRangeOf(position(952,173,-6), 50)
	for m,player in ipairs(stoneChamberAttendants[char.name]) do
		player:setQuestProgress(680,math.random(400,600))
		player:setQuestProgress(681,1)
	end
end


function MoveFromField(char)
   if char:getType() ~= Character.player then
	return
   else
	for xx=943,960 do
		for yy=164,182 do
			local positionStoneChamber = position(xx,yy,-6)
			local checkStoneChamber = world:getItemOnField(positionStoneChamber)
			if checkStoneChamber.id == 360 then
				world:erase(checkStoneChamber,checkStoneChamber.number)
				world:makeSound(13,char.pos)
			end
		end
	end
	local checkStoneChamber = world:getItemOnField(position(952,173,-6))
	if checkStoneChamber.id == 467 then
		world:erase(checkStoneChamber,checkStoneChamber.number)
		world:makeSound(13,position(952,173,-6))
	end
	local AmountStoneChamberStones = table.getn(stoneChamberStonePosition)
	for i = 1,AmountStoneChamberStones do
		local checkStoneChamber = world:getItemOnField(stoneChamberStonePosition[i])
		if checkStoneChamber.id == stoneChamberStoneKind[i] then
			world:erase(checkStoneChamber,checkStoneChamber.number)
			world:makeSound(13,stoneChamberStonePosition[i])
			world:gfx(5,stoneChamberStonePosition[i])
		elseif playerHasCorrectWeight == true then
			StoneChamberQuestProgress(char)
		end
	end
   end
end

function StartVision(char,AmountStory,TypeStory)
	find, myEffect = char.effects:find(83)
	if find then 
		return
	else
		myEffect = LongTimeEffect(83,50)
		myEffect:addValue("AmountStory",AmountStory)
		myEffect:addValue("TypeStory",TypeStory)
	end
	char.effects:addEffect(myEffect)
end



function RemoveEntranceTrap(char)
	for xx=992,996 do
		local EntranceTrap = world:getItemOnField(position(xx,195,0))
		if EntranceTrap.id == 3097 then
			world:erase(EntranceTrap,EntranceTrap.number)
			world:makeSound(4,char.pos)
			world:makeSound(5,char.pos)
		end
	end
end



executePortalLeverRiddle = base.class.class(function(leverriddle, posi)
    leverriddle.pos=posi;
end);

function executePortalLeverRiddle:execute()
	char=self.player
	PortalLeverRiddle(char)
end



function PortalLeverRiddle(char)
	world:makeSound(22,position(970,171,2))
	if CheckPortalLeverRiddle1(char) == true or CheckPortalLeverRiddle2(char) == true or CheckPortalLeverRiddle3(char) == true or CheckPortalLeverRiddle4(char) == true then
		world:gfx(32,position(970,171,2))
		world:makeSound(4,position(970,171,2))
		world:createItemFromId(798,1,position(970,171,2),true,666,nil)
	else
		local checkRedPortal = world:getItemOnField(position(970,171,2))
		if checkRedPortal.id == 798 then
			world:erase(checkRedPortal,checkRedPortal.number)
			world:makeSound(4,position(970,171,2))
			world:gfx(5,position(970,171,2))
		end
	end
end

function CheckPortalLeverRiddle1(char)
	if world:getItemOnField(position(966,169,2)).id == 436 and world:getItemOnField(position(967,169,2)).id == 436 and world:getItemOnField(position(968,169,2)).id ~= 436 and world:getItemOnField(position(969,169,2)).id ~= 436 and world:getItemOnField(position(970,169,2)).id ~= 436 and world:getItemOnField(position(971,169,2)).id ~= 436 and world:getItemOnField(position(972,169,2)).id ~= 436 and world:getItemOnField(position(973,169,2)).id ~= 436 and world:getItemOnField(position(974,169,2)).id == 436 then
		return true
	else
		return false
	end
end

function CheckPortalLeverRiddle2(char)
	if world:getItemOnField(position(966,169,2)).id == 436 and world:getItemOnField(position(967,169,2)).id ~= 436 and world:getItemOnField(position(968,169,2)).id == 436 and world:getItemOnField(position(969,169,2)).id ~= 436 and world:getItemOnField(position(970,169,2)).id ~= 436 and world:getItemOnField(position(971,169,2)).id == 436 and world:getItemOnField(position(972,169,2)).id ~= 436 and world:getItemOnField(position(973,169,2)).id ~= 436 and world:getItemOnField(position(974,169,2)).id ~= 436 then
		return true
	else
		return false
	end
end

function CheckPortalLeverRiddle3(char)
	if world:getItemOnField(position(966,169,2)).id == 436 and world:getItemOnField(position(967,169,2)).id ~= 436 and world:getItemOnField(position(968,169,2)).id ~= 436 and world:getItemOnField(position(969,169,2)).id == 436 and world:getItemOnField(position(970,169,2)).id ~= 436 and world:getItemOnField(position(971,169,2)).id ~= 436 and world:getItemOnField(position(972,169,2)).id ~= 436 and world:getItemOnField(position(973,169,2)).id == 436 and world:getItemOnField(position(974,169,2)).id ~= 436 then
		return true
	else
		return false
	end
end

function CheckPortalLeverRiddle4(char)
	if world:getItemOnField(position(966,169,2)).id == 436 and world:getItemOnField(position(967,169,2)).id ~= 436 and world:getItemOnField(position(968,169,2)).id ~= 436 and world:getItemOnField(position(969,169,2)).id == 436 and world:getItemOnField(position(970,169,2)).id ~= 436 and world:getItemOnField(position(971,169,2)).id ~= 436 and world:getItemOnField(position(972,169,2)).id == 436 and world:getItemOnField(position(973,169,2)).id ~= 436 and world:getItemOnField(position(974,169,2)).id ~= 436 then
		return true
	else
		return false
	end
end

