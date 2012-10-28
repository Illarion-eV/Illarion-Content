--ds_330_weisse_flasche_neu.lua
--Druidensystem in Arbeit
--Temporäre Einzelwirkungen
--Falk
-- reworked by Merung
require("base.common")
require("alchemy.base.alchemy")
require("alchemy.item.id_165_blue_bottle")

module("alchemy.item.id_330_white_bottle",package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_330_white_bottle' WHERE com_itemid = 330;

function DrinkPotion(User,SourceItem)

    potionEffectId = tonumber(SourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
    
	elseif (potionEffectId <= 8) then -- language potion
            
		ListPotionEffectId={1,2,3,4,5,6,7,8}
		ListLanguages={Character.commonLanguage,Character.humanLanguage,Character.dwarfLanguage,Character.elfLanguage,Character.lizardLanguage,Character.orcLanguage,Character.halflingLanguage,Character.ancientLanguage}
		
        find, myEffect = User.effects:find(330)
		if find then --  there is already an effect, we remove it, only one language at a time
            
			find,languageId = myEffect:findValue("languageId")
			skillName = ListLanguages[languageId]
			find,oldSkill = myEffect:findValue( "oldSkill")
			find,newSkill = myEffect:findValue( "newSkill")
			User:increaseSkill(skillName,(-(newSkill-oldSkill))) -- old skill level restored
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
	  
	    User:increaseSkill(ListLanguages[potionEffectId],newSkill)
 		User.effects:addEffect(myEffect);
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
			SourceItem:setData("essenceHerbs")orld:changeItem(SourceItem)
			
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
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine weiße Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a white liquid.");
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
