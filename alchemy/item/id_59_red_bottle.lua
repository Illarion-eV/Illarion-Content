--ds_059_rote_flasche
--Druidensystem in Arbeit
--Falk
--Delay added by Blay09
--rework by Merung

require("base.common")
require("alchemy.base.alchemy")

module("alchemy.item.id_59_red_bottle",package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_59_red_bottle' WHERE com_itemid = 59;

taste = {}
attribList   ={"strength","intelligence","dexterity"       ,"perception"  ,"constitution","essence","agility"      ,"willpower"}
attribListDe ={"Stärke"  ,"Intelligenz" ,"Geschicklichkeit","Wahrnehmung" ,"Ausdauer"    ,"Essenz" ,"Schnelligkeit","Willenskraft"}
taste[0]     ={"fruchtig","herb"        ,"bitter"          ,"faulig"      ,"sauer"       ,"salzig" ,"scharf"       ,"süß"}
taste[1]     ={"fruity"  ,"tartly"      ,"bitter"          ,"putrefactive","acidly"      ,"salt"   ,"hot"          ,"sweet"}

intensityListDe = {"stark"   ,"merkbar"  ,"leicht"  ,"kaum merklich"   ,"","kaum merklich"   ,"leicht"  ,"merkbar"  ,"stark"}
intensityListEn = {"strongly","noticably","slightly","barely noticably","","barely noticable","slightly","noticably","strongly"}

function DrinkPotion(User,SourceItem)
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	
	if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
	
	elseif potionEffectId >= 11111111 then -- it's an attribute changer  
		  -- there is already an effect, we remove it
		foundEffect, myEffect = User.effects:find(59);
		if foundEffect then
			effectRemoved = User.effects:removeEffect(59)
		    base.common.InformNLS(User, "Du spürst, dass der alte Stärkungstrank seine Wirkung verliert und wie der neue zu wirken einsetzt.", 
		    "You feel that the strengthening potion looses its effect and how the new one takes effect.")
		end
		local myEffectDuration = SourceItem.quality*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration
		myEffect=LongTimeEffect(59,myEffectDuration) -- new effect
		
		local dataZList = druid.base.alchemy.SplitBottleData(User,potionEffectId)
		druid.base.alchemy.generateTasteMessage(User,dataZList)
	    GenerateEffectMessage(User,dataZList)
		
		for i=1,8 do
			
			attribValue = User:increaseAttrib(attribList[i],0);

			bottomBorder = 1
			
			if (attribValue + dataZList[i] - 5) < bottomBorder then
				dataZList[i] = (bottomBorder - attribValue) + 5;
			end

			if dataZList[i] ~= 5 then
				User:increaseAttrib(attribList[i],dataZList[i]-5);
				myEffect:addValue(""..attribList[i],dataZList[i]);
			end
			
		end
		local pax = User:increaseAttrib("strength",0)
		local bellum = User:increaseAttrib("constitution",0)
		
		foundEffect, checkedEffect = User.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
		if not foundEffect then
		   User.effects:addEffect( myEffect )
		end
    else
	    -- something else
	end	
end

function GenerateEffectMessage(User,dataZList)
    local effectMessagesDe = ""
    local effectMessagesEn = ""
	local anyEffect = false
	
	for i=1,8 do
	    if dataZList[i] ~= 5 then
		    
			attribEn = attribList[i] -- attribute
			attribDe = attribListDe[i]
			if dataZList[i] > 5 then
			    nPTagEn = "in" -- increasing 
				nPTagDe = "zu"
			else
                nPTagEn = "de" -- decreasing
                nPTagDe = "ab"				
		    end
	        attribIntensityEn = intensityListEn[dataZList[i]] -- how strong it is in/decreased
			attribIntensityDe = intensityListDe[dataZList[i]]
            anyEffect = true
			-- we put everything together
			effectMessagesDe = effectMessagesDe.."Deine "..attribDe.." nimmt".." "..attribIntensityDe.." "..nPTagDe..". "
			effectMessagesEn = effectMessagesEn.."Your "..attribEn..nPTagEn.."creases "..attribIntensityEn..". "
		end
    end		
    if anyEffect == false then -- no effect
	    base.common.InformNLS(User,"Du spürst keine Wirkung.","You don't feel any effect.")
	else
	    base.common.InformNLS(User,effectMessagesDe,effectMessagesEn)
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
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine rote Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a red liquid.");
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
    
end
