module("content.lookat.unique", package.seeall)

-- Gibt den Suffix für das Item zurück
--
-- @param: CharacterStruct - Der Char, der sich das Item ansieht
-- @param: integer - ClassID des betrachteten Items
-- @param: integer - Art-ID des ersten Steins
-- @param: integer - Stärkestufe des ersten Steins
-- @return: text - Suffix-String
function getSuffix (User,Class,gem,Str)
local SUFFIX_DE = {"","","","","","",""};
local SUFFIX_EN = {"","","","","","",""};
	-- ** Suffix für Waffen **
	if (Class==1 or Class==2) then
		-- Stärke
		if Str==5 then -- Sufe 6
			-- Edelstein
			SUFFIX_DE={"der Haltbarkeit","der Sorgfalt","des Schülers","des Barbaren","der Abwehr","des Hasen","der Raubkatze"}
            SUFFIX_EN={"of durability","of diligence","of the pupil","of the barbarian","of defense","of the rabbit","of the predatory cat"}
		elseif Str==6 then -- Sufe 7
            SUFFIX_DE={"der Belastbarkeit","der Treffsicherheit","des Adepten","des Schlächters","der Parade","der Katze","des Wolfes"}
            SUFFIX_EN={"of toughness","of marksmanship","of an adept","of the slaughter","of parry","of the cat","of the wolf"}
		elseif Str==7 then -- Sufe 8
			SUFFIX_DE={"der Stabilität","der Zielsicherheit","des Könners","der Bestie","der Gewandheit","des Panthers","des Löwen"}
            SUFFIX_EN={"of stability","of aim","of the expert","of the beast","of agility","of the panther","of the lion"}
		elseif Str==8 then -- Sufe 9
			SUFFIX_DE={"der Langlebigkeit","der Präzision","des Lehrmeisters","des Dämons","der Verteidigung","des Geparden","des Ogers"}
            SUFFIX_EN={"of longevity","of targeting","of the master","of the demon","of defense","of the cheetah","of the ogre"}
		elseif Str==9 then -- Sufe 10
			SUFFIX_DE={"der Unzerstörbarkeit","der Genauigkeit","des Großmeisters","des Todes","der Unantastbarkeit","des Greifs","des Drachen"}
            SUFFIX_EN={"of endurance","of precision","of the weapons master","of the undead","of defense","of the griffin","of the dragon"}
		end
	-- ** Suffix für die Rüstung / Schilde **
	elseif (Class==3 or Class==4) then
		-- Stärke
		if Str==5 then -- Sufe 6
            -- Edelstein
            SUFFIX_DE={"der Haltbarkeit","der Stechmücke","des Schafes","der Dornen","der Abwehr","des Hasen","der Käfer"}
            SUFFIX_EN={"of durability","of the mosquito","of the sheep","of thorns","of defense","of a rabbit","of a beetle"}
        elseif Str==6 then -- Sufe 7
            SUFFIX_DE={"der Belastbarkeit","der Biene","der Kuh","der Spinne","der Parade","der Katze","des Seeigels"}
            SUFFIX_EN={"of toughness","of the bee","of a cow","of a spider","of parry","of a cat","of a sea urchin"}
        elseif Str==7 then -- Sufe 8
            SUFFIX_DE={"der Stabilität","der Wespe","der Mumie","des Faulwurms","der Gewandheit","des Panthers","der Schildkröte"}
            SUFFIX_EN={"od stability","of the wasp","of a mummy","of a rotworm","of agility","of a panther","of a turtle"}
        elseif Str==8 then -- Sufe 9
            SUFFIX_DE={"der Langlebigkeit","des Skorpions","des Trolls","der Schmerzen","der Verteidigung","des Geparden","des Golems"}
            SUFFIX_EN={"of longevity","of the scorpion","of a troll","of pain","of defense","of a cheetah","of the golem"}
        elseif Str==9 then -- Sufe 10
            SUFFIX_DE={"der Unzerstörbarkeit","der Tarantel","des Bären","der Qual","der Unantastbarkeit","des Greifen","des Gargoyles."}
            SUFFIX_EN={"of endurance","of the tarantula","of a bear","of agony","of inviolability","of a griffin","of the gargoyle"}
        end
	-- **Suffix für Zauberstäbe **
    elseif Class==5 then
        -- Stärke
        if Str==5 then -- Sufe 6
            -- Edelstein
            SUFFIX_DE={"der Haltbarkeit","des Umkreises","des Kampfes","der Kontrolle","der Illusion","des Hasen","des Tropfens"}
            SUFFIX_EN={"of durability","of periphery","of battle","of control","of illusion","of the rabbit","of trickle"}
        elseif Str==6 then -- Sufe 7
            SUFFIX_DE={"der Belastbarkeit","der Umgebung","der Vergeltung","der alten Schriften","der Heilung","der Katze","der Energie"}
            SUFFIX_EN={"of toughness","of proximity","of quittance","of writings","of healing","of the cat","of energy"}
        elseif Str==7 then -- Sufe 8
            SUFFIX_DE={"der Stabilität","der Weite","der Zerstörung","der Überlieferung","der Erhaltung","des Panthers","des Manas"}
            SUFFIX_EN={"of stability","of range","Of destruction","of tradition","of conservation","as a panther","of mana"}
        elseif Str==8 then -- Sufe 9
            SUFFIX_DE={"der Langlebigkeit","der Ferne","der Vernichtung","der Runen","der Bewahrung","des Geparden","der Erneuerung"}
            SUFFIX_EN={"of longevity","of distance","of elimination","of the runes","of protection","of the cheetah","of regeneration"}
        elseif Str==9 then -- Sufe 10
            SUFFIX_DE={"der Unzerstörbarkeit","des Horizontes","der Apokalypse","des geheimen Wissens","der Schöpfung","des Greifen","der Regeneration"}
            SUFFIX_EN={"of endurance","of horizon","of the apocalypse","of arcane wisdom","of creation","of the griffin","of regeneration"}
        end
	-- ** Suffix für Werkzeuge **
	elseif Class==6 then
        -- Stärke
        if Str==5 then -- Sufe 6
            -- Edelstein
            SUFFIX_DE={"der Haltbarkeit","der Verzögerung","des Schülers","der Sanierung","der Feinheit","des Hasen","der gelungenen Form"}
            SUFFIX_EN={"of durability","of decline","of pupil","of mending","of quality","of the rabbit","of shape"}
        elseif Str==6 then -- Sufe 7
            SUFFIX_DE={"der Belastbarkeit","der Langlebigkeit","des Lehrlings","der Restauration","der Kunstfertigkeit","der Katze","der Wohlgeformtheit"}
            SUFFIX_EN={"of toughness","of lasting","of adept","of restoration","of craftsmanship","of the cat","of crafting"}
        elseif Str==7 then -- Sufe 8
            SUFFIX_DE={"der Stabilität","der Beständigkeit","des Gesellen","der Instandsetzung","der Meisterschaft","des Panthers","des Gesellenstücks"}
            SUFFIX_EN={"of stability","of durability","of expert","of repairs","of craft ","of the panther","of worth"}
        elseif Str==8 then -- Sufe 9
            SUFFIX_DE={"der Langlebigkeit","der Permanenz","des Meisters","der Reparatur","der Makellosigkeit","des Geparden","des Meisterstücks"}
            SUFFIX_EN={"of longevity","of permanence","of the master","of mender","of craftsmanship","of the cheetah","of masterwork"}
        elseif Str==9 then -- Sufe 10
            SUFFIX_DE={"der Unzerstörbarkeit","der Ewigkeit","der Gildenmeisters","der Wiederherstellung","der Perfektion","des Greifen","des Kunstwerks"}
            SUFFIX_EN={"of endurance","of perpetuity","of the guild master","of repair","of perfection","of the griffin","of artistry"}
        end
	-- ** Suffix für Schmuck **
	elseif Class==7 then
        -- Stärke
        if Str==0 then
            -- Edelstein
            SUFFIX_DE={"der Ideen","des Trüffelschweins","der ruhigen Hand","der Ameise","des Wohlbefindens","des Seepferdchens","des Novizen"}
            SUFFIX_EN={"of ideas","of the forager","of even hand","of the ant","of wellness","of seehorse","of novice"}
		elseif Str==1 then
            SUFFIX_DE={"des Geistesblitzes","des Adlers","des Eichhörnchens","des Lasttiers","des Gürteltiers","der Schnelligkeit","der Konzentration"}
            SUFFIX_EN={"of sudden inspirations","of the eagle","of the squirrel","of the packmule","of the armadillo","of quickness","of concentration"}
		elseif Str==2 then
            SUFFIX_DE={"der Eule","der Weitsicht","des Taschenspielers","des Stieres","der Schildkröte","der Gewandheit","des reinen Geistes"}
            SUFFIX_EN={"of the owl","of skills","of the conjuror","of the bull","of the turtle","of agility","of pure mind"}
		elseif Str==3 then
            SUFFIX_DE={"der Erkenntnis","der geschärften Sinne","der flinken Finger","der Muskelmasse","der Resistenz","der Schlange","des Magiers"}
            SUFFIX_EN={"of knowledge","of honed senses","of agile fingers","of muscles","of resistance","of the snake","of skill"}
		elseif Str==4 then
            SUFFIX_DE={"der Geistesschärfe","der Wahrnehmung","des Frettchens","der Gewalt","des Schutzes","des Wiesels","der strahlenden Aura"}
            SUFFIX_EN={"of keen intellect","of perception","of the ferret","of force","of favor","of the weasel","of the radiating aura"}
		elseif Str==5 then -- Sufe 6
            SUFFIX_DE={"der Hirschkuh","der Aufmerksamkeit","des Kraken","der Stärke","des Widerstandes","der Gazelle","des Schamanen"}
            SUFFIX_EN={"of the hind","of alertness","of the octopus","of the ant","resistance","of the gazelle","of the shaman"}
        elseif Str==6 then -- Sufe 7
            SUFFIX_DE={"der Klugheit","der Wachsamkeit","der Fingerfertigkeit","des Riesen","der Konstitution","des flinken Fußes","des Hochmagiers"}
            SUFFIX_EN={"of wisdom","of the watchful eye","of dexterity","of strength","of constitution","of agile feet","of the high mage"}
        elseif Str==7 then -- Sufe 8
            SUFFIX_DE={"der Intelligenz","der Entdeckung","der Geschicklichkeit","der Kraft","der Gesundheit","der Leichtigkeit","des Beschwörung"}
            SUFFIX_EN={"of intelligence","of detection","of fortune","of force","of health","of ease","of incantation"}
        elseif Str==8 then -- Sufe 9
            SUFFIX_DE={"der Weisheit","der Voraussicht","des Fuchses","der Giganten","des Phönix","der Raserei","des Erzmagiers"}
            SUFFIX_EN={"of lore","of foresight","of the fox","of the giant","of the phoenix","of fury","of the archmage"}
        elseif Str==9 then -- Sufe 10
            SUFFIX_DE={"des Genius","der Allsicht","des Steinbocks","des Lindwurms","der Unsterblickeit","des Sturms","des Drachen"}
            SUFFIX_EN={"of the genius","of omnisight","of the ibex","of the lindworm","of immortality","of the storm","of the dragon"}
        end
	end
	if Str<=4 then
        SUFFIX_DE={"verziert mit einem Diamant","verziert mit einem Smaragd","verziert mit einem Rubin","verziert mit einem Schwarzstein","verziert mit einem Blaustein","verziert mit einem Amethyst","verziert mit einem Topas"}
        SUFFIX_EN={"adorned with a diamond","adorned with an emerald","adorned with a ruby","adorned with a blackstone","adorned with a sapphire","adorned with an amethyst","adorned with a topas"}
	end

	-- Sprachausgabe
	if User:getPlayerLanguage() == 0 then
        Suffix=SUFFIX_DE[gem];
    else
        Suffix=SUFFIX_EN[gem];
    end
	if Suffix==nil then Suffix=""; end

	return Suffix
