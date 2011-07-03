--I_329_schwarze_flasche
--Druidensystem in Arbeit
--Falk
require("base.common")
require("druid.base.alchemy")

module("druid.item.id_329_black_bottle", package.seeall, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_329_black_bottle' WHERE com_itemid = 329;

function DoDruidism(Character,SourceItem)

	if (druid.base.alchemy.checkPotionSpam(Character)) then
		base.common.InformNLS(Character, "Dein exzessives Trinken von Tränken hat wohl dazu geführt, dass Tränke vorrübergehend ihre Wirkung nicht mehr entfachen.", "The excessive drinking of potions seems to led to the fact that potions have no effects on you temporary.");
		return;
	end

--   Verwandlungszauber
  if firsttime == nil then
     ListCodecs = {}
     ListRaces  = {}
     ListRaceId = {}
     ListCodecs = {77744151,18784522,32699619,54876565,61348438,71378653,58548893,45634355,75529399,44554428,18861363,26562174,47418515,58151138,22551786,72225438,99992352,38114786,95371655,71796337,87611881,31231973,14523375,46852135,37531813,85293266,86659455,51464953,97171535,77577615,11695753,62545579,81519773,95153618,52728756,91986793,19831914}
     ListRaces  = {"Mensch","Zwerg","Halbling","Elb","Orc","Echse","Gnom","Oger","Mumie","Skelett","Beholder","Fliege","Schaf" ,"Spinne","Rotes Skelett","Rotwurm","Big Demon","Skorpion","Schwein","Unsichtbar","Schï¿½del","Wespe","Waldtroll","Geister-Skelett","SteinGolem","Goblin","Gnoll","Drache", "Drow","Drow-Frau","Kleiner Dämon","Kuh","Hirsch","Wolf","Panther","Hase","Gnom"}
     ListRaceId = {0,1,2,3,4,5,6,9,10,11,12,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,44}
     firsttime = 1
  end
  old_race = Character:get_race()
  for i=1,table.getn(ListCodecs) do
     if SourceItem.data == ListCodecs[i] then

--      Hier kommt die Sache mit dem Langzeiteffekt:
        find, myEffect = Character.effects:find(329);

        if not find then

           myEffect=LongTimeEffect(329,1);
--         Alten Wert sichern
           myEffect:addValue("old_race",old_race)

--         Neuen Wert sichern
           myEffect:addValue("new_race",ListRaceId[i])
--         Verwandlung ausfï¿½hren

					 world:gfx(5,Character.pos)
           Character:setAttrib("racetyp",ListRaceId[i])
           old_hp = Character:increaseAttrib("hitpoints",0)
           Character:increaseAttrib("hitpoints",-10000)
           Character:increaseAttrib("hitpoints",old_hp)
           Character:move(6,true)

--         Laufzeit nach Quality berechnen
           myEffect:addValue("zaehler",Sourceitem.id_quality)

--         Effekt an Char binden
           Character.effects:addEffect(myEffect);
        end
     end
  end

end

function UseItem(Character,SourceItem,TargetItem,Counter,Param)

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
		return
	end
	
    if (ltstate == Action.none) then
        User:startAction(20,0,0,12,25);
        User:talkLanguage(Character.say, Player.german, "#me beginnt einen Trank zu trinken.");
        User:talkLanguage(Character.say, Player.english, "#me starts to drink a potion.");
        return
    end

	if SourceItem.data == 0 then
		return; -- vermutlich Tinte
	elseif SourceItem.data == 71796337 then -- Unsichtbarkeitstrank
		Character:inform("Deactivated due to technical issues.");
		return;
	else

		world:erase(SourceItem,1);
		world:gfx(5,Character.pos);

		-- Hier verweisen wir auf die Wirkung
		-- Korrektur von Nitram, erst Flasche löschen, dann Verwandeln, weil beim Verwandeln die Flasche gedropped wird.
		DoDruidism(Character,SourceItem)

		if( math.random( 20 ) <= 1 ) then
			base.common.InformNLS( Character, "Die Flasche zerbricht.", "The bottle breaks.");
		else
			Character:createItem( 164, 1, 333,0);
		end

		Character.movepoints=Character.movepoints-50;
  end
end

--
function LookAtItem(User,Item)

    if Item.data == 77744151 then
        EtikettDe = "Gestaltenwandler Mensch"
        EtikettEn = "Shape Shifter Potion Human"
    elseif  Item.data == 18784522 then
        EtikettDe = "Gestaltenwandler Zwerg"
        EtikettEn = "Shape Shifter Potion Dwarf"
    elseif  Item.data == 32699619 then
        EtikettDe = "Gestaltenwandler Halbling"
        EtikettEn = "Shape Shifter Potion Halfling"
    elseif Item.data == 54876565 then
        EtikettDe = "Gestaltenwandler Elb"
        EtikettEn = "Shape Shifter Potion Elf"
    elseif Item.data == 61348438 then
        EtikettDe = "Gestaltenwandler Ork"
        EtikettEn = "Shape Shifter Potion Orc"
    elseif Item.data == 71378653 then
        EtikettDe = "Gestaltenwandler Echse"
        EtikettEn = "Shape Shifter Potion Lizard"
    elseif Item.data == 58548893 then
        EtikettDe = "Gestaltenwandler Gnom"
        EtikettEn = "Shape Shifter Potion Gnom"
    elseif Item.data == 45634355 then
        EtikettDe = "Gestaltenwandler Oger"
        EtikettEn = "Shape Shifter Potion Ogre"
    elseif Item.data == 75529399 then
        EtikettDe = "Gestaltenwandler Mumie"
        EtikettEn = "Shape Shifter Potion Mummy"
    elseif Item.data == 44554428 then
        EtikettDe = "Gestaltenwandler Skelett"
        EtikettEn = "Shape Shifter Potion Skeleton"
    elseif  Item.data == 18861363 then
        EtikettDe = "Gestaltenwandler Beholder"
        EtikettEn = "Shape Shifter Potion Beholder"
    elseif  Item.data == 26562174 then
        EtikettDe = "Gestaltenwandler Fliege"
        EtikettEn = "Shape Shifter Potion Fly"
    elseif Item.data == 47418515 then
        EtikettDe = "Gestaltenwandler Schaf"
        EtikettEn = "Shape Shifter Potion Sheep"
    elseif Item.data == 58151138 then
        EtikettDe = "Gestaltenwandler Spinne"
        EtikettEn = "Shape Shifter Potion Spider"
    elseif Item.data == 22551786 then
        EtikettDe = "Gestaltenwandler Rotes Skelett"
        EtikettEn = "Shape Shifter Potion Red Skeleton"
    elseif Item.data == 72225438 then
        EtikettDe = "Gestaltenwandler Rotwurm"
        EtikettEn = "Shape Shifter Potion Redworm"
    elseif Item.data == 99992352 then
        EtikettDe = "Gestaltenwandler Großer Dämon"
        EtikettEn = "Shape Shifter Potion Big Demon"
    elseif Item.data == 38114786 then
        EtikettDe = "Gestaltenwandler Skorpion"
        EtikettEn = "Shape Shifter Potion Scorpion"
    elseif Item.data == 95371655 then
        EtikettDe = "Gestaltenwandler Schwein"
        EtikettEn = "Shape Shifter Potion Pig"
    elseif Item.data == 71796337 then
        EtikettDe = "Gestaltenwandler Luft"
        EtikettEn = "Shape Shifter Potion Air"
    elseif Item.data == 87611881 then
        EtikettDe = "Gestaltenwandler Schï¿½del"
        EtikettEn = "Shape Shifter Potion Skull"
    elseif Item.data == 31231973 then
        EtikettDe = "Gestaltenwandler Wespe"
        EtikettEn = "Shape Shifter Potion Wasp"
    elseif Item.data == 14523375 then
        EtikettDe = "Gestaltenwandler Waldtroll"
        EtikettEn = "Shape Shifter Potion Forest Troll"
    elseif Item.data == 46852135 then
        EtikettDe = "Gestaltenwandler Geister-Skelett"
        EtikettEn = "Shape Shifter Potion Shadow Skeleton"
    elseif Item.data == 37531813 then
        EtikettDe = "Gestaltenwandler Stein-Golem"
        EtikettEn = "Shape Shifter Potion Stone-Golem"
    elseif Item.data == 85293266 then
        EtikettDe = "Gestaltenwandler Goblin"
        EtikettEn = "Shape Shifter Potion Goblin"
    elseif Item.data == 86659455 then
        EtikettDe = "Gestaltenwandler Gnoll"
        EtikettEn = "Shape Shifter Potion Gnoll"
    elseif Item.data == 51464953 then
        EtikettDe = "Gestaltenwandler Drache"
        EtikettEn = "Shape Shifter Potion Dragon"
    elseif Item.data == 97171535 then
        EtikettDe = "Gestaltenwandler Drow"
        EtikettEn = "Shape Shifter Potion Drow"
    elseif Item.data == 77577615 then
        EtikettDe = "Gestaltenwandler Drow-Frau"
        EtikettEn = "Shape Shifter Potion Female Drow"
    elseif Item.data == 11695753 then
        EtikettDe = "Gestaltenwandler Kleiner Dämon"
        EtikettEn = "Shape Shifter Potion Lower Demon"
    elseif Item.data == 62545579 then
        EtikettDe = "Gestaltenwandler Kuh"
        EtikettEn = "Shape Shifter Potion Cow"
    elseif Item.data == 81519773 then
        EtikettDe = "Gestaltenwandler Hirsch"
        EtikettEn = "Shape Shifter Potion Deer"
    elseif Item.data == 95153618 then
        EtikettDe = "Gestaltenwandler Wolf"
        EtikettEn = "Shape Shifter Potion Wolve"
    elseif Item.data == 52728756 then
        EtikettDe = "Gestaltenwandler Panther"
        EtikettEn = "Shape Shifter Potion Panther"
    elseif Item.data == 91986793 then
        EtikettDe = "Gestaltenwandler Hase"
        EtikettEn = "Shape Shifter Potion Rabbit"
    elseif Item.data == 19831914 then
        EtikettDe = "Gestaltenwandler Gnom"
        EtikettEn = "Shape Shifter Potion gnome"
    else
      if Item.data == 0 then
        EtikettDe = "Tinte"
        EtikettEn = "Ink"
      else
        EtikettDe = "Janus-Trunk"
        EtikettEn = "Janus Potion"
      end
    end

  if (User:getPlayerLanguage()==0) then
     world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: "..EtikettDe)
  else
     world:itemInform(User,Item,"You look at a sticker telling: "..EtikettEn)
  end

end
