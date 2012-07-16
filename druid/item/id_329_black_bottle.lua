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
	
	if SourceItem:getData("potionEffectId") == "" then
	    User:talkLanguage(Character.say, Player.german, "no potion effect")
    else
	    User:talkLanguage(Character.say, Player.german, ""..ListPotionEffect[SourceItem:getData("potionEffectId")])
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
	
	   if (cauldron:getData("cauldronData") ~= "") then 
	      base.common.InformNLS( User,
					"In dem Kessel befindet sich bereits etwas. Du kannst nichts mehr hinzutun.",
					"There is already something in the cauldron. You cannot add something else to it."
						   );
	       return;
      
	  elseif (cauldron:getData("cauldronData") == "") then -- nothing in the cauldron, so the stock is being filled in
	      
		  if ( ltstate == Action.abort ) then
                base.common.TempInformNLS( User,
                "Du brichst Deine Arbeit ab.",
                "You abort your work."
                       );
		        return;
            end
			
			if (ltstate == Action.none) then
			   User:startAction(20,21,5,0,0);
			   return
			end
		  
		  local ID_potion = SourceItem.id			 
		  cauldron:setData("potionID", ""..ID_potion);
		  cauldron:setData("cauldronData",""..SourceItem:getData("potionData"))
	      cauldron.quality = SourceItem.quality
		  world:changeItem(cauldron)
		  User:inform(""..ID_potion)
		  User:talkLanguage(Character.say, Player.german, "#me kippt einen Trank in den Kessel.");
          User:talkLanguage(Character.say, Player.english, "#me pours a potion into the cauldron.");
		  world:makeSound(10,User.pos);
		  world:erase(SourceItem,1);
		  User:createItem(164, 1, 333, 0);
	      return;
	   end  
	end
	
	-- not infront of a cauldron: let's drink the potion!
	if User.attackmode then
        base.common.TempInformNLS(User,
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
	           base.common.TempInformNLS( User,
                "Der Trank hätte jetzt keine Wirkung.",
                "The potion wouldn't have any effect now."
                       );  
	            return
			end
	   else
	     User:inform("Error, please inform dev.");
	   end
	  return;
	end	
	
	base.character.ChangeFightingpoints(User, -20);
	world:makeSound(12,User.pos);
	world:erase(SourceItem,1);
	if(math.random(20) == 1) then
       base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.");
    else
       User:createItem(164, 1, 333, 0);
    end
	DrinkPotion(User, SourceItem);
end

function LookAtItem(User,Item)
    world:itemInform(User,Item,"test name")

	--[[local potionData = tonumber(Item:getData("potionData"));

	if Item.data == 77744151 then
        EtikettDe = "Gestaltenwandler Mensch"
        EtikettEn = "Shape Shifter Potion Human"
    elseif  potionData == 65545555 then
        EtikettDe = "Gestaltenwandler Zwerg"
        EtikettEn = "Shape Shifter Potion Dwarf"
    elseif  Item.data == 32699619 then
        EtikettDe = "Gestaltenwandler Halbling"
        EtikettEn = "Shape Shifter Potion Halfling"
    elseif Item.data == 54876565 then
        EtikettDe = "Gestaltenwandler Elb"
        EtikettEn = "Shape Shifter Potion Elf"
    elseif Item.data == 61348438 then
        EtikettDe = "Gestaltenwandler Ork"
        EtikettEn = "Shape Shifter Potion Orc"
    elseif Item.data == 71378653 then
        EtikettDe = "Gestaltenwandler Echse"
        EtikettEn = "Shape Shifter Potion Lizard"
    elseif Item.data == 58548893 then
        EtikettDe = "Gestaltenwandler Gnom"
        EtikettEn = "Shape Shifter Potion Gnom"
    elseif Item.data == 45634355 then
        EtikettDe = "Gestaltenwandler Oger"
        EtikettEn = "Shape Shifter Potion Ogre"
    elseif Item.data == 75529399 then
        EtikettDe = "Gestaltenwandler Mumie"
        EtikettEn = "Shape Shifter Potion Mummy"
    elseif Item.data == 44554428 then
        EtikettDe = "Gestaltenwandler Skelett"
        EtikettEn = "Shape Shifter Potion Skeleton"
    elseif  Item.data == 18861363 then
        EtikettDe = "Gestaltenwandler Beholder"
        EtikettEn = "Shape Shifter Potion Beholder"
    elseif  Item.data == 26562174 then
        EtikettDe = "Gestaltenwandler Fliege"
        EtikettEn = "Shape Shifter Potion Fly"
    elseif Item.data == 47418515 then
        EtikettDe = "Gestaltenwandler Schaf"
        EtikettEn = "Shape Shifter Potion Sheep"
    elseif Item.data == 58151138 then
        EtikettDe = "Gestaltenwandler Spinne"
        EtikettEn = "Shape Shifter Potion Spider"
    elseif Item.data == 22551786 then
        EtikettDe = "Gestaltenwandler Rotes Skelett"
        EtikettEn = "Shape Shifter Potion Red Skeleton"
    elseif Item.data == 72225438 then
        EtikettDe = "Gestaltenwandler Rotwurm"
        EtikettEn = "Shape Shifter Potion Redworm"
    elseif Item.data == 99992352 then
        EtikettDe = "Gestaltenwandler Großer Dämon"
        EtikettEn = "Shape Shifter Potion Big Demon"
    elseif Item.data == 38114786 then
        EtikettDe = "Gestaltenwandler Skorpion"
        EtikettEn = "Shape Shifter Potion Scorpion"
    elseif Item.data == 95371655 then
        EtikettDe = "Gestaltenwandler Schwein"
        EtikettEn = "Shape Shifter Potion Pig"
    elseif Item.data == 71796337 then
        EtikettDe = "Gestaltenwandler Luft"
        EtikettEn = "Shape Shifter Potion Air"
    elseif Item.data == 87611881 then
        EtikettDe = "Gestaltenwandler Schï¿½del"
        EtikettEn = "Shape Shifter Potion Skull"
    elseif Item.data == 31231973 then
        EtikettDe = "Gestaltenwandler Wespe"
        EtikettEn = "Shape Shifter Potion Wasp"
    elseif Item.data == 14523375 then
        EtikettDe = "Gestaltenwandler Waldtroll"
        EtikettEn = "Shape Shifter Potion Forest Troll"
    elseif Item.data == 46852135 then
        EtikettDe = "Gestaltenwandler Geister-Skelett"
        EtikettEn = "Shape Shifter Potion Shadow Skeleton"
    elseif Item.data == 37531813 then
        EtikettDe = "Gestaltenwandler Stein-Golem"
        EtikettEn = "Shape Shifter Potion Stone-Golem"
    elseif Item.data == 85293266 then
        EtikettDe = "Gestaltenwandler Goblin"
        EtikettEn = "Shape Shifter Potion Goblin"
    elseif Item.data == 86659455 then
        EtikettDe = "Gestaltenwandler Gnoll"
        EtikettEn = "Shape Shifter Potion Gnoll"
    elseif Item.data == 51464953 then
        EtikettDe = "Gestaltenwandler Drache"
        EtikettEn = "Shape Shifter Potion Dragon"
    elseif Item.data == 97171535 then
        EtikettDe = "Gestaltenwandler Drow"
        EtikettEn = "Shape Shifter Potion Drow"
    elseif Item.data == 77577615 then
        EtikettDe = "Gestaltenwandler Drow-Frau"
        EtikettEn = "Shape Shifter Potion Female Drow"
    elseif Item.data == 11695753 then
        EtikettDe = "Gestaltenwandler Kleiner Dämon"
        EtikettEn = "Shape Shifter Potion Lower Demon"
    elseif Item.data == 62545579 then
        EtikettDe = "Gestaltenwandler Kuh"
        EtikettEn = "Shape Shifter Potion Cow"
    elseif Item.data == 81519773 then
        EtikettDe = "Gestaltenwandler Hirsch"
        EtikettEn = "Shape Shifter Potion Deer"
    elseif Item.data == 95153618 then
        EtikettDe = "Gestaltenwandler Wolf"
        EtikettEn = "Shape Shifter Potion Wolve"
    elseif Item.data == 52728756 then
        EtikettDe = "Gestaltenwandler Panther"
        EtikettEn = "Shape Shifter Potion Panther"
    elseif Item.data == 91986793 then
        EtikettDe = "Gestaltenwandler Hase"
        EtikettEn = "Shape Shifter Potion Rabbit"
    elseif Item.data == 19831914 then
        EtikettDe = "Gestaltenwandler Gnom"
        EtikettEn = "Shape Shifter Potion gnome"
    else

      if (Item:getData("potionData") == "") then
         EtikettDe = "Tinte"
         EtikettEn = "Ink"
      elseif (Item:getData("potionData") == "1") then
         EtikettDe = "Janus-Trunk"
         EtikettEn = "Janus Potion"
      end
    end

  if (User:getPlayerLanguage()==0) then
     world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: "..EtikettDe)
  else
     world:itemInform(User,Item,"You look at a sticker telling: "..EtikettEn)
  end]]

end