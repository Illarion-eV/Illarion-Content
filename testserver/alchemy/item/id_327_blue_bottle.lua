--ds_327_blaue_flasche.lua
--Druidensystem
--Nicht-Temporäre Einzelwirkungen
--Falk
-- reworked by Merung

require("base.common")
require("alchemy.base.alchemy")
require("alchemy.base.missile")


module("alchemy.item.id_327_blue_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_327_blue_bottle' WHERE com_itemid = 327;

function Explode(User,TargetItem)
local Item = TargetItem
local potionEffectId = (tonumber(Item:getData("potionEffectId")))

	if (potionEffectId >= 300) and (potionEffectId <= 399) then	-- bombs
		
		if (potionEffectId == 301) then
			druid.base.missile.effect_1( User, Item );
		elseif (potionEffectId == 302) then
			druid.base.missile.effect_2( User, Item );
		elseif (potionEffectId == 303) then
			druid.base.missile.effect_3( User, Item );
		elseif (potionEffectId == 304) then
			druid.base.missile.effect_4( User, Item );
		elseif (potionEffectId == 305) then
			druid.base.missile.effect_5( User, Item );
		elseif (potionEffectId == 306) then
			druid.base.missile.effect_6( User, Item );
		elseif (potionEffectId == 307) then
			druid.base.missile.effect_7( User, Item );
		elseif (potionEffectId == 308) then
			druid.base.missile.effect_8( User, Item );
		elseif (potionEffectId == 309) then
			druid.base.missile.effect_9( User, Item );
		elseif (potionEffectId == 310) then
			druid.base.missile.effect_10( User, Item );
		elseif (potionEffectId == 311) then 
			druid.base.missile.effect_11( User, Item );
		elseif (potionEffectId == 312) then
			druid.base.missile.effect_12( User, Item );
		elseif (potionEffectId == 313) then 
			druid.base.missile.effect_13( User, Item );
		elseif (potionEffectId == 314) then
			druid.base.missile.effect_14( User, Item );
		elseif (potionEffectId == 315) then
			druid.base.missile.effect_15( User, Item );
		elseif (potionEffectId == 316) then
			druid.base.missile.effect_16( User, Item );
		elseif (potionEffectId == 317) then 
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
    
	local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	if potionEffectId == nil then
	    potionEffectId = 0
	end	
	
	if not ((potionEffectId >= 300) and (potionEffectId <= 399)) then
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
	return true   
end;

function MoveItemBeforeMove( User, SourceItem, TargetItem )
	local missileStatus = (SourceItem:getData("missileStatus"));
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	if potionEffectId == nil then
	    potionEffectId = 0
	end	
	
	if not ((potionEffectId >= 300) and (potionEffectId <= 399)) then
        return true; -- no missile
    end
    
    if (TargetItem:getType()~=3) then
        return true; -- not thrown at the map
    end
    
    if (SourceItem:getType()~=4) and (SourceItem:getData("missileStatus") == "activated") then
        base.common.InformNLS( User,
        "Du musst den Wurfkörper aus der Hand werfen.",
        "You have to throw the missle out of your hand.");
        return false; -- not in the hand; only for activated missile
	end
    return true;
end

function DrinkPotion(User,SourceItem)
-- no drink effect exists for bomb potions, yet
   base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
end

function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	if potionEffectId == nil then
	    potionEffectId = 0
	end	
	
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.base.alchemy.FillIntoCauldron(User,SourceItem,cauldron,Counter,Param,ltstate)
	   
	else -- not infront of a cauldron, therefore use it
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			if (potionEffectId >= 300) and (potionEffectId <= 399) then -- a bomb
			      
				local missileStatus = SourceItem:getData("missileStatus")
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
			
			else -- not a bomb
				User:talkLanguage(Character.say, Player.german, "#me trinkt eine dunkelblaue Flüssigkeit.");
				User:talkLanguage(Character.say, Player.english, "#me drinks a dark blue liquid.");
				Salchemy.base.alchemy.EmptyBottle(User,SourceItem)
				User.movepoints=User.movepoints - 20
				DrinkPotion(User,SourceItem)
	        end
		end
	end  
end

function LookAtItem(User,Item)
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))   
end
