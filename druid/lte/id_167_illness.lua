-- LTE für das Druidensystem
-- by Falk
-- started to redo - Merung
require("base.common")
require("druid.base.outfit")

module("druid.lte.id_167_illness", package.seeall) --(druid.base.outfit))

-- INSERT INTO longtimeeffects VALUES (167, 'druids_illness', 'druid.lte.id_167_illness');

---- will probably a postVBU project
-- functions for Effect_1
--[[function CreateManaCloud(event_position)
world:gfx(4,event_position)
end

function ManaIllnessEffects(User, coughProb, strongCoughProb, sneezProb, snotProb)
    -- coughing, sneezing, snot fot Effect_1
	if (User:increaseAttrib("sex",0) == 1) then 
	    pronoun_DE = "ihr"
		pronoun_EN = "her"
	else 
	    pronoun_DE = "sein"
		pronoun_EN = "his"
	end	
	local probRandom = math.random(1,100) 
	local FieldFrontOfChar = base.commom.GetFrontPosition(User, 1)
	local Field5FieldsOfChar = base.commom.GetFrontPosition(User, 5)
	
	if (probRandom <= coughProb) and (coughProb ~= 0) then
	    User:talkLanguage(Character.say,Player.german,"#me hustet eine blaue Wolke aus.")
		User:talkLanguage(Character.say,Player.english,"#me coughs a blue cloud out.")
		world:gfx(4,FieldFrontOfChar)
		User:increaseAttrib("mana",-250)
    elseif (probRandom > coughProb) and (probRandom <= (coughProb + strongCoughProb)) and (strongCoughProb ~= 0) then
	    User:talkLanguage(Character.say,Player.german,"#me hustet lautstark eine große, blaue Wolke aus, die sich um "..pronoun_DE.."en Kopf herum verteilt.")
		User:talkLanguage(Character.say,Player.english,"#me coughs vociferously a big, blue cloud out which disperses around "..pronoun_EN.." head.")
		base.common.CreateCircle(User.pos, 1, CreateManaCloud)
		User:increaseAttrib("mana",-500)   
    elseif (probRandom > (coughProb + strongCoughProb)) and (probRandom <= (coughProb + strongCoughProb + sneezProb)) and (sneezProb ~= 0) then
	    User:talkLanguage(Character.say,Player.german,"#me niest und eine Strahl von Manawolken entfleucht sein"..pronoun_DE.." Nase.")
		User:talkLanguage(Character.say,Player.english,"#me coughs vociferously a big, blue cloud out which disperses around "..pronoun_EN.." head.")
		base.common.CreateLine(FieldFrontOfChar, Field5FieldsOfChar, CreateManaCloud)
		User:increaseAttrib("mana",-500)
    elseif (probRandom > (coughProb + strongCoughProb + sneezProb)) and (probRandom <= (coughProb + strongCoughProb + sneezProb + snotProb)) and (snotProb ~= 0) then
	    User:talkLanguage(Character.say,Player.german,"#mes Nase entkommt ein bläulicher Faden Schleim und tropft auf den Boden.")
		User:talkLanguage(Character.say,Player.english,"#me's nose looses a blusih strand of snot which drops to the ground.")
		world:gfx(11,FieldFrontOfChar)
		User:increaseAttrib("mana",-100)
	end
	
end

function Effect_1(Effect,User)
    -- mana illness 
	-- cough/snot/sneezing which reduces mana
	-- maixmum mana capacity is lowered
	
	findIllnessStatus,illness_status = Effect:findValue("illness_status");
    findPersistence,persistence = Effect:findValue("persistence"); -- == 1 -> char is getting better :-)  ~= 1 -> char is ill and getting worse :-(
	
	if findIllnessStatus then
	    
		if illnes_status <= 9 then -- first phase of the illness; so actually effect, just an inform
            
			if not (persistence == 0) and (illnes_status == 3) then -- this inform is only given if you become sick and only once; not while getting better
               base.common.InformNLS( User,
               "Dir scheint als fühlst Du etwas Pelziges auf Deiner Zunge. Plötzlich spürst Du einen kurzen Stich in Deiner Brust, der schnell wieder nachlässt.",
               "It seems to you as if you feel something furry on your tongue. Suddenly, you feel briefly a stitch in your chest, which fades away, fastly.");
	        end
	        if (persistence == 0) and (illnes_status == 7) then -- this inform is if you are sick, but you become better! Only one time.
	            base.common.InformNLS( User,
               "Der Husten scheint gänzlich abgeklungen zu sein. Nur das penetrante Gefühl von etwas Pelzigem ruht noch auf Deiner Zunge.",
               "The coughs has faded away finally, it seems. Only the penetrative feeling of something flurry stays on your tongue.");
	        end
	
	    end 
		
		if (illnes_status >= 10) and (illness_status <= 19) then -- second phase of the illness; a new inform and the first real effects
		    
			if not (persistence == 0) and (illnes_status == 10) then -- this inform is only given if you become sick and only once; not while getting better
               base.common.InformNLS( User,
               "Das pelzige Gefühl auf Deiner Zunge nimmt zu und irgendwas fühlt sich in Deinem Körper komisch an. Nach einem Kratzen im Hals musst Du husten und ein Teil Deines Manas verlässt Dich.",
               "The furry feeling on yout tongue intensiefies and something feels strange in your body. After a having a short sore throat you have to cough and some of your mana leavse you.");
	           ManaIllnessEffects(User, 100, 0, 0, 0)
			end
	        if (persistence == 0) and (illnes_status == 19) then -- this inform is if you are sick, but you become better! Only one time.
	            base.common.InformNLS( User,
               "Der Husten wird schwächer und auch Deinem Hals geht es langsam besser, obwohl er noch etwas kratzt. Außerdem scheint Dein Körper wieder die gewohnte Menge an Mana aufnehmen zu können.",
               "The coughs is getting weaker and also your throat feels better, even if it is still a bit sore. Also, your body seems to be able to hold the usual amount of mana.");
	        end
	        
			-- and here is the effect which can happen every round
			if not (illness_status == 10) then	
				ManaIllnessEffects(User, 10, 0, 0, 0)
		    end
		
		end

        if (illnes_status >= 20) and (illness_status <= 29)	then -- third phase of the illness	
		    
			-- mana reducing to a determined value; check every round
			if ( User:increaseAttrib("mana",0) > 7500 ) then
			    User:setAttrib("mana",7500)
			end	
			
			if not (persistence == 0) and (illnes_status == 20) then -- this inform is only given if you become sick and only once; not while getting better
               base.common.InformNLS( User,
               "Der Husten wird stärker. Das Kratzen im Hals ist nun dauerhaft da und Deine Brust schmerzt. Dein Körper scheint nicht mehr in der Lage, die gewohnte Menge an Mana dauerhaft halten zukönnen.",
               "The cough is getting stronger. Your throat is now permanently sore and your chest hurts. Your body seems no longer to able to hold lastingly the usualy amount of mana.");
	           ManaIllnessEffects(User, 0, 100, 0, 0)
			end
	        if (persistence == 0) and (illnes_status == 29) then -- this inform is if you are sick, but you become better! Only one time.
	            base.common.InformNLS( User,
               "Schnupfen und Niesen scheinen verschwunden. Brust und Hals schmerzen noch immer, doch Dein Körper scheint wieder etwas mehr - wenn auch immer noch weniger als gewöhnlich - Mana aufnehmen zu können.",
               "Snuffle and sneezing seem to be gone. Chest and thorat still ache, but your body seems to be able to hold more - even if still not the usual amount - mana.");
	        end
	        
			-- and here is the effect which can happen every round
			if not (illnes_status == 20) then	
				ManaIllnessEffects(User, 10, 5, 0, 0)
		    end
		
		end
		
		if (illnes_status >= 30) and (illness_status <= 39)	then -- fourth phase of the illness	
	
	        -- mana reducing to a determined value; check every round
			if ( User:increaseAttrib("mana",0) > 5000 ) then
			    User:setAttrib("mana",5000)
			end	
			
			if not (persistence == 0) and (illnes_status == 30) then -- this inform is only given if you become sick and only once; not while getting better
               base.common.InformNLS( User,
               "Schnupfen und Niesen gesellen sich zu Deinem Husten. Die maixmale Manakonzentration in Deinem Körper sinkt nunmehr auf die Hälfte.",
               "Snuffels and sneezing join the coughing. The maximal mana concentration of your body falls henceforth to the half.");
	           ManaIllnessEffects(User, 0, 0, 100, 0)
			end
	        
			-- and here is the effect which can happen every round
			if not (illnes_status == 20) then	
				ManaIllnessEffects(User, 10, 5, 5, 15)
			end
		end
		
		if (persistence > 0) then
		    illnes_status = illness_status + 1 
			if illness_status > 50 then 
			    illness_status = 50
			end
		    
			pesistence = persistence + 1
			if persistence > 9 then
			    persistence = 9
			end	
		elseif (persistence == 0) then
		    illness_status - 1
		end
        Effect:addValue("illness_status",illness_status)		
        Effect:addValue("persistence",persistence)
	
        if (persistence == 0) and (illness_status = 0) then -- no persistence left and last round of the healign phase; inform!
            base.common.InformNLS( User,
               "Das seltsame Gefühl von etwas Pelzigem auf deiner Zunge ist nun auch verschwunden. Du fühlst Dich wieder vollkommen gesund.",
               "The strange feeling of haveing something furry on your tnogue is also gone now. You feel completely healed.");
	    end
	
	else User:inform("LTE error: Lte 167, Error 1, inform a dev, please.");
		 return;
	end
end	]]
	    

