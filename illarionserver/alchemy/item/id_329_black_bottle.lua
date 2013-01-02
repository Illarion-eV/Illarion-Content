--I_329_schwarze_flasche
--Druidensystem in Arbeit
--Falk
-- complete rework by merung, 2011

require("base.common")
require("alchemy.base.alchemy")
require("alchemy.item.id_165_blue_bottle")

module("alchemy.item.id_329_black_bottle",package.seeall); --, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='alchemy.item.id_329_black_bottle' WHERE com_itemid = 329;

--lists for HUMANS, DWARVES, HALFLINGS, ELVES, ORCS and LIZARDS
-- apperance lists with the different values for the six races
-- 0 = human; 1 = dwarf; 2 = halfling; 3 = elf; 4 = orc; 5 = lizard
-- the color sets are seperated by ; while the three values of each set are seperated by ,
ListSkinColor = {}
ListSkinColor[0] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[1] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[2] = {246, 218, 181;243, 185, 111; 210, 146, 110;172, 116, 59;69, 42, 21;250, 199, 168}
ListSkinColor[3] = {227, 217, 213;239, 188, 137;215, 172, 134;188, 124, 95;196, 197, 157;221, 181, 145}
ListSkinColor[4] = {139, 123, 63;84, 134, 37;99, 132, 53;169, 144, 51;125, 92, 49;84, 101, 56}
ListSkinColor[5] = {104, 128, 52;235, 173, 0;159, 59, 59;82, 181, 138;21, 53, 91;184, 135, 214}

ListHairColor = {}
ListHairColor[0] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[1] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[2] = {255, 249, 7;162, 77, 0;95, 23, 0;216, 216, 216;39, 39, 39;119, 56, 3}
ListHairColor[3] = {255, 249, 7;104, 128, 52;108, 64, 35;108, 62, 46;216, 216, 216;21, 53, 91}
ListHairColor[4] = {162, 76, 0;116, 1, 4;139, 123, 61;39, 39, 39;166, 166, 166;58, 28, 4}
ListHairColor[5] = {239, 231, 0;154, 0, 0;72, 36, 0;28, 26, 48;44, 115, 133;96, 153, 46}

ListBeard = {}
ListBeard[0] = {0,1,3,4,5,6}
ListBeard[1] = {1,2,4}
ListBeard[2] = {0}
ListBeard[3] = {0}
ListBeard[4] = {0}
ListBeard[5] = {0}

ListHairMale = {}
ListHairMale[0] = {0,1,2,3}
ListHairMale[1] = {0,1,2,3}
ListHairMale[2] = {0,1,2}
ListHairMale[3] = {1,2}
ListHairMale[4] = {0,1,2,3,4,5}
ListHairMale[5] = {1,2,3,4,5,6}

ListHairFemale = {}
ListHairFemale[0] = {1,7,8}
ListHairFemale[1] = {1,7,9}
ListHairFemale[2] = {1,2,9}
ListHairFemale[3] = {1,7,8}
ListHairFemale[4] = {1,7,8}
ListHairFemale[5] = {1,2,3,4,5,6}

