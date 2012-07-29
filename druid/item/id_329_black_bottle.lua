--I_329_schwarze_flasche
--Druidensystem in Arbeit
--Falk
-- complete rework by merung, 2011

require("base.common")
require("druid.base.alchemy")

module("druid.item.id_329_black_bottle",package.seeall); --, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_329_black_bottle' WHERE com_itemid = 329;

function DrinkPotion(User,SourceItem)
    User:talkLanguage(Character.say, Player.german, "debugging 0");
	if SourceItem:getData("essenceBrew") == "true" then
        User:talkLanguage(Character.say, Player.german, "debugging 1");
		if base.common.GetFrontItemID(User) == 1008 then
	        cauldron = base.common.GetFrontItem( User );
	        if cauldron:getData("stockData") ~= "" then
			    User:talkLanguage(Character.say, Player.german, "debugging 2");
				druid.base.alchemy.CombineStockEssence( User, SourceItem, TargetItem, Counter, Param, ltstate )
			else
			    User:talkLanguage(Character.say, Player.german, "no stock");
			end
		else
		    User:talkLanguage(Character.say, Player.german, "no cauldron");
        end
		return  	
	end
	
	ListPotionEffect = {"pax","bellum"}
	
	if SourceItem:getData("potionEffectId") == "0" then
	    User:talkLanguage(Character.say, Player.german, "no potion effect")
        world:erase(SourceItem,1)
	else
	    potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
		User:talkLanguage(Character.say, Player.german, ""..ListPotionEffect[potionEffectId])
	    world:erase(SourceItem,1)
	end	
	    
	    
   --[[potionData = tonumber(SourceItem:getData("potionData"));
   
   -- if there is an active transformation and the potion belongs to the transformation
   -- and the counter of the new potion would be higher than raise the counter
   find, myEffect = User.effects:find(329)
	if find then
	   findCodecValue, CodecValue = myEffect:findValue("CodecValue")
	    findCounter,counterBlack = myEffect:findValue("counterBlack")
		if findCodecValue then
	        if CodecValue == potionData and (counterBlack ~= 0) then
	            local duration = 3 -- to be replaced with a formula with the potion's quality being the changeabale varibale
                if duration > counterBlack then
				    myEffect:addValue("counterBlack",duration)
                end
			end
		end
      return
    end	  
   
   -- old values (so that the char can be changed back later)
   old_race = User:getRace()
   old_skincolor1,old_skincolor2,old_skincolor3 = User:getSkinColor()
   old_haircolor1,old_haircolor2,old_haircolor3 = User:getHairColor()
   old_sex = User:increaseAttrib("sex",0)
   old_hair = User:getHair()
   old_beard = User:getBeard()
   old_height = User:increaseAttrib("body_height",0)
   
   -- first, the six races
   ListCodecs1 = {}
   ListRaceID1 = {}
   ListSex1    = {}
   ListCodecs1 = {15555555,25555555,51555555,52555555,55155555,55255555,55515555,55525555,55551555,55552555,55555155,55555255}
   ListRaceID1 = {0       ,0       ,1       ,1       ,2       ,2       ,3       ,3       ,4       ,4       ,5       ,5       }
   ListSex1    = {0       ,1       ,0       ,1       ,0       ,1       ,0       ,1       ,0       ,1       ,0       ,1       }
   
   for i=1,table.getn(ListCodecs1) do
       if potionData == ListCodecs1[i] then
  
		   -- we create our lists with the different values for the six races
		   -- 1 = human; 2 = dwarf; 3 = halfling; 4 = elf; 5 = orc; 6 = lizard
		   -- note that the lists' numbers do not match the race ids! They are race Id + 1
		   
		   -- the color sets are seperated by ; while the three values of each set are seperated by ,
		   ListSkinColor = {}
		   ListSkinColor[1] = {248,198,137;108,64,35;244,231,139;39,23,10;247,207,156}
		   ListSkinColor[2] = {248,198,137;108,64,35;244,231,139;39,23,10;247,207,156}
		   ListSkinColor[3] = {248,198,137;108,64,35;244,231,139;39,23,10;247,207,156}
		   ListSkinColor[4] = {250,238,238;179,138,110;245,230,139}
		   ListSkinColor[5] = {153,136,67;80,126,38;39,39,39}
		   ListSkinColor[6] = {79,98,42;20,54,92;242,76,62}
		   
		   ListHairColor = {}
		   ListHairColor[1] = {255,204,0;128,128,128;162,77,0;205,51,1;126,59,14}
		   ListHairColor[2] = {255,204,0;128,128,128;162,77,0;205,51,1;126,59,14}
		   ListHairColor[3] = {255,204,0;128,128,128;162,77,0;205,51,1;126,59,14}
		   ListHairColor[4] = {2,19,0;255,249,7;205,51,1}
		   ListHairColor[5] = {153,1,0;222,217,195;72,36,0}
		   ListHairColor[6] = {103,17,2;1,1,0;157,88,197}
		   
		   ListBeard = {}
		   ListBeard[1] = {0,1,3,4,5,6}
		   ListBeard[2] = {0,1,1,2,2,4,4} -- 0 means no beard, therefore there is a double chance for the other possibilities;a dwarf without a beard?
      	   ListBeard[3] = {0}
		   ListBeard[4] = {0}
		   ListBeard[5] = {0}
		   ListBeard[6] = {0}
		   
		   ListHairMale = {}
		   ListHairMale[1] = {0,1,2,3}
		   ListHairMale[2] = {0,1,2,3}
		   ListHairMale[3] = {0,1,2}
		   ListHairMale[4] = {1,2}
		   ListHairMale[5] = {0,1,2,3,4,5}
		   ListHairMale[6] = {1,2,3,4,5,6}
		   
		   ListHairFemale = {}
		   ListHairFemale[1] = {1,7,8}
		   ListHairFemale[2] = {1,7,9}
		   ListHairFemale[3] = {1,2,9}
		   ListHairFemale[4] = {1,7,8}
		   ListHairFemale[5] = {1,7,8}
		   ListHairFemale[6] = {1,2,3,4,5,6}
	   
	       -- we put our new values together
		   new_race = ListRaceID1[i]
	       new_sex = ListSex1[i]
	       if (new_race <= 1) and (new_sex == 0) then -- only male humans or dwarves get a beard
	          new_beard = ListBeard[(new_race)+1][math.random(1,#ListBeard)]
	       else
		      new_beard = 0
	       end
	       if (new_sex) == 0 then
		      new_hair = ListHairMale[(new_race)+1][math.random(1,#ListHairMale[(new_race)+1])]
	       else
		      new_hair = ListHairFemale[(new_race)+1][math.random(1,#ListHairFemale[(new_race)+1])]
	       end
	       
		   HairColorRandomPosition = ((math.random(1,(#ListHairColor[(new_race)+1]/3)))*3)
		   new_haircolor1 = ListHairColor[(new_race)+1][HairColorRandomPosition-2]
		   new_haircolor2 = ListHairColor[(new_race)+1][HairColorRandomPosition-1]
		   new_haircolor3 = ListHairColor[(new_race)+1][HairColorRandomPosition]
		   
		   SkinColorRandomPosition = ((math.random(1,(#ListSkinColor[(new_race)+1]/3)))*3)
		   new_skincolor1 = ListSkinColor[(new_race)+1][SkinColorRandomPosition-2]
		   new_skincolor2 = ListSkinColor[(new_race)+1][SkinColorRandomPosition-1]
		   new_skincolor3 = ListSkinColor[(new_race)+1][SkinColorRandomPosition]
		   
		          User:inform(""..new_skincolor1)
				  User:inform(""..new_skincolor2)
				  User:inform(""..new_skincolor3)
		   
		   new_height = math.random(80,120)
	   
	       OnlyRace = 0 
	       CodecValue = ListCodecs1[i]
	   end
   end
  
   -- second, all the other monsters
   ListCodecs2    = {}
   ListRaceID2    = {}
   ListCodecs2    = {95555555,59555555,55955555,55595555}
   ListRaceID2    = {9       ,10      ,11      ,12      }
   
   for i=1,table.getn(ListCodecs2) do
       if potionData == ListCodecs2[i] then
        
		  new_height = math.random(80,120)
		  new_race = ListRaceID2[i]
          OnlyRace = 1
          CodecValue = ListCodecs2[i]
	   end
   end
   
  
   -- LTE and transformation
   find, myEffect = User.effects:find(329)
   
   if not find then
	  
	  myEffect = LongTimeEffect(329,1)
	  
	  -- saving of the old values
	  if OnlyRace == 0 then -- if there is more to save than new_race
	     myEffect:addValue("old_sex",old_sex)
	     myEffect:addValue("old_hair",old_hair)
	     myEffect:addValue("old_beard",old_beard)
	     
		 myEffect:addValue("old_skincolor1",old_skincolor1)
	     myEffect:addValue("old_skincolor2",old_skincolor2)
		 myEffect:addValue("old_skincolor3",old_skincolor3)
		 
		 myEffect:addValue("old_haircolor1",old_haircolor1)
		 myEffect:addValue("old_haircolor2",old_haircolor2)
		 myEffect:addValue("old_haircolor3",old_haircolor3)
	  end
	  myEffect:addValue("old_race",old_race)
	  myEffect:addValue("old_height",old_height)
	  
	  
	  -- saving the new values
	  if OnlyRace == 0 then -- if there is more to save than new_race
	     myEffect:addValue("new_sex",new_sex)
	     myEffect:addValue("new_hair",new_hair)
	     myEffect:addValue("new_beard",new_beard)
	     
		 myEffect:addValue("new_skincolor1",new_skincolor1)
	     myEffect:addValue("new_skincolor2",new_skincolor2)
		 myEffect:addValue("new_skincolor3",new_skincolor3)
		 
		 myEffect:addValue("new_haircolor1",new_haircolor1)
		 myEffect:addValue("new_haircolor2",new_haircolor2)
		 myEffect:addValue("new_haircolor3",new_haircolor3)
	  end
	  myEffect:addValue("new_race",new_race)
	  myEffect:addValue("old_height",old_height)

	  myEffect:addValue("OnlyRace",OnlyRace)
	  myEffect:addValue("CodecValue",CodecValue)
	  
	  -- transformation
	  if OnlyRace == 0 then
	     User:setAttrib("sex",new_sex)
	     User:setHair(new_hair)
	     User:setBeard(new_beard)
	     User:setSkinColor(new_skincolor1,new_skincolor2,new_skincolor3)
	     User:setHairColor(new_haircolor1,new_haircolor2,new_haircolor3)
	  end
	  User:setAttrib("racetyp",new_race)
	  User:setAttrib("body_height",new_height)
	  
	  
	  -- to make the changes visible
	  old_hp = User:increaseAttrib("hitpoints",0)
	  User:increaseAttrib("hitpoints",-1000)
	  User:increaseAttrib("hitpoints",old_hp)

	  -- duration depends on the potion's quality
	  duration = 5 -- to be replaced with a formula with the potion's quality being the changeabale varibale
	  myEffect:addValue("counterBlack",duration)
	  
	  myEffect:addValue("cooldownBlack",5) -- starts after the effect has ended

	  User.effects:addEffect(myEffect)
   end]]
end


function UseItem(User,SourceItem,TargetItem,Counter,Param)
    
	if base.common.GetFrontItemID(User) == 1008 then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	
	   if ( ltstate == Action.abort ) then
	        base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
		
		-- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  User:talkLanguage(Character.say, Player.german, "nur alchemisten");
          base.common.InformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here.")
		  return;
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
			    world:gfx(1)
		        base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Gebräu hinzu tust.", 
		                                    "The substance in the cauldron blows out, as you fill the mixture in.")
			    cauldron:setData("cauldronFilledWith","")
			
			elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
			     druid.base.alchemy.CauldronExplosion(User,cauldron,{4,44})
			
			elseif cauldron:getData("potionEffectId") ~= "" then
			     druid.base.alchemy.CauldronExplosion(User,cauldron,{4,45})
			
			elseif cauldron:getData("stockData") ~= "" then -- stock is in the cauldron; we call the combin function
				druid.base.alchemy.CombineStockEssence( User, SourceItem, cauldron, Counter, Param, ltstate )
				
			else -- nothing in the cauldron, we just fill in the essence brew
				cauldron:setData("cauldronFilledWith","essenceBrew")
				cauldron:setData("potionId",SourceItem.id)
				for i=1,8 do 
				    cauldron:setData("essenceHerb"..i,SourceItem:getData("essenceHerb"..i))
				    world:changeItem(cauldron)
				end	
			end
		
		    SourceItem:setData("essenceBrew","")
			SourceItem:setData("potionId","")
			for i=1,8 do
			    SourceItem:setData("essenceBrew"..i,"")
				world:changeItem(SourceItem)
			end	
			
		elseif (SourceItem:getData("potionEffectId")~="") then -- potion should be filled into the cauldron
		    -- water, essence brew, potion or stock is in the cauldron; leads to a failure
			if cauldron:getData("cauldronFilledWith") == "water" then
			    world:gfx(1)
		        base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Wasser hinzu tust.", 
		                            "The substance in the cauldron blows out, as you fill the water in.")
			    cauldron:setData("cauldronFilledWith","")
			
			elseif cauldron:getData("cauldronFilledWith") == "essenceBrew" then 
			    druid.base.alchemy.CauldronExplosion(User,cauldron,{4,45})
			
			elseif cauldron:getData("potionEffectId") ~= "" then
			    druid.base.alchemy.CauldronExplosion(User,cauldron,{4,38})
			
			elseif cauldron:getData("stockData") ~= "" then
				druid.base.alchemy.CauldronExplosion(User,cauldron,{4,36})
			
			else -- nothing in the cauldron, we just fill in the potion
                cauldron:setData("potionEffectId",SourceItem:setData("potionEffectId"))
                cauldron:setData("potionId",SourceItem.id)
				cauldron:setData("potionQuality",SourceItem.quality)
			end
                
            SourceItem:setData("potionEffectId","")
			SourceItem:setData("potionId","")				
			SourceItem:setData("potionQuality","")
		
		else
            -- neither essence brew nor a potion; placeholder 
		end
	    if math.random(1,20) == 1 then
		    world:erase(SourceItem,1)	 -- bottle breaks
		    User:talkLanguage(Character.say, Player.german, "flasche kaputt");
		   -- base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.", Player.lowPriority)
        else	
		    world:changeItem(SourceItem)
        end
		world:changeItem(cauldron)		
			
    else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst nichts trinken, während Du kämpfst.", "You cannot drink while fighting.", Player.lowPriority)
		else
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine schwarze Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a black liquid.");
			SourceItem.id = 164
			SourceItem.quality = 333
			if math.random(1,20) == 1 then
			   world:erase(SourceItem,1) -- bottle breaks
			   base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.", Player.lowPriority)
			else	
				world:changeItem(SourceItem)
			end
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem)
	    end
	end  
end
	
--[[	-- not infront of a cauldron: let's drink the potion!
	if User.attackmode then
        base.common.InformNLS(User,
			"Du kannst den Trank nicht benutzen, während Du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	-- if the transformation LTE is there
	-- and it is not the same transformation potion kind OR if the transformation of the first potion is already over
    -- -> no effect
	find, myEffect = User.effects:find(329)
	if find then
	   findCodecValue, CodecValue = myEffect:findValue("CodecValue")
	    findCounter,counterBlack = myEffect:findValue("counterBlack")
		if findCodecValue then
	        if CodecValue ~= tonumber(SourceItem:getData("potionData")) or (counterBlack == 0) then
	           base.common.InformNLS( User,
                "Der Trank hätte jetzt keine Wirkung.",
                "The potion wouldn't have any effect now."
                       );  
	            return
			end
	   else
	     User:inform("Error, please inform dev.");
	   end
	  return;
	end	]]
	
function LookAtItem(User,Item)
end