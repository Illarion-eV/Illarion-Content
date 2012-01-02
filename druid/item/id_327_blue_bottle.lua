--ds_327_blaue_flasche.lua
--Druidensystem
--Nicht-Temporäre Einzelwirkungen
--Falk

require("base.common")
require("druid.base.alchemy")
require("druid.base.missile")

module("druid.item.id_327_blue_bottle", package.seeall) --, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_327_blue_bottle' WHERE com_itemid = 327;

-- Datawerte für Wurfkörper
-- Werte mï¿½ssen für optimierte Suche aufsteigend geordnet sein
listWK = {12836431, 13245638, 13983419, 16359531, 19123643, 21915579, 24968253, 26372612, 29732752, 32185872, 32484266,
          32812622, 33421656, 35471525, 36557188, 36835636, 42218944, 43185342, 43245354, 47564545, 52761593, 55938556,
          56548394, 57771997, 59159412, 62358491, 63155452, 64312656, 66475155, 67589591, 69657293, 71943574, 75568356,
          77254231, 79684787, 81876627, 84254555, 84613666, 86656358, 87783632, 88343542, 91357421, 93531588, 95257533,
          96261935, 96566994, 98538617};

function checkMissile(User, SourceItem, lower, upper)
    if not lower then
        lower = 0;
    end
    if not upper then
        upper = table.getn( listWK );
    end

    if lower > upper then
        return false;
    end;

    local margin = math.floor((lower+upper)/2);
    if listWK[margin] == SourceItem.data then
        return true;
    elseif listWK[margin] < SourceItem.data then
        return checkMissile( SourceItem.data, margin+1, upper );
    else
        return checkMissile( SourceItem.data, lower, margin-1 );
    end
end

function windtrank(User,SourceItem,TargetItem)
    --prï¿½fen, ob 5 Pfeile vorhanden (ID 64)
	if (User:countItemAt("all",64) < 5) then
	    base.common.InformNLS( User,
	    "Du brauchst zumindest 5 Pfeile um daraus Windpfeile zu fertigen.",
	    "You need at least 5 arrows to create wind arrows." );
	    return false;
	end
	--prï¿½fen, ob sonstige Voraussetzungen erfï¿½llt, zb Skills etc

	--Umwandlung normale Pfeile in Windpfeile
    world:erase(SourceItem,1)
    User:erase(Targetitem.id_id,5)
    User:createItem(322,5,333,0)
end

function Explode(User,Item)

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
    world:erase(Item,1);

end;

function Drop(User,Item)
    if (math.random(1,User:increaseAttrib("dexterity",0)+7)==1) then
        Explode(User,Item);
        User:talkLanguage(Character.say,Player.german,"#me lässt eine Flasche fallen, welche explodiert.");
        User:talkLanguage(Character.say,Player.english,"#me drops a bottle and it explodes.");
        base.common.InformNLS( User,
        "Der Wurfkörper rutscht dir aus den Händen und zerplatzt vor deinen Füßen.",
        "The missile slips out of your hands and burst asunder in front of you feets.");
    end;
end;

function MoveItemAfterMove(User, SourceItem, TargetItem)
	if Sourceitem.id_data == 0 then	
	else	
    if not checkMissile(User, SourceItem) then
        return; -- kein Wurfkörper
    end

    if (math.floor(SourceItem.quality/1000)==1) then
        return; -- Wurfkörper gesichert
    end

    if (SourceItem:getType()~=4 or (SourceItem.pos~=5 and SourceItem.pos~=6)) then
        Drop(User,TargetItem);
        return; -- Nicht in der Hand
    end

    if (TargetItem:getType()~=3) then
        Drop(User,TargetItem);
        return; -- Wird nicht auf die Karte geworfen
    end

    -- Alles okay, werfen und explodieren
    Explode(User,TargetItem);
    User:talkLanguage(Character.say,Player.german,"#me wirft eine Flasche, die zerplatzt.");
    User:talkLanguage(Character.say,Player.english,"#me throws a bottle that splits.");
    User.movepoints=User.movepoints-30;
	end    
end;

function MoveItemBeforeMove( User, SourceItem, TargetItem )
	if SourceItem.data == 0 then
	
	else	
    if not checkMissile(User, SourceItem) then
        return true; -- kein Wurfkörper
    end

    if (math.floor(SourceItem.quality/1000)==1) then
        return true; -- Wurfkörper gesichert
    end

    if (TargetItem:getType()~=3) then
        return true; -- Wird nicht auf die Karte geworfen
    end

    if (SourceItem:getType()~=4 or (SourceItem.pos~=5 and SourceItem.pos~=6)) then
        base.common.TempInformNLS( User,
        "Du musst den Wurfkörper aus der Hand werfen.",
        "You have to throw the missle out of your hand.");
        return false; -- Nicht in der Hand
    end
	end
    return true;
end


function UseItem(User,SourceItem,TargetItem,counter,param)
	local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if SourceItem.data == 0 then
		-- Windtrank alte Art vor DS
		if ( TargetItem and TargetItem.id == 64 ) and (User:countItem(64)>9) and (User:countItem(327)>0) then
			User:eraseItem(64,10)
			User:eraseItem(327,1)
	        User:createItem(322,10,333,0);
		else
			base.common.InformNLS(User,"Du brauchst 10 Pfeile pro Windtrank und den Windtrank in deiner Tasche","You need 10 arrows per wind potion and the wind potion in your pocket!");
		end
	else
		--Neue Wirkungen nach DS
		if (SourceItem.data == 63321157 and TargetItem) then --Windtrank
			windtrank(User, SourceItem, TargetItem);

		elseif checkMissile(SourceItem) then --das ist ein Wurfkörper
			if (math.floor(SourceItem.quality/1000)==1) then -- Wurfkörper gesichert (qual: 1xxx) --> entsichern (qual: xxx)
            	base.common.TempInformNLS( User,
            	"Du entsicherst des Wurfkörper. Vorsicht damit.",
            	"You activate the missle. Careful with it.");
            	SourceItem.quality = math.mod( SourceItem.quality, 1000 );
            	world:changeItem( SourceItem );
			else -- Wurfkörper entsichert --> sichern
				base.common.TempInformNLS( User,
            	"Du sicherst den Wurfkörper.",
            	"You deactivate the missile.");
            	SourceItem.quality = math.mod( SourceItem.quality, 1000 ) + 1000;
            	world:changeItem( SourceItem );
        	end
    	else
        	-- das ist weder ein Wurfkörper, noch eine Potion.
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
