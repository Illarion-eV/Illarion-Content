-- LTE für das Druidensystem
-- by Falk
-- Zeitverlauf und Rückwandlung bei Verwandlungen
require("base.common")

module("druid.lte.id_329_transformation", package.seeall)

-- INSERT INTO longtimeeffects VALUES (329, 'druids_transformation', 'druid.lte.id_329_transformation');

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
		  base.common.InformNLS(User, ""..counterBlack , ""..counterBlack)
		   
		   if counterBlack == 0 then
				-- the effect counter is down to zero; we change the char back
			    TransformBacke(Effect,User) 
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
				findOldSkincolor1, oldSkincolor1 = Effect:findValue("oldSkincolor1")
				findOldSkincolor2, oldSkincolor2 = Effect:findValue("oldSkincolor2")
				findOldSkincolor3, oldSkincolor3 = Effect:findValue("oldSkincolor3")
				findOldHaircolor1, oldHaircolor1 = Effect:findValue("oldHaircolor1")
				findOldHaircolor2, oldHaircolor2 = Effect:findValue("oldHaircolor2")
				findOldHaircolor3, oldHaircolor3 = Effect:findValue("oldHaircolor3")
				findOldBeard, oldBeard = Effect:findValue("oldBeard")
				findOldHair, oldHair = Effect:findValue("oldHair")
				findOldSex, oldSex = Effect:findValue("oldSex")
				
				User:setSkinColor(OldSkincolor1,OldSkincolor2,OldSkincolor3)
				User:setHairColor(OldHaircolor1,OldHaircolor2,OldHaircolor3)
				User:setBeard(OldBeard)
				User:setHair(oldHair)
				User:setAttrib("sex",oldSex)
			end
			findOldRace, oldRace = Effect:findValue("oldRace")
			findOldHeight, oldHeight = Effect:findValue("oldHeight")
			
			User:setAttrib("racetyp",oldRace)
			User:setAttrib("body_height",oldHeight) 
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
        
		User:setSkinColor(OldSkincolor1,OldSkincolor2,OldSkincolor3)
		User:setHairColor(OldHaircolor1,OldHaircolor2,OldHaircolor3)
		User:setBeard(OldBeard)
		User:setHair(oldHair)
	    User:setAttrib("sex",oldSex)
	end
    findOldRace, oldRace = Effect:findValue("oldRace")
	findOldHeight, oldHeight = Effect:findValue("oldHeight")
	
    User:setAttrib("racetyp",oldRace)
	User:setAttrib("body_height",oldHeight) 
 end