-- CreateAfterTime, id 80
-- to create a item after some time
-- see base.character.CreateAfterTime(Character,createAfter,createGfx,createSound)

require("base.common")
module("lte.createaftertime", package.seeall)

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character)
	findCreateItemX, createItemX = Effect:findValue("createItemX")
	findCreateItemY, createItemY = Effect:findValue("createItemZ")
	findCreateItemZ, createItemZ = Effect:findValue("createItemY")
	posOfItem = position(createItemX,createItemY,createItemZ)
    
	findCreateGfx, createGfx = Effect:findValue("createGfx")
  	if findCreateGfx then -- in case we defined a Gfx shown on the created item
		world:gfx(createGfx,posOfItem)
	end

	findCreateSound, createSound = Effect:findValue("createSound")
	if findCreateSound then -- if we have defined a sound for the created item
		world:makeSound(createSound,posOfItem)
	end

	findCreateItemID, CreateItemID = Effect:findValue("createItemID")
	findCreateItemAmount, CreateItemAmount = Effect:findValue("createItemAmount")
	findCreateItemQual, CreateItemQual = Effect:findValue("createItemQual")

	world:createItemFromId( createItemID, createItemAmount, position(createItemX,createItemY,createItemZ), true, createItemQual, nil) --creates item
   	return false -- callEffect is only needed once, no return true necessary
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end
