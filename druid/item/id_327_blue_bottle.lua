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
ListWK = {12836431, 13245638, 13983419, 16359531, 19123643, 21915579, 24968253, 26372612, 29732752, 32185872, 32484266,
          32812622, 33421656, 35471525, 36557188, 36835636, 42218944, 43185342, 43245354, 47564545, 52761593, 55938556,
          56548394, 57771997, 59159412, 62358491, 63155452, 64312656, 66475155, 67589591, 69657293, 71943574, 75568356,
          77254231, 79684787, 81876627, 84254555, 84613666, 86656358, 87783632, 88343542, 91357421, 93531588, 95257533,
          96261935, 96566994, 98538617};

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
    if (potionData == 12836431) then
        druid.base.missile.effect_12836431( User, Item );
    elseif (potionData == 13245638) then
        druid.base.missile.effect_13245638( User, Item );
    elseif (potionData == 13983419) then
        druid.base.missile.effect_13983419( User, Item );
    elseif (potionData == 16359531) then
        druid.base.missile.effect_16359531( User, Item );
    elseif (potionData == 19123643) then
        druid.base.missile.effect_19123643( User, Item );
    elseif (potionData == 21915579) then
        druid.base.missile.effect_21915579( User, Item );
    elseif (potionData == 24968253) then
        druid.base.missile.effect_24968253( User, Item );
    elseif (potionData == 26372612) then
        druid.base.missile.effect_26372612( User, Item );
    elseif (potionData == 29732752) then
        druid.base.missile.effect_29732752( User, Item );
    elseif (potionData == 32185872) then
        druid.base.missile.effect_32185872( User, Item );
    elseif (potionData == 32484266) then
        druid.base.missile.effect_32484266( User, Item );
    elseif (potionData == 32812622) then
        druid.base.missile.effect_32812622( User, Item );
    elseif (potionData == 33421656) then
        druid.base.missile.effect_33421656( User, Item );
    elseif (potionData == 35471525) then
        druid.base.missile.effect_35471525( User, Item );
    elseif (potionData == 36557188) then
        druid.base.missile.effect_36557188( User, Item );
    elseif (potionData == 36835636) then
        druid.base.missile.effect_36835636( User, Item );
    elseif (potionData == 42218944) then
        druid.base.missile.effect_42218944( User, Item );
    elseif (potionData == 43185342) then
        druid.base.missile.effect_43185342( User, Item );
    elseif (potionData == 43245354) then
        druid.base.missile.effect_43245354( User, Item );
    elseif (potionData == 47564545) then
        druid.base.missile.effect_47564545( User, Item );
    elseif (potionData == 52761593) then
        druid.base.missile.effect_52761593( User, Item );
    elseif (potionData == 55938556) then
        druid.base.missile.effect_55938556( User, Item );
    elseif (potionData == 56548394) then
        druid.base.missile.effect_56548394( User, Item );
    elseif (potionData == 57771997) then
        druid.base.missile.effect_57771997( User, Item );
    elseif (potionData == 59159412) then
        druid.base.missile.effect_59159412( User, Item );
    elseif (potionData == 62358491) then
        druid.base.missile.effect_62358491( User, Item );
    elseif (potionData == 63155452) then
        druid.base.missile.effect_63155452( User, Item );
    elseif (potionData == 64312656) then
        druid.base.missile.effect_64312656( User, Item );
    elseif (potionData == 66475155) then
        druid.base.missile.effect_66475155( User, Item );
    elseif (potionData == 67589591) then
        druid.base.missile.effect_67589591( User, Item );
    elseif (potionData == 69657293) then
        druid.base.missile.effect_69657293( User, Item );
    elseif (potionData == 71943574) then
        druid.base.missile.effect_71943574( User, Item );
    elseif (potionData == 75568356) then
        druid.base.missile.effect_75568356( User, Item );
    elseif (potionData == 77254231) then
        druid.base.missile.effect_77254231( User, Item );
    elseif (potionData == 79684787) then
        druid.base.missile.effect_79684787( User, Item );
    elseif (potionData == 81876627) then
        druid.base.missile.effect_81876627( User, Item );
    elseif (potionData == 84254555) then
        druid.base.missile.effect_84254555( User, Item );
    elseif (potionData == 84613666) then
        druid.base.missile.effect_84613666( User, Item );
    elseif (potionData == 86656358) then
        druid.base.missile.effect_86656358( User, Item );
    elseif (potionData == 87783632) then
        druid.base.missile.effect_87783632( User, Item );
    elseif (potionData == 88343542) then
        druid.base.missile.effect_88343542( User, Item );
    elseif (potionData == 91357421) then
        druid.base.missile.effect_91357421( User, Item );
    elseif (potionData == 93531588) then -- checked!
        druid.base.missile.effect_93531588( User, Item );
    elseif (potionData == 95257533) then
        druid.base.missile.effect_95257533( User, Item );
    elseif (potionData == 96261935) then
        druid.base.missile.effect_96261935( User, Item );
    elseif (potionData == 96566994) then
        druid.base.missile.effect_96566994( User, Item );
    elseif (potionData == 98538617) then
        druid.base.missile.effect_98538617( User, Item );
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
        base.common.TempInformNLS( User,
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
			base.common.TempInformNLS( User,
			"Du entsicherst des Wurfkörper. Vorsicht damit.",
			"You activate the missle. Careful with it.");
			SourceItem:setData("missileStatus","activated")
			world:changeItem( SourceItem );
		else
			base.common.TempInformNLS( User,
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
