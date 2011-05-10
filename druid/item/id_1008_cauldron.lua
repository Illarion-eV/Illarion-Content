-- DRUIDENTUM / ALCHEMIE 
-- Herstellung von Pflanzenextrakten
-- Fixieren von Pflanzenextrakten zu Potions
-- Neutralisieren von Pflanzenextrakten
-- Kessel 1008 (SourceItem) zur Herstellung von Pflanzensäften
-- by Falk

-- Flasche 164(grau) oder 331(grün) in der Hand
-- Pflanze,Mineral,Filtrat in der Hand
-- Auf Kessel auslösen

require("base.common")
require("druid.base.alchemy")
require("item.general.metal")

module("druid.item.id_1008_cauldron", package.seeall)

-- UPDATE common SET com_script='druid.item.id_1008_cauldron' WHERE com_itemid = 1008;

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
  --User:inform("debug ds_pflanzensud.lua") 
  -- prüfe ob der User eine Planze in der Hand hat
    local plantInHand = druid.base.alchemy.CheckIfPlantInHand(User);  
    -- prüfe ob eine Flasche in der Hand ist
    local bottleInHand = druid.base.alchemy.CheckIfBottleInHand(User);  
		-- check auf mehrere Flaschen(Stapelbug)
		if User:countItemAt("body",164)>1 or User:countItemAt("body",331)>1 then
			return
		end	
    -- Wenn der User eine Flasche hat dann...
    if plantInHand then
        -- braucht er noch eine Flasche
        if not bottleInHand then
            -- Die hat er aber nicht und das soll er wissen.
            base.common.InformNLS( User,
                "Du brauchst eine Flasche wenn du einen Trank mischen willst.",
                "You need one bottle if you want to brew a potion."
            );
            return;
        end     
        -- Flasche und Planze wurden gefunden. Also spalten wir den Wert auf der die Effektinformationen enthält

		-- Manche Pflanzen haben Doppelfunktionen und bekommen eine neue ID
        if plantInHand.data >9000 and plantInHand.data < 9017 then
        	dummy = plantInHand.data
        else
        	dummy =plantInHand.id
        end
        local plusWertPos,minusWertPos = druid.base.alchemy.SplitPlantData(dummy);
                        
        -- Wenn es eine leere Flasche ist werden default Werte verwendet.
        local bottleData = ( bottleInHand.id == 164 and 55555555 or bottleInHand.data );
        local bottleQual = ( bottleInHand.id == 164 and 999 or bottleInHand.quality );
        
        -- Und wir generieren eine Liste die jeden Eintrag des Datawertes einzeln enthält
        local dataZList = druid.base.alchemy.SplitBottleData(User,bottleData);

        -- Abhängig der Effektdaten der Planze wird ein Wert angehoben und ein anderer abgesenkt
        dataZList[plusWertPos] = math.min( 9, dataZList[plusWertPos] + 1 );
        dataZList[minusWertPos] = math.max( 1,dataZList[minusWertPos] - 1 );
        
        -- Aus den modifizierten Daten erstellen wir den neuen Datawert.
        bottleData = druid.base.alchemy.PasteBottleData(User,dataZList);
        
        -- die Pflanze löschen
        User:increaseAtPos(plantInHand.itempos,-1);
        
        -- Das Flascheitem wird entsprechend aller Daten modifiziert
        bottleInHand.id = 331;
        -- Die Qualität des Sudes richtet sich nach dem Alchemie Skill (0 Skill = Qualität 1)
		local quali = (User:getSkill("alchemy") + 10) * 10;
		if(quali > 999) then
			quali = 999;
		end
		bottleInHand.quality = quali;
        
        bottleInHand.data = bottleData;
        -- Hier noch einen Text einbauen, dass man gerade eine Pflanze verarbeitet...
        world:changeItem(bottleInHand);
        
		User.movepoints=User.movepoints-20; --Delay of 20 movepoints for scaling skillgain and prevent macro abuse. If you change this, also change the movepoints in the learn(...) line in alchemy.lua
			
        -- Und der Spieler soll noch was lernen
        druid.base.alchemy.ds_skillgain(User);
        return;
    end
    
    -- Der User hatte keine Planze. Vielleicht hat er ja Mineralstaub
    local gemInHand = druid.base.alchemy.CheckIfGemInHand(User);

    if gemInHand then     
        -- Er hat einen, aber hat er auch eine Flasche?
        if not bottleInHand then
            -- Nein er hat keine. Sagen wir ihm das.
            base.common.InformNLS( User,
                "Du brauchst eine Flasche wenn du einen Trank mischen willst.",
                "You need a bottle if you want to brew a potion."
            );
            return;
        end
        
        --Mineralstaub und Flasche sind da. Beides wird eingelesen.
        --local bottleInHand = User:getItemAt( bottleInHand );
        
        --Mit Mineralstaub werden Tränke fixiert. Wenn die Flasche leer ist, ist das sinnlos
        if( bottleInHand.id == 164 )then
            -- Und sie ist leer! Der User soll um seinen Fehler wissen:
            base.common.InformNLS( User,
                "Du musst schon erst einen Trank mischen ehe du ihn mit einem Mineral fixierst.",
                "You need to mix a potion before you fix it with a mineral."
            );
            return;
        end
        
        --alles ist in Ordnung. Der Mineralstaub wird gelöscht und die Flasche geändert
        