function getAction(User,Effect,Runde) -- here, we check what illness the char has and we call the fitting effect
	findEffectValue,effect_value = Effect:findValue("effect_value");   
	
	if findEffectValue then
	    if (effect_value == 1) then
		    Effect_1(Effect,User);
			return true;
	    elseif (effect_value == 2) then
		    Effect_2(Effect,User);
			return true;
	    elseif (effect_value == 3) then
		    Effect_3(Effect,User);
			return true;
		elseif (effect_value == 4) then
		    Effect_2(Effect,User);
			return true;
	    elseif (effect_value == 5) then
		    Effect_3(Effect,User);
			return true;	
	    end
	else
	    User:inform("LTE error: Lte 167, Error 2, inform a dev, please.");
		return false;
	end	
end
  
function addEffect(Effect, User)              
	
end

function callEffect(Effect,User)  

    if not getAction(User,Effect,Runde) then
	    return false;
	else
        findHealing,healing_status = Effect:findValue("healing_status") -- the time of healing will take half of time of you being ill; therefore nextCalled is just the half
		if (healing_status == 1) then
		    Effect.nextCalled = 50;
		else
            Effect.nextCalled = 100;		
		    return true;
	    end
	end		
end

function removeEffect(Effect,User)         
	
end

function loadEffect(Effect,User)

