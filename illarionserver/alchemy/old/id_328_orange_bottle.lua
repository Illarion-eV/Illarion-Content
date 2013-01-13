--I_328_orange_flasche
--Druidensystem in Arbeit
--Falk
require("base.common")
require("alchemy.base.alchemy")

module("alchemy.item.id_328_orange_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_328_orange_bottle' WHERE com_itemid = 328;

function DoDruidism(Character,SourceItem)
--Heilmittel für 8 Virus-Erkrankungen

	if (SourceItemREPLACED == 12345678) then -- TODO: Assign Potion Data
		-- Vampirism Desease Healing
		local foundEffect, vampEffect = Character.effects:find(501);
		if foundEffect then
			local foundNPE, noPotionEffect = vampEffect:findValue("npe");
			if foundNPE then
				if noPotionEffect > 3 then
					world:erase(SourceItem, 1);
					base.common.InformNLS(Character,
						"Du trinkst die Flüssigkeit, doch sie scheint keine Wirkung mehr auf dich zu haben. Die Krankheit hat sich zu weit entwickelt.",
						"You drink the liquid but it doesn't seem to have any effect on you. The desease seems to have developed too much.");
					return;
				end
			end
			world:erase(SourceItem, 1);
			base.common.InformNLS(Character, 
				"Nachdem du die Flüssigkeit getrunken hast, fühlst du dich leicht schwach, aber das Verlangen nach Blut scheint verschwunden.",
				"After you drank the liquid, you felt a little weak, but the demand for blood seems to be gone.");
			Character.effects:removeEffect(501);
			return;
		end
	end

  find, myEffect = Character.effects:find(167);
  if find then 
     
     find2,zaehler = myEffect:findValue("zaehler") 
     if not find2 then
        Character:inform("Error in 328.1 - please call dev")
     else
        find3,diagnose = myEffect:findValue("illness")        
        if not find3 then
           Character:inform("Error in 328.2 - please call dev")
        else
			local codeList = {16159738,49134362,37568889,15363356,82655747,14791859,85568351,76359585};
			local potionData = SourceItemREPLACED;
			if potionData == codeList[diagnose] then
--            Feststellung, ob die Qualität des Heiltrankes ï¿½ber der Schwere der Krankheit liegt 
--            Je hï¿½her die Krankheit in der Ordnungsnummer (1-8) liegt, umso hï¿½her sind die Anforderungen an den Heiltrank                    
              -- CONST may reduce the needed quality
			  local const = math.min(25,Character:increaseAttrib("constitution",0));
			  local seriousness = illness_seriousness[diagnose] - (math.random(30)<const and 1 or 0);
			  if math.random(111,illness_seriousness[diagnose] * 111) < SourceItem.quality then
                
--               Die Wirkung erfolgt indirekt durch das Herabsetzen des Rundezählers.
                 -- CONST may raise the probability for a good effect
				 local bottom = math.max(111,math.floor(SourceItem.quality*const/30));
				 zaehler = zaehler - math.random(bottom,SourceItem.quality)
                 world:gfx(52,Character.pos)                 
                 if zaehler <1 then 
                    zaehler = 1 
                 end
                 myEffect:addValue("zaehler",zaehler)
				 base.common.InformNLS(Character,
					"Die Wirkung des Tranks lindert dein Leiden.",
					"The effect of the potion allays your suffering.");
				 return;
              else
                 Character:inform("debug: keine Heilung wegen zu niedriger Trank-Qualität")
              end
           else
              Character:inform("debug: keine Heilung wegen falscher Medikamentation")
           end
        end
     end
   end
   world:erase(SourceItem,1);
   base.common.InformNLS(Character,
	"Du trinkst die Flüssigkeit, doch sie scheint keine Wirkung auf dich zu haben.",
	"You drink the liquid but it doesn't seem to have any effect on you.");
end

function UseItem(Character, SourceItem)

    if (ltstate == Action.abort) then
        Character:talkLanguage(Character.say, Player.german, "#me verschüttet den Trank.");
        Character:talkLanguage(Character.say, Player.english, "#me spills the potion.");
        world:erase(SourceItem,1);
        -- Chance for a new bottle 19/20
        if(math.random(20) == 1) then
            base.common.InformNLS(Character, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            Character:createItem(164, 1, 333, 0);
        end
        return
    end

    if Character.attackmode then
        base.common.InformNLS(Character, "Du kannst nichts trinken während du kämpfst.", "You can't drink something while fighting.");
	end
	
    if (ltstate == Action.none) then
        User:startAction(20,0,0,12,25);
        User:talkLanguage(Character.say, Player.german, "#me beginnt einen Trank zu trinken.");
        User:talkLanguage(Character.say, Player.english, "#me starts to drink a potion.");
        return
    end

     DoDruidism(Character,SourceItem)
     
     world:gfx(5,Character.pos)

     if not Character:isAdmin() then
        world:erase(SourceItem,1);
        if( math.random( 20 ) <= 1 ) then
           base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
        else
           Character:createItem( 164, 1, 333,0);
        end    
     end 
  
     Character.movepoints=Character.movepoints-50;  
end

function LookAtItem(User,Item)

  if ItemREPLACED == 16159738 then
     Etikett ="Rhag Anghenfil Twymyn"
  elseif ItemREPLACED == 49134362 then
     Etikett ="Rhag Morfa Cwlwm Gwythi"
  elseif ItemREPLACED == 37568889 then
     Etikett ="Trolio Caethineb Meddyginiaeth"
  elseif Item.id_data == 15363356 then
     Etikett ="Corrach Rhithdyb Gwrthwenwyn"
  elseif ItemREPLACED == 82655747 then
     Etikett ="Rhag Vein-Syndrome Meddyginiaeth"
  elseif ItemREPLACED == 14791859 then
     Etikett ="Draig Brech Moddion"
  elseif ItemREPLACED == 85568351 then
     Etikett ="Gwrthwenwyn Rhag Sgorpion Epidemig"
  elseif ItemREPLACED == 76359585 then
     Etikett ="Blaidd Haint Meddyginiaeth"
  else
     Etikett ="Cyffur"
  end

  if (User:getPlayerLanguage()==0) then
    world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: "..Etikett)
  else
    world:itemInform(User,Item,"You look at a sticker telling: "..Etikett)      
  end

end