--[[  aber nur, wenn der Char ein Druide ist !!!
      ansonsten ein text, der ihm das mitteilt
  ]]--    
				if User:getMagicType() == 3 then
        	bottleInHand.id = druid.base.alchemy.newBottle[gemInHand.id];
        	world:changeItem(bottleInHand);
		    	User:increaseAtPos(gemInHand.itempos,-1);
        
        	-- Und lernen wollen wir auch noch was.
        	druid.base.alchemy.ds_skillgain(User);
        else
        base.common.InformNLS( User,
                "Du musst schon Druide sein, um so etwas zu können.",
                "You need to be a druid to do such things."
            );
        end		
        return;
    end
    
    -- Letzter Versuch. Vielleicht ist es ja Faulbaumrinde
    local rtbInHand = druid.base.alchemy.CheckIfRtbInHand(User);
    if rtbInHand then
        -- Faulbaumrinde ist da
        if not bottleInHand then
            -- aber keine Flasche
            base.common.InformNLS( User,
                "Du brauchst eine Flasche wenn du einen Sud mischen willst.",
                "You need a bottle if you want to brew a broth."
            );
            return;
        end
        
        -- Flasche ist da
        if( bottleInHand.id == 164 )then
            -- doch die Flasche ist leer
            base.common.InformNLS( User,
                "Du musst schon erst einen Sud mischen wenn du ihn mit Faulbaumrinde neutralisieren willst.",
                "You need to mix a broth before you neutralize it with rotten tree bark."
            );
            return;
        end
        
        -- alles in Ordnung! Weg mit der Rinde
        User:increaseAtPos(rtbInHand.itempos,-1);
        
        -- Datawert der Flasche aufspalten
        local dataZList = SplitBottleData(User,bottleInHand.data);
        
        -- Und alle Werte um 1 dem Mittelwert annähern
        for i=1,8 do
            if (dataZList[i] > 5) then
                dataZList[i] = dataZList[i] - 1
            elseif (dataZList[i] < 5) then
                dataZList[i] = dataZList[i] + 1         
            end        
        end
        
        -- neuen Datawert generieren
        bottleInHand.data = druid.base.alchemy.PasteBottleData(User,dataZList);
        
        -- und das Item speichern
        world:changeItem(bottleInHand);
        return;
    end
 
    base.common.InformNLS( User,
        "Du musst eine Sud-Pflanze in die Hand nehmen.",
        "You need to carry a broth plant in your hands."
    );
end


function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst einen Kupferkessel.")
    else
        world:itemInform(User,Item,"You look at a copper kettle.")        
    end
end
