-- CreateAfterTime, id 80
-- to create a item after some time
-- see base.character.CreateAfterTime(Character,createAfter,createGfx,createSound)

require("base.common")
module("lte.createaftertime", package.seeall)

TextDE={};
TextEN={};
TextDE[1]="Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.";
TextEN[1]="It does not look like as any fairy would drop an element today.";
TextDE[2]="Ah! Eine Fee hat pure Luft verloren";
TextEN[2]="Ah! A fairy lost pure air";
TextDE[3]="Ah! Eine Fee hat pure Erde verloren";
TextEN[3]="Ah! A fairy lost pure earth";
TextDE[4]="Ah! Eine Fee hat pures Feurer verloren";
TextEN[4]="Ah! A fairy lost pure fire";
TextDE[5]="Ah! Eine Fee hat pures Wasser verloren";
TextEN[5]="Ah! A fairy lost pure water";

PosItemDE={};
PosItemEN={};
PosItemDE[1]=" nordwestlich von dir.";
PosItemEN[1]=" northwest of you.";
PosItemDE[2]=" südwestlich von dir.";
PosItemEN[2]=" southwest of you.";
PosItemDE[3]=" nordöstlich von dir.";
PosItemEN[3]=" northeast of you.";
PosItemDE[4]=" südöstlich von dir.";
PosItemEN[4]=" southeast of you.";
PosItemDE[5]=" westlich von dir.";
PosItemEN[5]=" west of you.";
PosItemDE[6]=" östlich von dir.";
PosItemEN[6]=" east of you.";
PosItemDE[7]=" nördlich von dir.";
PosItemEN[7]=" north of you.";
PosItemDE[8]=" südlich von dir.";
PosItemEN[8]=" south of you.";
PosItemDE[9]=" unter deinen Beinen.";
PosItemEN[9]=" underneath your feet.";

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character)

local findCreateItemTimeB, createItemTimeB = Effect:findValue("createItemTimeB") --find variable
local findCreateItemTimeBB, createItemTimeBB = Effect:findValue("createItemTimeBB") --find variable
debug("createItemTimeB1:"..createItemTimeB)
debug("createItemTimeBB1:"..createItemTimeBB)
if findCreateItemTimeB then
debug("createItemTimeB2:"..createItemTimeB)
Character:inform("run1","run1")
	if not createItemTimeA then --check if false
		createItemTimeA=0 --set 0 if false
	else
	end
	local findCreateItemTimeB, createItemTimeB = Effect:findValue("createItemTimeB") --find variable
debug("createItemTimeA:"..createItemTimeA)
debug("createItemTimeB3:"..createItemTimeB)
Character:inform("run2","run2")
 	if createItemTimeA<createItemTimeB then --check if smaller; if yes than nextcall
Character:inform("run3","run3")
		local findCreateRepeatA, createRepeatA = Effect:findValue("createRepeatA") --find variable
		local findCreateRepeatB, createRepeatB = Effect:findValue("createRepeatB") --find variable
		local createRepeatX=math.random(createRepeatA,createRepeatB) --create random value between variables
		local i=0; --ready for repeat
--debug("createRepeatA:"..createRepeatA)
--debug("createRepeatB:"..createRepeatB)
--debug("createRepeatX:"..createRepeatX)
--debug("i:"..i)
		repeat
			i=i+1; --counter
			findCreateItemID, createItemID = Effect:findValue("createItemID") --find variable

			findCreateItemAmountA, createItemAmountA = Effect:findValue("createItemAmountA") --find variable
			findCreateItemAmountB, createItemAmountB = Effect:findValue("createItemAmountB") --find variable
			createItemAmount=math.random(createItemAmountA,createItemAmountB) --create random value between variables

			findCreateItemXA, createItemXA = Effect:findValue("createItemXA") --find variable
			findCreateItemXB, createItemXB = Effect:findValue("createItemXB") --find variable
			findCreateItemYA, createItemYA = Effect:findValue("createItemYA") --find variable
			findCreateItemYB, createItemYB = Effect:findValue("createItemYB") --find variable
			findCreateItemZA, createItemZA = Effect:findValue("createItemZA") --find variable
			findCreateItemZB, createItemZB = Effect:findValue("createItemZB") --find variable
			createItemX=math.random(createItemXA,createItemXB) --create random value between variables
			createItemY=math.random(createItemYA,createItemYB) --create random value between variables
			createItemZ=math.random(createItemZA,createItemZB) --create random value between variables
			posOfItem = position(createItemX,createItemY,createItemZ) --set value for position