end

-- Gibt den Präfix für das Item zurück
--
-- @param: CharacterStruct - Der Char, der sich das Item ansieht
-- @param: integer - ClassID des betrachteten Items
-- @param: integer - Art-ID des zweiten Steins
-- @param: integer - Stärkestufe des zweiten Steins
-- @return: text - Praefix-String
function getPraefix (User,Class,gem,Str)
local PRAEFIX_DE = {"","","","","","",""};
local PRAEFIX_EN = {"","","","","","",""};
    -- ** Präfix für Waffen **
    if (Class==1 or Class==2) then
        -- Stärke
        if Str==5 then -- Sufe 6
            -- Edelstein
			PRAEFIX_DE={"solide","akkurate","durchdringende","grimmige","wehrhafte","flinke","polierte"}
            PRAEFIX_EN={"solid","accurate","astuteness","grim","strong","nimble","honed skills"}
        elseif Str==6 then -- Sufe 7
            PRAEFIX_DE={"robuste","zielsichere","durchschlagende","brutale","schützende","flotte","glänzende"}
            PRAEFIX_EN={"robust","steady","striking power","gory","protective","brisk","bite"}
        elseif Str==7 then -- Sufe 8
            PRAEFIX_DE={"stabile","genaue","zertrümmernde","blutrünstige","vereitelnde","schnelle","geschmeidige"}
            PRAEFIX_EN={"stable","clear","destructive","brutal","impeding","fast","lithe"}
        elseif Str==8 then -- Sufe 9
            PRAEFIX_DE={"unverwüstliche","präzise","pulverisierende","grausame","bändigende","gewandte","geschärfte"}
            PRAEFIX_EN={"durable","precise","dangerous","gruesome","elusive","agile","edge"}
        elseif Str==9 then -- Sufe 10
            PRAEFIX_DE={"unzerstörbare","exakte","heldenhafte","lethale","defensive","rasende","tödliche"}
            PRAEFIX_EN={"indestructible","exact","heroic","lethal","master","wild","deadly"}
        end
    -- ** Suffix für die Rüstung / Schilde **
    elseif (Class==3 or Class==4) then
        -- Stärke
        if Str==5 then -- Sufe 6
            -- Edelstein
			PRAEFIX_DE={"solide","stoffverstärkte","abschwächende","dornenbesetzte","gediegene","weiche","lederverstärkte"}
            PRAEFIX_EN={"solid","fabric fortified","alleviative","thorned","solid","soft","leather fortified"}
        elseif Str==6 then -- Sufe 7
            PRAEFIX_DE={"robuste","holzverstärkte","dämpfende","stachelige","verstärkte","geweitete","knochenverstärkte"}
            PRAEFIX_EN={"robust","wood fortified","cushioning","stinger","reinforced","widened","bone reinforced"}
        elseif Str==7 then -- Sufe 8
            PRAEFIX_DE={"stabile","blechverstärkte","abfedernde","zahnbewehrte","verbesserte","geölte","hornverstärkte"}
            PRAEFIX_EN={"stable","iron sheet fortified","padding","teethed","enhanced","oiled","shell reinforced"}
        elseif Str==8 then -- Sufe 9
            PRAEFIX_DE={"unverwüstliche","eisenverstärkte","wattierte","schmerzbringende","gehärtete","gewandte","chitinverstärkte"}
            PRAEFIX_EN={"unbreakable","iron fortified","padded","ache bringing","hardened","cunning","chitin fortified"}
        elseif Str==9 then -- Sufe 10
            PRAEFIX_DE={"unzerstörbare","stahlverstärkte","gepolsterte","quälende","gepanzerte","befreiende","schuppenverstärkte"}
            PRAEFIX_EN={"indestructible","steel fortfied","bolstered","excruciating","ironclad","freeing","scale reinforced"}
		end
	-- ** Praefix für Zauberstäbe **
    elseif Class==5 then
        -- Stärke
        if Str==5 then -- Sufe 6
            -- Edelstein
            PRAEFIX_DE={"solide","weitende","kämpfende","funkelnde","formende","flinke","spirituelle"}
            PRAEFIX_EN={"solid","widening","fighting","scintillating","formidable","nimble","spiritual"}
        elseif Str==6 then -- Sufe 7
            PRAEFIX_DE={"robuste","erweiterte","vergeltende","glänzende","heilende","flotte","energetische"}
            PRAEFIX_EN={"robust","extended","retaliatory","brilliant","healing","brisk","energetic"}
        elseif Str==7 then -- Sufe 8
            PRAEFIX_DE={"stabile","verbesserte","zerstörende","glühende","gestaltende","schnelle","kraftvolle"}
            PRAEFIX_EN={"stable","enhanced","destroying","glowing","forging","quick ","powerful"}
        elseif Str==8 then -- Sufe 9
            PRAEFIX_DE={"unverwüstliche","ausdehnende","vernichtende","strahlende","bewahrende","gewandte","erneuernde"}
            PRAEFIX_EN={"unbreakable","expansive","devastating","radiating","conserving","agile","quick"}
        elseif Str==9 then -- Sufe 10
            PRAEFIX_DE={"unzerstörbare","weitreichende","apokalyptische","magische","erschaffende","rasende","regenerierende"}
            PRAEFIX_EN={"indestructible","far-reaching","apocalyptic","magic","creative","wild","regenerating"}
        end
	-- ** Praefix für Werkzeuge **
	elseif Class==6 then
        -- Stärke
        if Str==5 then -- Sufe 6
            -- Edelstein
            PRAEFIX_DE={"solide","verzögernde","brauchbare","ausbessernde","gute","rasende","wohlgeformte"}
            PRAEFIX_EN={"solid","delayed","viable","renovating","good","nimble","well formed"}
        elseif Str==6 then -- Sufe 7
            PRAEFIX_DE={"robuste","lebensverlängernde","geübte","restaurierende","verbesserte","gewandte","verbessernde"}
            PRAEFIX_EN={"robust","life prolonging","trained","refurbishing","enhanced","brisk","enhancing"}
        elseif Str==7 then -- Sufe 8
            PRAEFIX_DE={"stabile","beständige","geschickte","instandsetzende","hervorragende","schnelle","außergewöhnliche"}
            PRAEFIX_EN={"stable","constant","skilled","repairing","outstanding","quick","exceptional"}
        elseif Str==8 then -- Sufe 9
            PRAEFIX_DE={"unverwüstliche","langlebige","fachmännische","reparierende","großartiges","flotte","herausragende"}
            PRAEFIX_EN={"unbreakable","durable","skilled","repairing","flawless","agile","prominent"}
        elseif Str==9 then -- Sufe 10
            PRAEFIX_DE={"unzerstörende","immerwährende","perfekte","wiederherstellende","meisterliche","flinke","formvollendete"}
            PRAEFIX_EN={"indestructible","everlasting","perfect","restoring","masterly","quick","overly perfect"}
		end
	end
	if Str<=4 then
        PRAEFIX_DE={"diamantenbesetzte","smaragdbesetzte","rubinbesetze","schwarzsteinbesetzte","blausteinbesetzte","amethystbesetzte","topasbesetzte"}
        PRAEFIX_EN={"diamond ornated","emerald ornated","ruby ornated","blackstone ornated","sapphire ornated","amethyst ornated","topas ornated"}
    end

    -- Sprachausgabe
    if User:getPlayerLanguage() == 0 then
        Praefix=PRAEFIX_DE[gem];
    else
        Praefix=PRAEFIX_EN[gem];
    end

    return Praefix

