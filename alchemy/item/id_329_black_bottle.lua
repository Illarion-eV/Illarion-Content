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
ListSkinColor[0] = {248,198,137;108,64,35;244,231,139;39,23,10;247,207,156}
ListSkinColor[1] = {248,198,137;108,64,35;244,231,139;39,23,10;247,207,156}
ListSkinColor[2] = {248,198,137;108,64,35;244,231,139;39,23,10;247,207,156}
ListSkinColor[3] = {250,238,238;179,138,110;245,230,139}
ListSkinColor[4] = {153,136,67;80,126,38;39,39,39}
ListSkinColor[5] = {79,98,42;20,54,92;242,76,62}

ListHairColor = {}
ListHairColor[0] = {255,204,0;128,128,128;162,77,0;205,51,1;126,59,14}
ListHairColor[1] = {255,204,0;128,128,128;162,77,0;205,51,1;126,59,14}
ListHairColor[2] = {255,204,0;128,128,128;162,77,0;205,51,1;126,59,14}
ListHairColor[3] = {2,19,0;255,249,7;205,51,1}
ListHairColor[4] = {153,1,0;222,217,195;72,36,0}
ListHairColor[5] = {103,17,2;1,1,0;157,88,197}

ListBeard = {}
ListBeard[0] = {0,1,3,4,5,6}
ListBeard[1] = {0,1,1,2,2,4,4} -- 0 means no beard, therefore there is a double chance for the other possibilities;a dwarf without a beard?
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
    
	elseif (potionEffectId >= 200)--[[(potionEffectId > 0)]] and (potionEffectId < 300) then -- transformation potion
	    -- transformation in monster currently deactivated since we have no runnig graphics for them
		--[[if (potionEffectId < 200) then -- monsters, everything which is not a playable race
		    -- new apperance
			newRace = potionEffectId -- the potionEffectId is the race id, there fore we can use this one
			isMonster = 1]]
		
		if (potionEffectId >= 200) then -- the six races playable by players
			-- new apperance
			newSex = potionEffectId - ((math.floor(potionEffectId/10))*10) -- example 251: race id 5 (lizard), sex 1 (female)
			newRace = ((potionEffectId - newSex - 200)/10)
		    isMonster = 0
		end
		-- our old value to change the char later back
		oldRace = User:getRace()
	    oldSkincolor1,oldSkincolor2,oldSkincolor3 = User:getSkinColor()
	    oldHaircolor1,oldHaircolor2,oldHaircolor3 = User:getHairColor()
	    oldSex = User:increaseAttrib("sex",0)
	    oldHair = User:getHair()
	    oldBeard = User:getBeard()
	    oldHeight = User:increaseAttrib("body_height",0)
		
		-- check if there is already a an effect
		find, myEffect = User.effects:find(329)
		if find then
		    findNewRace, LteNewRace = myEffect:findValue("newRace")
			findCounter,counterBlack = myEffect:findValue("counterBlack")
			if findNewRace then
				if LteNewRace == newRace then
					local duration = 3 -- to be replaced with a formula with the potion's quality being the changeabale varibale
					if duration > counterBlack then -- same transformation, but the new potion will last longer
						myEffect:addValue("counterBlack",duration)
					    return
					end
				else -- not the same transformation; we need to get the old apperance values from the LTE
			        findIsMonster, isMonster = myEffect:findValue("isMonster")
					if isMonster == 1 then
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
					effectRemoved = User.effects:removeEffect(329)
					if not effectRemove then
					    base.common.InformNLS( User,"Fehler: informiere einen dev. lte nicht entfernt. black bottle script", "Error: inform dev. Lte not removed. black bottle script.")
			            return
					end	
			    end
			end
		end
	
		if (potionEffectId >= 200) then -- the six races playable by players
			-- new apperance
			
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
	       HairColorRandomPosition = ((math.random(1,(#ListHairColor[newRace]/3)))*3)
		   newHaircolor1 = ListHairColor[newRace][HairColorRandomPosition-2]
		   newHaircolor2 = ListHairColor[newRace][HairColorRandomPosition-1]
		   newHaircolor3 = ListHairColor[newRace][HairColorRandomPosition]
		   
		   SkinColorRandomPosition = ((math.random(1,(#ListSkinColor[newRace]/3)))*3)
		   newSkincolor1 = ListSkinColor[newRace][SkinColorRandomPosition-2]
		   newSkincolor2 = ListSkinColor[newRace][SkinColorRandomPosition-1]
		   newSkincolor3 = ListSkinColor[newRace][SkinColorRandomPosition]
		
		end
		newHeight = math.random(80,120)
		
		-- LTE and transformation
	   find, myEffect = User.effects:find(329)
	   if not find then
		  
		  myEffect = LongTimeEffect(329,1)
		  
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
		  duration = 5 -- to be replaced with a formula with the potion's quality being the varibale
		  myEffect:addValue("counterBlack",duration)
		  User.effects:addEffect(myEffect)
        end
	
	elseif (potionEffectId >= 300) then
           -- place for other, non-transformation effects
 	end
end


function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
    
	if not ((SourceItem:getData("potionEffectId")~="") or (SourceItem:getData("essenceBrew") =="true")) then
		return -- no potion, no essencebrew, something else
	end
	
	if base.common.GetFrontItemID(User) == 1008 then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	
	   -- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  User:talkLanguage(Character.say, Player.german, "nur alchemisten");
          base.common.InformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here.")
		  return;
	    end
	   
	   if ( ltstate == Action.abort ) then
	        base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
		
		if ( ltstate == Action.none ) then
            if (SourceItem:getData("essenceBrew") =="true") and (cauldron:getData("stockData") ~= "") then
		        actionDuration = 40 -- when we combine a stock and an essence brew, it takes longer
            else
                actionDuration = 20
            end				
			User:startAction( actionDuration, 21, 5, 10, 45)
			return
		end	
		
	   if (SourceItem:getData("essenceBrew") =="true") then -- essence brew should be filled into the cauldron
			-- water, essence brew or potion is in the cauldron; leads to a failure
			if cauldron:getData("cauldronFilledWith") == "water" then
			    world:gfx(1,cauldron.pos)
		        base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Gebräu hinzu tust.", 
		                                    "The substance in the cauldron blows out, as you fill the mixture in.")
			    cauldron:setData("cauldronFilledWith","")
			
			elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
			     druid.base.alchemy.CauldronExplosion(User,cauldron,{4,44})
			
			elseif cauldron:getData("potionEffectId") ~= "" then
			     if cauldron:getData("potionId") == "165" then -- support potion
			        druid.item.id_165_blue_bottle.SupportEssencebrew(User,cauldron,SourceItem)
			     else
				    druid.base.alchemy.CauldronExplosion(User,cauldron,{4,45})
			     end
			
			elseif cauldron:getData("stockData") ~= "" then -- stock is in the cauldron; we call the combin function
				druid.base.alchemy.CombineStockEssence( User, SourceItem, cauldron, Counter, Param, ltstate )
				
			else -- nothing in the cauldron, we just fill in the essence brew
				cauldron:setData("cauldronFilledWith","essenceBrew")
				cauldron:setData("potionId",""..SourceItem.id)
				cauldron:setData("essenceHerbs",SourceItem:getData("essenceHerbs"))
			end
		
		    SourceItem:setData("essenceBrew","")
			SourceItem:setData("potionId","")
			SourceItem:setData("essenceHerbs")
			
		elseif (SourceItem:getData("potionEffectId")~="") then -- potion should be filled into the cauldron
		    -- water, essence brew, potion or stock is in the cauldron; leads to a failure
			if cauldron:getData("cauldronFilledWith") == "water" then
			    world:gfx(1,cauldron.pos)
		        base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Wasser hinzu tust.", 
		                            "The substance in the cauldron blows out, as you fill the water in.")
			    cauldron:setData("cauldronFilledWith","")
			
			elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
			    druid.base.alchemy.CauldronExplosion(User,cauldron,{4,45})
			
			elseif cauldron:getData("potionEffectId") ~= "" then
			    if cauldron:getData("potionId") == "165" then -- support potion
			        druid.item.id_165_blue_bottle.SupportPotion(User,cauldron,SourceItem)
			    else
				    druid.base.alchemy.CauldronExplosion(User,cauldron,{4,38})
			    end
			
			elseif cauldron:getData("stockData") ~= "" then
				druid.base.alchemy.CauldronExplosion(User,cauldron,{4,36})
			
			else -- nothing in the cauldron, we just fill in the potion
                cauldron:setData("potionEffectId",SourceItem:getData("potionEffectId"))
                cauldron:setData("potionId",""..SourceItem.id)
				cauldron:setData("potionQuality",""..SourceItem.quality)
			end
                
            SourceItem:setData("potionEffectId","")
			SourceItem:setData("potionId","")				
			SourceItem:setData("potionQuality","")
		end
	    if math.random(1,20) == 1 then
		    world:erase(SourceItem,1)	 -- bottle breaks
		    base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.")
        else	
		    SourceItem.id = 164
			SourceItem.quality = 333
			world:changeItem(SourceItem)
        end
		world:changeItem(cauldron)		
			
    else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während Du kämpfst.", "You cannot use the potion while fighting.")
		else
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine schwarze Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a black liquid.");
			SourceItem.id = 164
			SourceItem.quality = 333
			if math.random(1,20) == 1 then
			   world:erase(SourceItem,1) -- bottle breaks
			   base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.")
			else	
				world:changeItem(SourceItem)
			end
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem)
	    end
	end  
end
	
function LookAtItem(User,Item)
end