--Character:inform("createItemX: "..createItemX,"createItemX:"..createItemX)
--Character:inform("createItemY: "..createItemY,"createItemY:"..createItemY)
			findCreateItemQualA, createItemQualA = Effect:findValue("createItemQualA") --find variable
			findCreateItemQualB, createItemQualB = Effect:findValue("createItemQualB") --find variable
			createItemQual=math.random(createItemQualA,createItemQualB); --create random value between variables

			findCreateGfx, createGfx = Effect:findValue("createGfx") --find variable
  			if findCreateGfx then -- in case we defined a Gfx shown on the created item
				world:gfx(createGfx,posOfItem) --create gfx
				end

			findCreateSound, createSound = Effect:findValue("createSound") --find variable
			if findCreateSound then -- if we have defined a sound for the created item
				world:makeSound(createSound,posOfItem) --create sfx
				end
			until (i==createRepeatX) --stop repeat

		if createItemID ~= 0 then --an item shall be created
			PoscreatedItemX=createItemX
			PoscreatedItemY=createItemY
			world:createItemFromId( createItemID, createItemAmount, posOfItem, true, createItemQual, nil) --creates item
Character:inform("created","created")
Character:inform("Info "..createItemID,"Info "..createItemID)
		end

		createItemTimeA=createItemTimeA+1 --counter for nextcall
--debug("createItemTimeA:"..createItemTimeA)
		findCreateAfterA, createAfterA = Effect:findValue("createAfterA") --find variable
		findCreateAfterB, createAfterB = Effect:findValue("createAfterB") --find variable
		createAfter=math.random(createAfterA,createAfterB);  --create random value between variables
--debug("createAfter:"..createAfter)
		Effect.nextCalled = createAfter --set time for nextcall
		return true --callEffect is needed again, return true necessary

	elseif createItemID ~= 0 then --provide information if something has been created
		findCreateItemPos, createItemPos = Effect:findValue("createItemPos") --find variable
		if findCreateItemPos then -- if we have defined a sound for the created item
			if PoscreatedItemX < Character.pos.x and PoscreatedItemY < Character.pos.y then --set direction of created item based on player
				PosItem=1	
				elseif PoscreatedItemX < Character.pos.x and PoscreatedItemY > Character.pos.y then			
				PosItem=2
				elseif PoscreatedItemX > Character.pos.x and PoscreatedItemY < Character.pos.y then
				PosItem=3
				elseif PoscreatedItemX > Character.pos.x and PoscreatedItemY > Character.pos.y then
				PosItem=4
				elseif PoscreatedItemX < Character.pos.x then
				PosItem=5
				elseif PoscreatedItemX > Character.pos.x then
				PosItem=6
				elseif PoscreatedItemY < Character.pos.y then
				PosItem=7
				elseif PoscreatedItemY > Character.pos.y then
				PosItem=8
				else
				PosItem=9
			end
		end
Character:inform("createItemX: "..createItemX,"createItemX:"..createItemX)
Character:inform("createItemY: "..createItemY,"createItemY:"..createItemY)
Character:inform("PoscreatedItemX: "..PoscreatedItemX,"PoscreatedItemX:"..PoscreatedItemX)
Character:inform("PoscreatedItemY: "..PoscreatedItemY,"PoscreatedItemY:"..PoscreatedItemY)
		findCreateItemText, createItemText = Effect:findValue("createItemText") --find variable
		if createItemText==1 then -- if we have defined text1 for the created item
			base.common.InformNLS(Character,TextDE[createItemText],TextEN[createItemText]); --inform player about result
		end

		if createItemText==2 or createItemText==3 or createItemText==4 or createItemText==5 then -- if we have defined text2..5 for the created item
			Character:inform(""..TextDE[createItemText]..PosItemDE[PosItem],""..TextEN[createItemText]..PosItemEN[PosItem])--inform player about result and the direction
		end
	end

	createItemTimeA=0  --prepare for next script call
	return false -- callEffect is only needed once, no return true necessary

elseif findCreateItemTimeBB then
debug("createItemTimeBB2:"..createItemTimeBB)
Character:inform("run1b","run1b")
	if not createItemTimeAA then --check if false
		createItemTimeAA=0 --set 0 if false
		else
	end
--	local findCreateItemTimeB, createItemTimeB = Effect:findValue("createItemTimeB") --find variable
debug("createItemTimeAA:"..createItemTimeAA)
debug("createItemTimeBB3:"..createItemTimeBB)
Character:inform("run2b","run2b")
 	if createItemTimeAA<createItemTimeBB then --check if smaller; if yes than nextcall
Character:inform("run3b","run3b")
		local findCreateRepeatA, createRepeatA = Effect:findValue("createRepeatA") --find variable
		local findCreateRepeatB, createRepeatB = Effect:findValue("createRepeatB") --find variable
		local createRepeatX=math.random(createRepeatA,createRepeatB) --create random value between variables
		local i=0; --ready for repeat
