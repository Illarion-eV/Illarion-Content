--ds_327_blaue_flasche.lua
--Druidensystem
--Nicht-Temporäre Einzelwirkungen
--Falk
-- reworked by Merung

require("base.common")
require("druid.base.alchemy")
require("druid.base.missile")

module("druid.item.id_327_blue_bottle", package.seeall) --, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_327_blue_bottle' WHERE com_itemid = 327;

-- Datawerte für Wurfkörper
-- Werte mï¿½ssen für optimierte Suche aufsteigend geordnet sein
ListWK = {};
ListWK = {16359531, 21915579, 24968253, 29732752, 33421656, 36835636, 47564545, 62358491, 63155452, 64312656, 66475155, 71943574, 75568356,
          84254555, 84613666, 87783632, 93531588};

function checkMissile(User, potionData) --, lower, upper)
    for i=1,#ListWK do
        if potionData == ListWK[i] then
	       checkValue = true
	       break
		end
    end
    return checkValue
end

function Explode(User,TargetItem)
Item = TargetItem
local potionData = (tonumber(Item:getData("potionData")))

    -- Effektname des Wurfkörpers ermitteln und dorthin verzweigen
    if (potionData == 16359531) then
        druid.base.missile.effect_16359531( User, Item );
    elseif (potionData == 21915579) then
        druid.base.missile.effect_21915579( User, Item );
    elseif (potionData == 24968253) then
        druid.base.missile.effect_24968253( User, Item );
    elseif (potionData == 29732752) then
        druid.base.missile.effect_29732752( User, Item );
    elseif (potionData == 33421656) then
        druid.base.missile.effect_33421656( User, Item );
    elseif (potionData == 36835636) then
        druid.base.missile.effect_36835636( User, Item );
    elseif (potionData == 47564545) then
        druid.base.missile.effect_47564545( User, Item );
    elseif (potionData == 62358491) then
        druid.base.missile.effect_62358491( User, Item );
    elseif (potionData == 63155452) then
        druid.base.missile.effect_63155452( User, Item );
    elseif (potionData == 64312656) then
        druid.base.missile.effect_64312656( User, Item );
    elseif (potionData == 66475155) then 
        druid.base.missile.effect_66475155( User, Item );
    elseif (potionData == 71943574) then
        druid.base.missile.effect_71943574( User, Item );
    elseif (potionData == 75568356) then 
        druid.base.missile.effect_75568356( User, Item );
    elseif (potionData == 84254555) then
        druid.base.missile.effect_84254555( User, Item );
    elseif (potionData == 84613666) then
        druid.base.missile.effect_84613666( User, Item );
    elseif (potionData == 87783632) then
        druid.base.missile.effect_87783632( User, Item );
    elseif (potionData == 93531588) then 
        druid.base.missile.effect_93531588( User, Item );
    else
        -- unbekannter Trank
    end

    -- Deko-Effekte
    world:gfx(36,Item.pos);
    world:makeSound(5,Item.pos);
    world:erase(Item,1);
end;

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
    
	if not checkMissile(User, SourceItem) then
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
    
	if not checkMissile(User, SourceItem) then
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


function UseItem(User,SourceItem,TargetItem,counter,param)
	potionData = tonumber(SourceItem:getData("potionData"));
	local missileStatus = (SourceItem:getData("missileStatus"));

	if checkMissile(User, potionData) then -- a missile
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
		-- no missile
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
