-- LTE für das Druidensystem
-- by Falk
-- Zeitverlauf und Rückwandlung bei Verwandlungen
require("base.common")

module("alchemy.lte.id_329_transformation", package.seeall)

-- INSERT INTO longtimeeffects VALUES (329, 'alchemy_transformation', 'alchemy.lte.id_329_transformation');

function getAction(User,Effect,Runde)
	--Hier die eigentlichen Aktionen eintragen  
end
  
function addEffect(Effect, User)               -- Nur beim ersten Aufruf
	--User:inform("debug func addEffect")
end

function callEffect(Effect,User)   
--User:inform("debug func callEffect")
    
	findCounter,counterBlack = Effect:findValue("counterBlack")
    if findCounter then 
	  
	   if counterBlack >= 1 then 
		  
		  -- info that the effect will be removed soon
		   if counterBlack == 2 then 
		        base.common.InformNLS( User,
                "Du spührst, wie ein Schauer über deinen Körper läuft. Deine Verwandlung wird nicht mehr lange andauern.",
                "Shortly, you feel a chill on your skin. Your transformation won't last a long time anymore."
                       )
		   end
		  counterBlack = counterBlack - 1; -- reduce of the effect counter
		  Effect:addValue("counterBlack",counterBlack)
		  findCounter,counterBlack = Effect:findValue("counterBlack")
		  
		   if counterBlack == 0 then
				-- the effect counter is down to zero; we change the char back
			    TransformBack(Effect,User) 
		        return false
		   end
	   end   
   end

   Effect.nextCalled = 50
   return true
end

function removeEffect(Effect,User)         
end

function loadEffect(Effect,User)
    findCounter,counterBlack = Effect:findValue("counterBlack")	
	if findCounter then	
	   if counterBlack > 0 then -- check if the actual effect is still active
		
			findIsMonster, isMonster = Effect:findValue("isMonster")
			if isMonster ~= 1 then
				finnNewSkincolor1, newSkincolor1 = Effect:findValue("newSkincolor1")
				finnNewSkincolor2, newSkincolor2 = Effect:findValue("newSkincolor2")
				finnNewSkincolor3, newSkincolor3 = Effect:findValue("newSkincolor3")
				finnNewHaircolor1, newHaircolor1 = Effect:findValue("newHaircolor1")
				finnNewHaircolor2, newHaircolor2 = Effect:findValue("newHaircolor2")
				finnNewHaircolor3, newHaircolor3 = Effect:findValue("newHaircolor3")
				finnNewBeard, newBeard = Effect:findValue("newBeard")
				finnNewHair, newHair = Effect:findValue("newHair")
				finnNewSex, newSex = Effect:findValue("newSex")
				
				User:setSkinColor(newSkincolor1,newSkincolor2,newSkincolor3)
				User:setHairColor(newHaircolor1,newHaircolor2,newHaircolor3)
				User:setBeard(newBeard)
				User:setHair(newHair)
				User:setAttrib("sex",newSex)
			end
			finnNewRace, newRace = Effect:findValue("newRace")
			finnNewHeight, newHeight = Effect:findValue("newHeight")
			
			User:setAttrib("racetyp",newRace)
			User:setAttrib("body_height",newHeight) 
            User:increaseAttrib("hitpoints",-10) -- to make the effect vissible
	        User:increaseAttrib("hitpoints",10)
	   end
   end 
end 

function TransformBack(Effect,User)  
    -- give the char his original appeance back
	findIsMonster, isMonster = Effect:findValue("isMonster")
	if isMonster ~= 1 then
	    findOldSkincolor1, oldSkincolor1 = Effect:findValue("oldSkincolor1")
	    findOldSkincolor2, oldSkincolor2 = Effect:findValue("oldSkincolor2")
	    findOldSkincolor3, oldSkincolor3 = Effect:findValue("oldSkincolor3")
		findOldHaircolor1, oldHaircolor1 = Effect:findValue("oldHaircolor1")
	    findOldHaircolor2, oldHaircolor2 = Effect:findValue("oldHaircolor2")
	    findOldHaircolor3, oldHaircolor3 = Effect:findValue("oldHaircolor3")
		findOldBeard, oldBeard = Effect:findValue("oldBeard")
        findOldHair, oldHair = Effect:findValue("oldHair")
		findOldSex, oldSex = Effect:findValue("oldSex")
        
		User:setSkinColor(oldSkincolor1,oldSkincolor2,oldSkincolor3)
		User:setHairColor(oldHaircolor1,oldHaircolor2,oldHaircolor3)
		User:setBeard(oldBeard)
		User:setHair(oldHair)
	    User:setAttrib("sex",oldSex)
	end
    findOldRace, oldRace = Effect:findValue("oldRace")
	findOldHeight, oldHeight = Effect:findValue("oldHeight")
	
    User:setAttrib("racetyp",oldRace)
	User:setAttrib("body_height",oldHeight) 
 end