-- CreateAfterTime, id 80
-- to create a item after some time
-- see base.character.CreateAfterTime(Character,createAfter,createGfx,createSound)

require("base.common")
module("lte.createaftertime", package.seeall)

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character)
	if not createItemTimeA then --check if false
		createItemTimeA=0 --set 0 if false
		else
		end
	findCreateItemTimeB, createItemTimeB = Effect:findValue("createItemTimeB") --find variable
--debug("createItemTimeA:"..createItemTimeA)
--debug("createItemTimeB:"..createItemTimeB)
 	if createItemTimeA<createItemTimeB then --check if smaller; if yes than nextcall
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
Character:inform("createItemX: "..createItemX,"createItemX:"..createItemX)
Character:inform("createItemY: "..createItemY,"createItemY:"..createItemY)
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
		world:createItemFromId( createItemID, createItemAmount, posOfItem, true, createItemQual, nil) --creates item
		end

	createItemTimeA=createItemTimeA+1 --counter for nextcall
--debug("createItemTimeA:"..createItemTimeA)
	findCreateAfterA, createAfterA = Effect:findValue("createAfterA") --find variable
	findCreateAfterB, createAfterB = Effect:findValue("createAfterB") --find variable
	createAfter=math.random(createAfterA,createAfterB);  --create random value between variables
--debug("createAfter:"..createAfter)
	Effect.nextCalled = createAfter --set time for nextcall
	return true --callEffect is needed again, return true necessary
	else

	createItemTimeA=0  --prepare for next script call
	return false -- callEffect is only needed once, no return true necessary
	end 
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
