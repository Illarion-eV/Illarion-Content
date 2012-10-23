-- Druidsystem: diseases
--Falk
require("base.common")
require("alchemy.base.alchemy")

module("alchemy.item.id_167_yellow_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_167_yellow_bottle' WHERE com_itemid = 167;

function DrinkPotion(Character,SourceItem)

	local dataZList = druid.base.alchemy.SplitBottleData(Character,SourceItem.data);
	druid.base.alchemy.generateTasteMessage(Character,dataZList);
	
	local found, myEffect = Character.effects:find(167);
	if not found then
		local diagnose = 0;
		myEffect=LongTimeEffect(167,1);
		
		if SourceItem.data == 83795161 then
			--     Character:inform("Ork-Fieber/orc-fever")
			diagnose=1
		elseif SourceItem.data == 26343194 then
			--     Character:inform("Sumpfkrampf/bog-attack")
			diagnose=2
		elseif SourceItem.data == 98886573 then
			--     Character:inform("Trollsucht/Troll's rash")
			diagnose=3
		elseif SourceItem.data == 65336351 then
			--     Character:inform("Gnom-Wahn/gnome-paranoia")
			diagnose=4
		elseif math.mod(SourceItem.data,10000000) == 8455363 then
			--     Character:inform("Vein'sches Syndrom/Veins'syndrome")
			diagnose=5
			local allergy = math.floor(SourceItem.data/10000000);
			if allergy == 3 then
				allergy = 1;
			elseif allergy == 5 then
				allergy = 2;
			elseif allergy == 7 then
				allergy = 3;
			else
				allergy = math.random(1,3);
			end
			myEffect:addValue("allergy",allergy);
		elseif SourceItem.data == 95819741 then
			--     Character:inform("Drachenpocken/dragon's pox")
			diagnose=6
		elseif SourceItem.data == 15386558 then
			--     Character:inform("Skorpion-Seuche/scorpion's pestilence")
			diagnose=7
		elseif SourceItem.data == 58595367 then
			--     Character:inform("Wolfspest/wolves pest")
			diagnose=8
		end
		
		if diagnose ~= 0 then
			-- correct data value
			myEffect:addValue("illness",diagnose)
			--  Laufzeit nach Quality berechnen, maximal 999 Runden
			myEffect:addValue("zaehler",SourceItem.quality)

			--  Effekt an Char binden
			Character.effects:addEffect(myEffect);
			
			Character.movepoints=Character.movepoints-20;
		end
	else
		-- Character has already a disease (thus is immune to anything else)
		base.common.InformNLS(Character,
			"Du trinkst die Flüssigkeit, doch sie scheint keine Wirkung auf dich zu haben.",
			"You drink the liquid but it doesn't seem to have any effect on you.");
	end

	world:makeSound(12,Character.pos);
end

-- @return true if potion has been used
function PoisonCharacter(User,SourceItem,Character)
	if User.id == Character.id then
		return false;
	end
	if base.common.IsLookingAt(User,Character.pos) then
		if not base.common.IsLookingAt(Character,User.pos) then
			local SkillName=Skill.poisoning;
			local SkillVal=User:getSkill(SkillName);
			local AttribVal=math.floor((User:increaseAttrib("dexterity",0)*2+User:increaseAttrib("agility",0))/3)*(math.random(7,13)/10);
			local PoiTry=(6/10)*(SkillVal+AttribVal)+10;
			local AttribValDef=math.floor((Character:increaseAttrib("dexterity",0)+(Character:increaseAttrib("agility",0)*2))/3)*(math.random(7,13)/10);
			local PoiDef=(5*AttribValDef)-11;
			if (PoiTry>PoiDef) then
				base.common.InformNLS(User,
					"Du verabreichst deinem Opfer den Trank.",
					"You administer your victim the potion.");
				base.common.InformNLS(Character,
					"Jemand hat dir einen Trank in den Mund geschüttet.",
					"Someone has poured a potion into your mouth.");
				DrinkPotion(Character, SourceItem);
			else
				base.common.InformNLS(User,
					"Du versuchst deinem Opfer den Trank zu verabreichen, aber du scheiterst.",
					"You try to administer the potion to your victim, buy you fail.");
				base.common.InformNLS(Character,
					"Jemand versuchte dir den Inhalt einer Flasche in den Mund zu schütten.",
					"Someone tried to make you drink a potion.");
			end
			--User:learn(5,SkillName,1,(3*AttribValDef)+40);
			--Replace with new learn function, see learn.lua 
			return true;
		else
			base.common.InformNLS(User,
				"Dein Opfer darf nicht zu dir sehen, wenn du Erfolg haben willst.",
				"Your victim shouldn't look at you, if you want to succeed.");
		end
	else
		base.common.InformNLS(User,
			"Du musst zu deinem Opfer sehen.",
			"You have to look at your victim.");
	end
	return false;
end

function DoDruidism(Character,SourceItem)
--Krankheiten
--Hier kommt die Sache mit dem Langzeiteffekt:
  local found, myEffect = Character.effects:find(167);
  if not found then
    myEffect=LongTimeEffect(167,1);

    if SourceItem.data == 83795161 then
--     Character:inform("Ork-Fieber/orc-fever")
       diagnose=1
    elseif SourceItem.data == 26343194 then
--     Character:inform("Sumpfkrampf/bog-attack")
       diagnose=2
    elseif SourceItem.data == 98886573 then
--     Character:inform("Trollsucht/Troll's rash")
       diagnose=3
    elseif SourceItem.data == 65336351 then
--     Character:inform("Gnom-Wahn/gnome-paranoia")
       diagnose=4
    elseif math.mod(SourceItem.data,10000000) == 8455363 then
--     Character:inform("Vein'sches Syndrom/Veins'syndrome")
		   diagnose=5
		   local allergy = math.floor(SourceItem.data/10000000);
		   if allergy == 3 then
			   allergy = 1;
		   elseif allergy == 5 then
			   allergy = 2;
		   elseif allergy == 7 then
			   allergy = 3;
		   else
			   allergy = math.random(1,3);
		   end
		   myEffect:addValue("allergy",allergy);
    elseif SourceItem.data == 95819741 then
--     Character:inform("Drachenpocken/dragon's pox")
       diagnose=6
    elseif SourceItem.data == 15386558 then
--     Character:inform("Skorpion-Seuche/scorpion's pestilence")
       diagnose=7
    elseif SourceItem.data == 58595367 then
--     Character:inform("Wolfspest/wolves pest")
       diagnose=8
    end
--
    myEffect:addValue("illness",diagnose)
--  Laufzeit nach Quality berechnen, maximal 999 Runden
    myEffect:addValue("zaehler",SourceItem.quality)

--  Effekt an Char binden
    Character.effects:addEffect(myEffect);
  else
--  Character hat schon eine Krankheit (und ist immun vor weiterer Infektion)
    base.common.InformNLS(Character,
		"Du trinkst die Flüssigkeit, doch sie scheint keine Wirkung auf dich zu haben.",
		"You drink the liquid but it doesn't seem to have any effect on you.");
  end
end -- function DoDruidism()

--
function UseItem(Character,SourceItem,TargetItem,Counter,Param,ltstate)
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
        base.common.InformNLS(Character,
			"Du kannst den Trank nicht benutzen während du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	if not base.common.IsItemInHands(SourceItem) then
		base.common.InformNLS(Character,
			"Du musst die Flasche in die Hand nehmen.",
			"You have to take the bottle in your hand.");
		return;
	end
	
    if (ltstate == Action.none) then
		local frontChar = base.common.GetFrontCharacter(Character);
		if frontChar then
			if not PoisonCharacter(Character, SourceItem, frontChar) then
				return;
			end
		else
			Character:startAction(20,0,0,12,25);
			Character:talkLanguage(Character.say, Player.german, "#me beginnt einen Trank zu trinken.");
			Character:talkLanguage(Character.say, Player.english, "#me starts to drink a potion.");
			return;
		end
    else
		-- drink self
		DrinkPotion(Character, SourceItem);
	end
	
	world:erase(SourceItem,1);

    if( math.random( 20 ) <= 1 ) then
        base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
    else
        Character:createItem( 164, 1, 333,0);
    end
end

function LookAtItem(User,Item)

  if Item.data == 83795161 then
     Etikett ="Gwenwyn Anghenfil Twymyn"
  elseif Item.data == 26343194 then
     Etikett ="Gwenwyn Morfa Cwlwm Gwythi"
  elseif item.id_data == 98886573 then
     Etikett ="Gwenwyn Trolio Caethineb"
  elseif Item.data == 65336351 then
     Etikett ="Gwenwyn Corrach Rhithdyb"
  elseif math.mod(item.id_data,10000000) == 8455363 then
     Etikett ="Gwenwyn Rhag Vein-Syndrome"
  elseif Item.data == 95819741 then
     Etikett ="Gwenwyn Draig Brech Moddion"
  elseif Item.data == 15386558 then
     Etikett ="Gwenwyn Sgorpion Epidemig"
  elseif Item.data == 58595367 then
     Etikett ="Gwenwyn Blaidd Haint"
  else
     Etikett ="Siwgr Dwfr"
  end

  if (User:getPlayerLanguage()==0) then
    world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: "..Etikett)
  else
    world:itemInform(User,Item,"You look at a sticker telling: "..Etikett)    
  end

end
