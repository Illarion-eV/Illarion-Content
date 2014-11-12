--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- LTE für das Druidensystem
-- by Falk
-- Zeitverlauf und Rückwandlung bei Verwandlungen
local common = require("base.common")

local M = {}

-- INSERT INTO longtimeeffects VALUES (329, 'alchemy_transformation', 'alchemy.lte.id_329_transformation');

function getAction(User,Effect,Runde)
	--Hier die eigentlichen Aktionen eintragen  
end
  
function M.addEffect(Effect, User)               -- Nur beim ersten Aufruf
	--User:inform("debug func addEffect")
end

function M.callEffect(Effect,User)   
--User:inform("debug func callEffect")
    
	local findCounter,counterBlack = Effect:findValue("counterBlack")
    if findCounter then 
	  
	   if counterBlack >= 1 then 
		  
		  -- info that the effect will be removed soon
		   if counterBlack == 2 then 
		        common.InformNLS( User,
                "Du spührst, wie ein Schauer über deinen Körper läuft. Deine Verwandlung wird nicht mehr lange andauern.",
                "Shortly, you feel a chill on your skin. Your transformation won't last a long time anymore."
                       )
		   end
		  counterBlack = counterBlack - 1; -- reduce of the effect counter
		  Effect:addValue("counterBlack",counterBlack)
		  local findCounter,counterBlack = Effect:findValue("counterBlack")
		  
		   if counterBlack == 0 then
				-- the effect counter is down to zero; we change the char back
			    return false
		   end
	   end   
   end

   Effect.nextCalled = 600
   return true
end

function M.removeEffect(Effect,User)         
    TransformBack(Effect,User)
end

function M.loadEffect(Effect,User)
   local findCounter,counterBlack = Effect:findValue("counterBlack")	
	if findCounter then	
		if counterBlack > 0 then -- check if the actual effect is still active
		
			local findNewSkincolor1, newSkincolor1 = Effect:findValue("newSkincolor1")
			local findNewSkincolor2, newSkincolor2 = Effect:findValue("newSkincolor2")
			local findNewSkincolor3, newSkincolor3 = Effect:findValue("newSkincolor3")
			local findNewHaircolor1, newHaircolor1 = Effect:findValue("newHaircolor1")
			local findNewHaircolor2, newHaircolor2 = Effect:findValue("newHaircolor2")
			local findNewHaircolor3, newHaircolor3 = Effect:findValue("newHaircolor3")
			local findNewBeard, newBeard = Effect:findValue("newBeard")
			local findNewHair, newHair = Effect:findValue("newHair")
			local findNewSex, newSex = Effect:findValue("newSex")
			
			if findNewSkinColor1 then
				User:setSkinColor(newSkincolor1,newSkincolor2,newSkincolor3)
			end
			if findNewHairColor1 then
				User:setHairColor(newHaircolor1,newHaircolor2,newHaircolor3)
			end
			if findNewBeard then
				User:setBeard(newBeard)
			end
			if findNewHair then
				User:setHair(newHair)
			end
			if findNewSex then
				User:setAttrib("sex",newSex)
			end
			
			local findNewRace, newRace = Effect:findValue("newRace")
			local findNewHeight, newHeight = Effect:findValue("newHeight")
			
			User:setRace(newRace)
			User:setAttrib("body_height",newHeight)
	   end
   end 
end 

function TransformBack(Effect,User)  
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

	local findOldRace, oldRace = Effect:findValue("oldRace")
	local findOldHeight, oldHeight = Effect:findValue("oldHeight")

	User:setRace(oldRace)
	User:setAttrib("body_height",oldHeight) 
 end
return M