end



----------------OLD-----------------------
--[[ 
function DoInfection(Character,Runde,Diag)
-- Ansteckung:
-- Feststellen ob jemand in Kontaktweite steht
   local const = 1;
   local myPos = Character.pos
   local charsAround = world:getCharactersInRangeOf(myPos,2)
   if charsAround == nil then
      -- niemand da zum Anstecken
   else
      for i,chars in pairs(charsAround) do
--       Hier kommt die Sache mit dem Langzeiteffekt:
         find, Effect = chars.effects:find(167);
		 const = math.min(25,chars:increaseAttrib("constitution",0));
         if not find and math.random(90) <= math.ceil(Runde/const) then
            Effect=LongTimeEffect(167,1);
--          Laufzeit nach Quality berechnen
            duration = math.random(111,999)
            Effect:addValue("zaehler",duration)
            Effect:addValue("illness",Diag)
--          Effekt an Char binden
            chars.effects:addEffect(Effect);
         else
--          Char hat schon eine Infektion
         end
      end
   end
end

function getEffect_1(Character,Runde)
-- Character:inform("Ork-Fieber/orc-fever")
-- Hitzewallung (man reisst sich alle Kleider, Rüstungen vom Leib)
	if Runde -(math.floor(Runde/10)*10) == 0 then
--   jede 10. Runde etwas ausziehen
		local foundCloth = false;
		local curItem = nil;
		Character:inform("Runde "..Runde)
		L = {1,3,4,9,10,11};
		for i=0,3 do
			curItem = Character:getItemAt(L[math.random(1,table.getn(L))]);
			if curItem.id >0 then break end;
		end
		if curItem == 0 then
			for i,pos in pairs(L) do
				curItem = Character:getItemAt(pos);
				if curItem.id >0 then break end;
			end
		end
		if curItem.id > 0 then
			base.common.InformNLS(Character,
				"Du fühlst eine unangenehme Hitze in dir aufsteigen und Du hast den Zwang, Dir die Kleider vom Leib zu reißen",
				"You feel a painful heat emerging and you have to put off some clothes");
			world:createItemFromItem(curItem,Character.pos,true);
			world:erase(curItem,1);
		end
	end
-- Krankheit verbreiten:
--   DoInfection(Character,Runde,1)
end

function getEffect_2(Character,Runde)
-- Character:inform("Sumpfkrampf/bog-attack")
-- Erbrechen, Char dreht sich ,rp-kotzen, foodl halbieren, Rückgang von hp
-- Jede 25. Runde:
   if Runde -(math.floor(Runde/25)*25) == 0 then

--    Enstprechender RP-Text
      base.common.InformNLS(Character,"Dir wird urplötzlich schlecht, Dein Magen rebelliert und Du musst Dich übergeben.",
                           "You feel sick, your stomache strikes back and you need to puke")

--    Spieler dreht sich ab
      xpos = Character.pos.x
      ypos = Character.pos.y
      zpos = Character.pos.z
      richtung = Character:getFaceTo()

      if richtung == 0 then
--         richtung = 2
         ypos = ypos -1
      elseif richtung == 2 then
--         richtung = 4
         xpos = xpos + 1
      elseif richtung == 4 then
--         richtung = 6
         ypos = ypos +1
      else
--         richtung = 0
         xpos = xpos -1
      end

      Character:setAttrib("faceto",richtung)
--    Grafik für Erbrochenes?
--    Würge-Sound wäre nicht schlecht
      Character:talkLanguage(Character.say,Player.german,"#me muss sich übergeben.");
	  Character:talkLanguage(Character.say,Player.english,"#me has to vomit.");
      world:makeSound(23,Character.pos)

--    Foodlevel halbieren
      setFood(Character,Character:increaseAttrib("foodlevel",0)/2);

--    HP Rückgang um 26-constitution %
      local const = math.min(25,Character:increaseAttrib("constitution",0));
	  Character:increaseAttrib("hitpoints",math.floor(Character:increaseAttrib("hitpoints",0) * -(26-const)/100) )

   end
-- Krankheit verbreiten:
--   DoInfection(Character,Runde,2)
end

function getEffect_3(Character,Effect,Runde)
--Character:inform("Trollsucht/Troll's rash")
-- Verlust der Sprachfähigkeiten (language skills, vielleicht Leseskill oa)
-- da der Verlust der Sprachskills am Anfang des LTE steht, ist hier nur die Zeit abzuwarten

-- Krankheit verbreiten:
--   DoInfection(Character,Runde,3)

   if Runde == 1 then
--    wieder die alten Werte herstellen
      sprache = {"ancient language","orc language","dwarf language","elf language","lizard language","fairy language","goblin language","gnome language","halfling language","human language"}
      for i = 1, table.getn(sprache) do
         find,wert = Effect:findValue(sprache[i])
         if find then
            Character:increaseSkill(sprache[i],wert)
         else
            Character:inform("debug 167-333: Value missing, please call dev")
         end
      end
   end

end

function getEffect_4(Character,Runde)
-- Character:inform("Gnom-Wahn/gnome-paranoia")
-- Umdrehen und ein paar Schritte in die andere Richtung machen
-- shorter intervals at high counter
-- shortest interval: every 5sec
   local interval = math.max(5,30-math.floor(Runde/30));
   if Runde -(math.floor(Runde/interval)*interval) == 0 then
--   Blickrichtung feststellen, Gegenrichtung feststellen
     richtung = Character:getFaceTo()
     richtung = richtung + 4
     if richtung > 6 then richtung = 0 end

--    Körper drehen, Schritte machen
      Character:setAttrib("faceto",richtung)
      Character:move(richtung, true);

	  -- inform every 30sec
	  if Runde - (math.floor(Runde/30)*30) == 0 then
		if paranoiaList == nil then
			raceList = {};
			raceList[1] = {};
			raceList[2] = {}
			raceList[1][1] = "Menschen";
			raceList[2][1] = "human";
			raceList[1][2] = "Zwergen";
			raceList[2][2] = "dwarf";
			raceList[1][3] = "Halblings";
			raceList[2][3] = "halfling";
			raceList[1][4] = "Elfen";
			raceList[2][4] = "elf";
			raceList[1][5] = "Orks";
			raceList[2][5] = "orc";
			raceList[1][6] = "Echsenmenschen";
			raceList[2][6] = "lizardman";
			raceList[1][7] = "Gnoms";
			raceList[2][7] = "gnome";
			raceList[1][8] = "Feenmanns";
			raceList[2][8] = "fairy"
			raceList[1][9] = "Goblins";
			raceList[2][9] = "goblin";

			paranoiaList = {};
			paranoiaList[1] = {};
			paranoiaList[2] = {};

			paranoiaList[1][1] = "Vor deinem inneren Auge erscheint eine grässliche Kreatur, in der sich alles Böse zu vereinen scheint.";
			paranoiaList[2][1] = "With your inner eye you envision a horrible creature that seems to be made up of all the evil in the world.";
			paranoiaList[1][2] = "Schlangen erscheinen von überall her vor dir, sie kommen aus jeder Ritze, aus jedem Loch. Unmengen! Flucht ist das Einzige, was dir noch in den Sinn kommt.";
			paranoiaList[2][2] = "Snakes appear all around you, they are coming out of every chasm, out of every hole. To run away is the only thing which leaps into your mind.";
			paranoiaList[1][3] = "Ein Panther springt plötzlich von der Seite in dein Sichtfeld. Lauf, sonst bohrt er seine Krallen in deine Haut und zerbeißt dir den Schädel!";
			paranoiaList[2][3] = "A panther jumps suddenly in front of you. Run, otherwise he is going to rip off your flesh with his claws and crack your skull in it's maw.";
			paranoiaList[1][4] = "Aus der Luft bildet sich eine Nebelgestalt. Grob erkennst du ihn. Ein alter Mann. Seine stumpfen Augen starren dich an. Warum starrt er dich an? Was will er? Du weißt es nicht. Du weißt nur, du musst hier weg.";
			paranoiaList[2][4] = "An image of a man made out of fog appears from out of thin air. You struggle to see his features: An old man. His dull eyes are staring at you. Why is he staring at you? What does he want? You only know that you must get away. ";
			paranoiaList[1][5] = "Diese Hitze. Vulkanausbruch! Der Lavastrom fließt auf dich zu. Hinfort mit dir!";
			paranoiaList[2][5] = "A burst of incredible heat! Volcanic eruption! The stream of lava is flowing towards you. Run away!";
			paranoiaList[1][6] = "Warum beobachtet er dich? Dieses paar Augen, welche nur von dem vermummten Gesicht zu sehen sind. Ein Räuber! Er will dein Geld, schlimmer, dein Leben! Doch dazu muss er dich erstmal fangen.";
			paranoiaList[2][6] = "Why is he spying on you? You only see his eyes in the shadow of his hood. A thief! He wants your money! Worse! He's a murderer!! Run before he catches you.";
			paranoiaList[1][7] = "Eine dunkle Wolke bildet sich direkt über deinem Kopf. Spannung liegt in der Luft. Mit einem Mal schießen Blitze aus der Wolke und treffen den Boden um dich herum. Flieh, bevor du zu Asche wirst!";
			paranoiaList[2][7] = "A dark cloud forms over your head. The air is unsettling. Lightning strikes from above all around you! Flee, before you turn to ash.";
			paranoiaList[1][8] = "Dieser riesige Baum, welcher in die Wolken ragt, warum fiel er dir nie auf? Er schwankt. Am Fuße steht ein Mann mit einem Beil. Der Baum fällt genau in deine Richtung. Lauf, lauf oder er wird dich zermalmen.";
			paranoiaList[2][8] = "You see a tree so tall it's branches are lost in the clouds. Why didn't you notice it before? Suddenly the tree shakes. You hear someone yell 'timber!' as the tree begins to crash in your direction! Run!";
			paranoiaList[1][9] = "Du öffnest deine Augen und findest dich in einer schwarzen Höhle wieder. Was machst du hier? Wie kamst du her? ROOOOOOOAR! Was war das?! Hinter dir scheint trübe das Tageslicht. Der Ausgang.";
			paranoiaList[2][9] = "You open your eyes to discover yourself in a black cave. What are you doing here? How did you get here? ROOOOOOOAR! What was that?! Behind you the light of day flares. Make your escape.";
			paranoiaList[1][10] = "Du siehst eine Armee von Goblins. Sie haben Bögen, Speere, Messer und einer hält den Kopf eines %RACETEXT in der Hand. Der Häuptling zeigt mit dem Stab auf dich. Sie jagen dich!";
			paranoiaList[2][10] = "You see an army of goblins armed to the teeth. One of them holds a decapitated %RACETEXT head in his hand. The goblin chieftain points at you with his staff. They are about to hunt you!";
			paranoiaList[1][11] = "Der Boden bricht auf. Flammen schießen aus dem Boden und mit ihnen steigt eine Kreatur mir roter Haut, blutigen Klauen und einer abscheulichen Fratze hervor. Ein Dämon, da hilft nur die Flucht!";
			paranoiaList[2][11] = "The ground trembles and cracks open. Flames shoot up from the cracks and with them a creature with red skin, bloody claws and hideous grimace arises: a demon.";
		end
		local chance = math.random(1,table.getn(paranoiaList[1]));
		local race = Character:getRace() + 1;
		if race > 9 then race = 4 end;
		base.common.InformNLS(Character,
			string.gsub(paranoiaList[1][chance],"%RACETEXT",raceList[1][race]),
			string.gsub(paranoiaList[2][chance],"%RACETEXT",raceList[2][race]));
	  end
   end
-- Krankheit verbreiten:
--   DoInfection(Character,Runde,4)
end

function getEffect_5(Character,Effect,Runde)
--Character:inform("Vein'sches Syndrom/Veins'syndrome")
--Kontaktallergien auf Kleidung
	local doInform = false;
	local posList = {1,3,4,9,10,11};
	local LIST_outfit = {};
	-- metal
	LIST_outfit[3] = {4,7,16,94,101,184,185,187,202,324,325,326,2111,2112,2116,2117,2172,2286,2287,2290,2291,2302,2303,2357,2359,2360,2363,2364,2365,2367,2369,2389,2390,2393,2395,2399,2400,2402,2403,2407,2441,2444};
	-- cloth
	LIST_outfit[2] = {34,48,55,180,181,182,183,193,194,195,196,357,358,368,370,371,384,385,547,548,558,2295,2377,2378,2380,2384,2416,2418,2419,2420,2421};
	-- leather
	LIST_outfit[1] = {53,356,362,363,364,365,366,367,369};
	local foundAllergy, allergy = Effect:findValue("allergy");
	if not foundAllergy then
		allergy = math.random(1,3);
		Effect:addValue("allergy",allergy);
	end
	allergy = math.min(math.max(1,allergy),3);
--    Feststellen, ob solche Kleidung getragen wird
--    Kleidungsstück fallenlassen
	for i,pos in pairs(posList) do
		thisItem = Character:getItemAt(pos)
		if thisItem.id ~= 0 then
			for j,id in pairs(LIST_outfit[allergy]) do
				if thisItem.id == id then
					world:createItemFromItem(thisItem,Character.pos,true);
					Character:increaseAtPos(pos,-1);
					doInform = true;
				end
			end
		end
	end
	if doInform or Runde-(math.floor(Runde/60)*60) == 0 then
		base.common.InformNLS(Character,
			"An deinem Körper haben sich rote, stark juckende Pusteln gebildet."..(doInform and " Du kannst jene Kleidung nicht am Körper halten." or ""),
			"All over your body you find little red terribly itching blisters."..(doInform and " You can't keep that clothes at your body." or ""));
	end
-- Krankheit verbreiten:
--   DoInfection(Character,Runde,5)
end

function getEffect_6(Character,Runde)
--Character:inform("Drachenpocken/dragon's pox")
--Schmerzhafte Warzen an den Händen, man kann praktisch nichts mehr in den Händen halten

	local doInform = false;
	local posList = {4,5,6};
	for i,pos in pairs(posList) do
		thisItem = Character:getItemAt(pos);
		if thisItem.id ~= 0 then
			world:createItemFromItem(thisItem,Character.pos,true);
			Character:increaseAtPos(pos,-1);
			doInform = true;
		end
	end
	if doInform or Runde-(math.floor(Runde/60)*60) == 0 then
		base.common.InformNLS(Character,
			"An deinen Händen haben sich grünlich schimmernde schmerzhafte eitrige Dornwarzen gebildet."..(doInform and " Du musst alles in deinen Händen fallen lassen." or ""),
			"Your hands are covered with greenish glimmering painful mucopurulent plantar warts."..(doInform and " You have to drop everything you hold in your hands." or ""));
	end
-- Krankheit verbreiten:
-- DoInfection(Character,Runde,6)
end

function getEffect_7(Character,Runde)
-- Character:inform("Skorpion-Seuche/scorpion's pestilence")
-- Schweres Fieber: Absenken hp auf unter 1000
-- Standard: jede 10. Runde:
   if Runde -(math.floor(Runde/10)*10) == 0 then
      if Character:increaseAttrib("hitpoints",0) > 300 then
         Character:increaseAttrib("hitpoints",-Character:increaseAttrib("hitpoints",0)/2)
      end
      Character.movepoints = Character.movepoints -50
	  if Runde-(math.floor(Runde/30)*30) == 0 then
		base.common.InformNLS(Character,
			"Du fühlst Dich fiebrig, dein Puls ist flach, auf Deiner Stirn glänzt kalter Schweiß.",
			"You feel febrile, your pulse is low, at your frown cold sweat is shining.");
	  end
   end
-- Krankheit verbreiten:
--   DoInfection(Character,Runde,7)
end

function getEffect_8(Character,Effect,Runde)
--Character:inform("Wolfspest/wolves pest")
--Verlust von Primärattributen
-- Standard: jede 10. Runde:
   if Runde -(math.floor(Runde/10)*10) == 0 then
      if math.random(6) == 6 then
         base.common.InformNLS(Character,
			"Du hast das Gefühl, deine Organe würden brennen.",
			"Your insides feel like burning.");
      end
      local L = {"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
      local i = math.random(1,8);
      local curAttribValue = math.max(1,Character:increaseAttrib(L[i])-1);
	  Character:setAttrib(L[i],curAttribValue);
	  Effect:addValue(L[i].."_cur",curAttribValue);
      local counterValue = math.max(10,math.ceil(Runde/30));
	  if math.random(1,35) < counterValue then
		setFood(Character,Character:increaseAttrib("foodlevel",0)*2/3);
	  end
	  if math.random(1,35) < counterValue then
		Character:increaseAttrib("mana",-Character:increaseAttrib("mana",0)/3);
	  end
	  if Character:increaseAttrib("hitpoints",0) > 500 then
		if math.random(1,35) < counterValue then
			Character:increaseAttrib("hitpoints",-Character:increaseAttrib("hitpoints",0)/3);
		end
	  end
   end
-- Krankheit verbreiten:
--   DoInfection(Character,Runde,8)
end

function setFood(Character,Food)

	Food = math.max(0,math.min(60000,Food));
	local FoodToAdd = Food - Character:increaseAttrib("foodlevel",0);
	while true do
		Character:increaseAttrib("foodlevel",math.max(-10000,math.min(10000,FoodToAdd)));
		FoodToAdd = FoodToAdd - math.max(-10000,math.min(10000,FoodToAdd));
		if (FoodToAdd == 0) then
			break;
		end
	end
end

function getAction(Character,Effect,Runde)
--Hier die eigentlichen Aktionen eintragen
--Erstmal sehen, waserhat
  find,waserhat = Effect:findValue("illness")
  if find then
    if waserhat == 1 then
       getEffect_1(Character,Runde)
    elseif waserhat == 2 then
       getEffect_2(Character,Runde)
    elseif waserhat == 3 then
       getEffect_3(Character,Effect,Runde)
    elseif waserhat == 4 then
       getEffect_4(Character,Runde)
    elseif waserhat == 5 then
       getEffect_5(Character,Effect,Runde)
    elseif waserhat == 6 then
       getEffect_6(Character,Runde)
    elseif waserhat == 7 then
       getEffect_7(Character,Runde)
    elseif waserhat == 8 then
       getEffect_8(Character,Effect,Runde)
    else
		Character:inform("LTE-Error 167-1: value out of range. Please inform a developer.");
		return false;
	end
  else
    Character:inform("LTE-Error 167-1: missing value. Please inform a developer.");
	return false;
  end
  return true;
end

function addEffect(Effect, Character)               -- Nur beim ersten Aufruf

	local foundIllness, illness = Effect:findValue("illness");
	if foundIllness then
		local foundImmunityEffect, immunityEffect = Character.effects:find(328);
		if foundImmunityEffect then
			if immunityEffect:findValue("immunity_"..illness) then

				base.common.InformNLS(Character,
					"Du spürst wie die Krankheit von dir Besitz ergreifen will, doch dein Körper wehrt sich erfolgreich.",
					"You feel the illness trying to take control over you, but your body can resist.");
				Character.effects:removeEffect(167);
				return;
			end
		end
		base.common.InformNLS(Character,
			"Du fühlst dich auf einmal ganz seltsam. Irgendetwas stimmt nicht mit deinem Körper.",
			"You suddenly have a very strange feeling. Something's wrong with your body.");
		if illness == 3 then
			--  Sprachskills sichern
			Effect:addValue("ancient language",Character:getSkill("ancient language"))
			Effect:addValue("orc language",Character:getSkill("orc language"))
			Effect:addValue("dwarf language",Character:getSkill("dwarf language"))
			Effect:addValue("elf language",Character:getSkill("elf language"))
			Effect:addValue("lizard language",Character:getSkill("lizard language"))
			Effect:addValue("fairy language",Character:getSkill("fairy language"))
			Effect:addValue("goblin language",Character:getSkill("goblin language"))
			Effect:addValue("gnome language",Character:getSkill("gnome language"))
			Effect:addValue("halfling language",Character:getSkill("halfling language"))
			Effect:addValue("human language",Character:getSkill("human language"))

			-- Sprachskills auf 0 setzen
			Character:increaseSkill(1,"ancient language",-Character:getSkill("ancient language"))
			Character:increaseSkill(1,"orc language",-Character:getSkill("orc language"))
			Character:increaseSkill(1,"dwarf language",-Character:getSkill("dwarf language"))
			Character:increaseSkill(1,"elf language",-Character:getSkill("elf language"))
			Character:increaseSkill(1,"lizard language",-Character:getSkill("lizard language"))
			Character:increaseSkill(1,"fairy language",-Character:getSkill("fairy language"))
			Character:increaseSkill(1,"goblin language",-Character:getSkill("goblin language"))
			Character:increaseSkill(1,"gnome language",-Character:getSkill("gnome language"))
			Character:increaseSkill(1,"halfling language",-Character:getSkill("halfling language"))
			Character:increaseSkill(1,"human language",-Character:getSkill("human language"))

			--     Evtl. noch library research ua nullen
		end

		--  Alle Primärattribute sichern
	    Effect:addValue("strength",Character:increaseAttrib("strength",0))
	    Effect:addValue("willpower",Character:increaseAttrib("willpower",0))
	    Effect:addValue("perception",Character:increaseAttrib("perception",0))
	    Effect:addValue("intelligence",Character:increaseAttrib("intelligence",0))
	    Effect:addValue("constitution",Character:increaseAttrib("constitution",0))
	    Effect:addValue("agility",Character:increaseAttrib("agility",0))
	    Effect:addValue("dexterity",Character:increaseAttrib("dexterity",0))
	    Effect:addValue("essence",Character:increaseAttrib("essence",0))
		--  Alle Sekundärattribute sichern
	    Effect:addValue("hitpoints",Character:increaseAttrib("hitpoints",0))
	    Effect:addValue("foodlevel",Character:increaseAttrib("foodlevel",0))
	    Effect:addValue("mana",Character:increaseAttrib("mana",0))
	    Effect:addValue("poisonlevel",Character:increaseAttrib("poisonlevel",0))
	    Effect:addValue("luck",Character:increaseAttrib("luck",0))
	    Effect:addValue("attitude",Character:increaseAttrib("attitude",0))
	    Effect:addValue("height",Character:increaseAttrib("height",0))
	    Effect:addValue("weight",Character:increaseAttrib("weight",0))
	end
end

function callEffect(Effect,Character)               -- Effect wird ausgeführt

--Erst einmal kommt der Rundenzähler
  find,zaehler = Effect:findValue("zaehler")
  if find then
--  Character:inform("debug func callEffect 167-0 Runde "..zaehler)
     zaehler = zaehler -1  -- maximal 999 Runden
     Effect:addValue("zaehler", zaehler)

     Effect.nextCalled = 10  -- nächster Aufruf in 1 Sekunde

     if not getAction(Character,Effect,zaehler) then
		return false;
	 end

--   Ende der Aktionen, es folgt noch etwas Verwaltung
     if zaehler == 0 then
--      das war die letzte Runde
        return false
     else
        return true
     end
  else
    Character:inform("LTE-Error 167-0: please call dev")
  end
  return false;
end

function removeEffect(Effect,Character)
	--Character:inform("debug func removeEffect")
	-- create immunity
	local foundImmunity = false;
	local foundIllness, illness = Effect:findValue("illness");

	if foundIllness then
		local foundImmunityEffect, immunityEffect = Character.effects:find(328);
		if not foundImmunityEffect then
			immunityEffect = LongTimeEffect(328,1);
			Character.effects:addEffect(immunityEffect);
		end
		foundImmunity = immunityEffect:findValue("immunity_"..illness);
		-- only add immunity if not immune already.
		if not foundImmunity then
			local immunityTime = math.random(60,120)+60*math.min(25,Character:increaseAttrib("constitution",0));
			immunityEffect:addValue("immunity_"..illness,immunityTime);
		end
	end
	-- if illness is removed as usual and not due to immunity, then inform player and create gfx
	if not foundImmunity then
		base.common.InformNLS(Character,
			"Du spürst wie die Krankheit aus deinem Körper weicht und du neue Kraft bekommst.",
			"You feel the illness withdrawing from your body and you regain your strength.");
		world:gfx(45,Character.pos);
	end
end

function loadEffect(Effect,Character)                  -- wenn der Charakter erneut einloggt
	--Character:inform("debug func loadEffect")
	find,zaehler = Effect:findValue("zaehler")

	if not find then
		Character:inform("LTE-Error 167-3: please call dev");
		Character.effects:removeEffect(167);
		return;
	end

	local L = {"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
	local foundAttrib, value;

	for i,attrib in pairs(L) do
		foundAttrib, value = Effect:findValue(attrib.."_cur");
		if foundAttrib then
			Character:setAttrib(attrib,value);
		end
  	end
end]]
--------------OLD END---------------------