end




-- Gibt den String der betreffenden Itemklasse zurück
--
-- @param: CharacterStruct - Der Char, der sich das Item ansieht
-- @param: integer - Class-ID des betrachteten Items
-- @return: text - String der Item-Klasse
function writeClass(User,Class)
    GEM_CLASS_DE={ "die Waffe", "die Waffe", "die Rüstung", "den Schild", "den Stab", "das Werkzeug", "das Schmuckstück" }
    GEM_CLASS_EN={ "weapon", "weapon", "armor", "shield", "wand", "tool", "jewel" }
    if User:getPlayerLanguage() == 0 then
        ItemCl=GEM_CLASS_DE[Class];
    else
        ItemCl=GEM_CLASS_EN[Class];
    end
    return ItemCl
end

-- Gibt den String des "eingesetzten Steins" zurück
--
-- @param: CharacterStruct - Der Char, der sich das Item ansieht
-- @param: integer - 2te (bzw 4te beim 2ten Stein) Stelle des Datawertes des betrachteten Items
-- @return: text - Name des eingesetzten Steins
function writeGem(User, gem)
    GEM_NAME_DE={ "Diamant", "Smaragd", "Rubin","Schwarzstein", "Blaustein", "Amethyst", "Topas" }
    GEM_NAME_EN={ "diamond", "emerald", "ruby","blackstone", "sapphire", "amethyst", "topas" }
    if User:getPlayerLanguage() == 0 then
        gemName=GEM_NAME_DE[gem];
    else
        gemName=GEM_NAME_EN[gem];
    end
    return gemName
