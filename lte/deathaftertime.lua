-- KillAfterTime, id xxx
-- to kill a monster (or a char) after some time


require("base.common")

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character) 

   findDeathGfx, deathGfx = Effect:findValue("deathGfx")
   if findDeathGfx then -- in case we defined a Gfx shown on his death
		world:Gfx(deathGfx,Character.pos)
   end
   Character:increaseAttrib("hitpoints",-10000) -- die!
   return false
-- callEffect is only needed once, no return true necessary
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end