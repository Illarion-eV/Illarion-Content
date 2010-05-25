-- I_2184_Sammelbehälter für Pflanzen
-- by Falk

require("base.common")
dofile( "ds_base_alchemy.lua" );
dofile( "base_lookat_metal.lua" );

function UseItem(User,SourceItem,TargetItem,Counter,Param)

-- Da das Skript über den Tonbecher ausgelöst wurde, hier die Eingangswerte von SourceItem
   --User:inform("debug: User benutzt ID: "..SourceItem.id)
   --User:inform("debug: "..SourceItem.id" hat Quality: "..SourceItem.quality.." und Data: "..SourceItem.data)

-- Pflanzenliste einlesen und Werte inititalisieren
   Init_ds_base_alchemy()

-- prüfe, ob User eine Pflanze in der Hand hat
   plantInHand = CheckIfPlantInHand(User)
 
   if plantInHand then
      
      QualPlant = math.floor(plantInHand.quality/100)
      DuraPlant = plantInHand.quality - (QualPlant*100)
      
      --User:inform("debug: Die Pflanze in der Hand hat den Namen "..plantInHand.id.." eine Qualität von "..QualPlant.." und eine Dura von: "..DuraPlant)  
      --User:inform("debug: Die Pflanze hat eine Wirkung (in DATA) von "..plantData)
      
      -- Hat der Becher einen Datawert wir PflanzenID ?
      if SourceItem.data == plantInHand.id then
         -- Im Becher ist bereits eine solche Pflanze
         
         -- Hat Becher die gleiche Quality wie die Pflanze ?
            QualityBecher = math.floor(SourceItem.quality /100)
            AnzahlImBecher = SourceItem.quality - QualityBecher *100
            
            if QualityBecher == QualPlant then
               -- Im Becher ist die richtige Pflanze mit richtiger Quality
               
               -- Lösche Pflanze
                  User:increaseAtPos(plantInHand.itempos,-1)
               
               -- Zähler für Pflanzenanzahl hochsetzen
                  AnzahlImBecher = AnzahlImBecher +1
                  
                  -- Becherinhalt auf 10 Pflanzen begrenzen
                  if AnzahlImBecher > 10 then 
                     AnzahlImBecher = 10 
                  end
                  
                  SourceItem.quality = QualityBecher *100 + AnzahlImBecher
                  world:changeItem(SourceItem) 

                  --User:inform("debug Im Becher sind jetzt "..AnzahlImBecher.." Pflanzen mit ID "..plantInHand.id.." und Qualität: "..QualityBecher)  
               
            else
               -- In dem Becher steckt etwas Inkompatibles
               User:inform("In diesem Becher sammelst Du schon diese Pflanze, aber mit anderer Qualität")
               -- keine weiteren Maßnahmen treffen
            end  
              
      elseif SourceItem.data == 0 then
          -- Becher hat leeren Datawert, also kann man Becher mit Pflanzen füllen 
          
          -- Inhalt des Tonbechers ändern durch Übernahme der PflanzenID im Datawert des Bechers             
             SourceItem.data = plantInHand.id
             SourceItem.quality = plantInHand.quality + 1
             AnzahlImBecher = 1   
         
             world:changeItem(SourceItem) 
                        
            --User:inform("debug: Der Behälter hat jetzt eine Quality von "..SourceItem.quality.." und einen Datawert von: "..SourceItem.data)
            
            -- Lösche Pflanze
            User:increaseAtPos(plantInHand.itempos,-1)
      else
            User:inform("In diesem Becher liegt schon etwas anderes")      
      end
               
   else
      base.common.InformNLS( User,
                 "Du musst eine Pflanze in die Hand nehmen",
                 "You need to carry a plant in your hands")
   end


end

function UseItemWithCharacter(User,SourceItem,TargetChar,Counter,Param)

end
--
function UseItemWithField(User,SourceItem,TargetPos,Counter,Param)
   -- Becher soll ausgeschüttet werden
      QualityBecher = math.floor(SourceItem.quality /100)
      AnzahlImBecher = SourceItem.quality - QualityBecher *100
      
      --User:inform("debug:  Qualität der Pflanzen: "..QualityBecher)
      --User:inform("debug:  Anzahl der Pflanzen: "..AnzahlImBecher)
      --User:inform("debug:  Name der Pflanzen: "..SourceItem.data)
      
   if AnzahlImBecher > 0 and SourceItem.data > 0 then
      for i = 1,AnzahlImBecher do
         -- itemstapel auslegen !!! Achtung : woher beziehen wir data?
         world:createItemFromId(SourceItem.data,1,User.pos,true,(QualityBecher*100+1),15)         

      end
      SourceItem.quality = 101
      SourceItem.data = 0
      world:changeItem(SourceItem) 
   end
end
--