end

-- Gibt den String der Stärke des "eingesetzten Steins" zurück
--
-- @param: CharacterStruct - Der Char, der sich das Item ansieht
-- @param: integer - 1te (bzw 3te beim 2ten Stein) Stelle des Datawertes des betrachteten Items
-- @return: text - Name der betreffenden Stärkestufe des Steins
function writeStr(User, Str)
    GEM_STR_DE= { "latent", "bedingt", "leicht", "mäßig", "moderat", "bemerkenswert", "stark", "sehr stark", "unglaublich", "einzigartig" }
    GEM_STR_EN= { "latent", "limited", "slight", "mediocre", "moderate", "notable", "strong", "very strong", "unbelievable", "unique" }
    if User:getPlayerLanguage() == 0 then
        StrName=GEM_STR_DE[Str+1].." magischer";
    else
        StrName=GEM_STR_EN[Str+1].." magical";
    end
    return StrName
end

-- Vorläufige Einteilung der Itemid's für das Edelsteinsystem
--
function itemList()
    if ItemClass ~= nil then
        return false;
    end
    Items={};
    ItemClass={};
    -- weapons
    Items[1]={1,25,27,77,78,84,85,88,91,98,123,124,188,189,190,192,204,205,206,207,226,229,230,231,296,297,383,389,398,444,445,2626,2627,2629,2635,2636,2640,2642,2650,2652,2654,2655,2656,2658,2660,2662,2663,2664,2668,2671,2672,2673,2674,2675,2693,2694,2701,2704,2705,2707,2711,2723,2725,2728,2731,2737,2740,2742,2743,2757,2775,2776,2777,2778,2788,3035,3036};
    -- bows
    Items[2]={65,89,293,294,2645,2646,2685,2689,2708,2714,2718,2727,2739,2780};
    -- armor
    Items[3]={4,101,362,363,364,365,2357,2359,2360,2363,2364,2365,2367,2369,2389,2390,2393,2395,2399,2400,2402,2403,2407,2445,2447,2448};
    -- shields
    Items[4]={17,18,19,20,95,96,186,916,917,2284,2388,2439};
    -- wands
    Items[5]={39,40,57,76,208,209,323,2782,2783,2784,2785};
    -- tools
    Items[6]={6,9,23,24,47,58,72,74,118,121,122,126,227,258,271,311,312,734,737,2495,2659,2697,2709,2710,2715,2751,2752,2763,2781,2946};
    -- jewels
    Items[7]={68,235,277,278,279,280,281,282};
    for class, ItemList in pairs(Items) do
        for i, itemID in pairs(ItemList) do
            ItemClass[itemID]=class
        end
    end
end