function DrinkPotion(User,SourceItem)
    
    potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
    
	if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
    
	elseif (potionEffectId >= 500)--[[(potionEffectId > 0)]] and (potionEffectId < 599) then -- transformation potion
	    -- MONSTER DEACTIVATED!!! no runnig graphics = no shape shifter potions
		
		--[[if (potionEffectId < 200) then -- monsters, everything which is not a playable race
		    -- new apperance
			newRace = potionEffectId -- the potionEffectId is the race id, there fore we can use this one
			isMonster = 1]]
		
		-- new apperance
		local newSex = potionEffectId - ((math.floor(potionEffectId/10))*10) -- example 551: race id 5 (lizard), sex 1 (female)
		local newRace = math.floor(((potionEffectId - newSex - 500)/10))
		local isMonster = 0
		-- our old value to change the char later back
		local oldRace = User:getRace()
	    local oldSkincolor1,oldSkincolor2,oldSkincolor3 = User:getSkinColor()
	    local oldHaircolor1,oldHaircolor2,oldHaircolor3 = User:getHairColor()
	    local oldSex = User:increaseAttrib("sex",0)
	    local oldHair = User:getHair()
	    local oldBeard = User:getBeard()
	    local oldHeight = User:increaseAttrib("body_height",0)
		
		-- check if there is already a an effect
		local  find, myEffect = User.effects:find(329)
		local findOldRace, findOldHeight
		if find then
		    local  findNewRace, LteNewRace = myEffect:findValue("newRace")
			local findCounter,counterBlack = myEffect:findValue("counterBlack")
			if findNewRace then
				if LteNewRace == newRace then
					local duration = 3 -- to be replaced with a formula with the potion's quality being the changeabale varibale
					if duration > counterBlack then -- same transformation, but the new potion will last longer
						myEffect:addValue("counterBlack",duration)
					    return
					end
				else -- not the same transformation; we need to get the old apperance values from the LTE
			       local findIsMonster, isMonster = myEffect:findValue("isMonster")
					if isMonster ~= 1 then
					    findOldSkincolor1, oldSkincolor1 = myEffect:findValue("oldSkincolor1")
						findOldSkincolor2, oldSkincolor2 = myEffect:findValue("oldSkincolor2")
						findOldSkincolor3, oldSkincolor3 = myEffect:findValue("oldSkincolor3")
						findOldHaircolor1, oldHaircolor1 = myEffect:findValue("oldHaircolor1")
						findOldHaircolor2, oldHaircolor2 = myEffect:findValue("oldHaircolor2")
						findOldHaircolor3, oldHaircolor3 = myEffect:findValue("oldHaircolor3")
					    findOldHair, oldHair = myEffect:findValue("oldHair")
						findOldBeard, oldBeard = myEffect:findValue("oldBeard")
					    findOldSex, oldSex = myEffect:findValue("oldSex")
					end	
					findOldRace, oldRace = myEffect:findValue("oldRace")
					findOldHeight, oldHeight = myEffect:findValue("oldHeight")
					-- and remove the old effect
					local effectRemoved = User.effects:removeEffect(329)
					if not effectRemoved then
					    base.common.InformNLS( User,"Fehler: informiere einen dev. lte nicht entfernt. black bottle script", "Error: inform dev. Lte not removed. black bottle script.")
			            return
					end	
			    end
			end
		end
	    local newBeard, newHair
		if (newRace <= 1) and (newSex == 0) then -- only male humans or dwarves get a beard
		  newBeard = ListBeard[newRace][math.random(1,#ListBeard)]
	   else
		  newBeard = 0
	   end
	   if (newSex) == 0 then
		  newHair = ListHairMale[newRace][math.random(1,#ListHairMale[newRace])]
	   else
		  newHair = ListHairFemale[newRace][math.random(1,#ListHairFemale[newRace])]
	   end
	   local HairColorRandomPosition = ((math.random(1,(#ListHairColor[newRace]/3)))*3)
	   local newHaircolor1 = ListHairColor[newRace][HairColorRandomPosition-2]
	   local newHaircolor2 = ListHairColor[newRace][HairColorRandomPosition-1]
	   local newHaircolor3 = ListHairColor[newRace][HairColorRandomPosition]
	   
	   local SkinColorRandomPosition = ((math.random(1,(#ListSkinColor[newRace]/3)))*3)
	   local newSkincolor1 = ListSkinColor[newRace][SkinColorRandomPosition-2]
	   local newSkincolor2 = ListSkinColor[newRace][SkinColorRandomPosition-1]
	   local newSkincolor3 = ListSkinColor[newRace][SkinColorRandomPosition]
		
	   local newHeight = math.random(80,120)
		
		-- LTE and transformation
	   local find, myEffect = User.effects:find(329)
	   if not find then
		  
		 local myEffect = LongTimeEffect(329,1)
		     
			-- saving of the old values
			  if isMonster ~= 1 then -- we transform him into an other memeber of on of the six races, so we need to save those old values
					myEffect:addValue("oldSex",oldSex)
					myEffect:addValue("oldHair",oldHair)
					myEffect:addValue("oldBeard",oldBeard)
					myEffect:addValue("oldSkincolor1",oldSkincolor1)
					myEffect:addValue("oldSkincolor2",oldSkincolor2)
					myEffect:addValue("oldSkincolor3",oldSkincolor3)
					myEffect:addValue("oldHaircolor1",oldHaircolor1)
					myEffect:addValue("oldHaircolor2",oldHaircolor2)
					myEffect:addValue("oldHaircolor3",oldHaircolor3)
			  
					myEffect:addValue("newSex",newSex)
					myEffect:addValue("newHair",newHair)
					myEffect:addValue("newBeard",newBeard)
					myEffect:addValue("newSkincolor1",newSkincolor1)
					myEffect:addValue("newSkincolor2",newSkincolor2)
					myEffect:addValue("newSkincolor3",newSkincolor3)
					myEffect:addValue("newHaircolor1",newHaircolor1)
					myEffect:addValue("newHaircolor2",newHaircolor2)
					myEffect:addValue("newHaircolor3",newHaircolor3)      
			  
			  end
			    myEffect:addValue("oldRace",oldRace)
				myEffect:addValue("oldHeight",oldHeight)
				myEffect:addValue("newRace",newRace)
				myEffect:addValue("newHeight",newHeight)
				myEffect:addValue("isMonster",isMonster)
		    
		  -- transformation
		  if isMonster ~= 1 then
			 User:setAttrib("sex",newSex)
			 User:setHair(newHair)
			 User:setBeard(newBeard)
			 User:setSkinColor(newSkincolor1,newSkincolor2,newSkincolor3)
			 User:setHairColor(newHaircolor1,newHaircolor2,newHaircolor3)
		  end
		  User:setAttrib("racetyp",newRace)
		  User:setAttrib("body_height",newHeight)
		  
		  -- to make the changes visible
		  User:increaseAttrib("hitpoints",-10)
		  User:increaseAttrib("hitpoints",10)

		  -- duration depends on the potion's quality
		 local duration = math.floor(SourceItem.quality/100)*10 -- effect is called every minute. quality 1 = 10 minutes; quality 9 = 90
		  myEffect:addValue("counterBlack",duration)
		  User.effects:addEffect(myEffect)
        end
	end
end


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.base.alchemy.FillIntoCauldron(User,SourceItem,cauldron,Counter,Param,ltstate)
	
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine schwarze Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a black liquid.");
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
	    end
	end  
end
	
function LookAtItem(User,Item)
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
end