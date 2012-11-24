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

-- PLEASE WRITE YOUR COMMENTARIES IN THE PROJECT LANGUAGE: ENGLISH! ~Estralis

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

  -- prüfe ob der User eine Planze in der Hand hat
    local plantInHand = druid.base.alchemy.CheckIfPlantInHand(User);  
    -- prüfe ob eine Flasche in der Hand ist
    local bottleInHand = druid.base.alchemy.CheckIfBottleInHand(User);  
		-- check auf mehrere Flaschen (Stapelbug)
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

        if dataZList[plusWertPos] == 9 or dataZList[minusWertPos] == 1 then
		   world:makeSound(10,User.pos);
	       User:increaseAtPos(plantInHand.itempos,-1);
		   world:erase( bottleInHand, 1 );
		   world:makeSound(5,User.pos);
	       world:gfx(0,User.pos);
		   base.common.InformNLS( User,
                "Flasche weg.",
                "Bottle gone."
            );
		   return;
		end   
		
		-- Abhängig der Effektdaten der Planze wird ein Wert angehoben und ein anderer abgesenkt
        if plusWertPos == 0 then
		   dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
		elseif minusWertPos == 0 then
		       dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
		else
		     dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
             dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
        end
        
        -- Aus den modifizierten Daten erstellen wir den neuen Datawert.
        bottleData = druid.base.alchemy.PasteBottleData(User,dataZList);
        
        -- die Pflanze löschen
        world:makeSound(10,User.pos);
		User:increaseAtPos(plantInHand.itempos,-1);
        
        -- Das Flaschenitem wird entsprechend aller Daten modifiziert
        
        -- Die Qualität des Sudes richtet sich nach dem Alchemie-Skill (0 Skill = Qualität 1)
		if bottleInHand.id == 331 then
		   if math.random(1,100) <= math.floor(120/(User:getSkill(Character.alchemy)+User:increaseAttrib("perception",0))) then
		      quali = bottleInHand.quality - 100;
          else 
		      quali = bottleInHand.quality;
		   end		
		elseif bottleInHand.id == 164 then
		       quali = math.floor(User:getSkill(Character.alchemy)+User:increaseAttrib("perception",0)*8);
		end
		
		bottleInHand.id = 331;
		bottleInHand.quality = quali;
        bottleInHand.data = bottleData;
        -- Hier noch einen Text einbauen, dass man gerade eine Pflanze verarbeitet...
        world:changeItem(bottleInHand);
        
		User.movepoints=User.movepoints-30; --Delay of 30 movepoints for scaling skillgain and prevent macro abuse. If you change this, also change the movepoints in the learn(...) line in alchemy.lua
			
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
    
    
 -- WUT!?!
    base.common.InformNLS( User,
        "Du musst eine Sud-Pflanze in die Hand nehmen.",
        "You need to carry a broth plant in your hands."
    );
end
