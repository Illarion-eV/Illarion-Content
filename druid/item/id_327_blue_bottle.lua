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
--[[
    -- Effektname des Wurfkörpers ermitteln und dorthin verzweigen
    if (Item.data == 12836431) then
        effect_12836431( User, Item );
    elseif (Item.data == 13245638) then
        effect_13245638( User, Item );
    elseif (Item.data == 13983419) then
        effect_13983419( User, Item );
    elseif (Item.data == 16359531) then
        effect_16359531( User, Item );
    elseif (item.id_data == 19123643) then
        effect_19123643( User, Item );
    elseif (Item.data == 21915579) then
        effect_21915579( User, Item );
    elseif (Item.data == 24968253) then
        effect_24968253( User, Item );
    elseif (item.id_data == 26372612) then
        effect_26372612( User, Item );
    elseif (Item.data == 29732752) then
        effect_29732752( User, Item );
    elseif (Item.data == 32185872) then
        effect_32185872( User, Item );
    elseif (Item.data == 32484266) then
        effect_32484266( User, Item );
    elseif (Item.data == 32812622) then
        effect_32812622( User, Item );
    elseif (Item.data == 33421656) then
        effect_33421656( User, Item );
    elseif (item.id_data == 35471525) then
        effect_35471525( User, Item );
    elseif (item.id_data == 36557188) then
        effect_36557188( User, Item );
    elseif (Item.data == 36835636) then
        effect_36835636( User, Item );
    elseif (Item.data == 42218944) then
        effect_42218944( User, Item );
    elseif (Item.data == 43185342) then
        effect_43185342( User, Item );
    elseif (item.id_data == 43245354) then
        effect_43245354( User, Item );
    elseif (Item.data == 47564545) then
        effect_47564545( User, Item );
    elseif (Item.data == 52761593) then
        effect_52761593( User, Item );
    elseif (Item.data == 55938556) then
        effect_55938556( User, Item );
    elseif (Item.data == 56548394) then
        effect_56548394( User, Item );
    elseif (Item.data == 57771997) then
        effect_57771997( User, Item );
    elseif (Item.data == 59159412) then
        effect_59159412( User, Item );
    elseif (item.id_data == 62358491) then
        effect_62358491( User, Item );
    elseif (Item.data == 63155452) then
        effect_63155452( User, Item );
    elseif (Item.data == 64312656) then
        effect_64312656( User, Item );
    elseif (Item.data == 66475155) then
        effect_66475155( User, Item );
    elseif (Item.data == 67589591) then
        effect_67589591( User, Item );
    elseif (Item.data == 69657293) then
        effect_69657293( User, Item );
    elseif (Item.data == 71943574) then
        effect_71943574( User, Item );
    elseif (Item.data == 75568356) then
        effect_75568356( User, Item );
    elseif (Item.data == 77254231) then
        effect_77254231( User, Item );
    elseif (Item.data == 79684787) then
        effect_79684787( User, Item );
    elseif (item.id_data == 81876627) then
        effect_81876627( User, Item );
    elseif (Item.data == 84254555) then
        effect_84254555( User, Item );
    elseif (Item.data == 84613666) then
        effect_84613666( User, Item );
    elseif (Item.data == 86656358) then
        effect_86656358( User, Item );
    elseif (Item.data == 87783632) then
        effect_87783632( User, Item );
    elseif (Item.data == 88343542) then
        effect_88343542( User, Item );
    elseif (item.id_data == 91357421) then
        effect_91357421( User, Item );
    elseif (Item.data == 93531588) then
        effect_93531588( User, Item );
    elseif (Item.data == 95257533) then
        effect_95257533( User, Item );
    elseif (Item.data == 96261935) then
        effect_96261935( User, Item );
    elseif (Item.data == 96566994) then
        effect_96566994( User, Item );
    elseif (Item.data == 98538617) then
        effect_98538617( User, Item );
    else
        -- unbekannter Trank
    end

    -- Deko-Effekte
    world:gfx(36,item.pos);
    world:makeSound(5,item.pos);
    world:erase(Item,1);]]
User:inform("explosion!")
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
	
    if not checkMissile(User, SourceItem) then
        return true; -- no missile
    end

    if (missileStatus == "deactivated") or (missileStatus == "") then
        return true; -- missile is deactivated
    end

    if (SourceItem:getType()~=4 or (SourceItem.pos~=5 and SourceItem.pos~=6)) then
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
	
    if not checkMissile(User, SourceItem) then
        return true; -- no missile
    end

    if (TargetItem:getType()~=3) then
        return true; -- not thrown at the map
    end

    User:inform(""..SorceItem.pos)
	if ((not SourceItem.pos==5) and (not SourceItem.pos==6)) and (SourceItem:getData("missileStatus") == "activated") then
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
	missileStatus = (SourceItem:getData("missileStatus"));

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
