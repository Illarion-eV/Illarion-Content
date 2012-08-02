-- DeathAfterTime, id 36
-- to kill a monster (or a char) after some time
-- see base.character.DeathAfterTime(Character,deathAfter,deathGfx)

require("base.common")
module("lte.deathaftertime", package.seeall)

function addEffect(Effect, Character)               				

end

function callEffect(Effect, Character) 
    posOfVic = Character.pos
   
   Character:talkLanguage(Character.say, Player.german, "#me zerfällt zu einer blauen Pfütze.");
   Character:talkLanguage(Character.say, Player.english, "#me collapses into a blue puddle.");
  
  findDeathGfx, deathGfx = Effect:findValue("deathGfx")
   if findDeathGfx then -- in case we defined a Gfx shown on his death
		world:Gfx(deathGfx,posOfVic)
        myList = world:getPlayersInRangeOf(posOfVic,10) 
        for i=1,#myList do
		    base.common.InformNLS(myList[i], "debug 1", "debug 1")
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