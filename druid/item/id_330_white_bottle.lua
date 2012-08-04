--ds_330_weisse_flasche_neu.lua
--Druidensystem in Arbeit
--Temporäre Einzelwirkungen
--Falk
-- reworked by Merung
require("base.common")
require("druid.base.alchemy")
require("druid.item.id_165_blue_bottle")

module("druid.item.id_330_white_bottle",package.seeall)

-- UPDATE common SET com_script='druid.item.id_330_white_bottle' WHERE com_itemid = 330;

function DrinkPotion(User,SourceItem)

    potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
    
	elseif (potionEffectId <= 8) then -- language potion
            
		ListPotionEffectId={1,2,3,4,5,6,7,8}
		ListLanguages={"common language","human language","dwarf language","elf language","lizard language","orc language","halfling language","ancient language"}
		
        find, myEffect = User.effects:find(330)
		if find then --  there is already an effect, we remove it, only one language at a time
            
			find,languageId = myEffect:findValue("languageId")
			skillName = ListLanguages[languageId]
			find,oldSkill = myEffect:findValue( "oldSkill")
			find,newSkill = myEffect:findValue( "newSkill")
			User:increaseSkill(1,skillName,(-(newSkill-oldSkill))) -- old skill level restored
		    effectRemoved = User.effects:removeEffect(329)
			if not effectRemove then
				base.common.InformNLS( User,"Fehler: informiere einen dev. lte nicht entfernt. white bottle script", "Error: inform dev. Lte not removed. white bottle script.")
				return
			end
		end
		
		oldSkill = User:getSkill(ListLanguages[potionEffectId])
		if oldSkill == nil then
		   oldSkill = 0
		end
		newSkill = 100
   
        myEffect=LongTimeEffect(330,1)
		myEffect:addValue( "oldSkill",oldSkill )
		myEffect:addValue( "newSkill",newSkill )
	    myEffect:addValue( "languageId",potionEffectId)
        duration = 10 -- replace with formula
        myEffect:addValue("counterWhite",10)
	  
	    User:increaseSkill(1,ListLanguages[potionEffectId],newSkill)
 		User.effects:addEffect(myEffect);
    end
  end
    
function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
 
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
			    world:gfx(1)
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
			SourceItem:setData("essenceHerbs")orld:changeItem(SourceItem)
			
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
		
		else
            -- neither essence brew nor a potion; placeholder 
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
			   base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.", Player.lowPriority)
			else	
				world:changeItem(SourceItem)
			end
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem)
	    end
	end  
end
-- end (milk)
  
  ----------- MILK ; has to be reworked sometime --------
  --if SourceItem.data == 0 then
	--world:erase(SourceItem,1);
	--world:makeSound(12,Character.pos);
	--return;
    -- Sheep Milk
 -- elseif SourceItem.data == 1 then     -- special Cow Milk
	--User = getCharForId(Character.id);  --create a save copy of the char struct
	--world:erase(SourceItem,1);
	--world:makeSound(12,Character.pos);

    
        -- ALTE FASSUNG ALS HEILTRANK
       -- if (ltstate == Action.abort) then

        --    User:talkLanguage(Character.say, Player.german, "#me verschüttet die Milch.");
        --    User:talkLanguage(Character.say, Player.english, "#me spills the milk.");

        --    world:erase( SourceItem, 1 );

        --    if (math.random( 20 ) == 1) then
        --        base.common.InformNLS( User,
        --        "Die Flasche zerbricht.",
         --       "The bottle breaks.");
         --   else
         --       User:createItem( 164, 1, 333, 0 );
        --    end

        --    return
       -- end

        --if User.attackmode then
        --    base.common.InformNLS( User,
        --    "Du kannst nichts trinken während du kämpfst.",
        --    "You can't drink something while fighting." );
        --    return
        --end

        --if (ltstate == Action.none) then

            --User:startAction( 20, 0, 0, 12, 25 );

         --   User:talkLanguage(Character.say, Player.german, "#me beginnt eine Milch zu trinken.");
         --   User:talkLanguage(Character.say, Player.english, "#me starts to drink a milk.");

        --end


        --if( math.random( 20 ) == 1 ) then
        --    base.common.InformNLS( User,
        --    "Die Flasche zerbricht.",
        --    "The bottle breaks.");
       -- else
        --    User:createItem( 164, 1, 333,0);
        --end

        --User:LTIncreaseHP(333,3,1); --1000HP+
        --User:LTIncreaseMana(333,3,1); --1000Mana+
        --User:increaseAttrib("foodlevel",1000);
       -- User.movepoints = User.movepoints - 16;
        
        --local Poisonvalue = User:getPoisonValue();                -- Poisonvalue einlesen  ( 0 - 10000 )
        --if Poisonvalue>1000 then
        --	Poisonvalue = Poisonvalue -1000; --remove 1000 Poison points
        --end
        --User:setPoisonValue( Poisonvalue );
			
        --if (User:increaseAttrib("foodlevel",0) > 60000) then
        --    base.common.InformNLS( User,
        --    "Du bekommst kaum noch was runter und dir wird schlecht.",
        --    "You hardly manage to eat something more and get sick!");

        --    User:increaseAttrib("hitpoints",-1000);
        --elseif  (User:increaseAttrib("foodlevel",0) > 40000) then
       --     base.common.InformNLS( User,
        --    "Du bist satt.",
        --    "You are stuffed.");
        --else
        --    base.common.InformNLS( User,
        --    "Du trinkst die Flasche aus und fühlst wie neue Stärke dich durchströmt.",
        --    "You drink up the bottle, and you feel the new strength that flows through your body.");
        --end

        --return
        -- Old style potion done
   --end
	------------------------ MILKD END -------------------	

function LookAtItem(User,Item)

    if Item.data ==  0 then
        EtikettDe = "Schafsmilch"
        EtikettEn = "Sheep Milk"
    elseif item.id_data ==  1 then
        EtikettDe = "Orun-Milch"
        EtikettEn = "Orun milk"
	elseif Item.data ==  45942235 then
        EtikettDe = "Menschensprache"
        EtikettEn = "Human Language Potion"
    elseif  Item.data == 62483256 then
        EtikettDe = "Zwergensprache"
        EtikettEn = "Dwarfen Language Potion"
    elseif  Item.data == 32529515 then
        EtikettDe = "Elfensprache"
        EtikettEn = "Elbian Language Potion"
    elseif Item.data == 15751754 then
        EtikettDe = "Echsensprache"
        EtikettEn = "Lizard Language Potion"
    elseif Item.data == 82897532 then
        EtikettDe = "Orksprache"
        EtikettEn = "Orcish Language Potion"
    elseif Item.data == 63296636 then
        EtikettDe = "Halblingssprache"
        EtikettEn = "Halfling Language Potion"
    elseif Item.data == 93538334 then
        EtikettDe = "Alten Sprache"
        EtikettEn = "Ancient Language Potion"
    else
        EtikettDe = "Vieltrank"
        EtikettEn = "Polyjuice Potion"
    end

	if (User:getPlayerLanguage()==0) then
		world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: "..EtikettDe)
	else
		world:itemInform(User,Item,"You look at a sticker telling: "..EtikettEn)
	end

end
