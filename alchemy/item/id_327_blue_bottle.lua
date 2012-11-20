--ds_327_blaue_flasche.lua
--Druidensystem
--Nicht-Temporäre Einzelwirkungen
--Falk
-- reworked by Merung

require("base.common")
require("alchemy.base.alchemy")
require("alchemy.base.missile")
require("alchemy.item.id_165_blue_bottle")

module("alchemy.item.id_327_blue_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_327_blue_bottle' WHERE com_itemid = 327;

function Explode(User,TargetItem)
Item = TargetItem
local potionEffectId = (tonumber(Item:getData("potionEffectId")))

	if (potionEffectId > 0) and (potionEffectId < 100) then	-- bombs
		
		if (potionEffectId == 1) then
			druid.base.missile.effect_1( User, Item );
		elseif (potionEffectId == 2) then
			druid.base.missile.effect_2( User, Item );
		elseif (potionEffectId == 3) then
			druid.base.missile.effect_3( User, Item );
		elseif (potionEffectId == 4) then
			druid.base.missile.effect_4( User, Item );
		elseif (potionEffectId == 5) then
			druid.base.missile.effect_5( User, Item );
		elseif (potionEffectId == 6) then
			druid.base.missile.effect_6( User, Item );
		elseif (potionEffectId == 7) then
			druid.base.missile.effect_7( User, Item );
		elseif (potionEffectId == 8) then
			druid.base.missile.effect_8( User, Item );
		elseif (potionEffectId == 9) then
			druid.base.missile.effect_9( User, Item );
		elseif (potionEffectId == 10) then
			druid.base.missile.effect_10( User, Item );
		elseif (potionEffectId == 11) then 
			druid.base.missile.effect_11( User, Item );
		elseif (potionEffectId == 12) then
			druid.base.missile.effect_12( User, Item );
		elseif (potionEffectId == 13) then 
			druid.base.missile.effect_13( User, Item );
		elseif (potionEffectId == 14) then
			druid.base.missile.effect_14( User, Item );
		elseif (potionEffectId == 15) then
			druid.base.missile.effect_15( User, Item );
		elseif (potionEffectId == 16) then
			druid.base.missile.effect_16( User, Item );
		elseif (potionEffectId == 17) then 
			druid.base.missile.effect_17( User, Item );
		else
			-- unbekannter Trank
		end
		-- Deko-Effekte
		world:gfx(36,Item.pos);
		world:makeSound(5,Item.pos);
		world:erase(Item,1);
    end
end

function Drop(User,TargetItem)
    if (math.random(1,User:increaseAttrib("dexterity",0)+7)==1) then
        Explode(User,TargetItem);
        User:talkLanguage(Character.say,Player.german,"#me lässt eine Flasche fallen, welche explodiert.");
        User:talkLanguage(Character.say,Player.english,"#me drops a bottle and it explodes.");
        base.common.InformNLS( User,
        "Der Wurfkörper rutscht dir aus den Händen und zerplatzt vor deinen Füßen.",
        "The missile slips out of your hands and burst asunder in front of you feets.");
    end;
end;

function MoveItemAfterMove(User, SourceItem, TargetItem)
	local missileStatus = (SourceItem:getData("missileStatus"));
    
	if not ((potionEffectId > 0) and (potionEffectId < 100)) then
        return true; -- no missile
    end
 
	if (missileStatus == "deactivated") or (missileStatus == "") then
        return true; -- missile is deactivated
    end

    if (SourceItem:getType()~=4) then
        Drop(User,TargetItem);
        return true; -- not in the hand
    end

    if (TargetItem:getType()~=3) then
        Drop(User,TargetItem);
        return true; -- not thrown at the map
    end

    -- everything allright: explosion!
    Explode(User,TargetItem);
    User:talkLanguage(Character.say,Player.german,"#me wirft eine Flasche, die zerplatzt.");
    User:talkLanguage(Character.say,Player.english,"#me throws a bottle that splits.");
    User.movepoints=User.movepoints-30;
	   
end;

function MoveItemBeforeMove( User, SourceItem, TargetItem )
	local missileStatus = (SourceItem:getData("missileStatus"));
    potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	if potionEffectId == nil then
	    potionEffectId = 0
	end	
	
	if not ((potionEffectId > 0) and (potionEffectId < 100)) then
        return true; -- no missile
    end
    
    if (TargetItem:getType()~=3) then
        return true; -- not thrown at the map
    end
    
    if (SourceItem:getType()~=4) and (SourceItem:getData("missileStatus") == "activated") then
        base.common.InformNLS( User,
        "Du musst den Wurfkörper aus der Hand werfen.",
        "You have to throw the missle out of your hand.");
        User:inform(""..(SourceItem:getData("missileStatus")))
		return false; -- not in the hand; only for activated missile
	end
    return true;
end

function DrinkPotion(User,SourceItem)
   if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
    end
end

function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
	
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
		        base.common.InformNLS(User, "Der Inhalt des Kessels verpufft, als Du das Gebräu hinzu tust.", 
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
		        base.common.InformNLS(User, "Der Inhalt des Kessels verpufft, als Du das Wasser hinzu tust.", 
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
		    User:talkLanguage(Character.say, Player.german, "flasche kaputt");
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
			if (potionEffectId > 0) and (potionEffectId < 100) then
			      
				missileStatus = SourceItem:getData("missileStatus")
				if (missileStatus == "deactivated") or (missileStatus == "") then -- potion deactivated or status not set --> activate
					base.common.InformNLS( User,
					"Du entsicherst des Wurfkörper. Vorsicht damit.",
					"You activate the missle. Careful with it.");
					SourceItem:setData("missileStatus","activated")
					world:changeItem( SourceItem );
				else
					base.common.InformNLS( User,
					"Du sicherst den Wurfkörper.",
					"You deactivate the missile.");
					SourceItem:setData("missileStatus","deactivated")
					world:changeItem( SourceItem );
		        end
			
			else 
				User:talkLanguage(Character.say, Player.german, "#me trinkt eine dunkelblaue Flüssigkeit.");
				User:talkLanguage(Character.say, Player.english, "#me drinks a dark blue liquid.");
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
end

function LookAtItem(User,Item)
	if (Item.data == 63321157) then
		if (User:getPlayerLanguage()==0) then
			world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: 'Windtrank'")
		else
			world:itemInform(User,Item,"You look at a sticker telling: 'Wind Potion'")        
		end
	elseif (Item.data == 0) then
		if (User:getPlayerLanguage()==0) then
			world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: 'Windtrank'")
		else
			world:itemInform(User,Item,"You look at a sticker telling: 'Wind Potion'")        
		end 
	else 
		if (User:getPlayerLanguage()==0) then
			world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: 'Wurfkörper'")
		else
			world:itemInform(User,Item,"You look at a sticker telling: 'Missile'")        
		end
	end    
end
