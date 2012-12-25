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
    
	elseif (potionEffectId >= 600) and (potionEffectId <= 699) then -- language potion
            
		local ListLanguages={Character.commonLanguage,Character.humanLanguage,Character.dwarfLanguage,Character.elfLanguage,Character.lizardLanguage,Character.orcLanguage,Character.halflingLanguage,Character.ancientLanguage}
		
        local find, myEffect = User.effects:find(330)
		
		local findLID,languageId,skillName,findOS,oldSkill,findNS,newSkill,effectRemoved
		if find then --  there is already an effect, we remove it, only one language at a time
            
			findLID,languageId = myEffect:findValue("languageId")
			skillName = ListLanguages[languageId]
			findOS,oldSkill = myEffect:findValue( "oldSkill")
			findNS,newSkill = myEffect:findValue( "newSkill")
			User:increaseSkill(skillName,(-(newSkill-oldSkill))) -- old skill level restored
		    effectRemoved = User.effects:removeEffect(329)
			if not effectRemove then
				base.common.InformNLS( User,"Fehler: informiere einen dev. lte nicht entfernt. white bottle script", "Error: inform dev. Lte not removed. white bottle script.")
				return
			end
		end
		
		oldSkill = User:getSkill(ListLanguages[potionEffectId-599])
		if oldSkill == nil then
		   oldSkill = 0
		end
		newSkill = 100
   
        myEffect=LongTimeEffect(330,1)
		myEffect:addValue( "oldSkill",oldSkill )
		myEffect:addValue( "newSkill",newSkill )
	    myEffect:addValue( "languageId",potionEffectId-599)
        duration = SourceItem.quality*600*10 
        myEffect:addValue("counterWhite",10)
	  
	    User:increaseSkill(ListLanguages[potionEffectId-599],newSkill)
 		User.effects:addEffect(myEffect);
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
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine weiße Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a white liquid.");
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
	    end
	end  
end

function LookAtItem(User,Item)
world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
end
