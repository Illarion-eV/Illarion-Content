--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
--ds_327_blaue_flasche.lua
--Druidensystem
--Nicht-Temporäre Einzelwirkungen
--Falk
-- reworked by Merung

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local missile = require("alchemy.base.missile")


module("alchemy.item.id_327_blue_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_327_blue_bottle' WHERE com_itemid = 327;

function Explode(User,TargetItem)
local Item = TargetItem
local potionEffectId = (tonumber(Item:getData("potionEffectId")))

	if (potionEffectId >= 300) and (potionEffectId <= 399) then	-- bombs
		
		if (potionEffectId == 301) then
			missile.effect_1( User, Item );
		elseif (potionEffectId == 302) then
			missile.effect_2( User, Item );
		elseif (potionEffectId == 303) then
			missile.effect_3( User, Item );
		elseif (potionEffectId == 304) then
			missile.effect_4( User, Item );
		elseif (potionEffectId == 305) then
			missile.effect_5( User, Item );
		elseif (potionEffectId == 306) then
			missile.effect_6( User, Item );
		elseif (potionEffectId == 307) then
			missile.effect_7( User, Item );
		elseif (potionEffectId == 308) then
			missile.effect_8( User, Item );
		elseif (potionEffectId == 309) then
			missile.effect_9( User, Item );
		elseif (potionEffectId == 310) then
			missile.effect_10( User, Item );
		elseif (potionEffectId == 311) then 
			missile.effect_11( User, Item );
		elseif (potionEffectId == 312) then
			missile.effect_12( User, Item );
		elseif (potionEffectId == 313) then 
			missile.effect_13( User, Item );
		elseif (potionEffectId == 314) then
			missile.effect_14( User, Item );
		elseif (potionEffectId == 315) then
			missile.effect_15( User, Item );
		elseif (potionEffectId == 316) then
			missile.effect_16( User, Item );
		elseif (potionEffectId == 317) then 
			missile.effect_17( User, Item );
		elseif (potionEffectId == 318) then 
		    missile.effect_18( User, Item );
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
        User:talk(Character.say, "#me lässt eine Flasche fallen, welche explodiert.", "#me drops a bottle and it explodes.")
        common.InformNLS( User,
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
    User:talk(Character.say, "#me wirft eine Flasche, die zerplatzt.", "#me throws a bottle that splits.")
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
        common.InformNLS( User,
        "Du musst den Wurfkörper aus der Hand werfen.",
        "You have to throw the missle out of your hand.");
        return false; -- not in the hand; only for activated missile
	end
    return true;
end

function DrinkPotion(User,SourceItem)
-- no drink effect exists for bomb potions, yet
   common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
end

function UseItem(User, SourceItem, ltstate)
    -- repair potion in case it's broken
	alchemy.repairPotion(SourceItem)
	-- repair end

	if SourceItem:getData("filledWith")=="meraldilised slime" then
	    User:inform("Die Öffnung der Flasche ist von Klumpen verklebt, wodurch der zähflüssige Inhalt nicht ausfließen kann.",
		            "The opening of the bottle is clotted by gobs, so that its semifluid content cannot flow out.")
	end
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	if potionEffectId == nil then
	    potionEffectId = 0
	end	
	
	local cauldron = alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.FillIntoCauldron(User,SourceItem,cauldron,ltstate)
	   
	else -- not infront of a cauldron, therefore use it
        if User.attackmode then
		   common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			if (potionEffectId >= 300) and (potionEffectId <= 399) then -- a bomb
			      
				local missileStatus = SourceItem:getData("missileStatus")
				if (missileStatus == "deactivated") or (missileStatus == "") then -- potion deactivated or status not set --> activate
					common.InformNLS( User,
					"Du entsicherst des Wurfkörper. Vorsicht damit.",
					"You activate the missle. Careful with it.");
					SourceItem:setData("missileStatus","activated")
					world:changeItem( SourceItem );
				else
					common.InformNLS( User,
					"Du sicherst den Wurfkörper.",
					"You deactivate the missile.");
					SourceItem:setData("missileStatus","deactivated")
					world:changeItem( SourceItem );
		        end
			
			else -- not a bomb
				User:talk(Character.say, "#me trinkt eine dunkelblaue Flüssigkeit.", "#me drinks a dark blue liquid.")
				User.movepoints=User.movepoints - 20
				DrinkPotion(User,SourceItem)
				alchemy.EmptyBottle(User,SourceItem)
	        end
		end
	end  
end

function LookAtItem(User,Item)
	return base.lookat.GenerateLookAt(User, Item, 0)  
end
