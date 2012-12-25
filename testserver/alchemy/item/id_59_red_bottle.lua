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
	User:inform(""..potionEffectId)
	if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
	
	elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer  
		  -- there is already an effect, we remove it
		local foundEffect, myEffect = User.effects:find(59);
		if foundEffect then
			local effectRemoved = User.effects:removeEffect(59)
		    base.common.InformNLS(User, "Du spürst, dass der alte Stärkungstrank seine Wirkung verliert und wie der neue zu wirken einsetzt.", 
		    "You feel that the old strengthening potion looses its effect and how the new one takes effect.")
		end
		local myEffectDuration = SourceItem.quality*600*4 -- quality 1 = 4 minutes duration, quality 9 = 36 minutes duration
		local myEffect=LongTimeEffect(59,myEffectDuration) -- new effect
		
		local dataZList = alchemy.base.alchemy.SplitData(User,potionEffectId)
		alchemy.base.alchemy.generateTasteMessage(User,dataZList) -- potion taste
	    GenerateEffectMessage(User,dataZList) -- inform about the effects
		
		local attribValue, bottomBorder
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
		
		local foundEffect, checkedEffect = User.effects:find(59) -- security check, there shouldn't be an effect at this point anymore
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
	
	local attribEn, attribDe, nPTagEn, nPTagDe, attribIntensityEn, attribIntensityDe
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
 User:inform(SourceItem:getData("filledWith"));  User:inform(SourceItem:getData("potionEffectId"))
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
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine rote Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a red liquid.");
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
	    end
	end  
end

function LookAtItem(User,Item)
    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
end