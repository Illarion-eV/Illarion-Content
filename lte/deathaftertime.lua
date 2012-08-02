-- DeathAfterTime, id 36
-- to kill a monster (or a char) after some time
-- see base.character.DeathAfterTime(Character,deathAfter,deathGfx)

require("base.common")
module("lte.deathaftertime", package.seeall)

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character) 
    posOfVic = Character.pos
    base.common.TalkNLS(Character, Character.say, "#me zerfällt zu einer blauen Pfütze.", "#me collapses into a blue puddle.")
   
  findDeathGfx, deathGfx = Effect:findValue("deathGfx")
  if findDeathGfx then -- in case we defined a Gfx shown on his death
		debug("lte 2")
		world:gfx(deathGfx,posOfVic)
   end
   Character:increaseAttrib("hitpoints",-10000) -- die!
   return false
-- callEffect is only needed once, no return true necessary
end

function removeEffect(Effect,User)

end

function loadEffect(Effect,User)                  			

end