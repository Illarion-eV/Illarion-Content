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
    
	local findCounter,counterBlack = Effect:findValue("counterBlack")
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
		  local findCounter,counterBlack = Effect:findValue("counterBlack")
		  
		   if counterBlack == 0 then
				-- the effect counter is down to zero; we change the char back
			    TransformBack(Effect,User) 
		        return false
		   end
	   end   
   end

   Effect.nextCalled = 60
   return true
end

function removeEffect(Effect,User)         
end

function loadEffect(Effect,User)
   local findCounter,counterBlack = Effect:findValue("counterBlack")	
	if findCounter then	
	   if counterBlack > 0 then -- check if the actual effect is still active
		
			local findIsMonster, isMonster = Effect:findValue("isMonster")
			if isMonster ~= 1 then
				local finnNewSkincolor1, newSkincolor1 = Effect:findValue("newSkincolor1")
				local finnNewSkincolor2, newSkincolor2 = Effect:findValue("newSkincolor2")
				local finnNewSkincolor3, newSkincolor3 = Effect:findValue("newSkincolor3")
				local finnNewHaircolor1, newHaircolor1 = Effect:findValue("newHaircolor1")
				local finnNewHaircolor2, newHaircolor2 = Effect:findValue("newHaircolor2")
				local finnNewHaircolor3, newHaircolor3 = Effect:findValue("newHaircolor3")
				local finnNewBeard, newBeard = Effect:findValue("newBeard")
				local finnNewHair, newHair = Effect:findValue("newHair")
				local finnNewSex, newSex = Effect:findValue("newSex")
				
				User:setSkinColor(newSkincolor1,newSkincolor2,newSkincolor3)
				User:setHairColor(newHaircolor1,newHaircolor2,newHaircolor3)
				User:setBeard(newBeard)
				User:setHair(newHair)
				User:setAttrib("sex",newSex)
			end
			local finnNewRace, newRace = Effect:findValue("newRace")
			local finnNewHeight, newHeight = Effect:findValue("newHeight")
			
			User:setAttrib("racetyp",newRace)
			User:setAttrib("body_height",newHeight) 
            User:increaseAttrib("hitpoints",-10) -- to make the effect vissible
	        User:increaseAttrib("hitpoints",10)
	   end
   end 
end 

function TransformBack(Effect,User)  
    -- give the char his original appeance back
	local findIsMonster, isMonster = Effect:findValue("isMonster")
	if isMonster ~= 1 then
	    local findOldSkincolor1, oldSkincolor1 = Effect:findValue("oldSkincolor1")
	    local findOldSkincolor2, oldSkincolor2 = Effect:findValue("oldSkincolor2")
	    local findOldSkincolor3, oldSkincolor3 = Effect:findValue("oldSkincolor3")
		local findOldHaircolor1, oldHaircolor1 = Effect:findValue("oldHaircolor1")
	    local findOldHaircolor2, oldHaircolor2 = Effect:findValue("oldHaircolor2")
	    local findOldHaircolor3, oldHaircolor3 = Effect:findValue("oldHaircolor3")
		local findOldBeard, oldBeard = Effect:findValue("oldBeard")
        local findOldHair, oldHair = Effect:findValue("oldHair")
		local findOldSex, oldSex = Effect:findValue("oldSex")
        
		User:setSkinColor(oldSkincolor1,oldSkincolor2,oldSkincolor3)
		User:setHairColor(oldHaircolor1,oldHaircolor2,oldHaircolor3)
		User:setBeard(oldBeard)
		User:setHair(oldHair)
	    User:setAttrib("sex",oldSex)
	end
    local findOldRace, oldRace = Effect:findValue("oldRace")
	local findOldHeight, oldHeight = Effect:findValue("oldHeight")
	
    User:setAttrib("racetyp",oldRace)
	User:setAttrib("body_height",oldHeight) 
 end