-- CreateAfterTime, id 80
-- to create a item after some time
-- see base.character.CreateAfterTime(Character,createAfter,createGfx,createSound)

require("base.common")
module("lte.createaftertime", package.seeall)

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character)
	if not createItemTimeA then
		createItemTimeA=0
		Character:inform("test", "test")
		else
		end

--[[	if createItemTimeA ~= nil then
		createItemTimeA=0
		Character:inform("test", "test")
		else
		end ]]--
	Character:inform("test2", "test2")
	findCreateItemTimeB, createItemTimeB = Effect:findValue("createItemTimeB")
 	if createItemTimeA<createItemTimeB then
--[[	if createItemTimeD < 5 then
		createItemTimeD=createItemTimeD+1
		Character:inform("test3", "test3")
		else
		end]]--
	Character:inform("run", "run")
	findCreateItemID, createItemID = Effect:findValue("createItemID")

	findCreateItemAmountA, createItemAmountA = Effect:findValue("createItemAmountA")
	findCreateItemAmountB, createItemAmountB = Effect:findValue("createItemAmountB")
	createItemAmount=math.random(createItemAmountA,createItemAmountB)

	findCreateItemXA, createItemXA = Effect:findValue("createItemXA")
	findCreateItemXB, createItemXB = Effect:findValue("createItemXB")
	findCreateItemYA, createItemYA = Effect:findValue("createItemYA")
	findCreateItemYB, createItemYB = Effect:findValue("createItemYB")
	findCreateItemZA, createItemZA = Effect:findValue("createItemZA")
	findCreateItemZB, createItemZB = Effect:findValue("createItemZB")
	createItemX=math.random(createItemXA,createItemXB)
	createItemY=math.random(createItemYA,createItemYB)
	createItemZ=math.random(createItemZA,createItemZB)
	posOfItem = position(createItemX,createItemY,createItemZ)

	findCreateItemQualA, createItemQualA = Effect:findValue("createItemQualA")
	findCreateItemQualB, createItemQualB = Effect:findValue("createItemQualB")
	createItemQual=math.random(createItemQualA,createItemQualB);

	findCreateGfx, createGfx = Effect:findValue("createGfx")
  	if findCreateGfx then -- in case we defined a Gfx shown on the created item
		world:gfx(createGfx,posOfItem)
	end

	findCreateSound, createSound = Effect:findValue("createSound")
	if findCreateSound then -- if we have defined a sound for the created item
		world:makeSound(createSound,posOfItem)
	end


	if createItemID ~= 0 then
		world:createItemFromId( createItemID, createItemAmount, posOfItem, true, createItemQual, nil) --creates item
		end

	createItemTimeA=createItemTimeA+1

	findCreateAfterA, createAfterA = Effect:findValue("createAfterA")
	findCreateAfterB, createAfterB = Effect:findValue("createAfterB")
	createAfter=math.random(createAfterA,createAfterB);
	Effect.nextCalled = createAfter
	return true
	else

	createItemTimeA=0
	Character:inform("stop", "stop")
	return false -- callEffect is only needed once, no return true necessary
--	end 
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
