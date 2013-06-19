-- DeathAfterTime, id 36
-- to kill a monster (or a char) after some time
-- see base.character.DeathAfterTime(Character,deathAfter,deathGfx,deathSound)

require("base.common")
module("lte.deathaftertime", package.seeall)

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character) 
  posOfVic = Character.pos
    
  findDeathGfx, deathGfx = Effect:findValue("deathGfx")
  if findDeathGfx then -- in case we defined a Gfx shown on his death
		world:gfx(deathGfx,posOfVic)
   end
   findDeathSound, deathSound = Effect:findValue("deathSound")
   if findDeathSound then -- if we have defined a sound for the death
        world:makeSound(deathSound,posOfVic)
   end
   findBlood, blood = Effect:findValue("blood")
   if findBlood then
	    if not world:isItemOnField(posOfVic) then
			Blood = world:createItemFromId(3101, 1, posOfVic, true, 333, nil)
			Blood.wear = 2
			world:changeItem(Blood)
		end
		for x=-1,1 do
			for y=-1,1 do
				local bloodPos=position( posOfVic.x+x, posOfVic.y+y, posOfVic.z ) )
				if not world:isItemOnField(bloodPos) then
					Blood = world:createItemFromId(3101, 1, bloodPos, true, 333, nil)
					Blood.wear = 2
					world:changeItem(Blood)
				end
			end
		end
    end
   Character:increaseAttrib("hitpoints",-10000) -- die!
   return false
-- callEffect is only needed once, no return true necessary
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end