--debug("createRepeatA:"..createRepeatA)
--debug("createRepeatB:"..createRepeatB)
--debug("createRepeatX:"..createRepeatX)
--debug("i:"..i)
		repeat
		i=i+1; --counter
		findCreateItemID, createItemID = Effect:findValue("createItemID") --find variable

		findCreateItemAmountA, createItemAmountA = Effect:findValue("createItemAmountA") --find variable
		findCreateItemAmountB, createItemAmountB = Effect:findValue("createItemAmountB") --find variable
		createItemAmount=math.random(createItemAmountA,createItemAmountB) --create random value between variables

		findCreateItemXA, createItemXA = Effect:findValue("createItemXA") --find variable
		findCreateItemXB, createItemXB = Effect:findValue("createItemXB") --find variable
		findCreateItemYA, createItemYA = Effect:findValue("createItemYA") --find variable
		findCreateItemYB, createItemYB = Effect:findValue("createItemYB") --find variable
		findCreateItemZA, createItemZA = Effect:findValue("createItemZA") --find variable
		findCreateItemZB, createItemZB = Effect:findValue("createItemZB") --find variable
		createItemX=math.random(createItemXA,createItemXB) --create random value between variables
		createItemY=math.random(createItemYA,createItemYB) --create random value between variables
		createItemZ=math.random(createItemZA,createItemZB) --create random value between variables
		posOfItem = position(createItemX,createItemY,createItemZ) --set value for position
--Character:inform("createItemX: "..createItemX,"createItemX:"..createItemX)
--Character:inform("createItemY: "..createItemY,"createItemY:"..createItemY)
		findCreateItemQualA, createItemQualA = Effect:findValue("createItemQualA") --find variable
		findCreateItemQualB, createItemQualB = Effect:findValue("createItemQualB") --find variable
		createItemQual=math.random(createItemQualA,createItemQualB); --create random value between variables

		findCreateGfx, createGfx = Effect:findValue("createGfx") --find variable
  		if findCreateGfx then -- in case we defined a Gfx shown on the created item
			world:gfx(createGfx,posOfItem) --create gfx
		end

		findCreateSound, createSound = Effect:findValue("createSound") --find variable
		if findCreateSound then -- if we have defined a sound for the created item
			world:makeSound(createSound,posOfItem) --create sfx
		end
		until (i==createRepeatX) --stop repeat

		if createItemID ~= 0 then --an item shall be created
			PoscreatedItemX=createItemX
			PoscreatedItemY=createItemY
			world:createItemFromId( createItemID, createItemAmount, posOfItem, true, createItemQual, nil) --creates item
Character:inform("created","created")
Character:inform("Info "..createItemID,"Info "..createItemID)
		end

		createItemTimeAA=createItemTimeAA+1 --counter for nextcall
--debug("createItemTimeA:"..createItemTimeA)
		findCreateAfterA, createAfterA = Effect:findValue("createAfterA") --find variable
		findCreateAfterB, createAfterB = Effect:findValue("createAfterB") --find variable
		createAfter=math.random(createAfterA,createAfterB);  --create random value between variables
--debug("createAfter:"..createAfter)
		Effect.nextCalled = createAfter --set time for nextcall
		return true --callEffect is needed again, return true necessary
	
	elseif createItemID ~= 0 then --provide information if something has been created
		findCreateItemPos, createItemPos = Effect:findValue("createItemPos") --find variable
		if findCreateItemPos then -- if we have defined a sound for the created item
			if PoscreatedItemX < Character.pos.x and PoscreatedItemY < Character.pos.y then --set direction of created item based on player
				PosItem=1	
				elseif PoscreatedItemX < Character.pos.x and PoscreatedItemY > Character.pos.y then			
				PosItem=2
				elseif PoscreatedItemX > Character.pos.x and PoscreatedItemY < Character.pos.y then
				PosItem=3
				elseif PoscreatedItemX > Character.pos.x and PoscreatedItemY > Character.pos.y then
				PosItem=4
				elseif PoscreatedItemX < Character.pos.x then
				PosItem=5
				elseif PoscreatedItemX > Character.pos.x then
				PosItem=6
				elseif PoscreatedItemY < Character.pos.y then
				PosItem=7
				elseif PoscreatedItemY > Character.pos.y then
				PosItem=8
				else
				PosItem=9
			end
		end
Character:inform("createItemX: "..createItemX,"createItemX:"..createItemX)
Character:inform("createItemY: "..createItemY,"createItemY:"..createItemY)
Character:inform("PoscreatedItemX: "..PoscreatedItemX,"PoscreatedItemX:"..PoscreatedItemX)
Character:inform("PoscreatedItemY: "..PoscreatedItemY,"PoscreatedItemY:"..PoscreatedItemY)
		findCreateItemText, createItemText = Effect:findValue("createItemText") --find variable
		if createItemText==1 then -- if we have defined text1 for the created item
			base.common.InformNLS(Character,TextDE[createItemText],TextEN[createItemText]); --inform player about result
		end

		if createItemText==2 or createItemText==3 or createItemText==4 or createItemText==5 then -- if we have defined text2..5 for the created item
			Character:inform(""..TextDE[createItemText]..PosItemDE[PosItem],""..TextEN[createItemText]..PosItemEN[PosItem])--inform player about result and the direction
		end
	end

	createItemTimeAA=0  --prepare for next script call
	return false -- callEffect is only needed once, no return true necessary
	end
end
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
