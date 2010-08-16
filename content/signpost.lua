module("content.signpost", package.seeall)

function InitWegweiser()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

    ---------------- WEGWEISER ----------------

    --AddWeg({X,Y,Z},german text,english text, direction, needed value of perception);
    --directions:
    -- 0 = north
    -- 2 = east
    -- 4 = south
    -- 6 = west

    --Norden
    AddWeg({-84,-320,0},"Zur Nordmine - Achtung, Wï¿½lfe und Goblins!","To the Northern Mine - Attention, Wulfs and Goblins!",0,0);
    AddWeg({-75,-274,0},"Tempel - Achtung: Zerfallenes Mauerwerk","Temple - Warning: Collapsing walls",0,0);
    AddWeg({206,-328,0},"Gefahr! Bloodskull Territorium!","Danger! Bloodskull Territory Ahead!",0,0);
    AddWeg({-115,-110,0},"Zu den Werkstï¿½tten","To the Workshops",0,0);
    AddWeg({139,-123,0},"Norden - Die Wï¿½ste und ...","North - The Desert and ...",0,0);
    AddWeg({263,-315,0},"Dieses Schild ist kï¿½rzlich ausgebessert und ï¿½bermalt: 'Burg Northerot - Heimstï¿½tte diverser Flï¿½che und anderer Entitï¿½ten'","This sign is newly repaird & painted over: 'Castle Northerot - home of serval magical curses and other entities'",0,0);
    AddWeg({-85,-217,0},"Norden - Zur Nordmine","North - To the 'North Mine'",0,0);
    AddWeg({-230,-222,0},"Zum Falkners Hain - Ushara Schrein","To Falkners Hain - Shrine of Ushara",0,0);
    AddWeg({-87,-153,0},"Norden - Die Graue Zuflucht, dahinter die Nordmine","North - The Grey Refuge, and beyond the Northern Mine",0,0);
    AddWeg({-175,53,0},"Norden - Nach Troll's Bane","North - To Troll's Bane",0,0);
    AddWeg({-419,-26,0},"Norden - Zum Kloster Eldan und zum Druidenhaus","North - Zu the Monastery of Eldan and to the Druidhouse",0,0);
    AddWeg({-413,-132,0},"Das Kloster Eldan","The Monastery Eldan",0,0);
    AddWeg({67,-110,0},"Norden - Nach Silberbrand","North - To Silverbrand",0,0);
    AddWeg({144,-154,0},"Norden - Nach Silberbrand","North - To Silverbrand",0,0);    
    AddWeg({-81,-67,0},"Norden - Troll's Bane","North - Troll's Bane",0,0);
    AddWeg({-2,-111,0},"Zur Kupfermine","To the Copper Mine",0,0);
    AddWeg({41,-347,-23},"Falls du es noch nicht begriffen hast. Du stehst JETZT in einem Drachenhort. Musst dich also nicht mehr warm anziehen.","Only if you didn't got it. NOW you stand in a dragon lair. So you don't have to wear warm clothes any longer.",0,0);
    AddWeg({-28,-111,0},"Garons Goldschmiede","Garon's Goldsmithy",0,0);
    AddWeg({348,-34,0},"Hier!","Here!",0,0);

    --Osten
    AddWeg({204,-195,0},"Dieses Schild zeigt 'Northerot', wurde aber teilweise ï¿½berschrieben und zeigt nun 'Varshikar'","This sign reads 'Northerot', but has been partially painted over and now reads 'Varshikar'",2,0);
    AddWeg({344,214,0},"Willkommen, Besucher der Elfen","Welcome, Visitors of the Elven",2,0);
    AddWeg({-49,-102,0},"Osten - Silberbrand hinter den Kupferbergen, dahinter Varshikar","East - Silverbrand behind the Copper Mountains, beyond to Varshikar",2,0);
    AddWeg({-446,-20,0},"Osten - Nach Troll's Bane","East - To Troll's Bane",2,0);
    AddWeg({-74,-36,0},"Südosten - Der Friedhof","South-East - The Graveyard",2,0);
    AddWeg({87,4,0},"Die Reste des Schildes zeigen gen Osten - 'Kallahorn'","The remains of the old sign shows to east - 'Kallahorn'",2,0);
    AddWeg({68,-104,0},"Osten - Varshikar","East - Varshikar",2,0);
    AddWeg({147,-155,0},"Osten - Varshikar","East - Varshikar",2,0);
    AddWeg({-149,-100,0},"Zum Hospital. Lï¿½den und Geschï¿½fte im Osten der Stadt","To the Hospital. Shops in the east of the town.",2,0);
    AddWeg({-280,19,0},"Osten - Troll's Bane, dahinter Silberbrand und Varshikar","East - Troll's Bane, beyond to Silverbrand and Varshikar",2,0);
    AddWeg({-414,-24,0},"Osten - Zum Hafen, dahinter Troll's Bane","East - To the Harbour, beyond to Troll's Bane",2,0);
    AddWeg({-410,-132,0},"Zum Druidenhaus","To the Druidhouse",2,0);
    AddWeg({-138,-55,0},"Osten - Silberbrand und Varshikar","East - Silverbrand and Varshikar",2,0);
    AddWeg({-385,-211,0},"Osten - Graue Zuflucht und Troll's Bane","East - Grey Refuge and Troll's Bane",2,0);
    AddWeg({62,-192,0},"Nach Silberbrand","To Silverbrand",2,0);
    AddWeg({-401,81,0},"Zur Taverne","To the Tavern",2,0);
    AddWeg({-465,-471,0},"Besprechungs und Diskussionsrï¿½ume","Conference and discussion rooms",2,0);
    AddWeg({-472,-484,0},"Bï¿½se Spieler gibts hier zu sehen","Mean players you can find here",2,0);
    AddWeg({-459,-484,0},"Besprechungsraum für Druiden und Elfen","Conference room for druids and elfes",2,0);
    AddWeg({-439,-490,0},"Treppe nach Varshikar","Ladder to Varshikar",2,0);
    AddWeg({-236,-337,0},"Haut ab, Ihr seid hier nicht willkommen!","Go away, you are not wanted here!",2,0);
    AddWeg({346,-36,0},"Hier!","Here!",2,0);
    
    --Süden
    AddWeg({-282,44,0},"Zu den Fï¿½hren","To the Ferries",4,0);
    AddWeg({-69,-203,0},"Süden - Troll's Bane","South - Troll's Bane",4,0);
    AddWeg({-95,-107,0},"Zur Taverne Fluffy Sheep","To the tavern Fluffy Sheep",4,0);
    AddWeg({-142,-49,0},"Süden - Zum Hafen, dahinter nach Greenbriar","South - To the Harbour, beyond to Greenbriar",4,0);
    AddWeg({-175,54,0},"Zur Farmer Union","To the Farmer Union",4,0);
    AddWeg({-282,23,0},"Zum Hafen","To the Harbour",4,0);
    AddWeg({-95,-107,0},"Zur Taverne Fluffy Sheep","To the tavern Fluffy Sheep",4,0);
    AddWeg({-72,-141,0},"Zu Eliza's Shop","To Eliza's Shop",4,0);
    AddWeg({-81,-66,0},"Süden - Die sï¿½dlichen Wï¿½lder. Achtung gefï¿½hrliche Kreaturen!","South - The southern Forests, Be careful, dangerous creatures!",4,0);
    AddWeg({60,-186,0},"Süden - Nach Troll's Bane","South -To Troll's Bane",4,0);
    AddWeg({-118,-101,0},"Das Hospital","The Hospital",4,0);
    AddWeg({-419,39,0},"Willkommen in Greenbriar","Welcome to Green Briar",4,0);
    AddWeg({-489,-452,0},"Achtung Testgelï¿½nde! Betreten auf eigene Gefahr!","Danger proving ground! Entry on own risk",4,0);
    AddWeg({348,-38,0},"Hier!","Here!",4,0);

    --Westen
    AddWeg({-407,83,0},"Zum Hospital","To the Hospital",6,0);
    AddWeg({-452,-12,0},"Caelum","Caelum",6,0);
    AddWeg({-82,-280,0},"Zur Nordmine - Achtung, Wï¿½lfe und Goblins!","To the northern mine - Attention, wolves and goblins!",6,0);
    AddWeg({-99,-189,0},"Westen - Der Leuchtturm","West - The Lighthouse",6,0);
    AddWeg({-208,-205,0},"Westen - Die Sï¿½mpfe, dahinter der Leuchtturm","West - The Swamps, and beyond the Lighthouse",6,0);
    AddWeg({-76,-112,0},"Westen - Zu der Bibiliothek, der Taverne, die Werkstï¿½tten & dem Südtor.","West - To the Library, the Tavern, Workshops & Southgate",6,0);
    AddWeg({307,231,0},"Zu den Fï¿½hren","To the Ferries",6,0);
    AddWeg({-285,20,0},"Nach Greenbriar, Zum Kloster Eldan und Druidenhaus","To Greenbriar, To the Monastery of Eldan and the Druidhouse",6,0);
    AddWeg({-181,55,0},"Westen - Der Hafen, und dahinter Greenbriar","West - The Harbour, and beyond Greenbriar",6,0);
    AddWeg({-421,-23,0},"Westen - Greenbriar","West - Greenbriar",6,0);
    AddWeg({59,-105,0},"Westen - Troll's Bane, dahinter der Hafen und Briar","West - Troll's Bane, and beyond the Harbour and Briar",6,0);
    AddWeg({59,-193,0},"Zur Grauen Zuflucht, dahinter der Leuchtturm","To the Grey Refuge, and beyond the Lighthouse",6,0);
    AddWeg({-79,-141,0},"Ein Ort zum Nachdenken, was richtig und was falsch ist","A place to think about what is right and what is wrong",6,0);
    AddWeg({-466,-471,0},"Bestrafungs und Hinrichtungsrï¿½ume","Punishment and execution rooms",6,0);
    AddWeg({-478,-484,0},"Bï¿½se Spieler die nicht von allein lieb werden wollen, dort hinein.","Mean Players who don't become nice on their own, in there.",6,0);
    AddWeg({-476,-476,0},"Bï¿½se Spieler die gar nicht lieb werden wollten.","Mean Players who don't want to become nice.",6,0);
    AddWeg({-441,-490,0},"Treppe nach Troll's Bane","Ladder to Troll's Bane",6,0);
    AddWeg({-248,-347,0},"Verschwindet und kommt niemals wieder zurück!","Leave, and never come back!",6,0);
    AddWeg({350,-36,0},"Hier!","Here!",6,0);
    
    
--    -- Nargun Questschilder
--    AddWeg({-130, -98,0},"Samantha 1","",0,0);
--    AddWeg({-139, -98,0},"Merung Harbes - Offizieller Schildermacher von Enab Sllort","Merung Harbes - Official Signmaker of Enab Sllort",4,0);
--    AddWeg({-113, -94,0},"Das Troll's Bane Hospital - Wir machen die Siechen von heute zu den Untoten von morgen!","The Troll's Bane hospital - We turn the injured of today into the undead of tomorrow!",2,0);
--    AddWeg({ -95,-111,0},"Bibliothek von Troll's Bane - Bï¿½cherverbrennung immer Samstags","Library of Troll's Bane - Book Burning every Saturday",0,0);
--    AddWeg({-104,-138,0},"Siltaris 1","",0,0);
--    AddWeg({ -69,-130,0},"Eliza's Shop - Neu im Sortiment: Kinder aller Rassen","Eliza's Shop - New for sale: Children of all races",2,0);
--    AddWeg({ -59,-111,0},"Eliza's Shop - Neu im Sortiment: Kinder aller Rassen","Eliza's Shop - New for sale: Children of all races",0,0);
--    AddWeg({ -74,-108,0},"Achtung - Geheimer Tunnelkomplex!","Attention - Secret Cave!",2,0);
--    AddWeg({ -90, -87,0},"Nur für kurze Zeit: Das ekelhafteste, abscheulichste Bier auf ganz Gobaith - Frisch aus Silberbrand!","For a short time only: The most disgusting, abhorrent beer on Gobaith - Fresh from Silverbrand!",0,0);
--    AddWeg({ -96,-100,0},"Nur für kurze Zeit: Das ekelhafteste, abscheulichste Bier auf ganz Gobaith - Frisch aus Silberbrand!","For a short time only: The most disgusting, abhorrent beer on Gobaith - Fresh from Silverbrand!",4,0);    
--    
	
	-- Noobia --
	AddWeg({47,98,100},"Zur Sandlandschaft 'Doppelpalme'","To sand scape 'Double Palm'",2,0);
	AddWeg({114,162,100},"Arax Ironheart - Schmied","Arax Ironheart - smith",2,0);
	AddWeg({113,164,100},"Nimbur Goldhand - Goldschmied","Nimbur Goldhand - goldsmith",4,0);
	
	
	---------------- GRABSTEINE ----------------

    --AddGrave({X,Y,Z},german text,english text, type,0);
    --typs:
    -- 1 = east-west direction 1
    -- 2 = east-west direction 2
    -- 3 = all directions (column)
    -- 4 = coffin

    --Friedhof
    AddGrave({101,33,0},"Hier ruht Charsi. Man sollte nicht alles trinken, was man auf der Straï¿½e findet.","Here rests Charsi. Drinking everything youfind on the street is bad.",1,0);
    AddGrave({99,41,0},"Kaja Wolfagen. Der Tod ist nur ein Schritt zur Unsterblichkeit.","Kaja Wolfagen. Death is but one step to immortality.",3,0);
    AddGrave({96,40,0},"Hier ruht Niphredil Pelith. Trage ich dich nicht in meinen Armen, so trage ich dich in meinem Herzen.","Here rests Niphredil Pelith. If I don't carry you in my arms, so I carry you in my heart.",1,0);
    AddGrave({94,34,0},"Hier ruht currentChar. Das Leben bestimmt den Tod.","Here rests currentChar. The life determines the death.",3,0);
    AddGrave({94,31,0},"Hier ruht die Asche von Zauberer Rufux. Er schaffte es leider nicht mehr seinen Flammenzauber sicher zu machen.","Here rests the ash of the mage Rufux. He wasn't able to make his flame spell safe.",2,0);
    AddGrave({91,30,0},"Hier liegt Lord Raglar. Er verhungerte aus Angst vergiftet zu werden.","Here rests Lord Raglar. He died of hunger caused by fear of being poisoned.",2,0);
    AddGrave({91,33,0},"Schaf Fluffy. Wir haben dich gegessen, doch wir werden dich immer vermissen.","Sheep Fluffy. We ate you, but we will miss you forever.",1,0);
    AddGrave({91,36,0},"Hier ruht der Rumpf von Sir Hektor. Er starb heldenhaft im Kampf mit dem Drachen.","Here rests the torso of Sir Hektor. He died in the heroical fight against a dragon.",2,0);
    AddGrave({87,39,0},"~Nur einige Kratzspuren sind an dem Grabstein zu erkennen~","~Nothing but some claw marks are visible on the grave stone",3,0);
    
    --TB Osttor
    AddGrave({-65,-74,0},"Hier ruhe eine Elfe, deren Namen keiner kannte. Dahin gerafft vom Wahnsinn der Rothmans","Here rests a elfess, her name remains unknown. Killed by the insanity of the Rothmans.",1,0);
    AddGrave({-65,-75,0},"Jack Lemmings ist nun im Himmel mit den Göttern.","Jack Lemmings is now in the heavens with the gods",2,0);
    
    --TB Arena
    AddGrave({-35,-82,0},"Hier ruht Retlak, zumindest manchmal","Here rests Retlak, at least sometimes",2,0);
    
    --TB Prison
    AddGrave({-107,-139,0},"In Erinnerung an Johnny Lant, einem Verbï¿½ndeten","Forever remember Johnny Lant, an Ally",1,0);
    
    --Dragons Lair
    AddGrave({46,-352,-23},"Hier liegt die Zeit begraben die beim Erstellen dieses Dungeons gebraucht wurde.","Here rests the time, that was needed to create this dungeon.",2,0);
    -- By the lighthouse
    AddGrave({-395,-230,0},"Flammende Buchstaben sind in den Stein gebrannt und formen den Namen 'Tybalt'","Blazing letters are burned into the stone and formed the name 'Tybalt'",3,0);

    -- Nï¿½rdlich des Trollwaldes (temporï¿½r ~Kadiya )
    AddGrave({348,-36,0},"Hier ruht der Verstand der grauen Rose","Here rest the mind of the grey rose",3,0);

    --Friedhof von Briar
    AddGrave({-434,52,0},"Das Grab des unbekannten Halblings.","The grave of the unknown halfling.",3,0);
    AddGrave({-435,47,0},"Hier liegt Rosy Bottoms. 'Herzallerliebste Schwester, Du wurdest gerï¿½cht. ~Dusty Bottoms'.","Here Lies Rosy Bottoms Dearest. 'Sister You have been avenged. ~Dusty Bottoms'",1,0);
    AddGrave({-439,46,0},"Hier liegt Baron Dusty Bottoms vom westlichen Meer, Grï¿½nder vom Weiler Greenbriar, Diplomat, Kaufmann und Meisterhandwerker, Treuer Freund zu X und Demonen gleich. Ruhe in Frieden.","Here Lies Baron Dusty Bottoms of the Western Sea, Founder of the 'Hamlet of Greenbriar', Diplomat, Merchant and Master Craftsman, Truest friend to Men and Demons alike. Rest in Peace.",3,0);
    AddGrave({-439,58,0},"Hier liegt Zal'undin, nun und für immer.","Here lies Zal'undin, now and forever.",3,0);
    AddGrave({-435,55,0},"Franz Strohblum, er starb in den Waeldern von Greenbriar als Widerstandskï¿½mpfer gegen die Horden des Tempels.","Franz Strohblum, he die in the Forest of Greenbriar as a resistance fighter to the hordes of the temple.",2,0);
    AddGrave({-442,54,0},"Geliebt, beweint und unvergessen ...! - Pia Dandelion -","beloved, weeped and unforgotten ...! - Pia Dandelion -",1,0);
    AddGrave({-442,55,0},"Keine Chance zu leben. Vergib mir! Anfala","No chance to life. Forgive me! Anfala",1,0);

    -- Varshikar
    AddGrave({285,-304,1},"Hier ruht Siltaris, die wackere Amazone von Mortock - Doch unsere Liebe zu ihr wird niemals sterben.","Here rests Siltaris, the valiant Amazon of Mortock - But our love to her will never die.",1,0);

    ---------------- BILDER ----------------

    --AddPicture({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = east wall yellow picture
    -- 2 = east wall violett picture


    ---------------- STANDARTEN ----------------

    --AddPennant({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = Simple Pennant - north-south direction
    -- 2 = Simple Pennant - east-west direction
    -- 3 = huge animated flag - north-south direction
    -- 4 = scull post - north
    -- 5 = scull post - east
    -- 6 = scull post - west
    -- 7 = scull post - south
    
    --Irundar--
    AddPennant({-43,194,-9},"Willkommen in Irundar","Welcome to Irundar",2,0);
    AddPennant({-36,197,-9},"Magierturm - Kein Zutritt","Magetower - No Entrance",2,0);
    AddPennant({-48,181,-9},"Kirche der Alten","Church of the Ancient",1,0);
    AddPennant({-48,173,-9},"Rinaads Eisen","Rinaad's Iron",2,0);
    AddPennant({-49,167,-9},"Alehas Gemischtwarenhandlung","Aleha's General Store",1,0);
    AddPennant({-41,165,-9},"Schloss Irundar","Irundar Castle",1,0);
    AddPennant({-38,165,-9},"Schloss Irundar","Irundar Castle",1,0);
    AddPennant({-41,154,-9},"Vorzimmer","Antechamber",1,0);
    AddPennant({-38,154,-9},"Vorzimmer","Antechamber",1,0);
    AddPennant({-41,148,-9},"Thronsaal","Throne Room",1,0);
    AddPennant({-38,148,-9},"Thronsaal","Throne Room",1,0);
    AddPennant({-41,142,-9},"Der ehrwï¿½rdige Herzog von Irundar","The venerable Duke of Irundar",1,0);
    AddPennant({-38,142,-9},"Der ehrwï¿½rdige Herzog von Irundar","The venerable Duke of Irundar",1,0);
    AddPennant({-52,212,-3},"Gefahr: Niedrige Decke","Danger: Low ceiling",2,0);
    AddPennant({-51,201,-3},"Der Weg nach Irundar...","The road to Irundar...",1,0);
    AddPennant({-49,201,-3},"...ist den Zweiflern versperrt!","...is obstructed for those who doubt!",1,0);
    
    --Troll's Bane--
    AddPennant({-67,-115,0},"Laden von Troll's Bane - Inhaberin: Eliza","Shop of Troll's Bane - Owner: Eliza",2,0);
    AddPennant({-65,-128,0},"Laden von Troll's Bane - Inhaberin: Eliza","Shop of Troll's Bane - Owner: Eliza",2,0);
    AddPennant({-101,-139,0},"Gefï¿½ngnis","Prison",1,0); 
    AddPennant({-131,-101,0},"\"Seahorse\" - Regierungssitz","\"Seahorse\" - Seat of Goverment",1,0); 
    AddPennant({-53,-101,0},"Willkommen in Troll's Bane","Welcome in Troll's Bane",1,0); 
    AddPennant({-150,-82,0},"Willkommen in Troll's Bane","Welcome in Troll's Bane",1,0); 
    AddPennant({-81,-148,0},"Willkommen in Troll's Bane","Welcome in Troll's Bane",2,0); 
    AddPennant({-77,-143,0},"Nordtor","Northern Gate",1,0); 
    AddPennant({-155,-89,0},"Südtor","Southern Gate",2,0); 
    AddPennant({-63,-108,0},"Osttor","Eastern Gate",2,0); 
    AddPennant({-95,-100,-3},"Kï¿½nigreich Silberbrand","Kingdom of Silverbrand",2,0); 
    AddPennant({-96,-93,0},"Taverne \"Fluffy Sheep\" - Territorium Silberbrand","Tavern \"Fluffy Sheep\" - Territory of Silverbrand",2,0);
    AddPennant({-69,-106,-3},"Abstieg auf eigene Gefahr! Horror, Erbrechen und Arachnophobie nicht auszuschlieï¿½en!","The use of downstairs at own risk! Horror, sickness and arachnophobia can not be excluded!",6,0);
    AddPennant({-219,-121,-3},"Abstieg auf eigene Gefahr! Horror, Erbrechen und Arachnophobie nicht auszuschlieï¿½en!","Use of downstairs at own risk! Horror, sickness and arachnophobia can not be excluded!",6,0);
    AddPennant({-124,-72,-3},"Abstieg auf eigene Gefahr! Horror, Erbrechen und Arachnophobie nicht auszuschlieï¿½en!","Use of downstairs at own risk! Horror, sickness and arachnophobia can not be excluded!",4,0);
    
    --GM Castle--
    AddPennant({-461,-470,0},"Gamemaster Festung","Castle of the gamemasters",3,0);
    AddPennant({-470,-470,0},"Gamemaster Festung","Castle of the gamemasters",3,0);  
    AddPennant({-256,62,-25},"\"Quartiere der Toten\" steht auf der Standarte. Aber irgendjemand hat in kleinen Buchstaben darunter geschrieben \"Meriels Bordell\"","\"Quarters of the deads\" is written on the pennant. But somebody wrote under it is small letters \"Meriels Brothel\"",1,0);  
    AddPennant({-254,62,-25},"\"Quartiere der Toten\" steht auf der Standarte. Aber irgendjemand hat in kleinen Buchstaben darunter geschrieben \"Meriels Bordell\"","\"Quarters of the deads\" is written on the pennant. But somebody wrote under it is small letters \"Meriels Brothel\"",1,0);  
    
    --Varshikar--
    AddPennant({240,-394,0},"Achtung, Tote Grï¿½ber!","Danger, dead gravediggers inside!",6,0);
    AddPennant({240,-391,0},"Achtung, Tote Grï¿½ber!","Danger, dead gravediggers inside!",6,0);
    AddPennant({250,-381,0},"Die Warnung ist ernstgemeint, wirklich!","The warn is serious! Really!",4,0);
    
    --Silverbrand-- 
    AddPennant({119,-195,-3},"Kï¿½nigssaal","Royal Hall",2,0);
    AddPennant({119,-192,-3},"Kï¿½nigssaal","Royal Hall",2,0); 
    AddPennant({112,-199,-3},"Halle des Hammers","Hall of the Hammer",1,0); 
    AddPennant({101,-182,-3},"Halle der Axt","Hall of the Axe",2,0); 
    AddPennant({98,-199,-3},"Gandelahalle","Hall of Gandela",2,0); 
    AddPennant({73,-210,0},"Willkommen in Silberbrand","Welcome in Silverbrand",1,0); 
    AddPennant({132,-196,0},"Willkommen in Silberbrand","Welcome in Silverbrand",1,0); 
    AddPennant({103,-211,-3},"Dwarfpower Heatmaster 3000","Dwarfpower Heatmaster 3000",1,0); 
    
    --Graue Rose-- 
    AddPennant({-54,-219,0},"Die Graue Zuflucht","The grey refuge",1,0); 
    AddPennant({-57,-219,0},"Die Graue Zuflucht","The grey refuge",1,0); 
    AddPennant({-73,-201,0},"Die Graue Rose","The grey rose",3,0); 
    AddPennant({-69,-202,0},"Das Graue Licht","The grey light",3,0); 
    AddPennant({-93,-266,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0); 
    AddPennant({-121,-240,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0); 
    AddPennant({-144,-228,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0); 
    AddPennant({-162,-228,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0); 
    AddPennant({-190,-235,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0); 
    AddPennant({-224,-235,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0); 
    AddPennant({-264,-211,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0); 
    AddPennant({-242,-221,0},"Territorium der Grauen Orden","Territory of the Grey Orders",1,0);
    AddPennant({-51,-215,-3},"Die heilige Halle Malachins","The holy hall of Malachin",2,0); 
    AddPennant({-51,-212,-3},"Wahrt respektvolles Verhalten im heiligen Bezirk!","Keep a behavior of respect inside the holy area!",2,0); 
    AddPennant({-59,-238,1},"\"Thron\" der Schatzmeisterin","\"Throne\" of the Treasurer",2,0); 
    AddPennant({-68,-240,1},"Graue Rose","Grey Rose",1,0); 
    AddPennant({-65,-240,1},"Graues Licht","Grey Light",1,0); 
    
    -- Merenium-Mine-- 
    AddPennant({395,147,-10},"Lange, Bleibt drauï¿½en!","Longlegs, Stay Outside!",7,0); 
    AddPennant({401,145,-10},"Zutritt verboten! Raus hier!","No Entry! Leave us!",6,0); 
    AddPennant({364,172,-10},"Gnome an die Macht!","Gnomes! All powers to us!",1,0); 
    AddPennant({397,171,-13},"Gnome Heatmaster \"3100\"","Gnome Heatmaster \"3100\"",2,0); 
    AddWeg({380,161,-13},"Im Norden - die Leuchtenmine","North - The Shining Mine",0,0); 
    
    -- VOTINGS in TROLLSBANE -- 
    AddPennant({-87,-108,0},"Geht in die Taverne, kauft euch ein Bier und hï¿½rt auf Borgate. Er ist ein weiser Zwerg.","Go into the tavern, buy a beer and listen to Borgate. He is a wise dwarf.",1,0); 
    
    -- Noobia --
    AddPennant({73,40,101},"Oldren Shmagging - Koch und Bï¿½cker","Oldren Shmagging - cook and baker",2,0);
    AddPennant({73,42,101},"Schreiner (zur Zeit im Urlaub)","carpenter (currently on holiday)",2,0);
    AddPennant({73,44,101},"Vandor Serias - Glasblï¿½ser","Vandor Serias - glassblower",2,0);
    AddPennant({73,46,101},"Hirk - Bauer (zur Zeit im Urlaub)","Hirk - farmer (currently on holiday)",2,0);
    AddPennant({68,40,101},"Arax Ironheart - Schmied, Nimbur Goldhand - Goldschmied","Arax Ironheart - smith, Nimbur Goldhand - goldsmith",2,0);
    AddPennant({68,42,101},"Die Copperneedle Schwestern - Schneiderinnen","The Copperneedle sisters - tailors",2,0);
    AddPennant({68,44,101},"Siemus Berger - Bergarbeiter (zur Zeit im Urlaub)","Siemus Berger - miner (currently on holiday)",2,0);
    AddPennant({68,46,101},"Farell Schleifer - Edelsteinschleifer (zur Zeit im Urlaub)","Farell Schleifer - gem cutter (currently on holiday)",2,0);
    AddPennant({68,48,101},"Angler (zur Zeit im Urlaub)","fisherman (currently on holiday)"	,2,0);

    
    ---------------- Bï¿½UME ----------------

    --AddTree({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = fri tree
    -- 2 = cachdern tree
    -- 3 = naldor tree
    -- 4 = blooming ceridern
    -- 5 = ceridern tree
    -- 6 = eldan oak
    -- 7 = scandrel pine

    -- Tol Vanima --
    AddTree({432,205,0},"Katherine van Illdoran \"Ich habe nur ein Leben gelebt, aber für Tausende geliebt.\"","Katherine van Illdoran \"I only lived one life, but i have loved for a thousand.\"",5,0);


    ---------------- Sï¿½ulen/Statuen  ----------------
    --AddPillar({X,Y,Z},german text,english text, type, needed value of perception);
    -- typs:
    -- 1 = dark column
    -- 2 = statue (woman) south

    -- Tol Vanima (Magnus Haus) --
	AddPillar({317, 241, 0},"~ Das primitive Relief einer Person, die an ein Tor, ï¿½hnlich dem neben der Sï¿½ule, klopft und wohl auch rufend um Einlass zu bitten scheint. ~","~ The primitive relief of a person that is knocking on a gate, similar to the one beside the pillar. Also, they seem to be pleading loudly for entrance. ~",1,0);
	AddPillar({314, 241, 0},"~ Das primitive Relief einer Person, die das Tor nach Betreten des Raumes dahinter auch wieder schliesst. ~","~ The primitive relief of a person that closes the gate again after having entered the room behind it. ~",1,0);
	AddPillar({317, 236, 0},"~ Die Statue einer gebeugten, alten Frau mit Kleidung und Haaren aus Efeu. Sie lï¿½chelt gï¿½tig, beinah großzï¿½gig. Zudem hï¿½lt sie eine Miniatur des Magnol-Anwesens in ihren Hï¿½nden. ~","~ The statue of an old, bent woman with clothes and hair made of ivy. She is smiling gratefully, even almost generously. Additionally she is holding a miniature of the Magnol-house in her hands. ~",2,0);
	AddPillar({314, 236, 0},"~ Die Statue eines Jï¿½nglings, fein gekleidet und mit einem sehr freundlichen Lï¿½cheln auf den Lippen. Er hat eine Hand ausgesteckt, als wolle er die des Ankï¿½mmlings schï¿½tteln. ~","~ The statue of a young man, nicely clad and bearing a very friendly smile on his lips. One of his hands is extended as if to shake that of the newcomer. ~",2,0);
	AddPillar({315, 233, 1},"~ Die Statue eines Hï¿½nen, dessen Körper fast vollstï¿½ndig in Flammen gehï¿½llt ist. Ein strenger, mahnender Ausdruck ruht in den Zï¿½gen seines kantigen Gesichts. ~","~The statue of a giant whose body is almost fully covered in flames. His facial expression and the look in his eyes are strict and warning. ~",2,0);
	AddPillar({317, 233, 1},"~ Die Statue eines schielenden aber lï¿½chelnden Greises, der am Stock geht und dessen magerer Körper mit Lumpen eingekleidet ist. Mit seiner Rechten hï¿½lt er einen Krug hoch und prostet dir zu. ~","~ The statue of a cross-eyed but smiling old man who walks with the help of a stick and whose thin body is clad with rags. With his right hand he is holding up a mug to toast you. ~",2,0);
	AddPillar({312, 232, 2},"~ Das Relief zwei junger Mï¿½nner, die auf einem Steg stehen und dich, beide mit Reisebï¿½ndeln beladen, hoffnungsvoll aber auch etwas unsicher ansehen. ~","~ The relief of two young men standing on a landing stage. Loaded with travelling bags they are both looking at you hopefully but also with a certain uncertainty. ~",1,0);
	AddPillar({325, 232, 2},"~ Das Relief einer wunderschönen, kurzhaarigen Elfe, die am Fuï¿½e eines Baumes sitzt. Zwischen ihren Knien hï¿½lt sie eine Harfe und ihre zerbrechlichen Finger streicheln die Saiten. ~","~ The relief of a beautiful, short-haired elfess who is sitting at the bottom of a tree. Between her knees she holds a harp while her delicate fingers stroke the cords. ~",1,0);
	AddPillar({312, 239, 2},"~ Das Relief eines schrecklichen Skelettkriegers, der einen gewaltigen Streithammer schwingt, dessen Kopf von einer unnatürlichen Aura umgeben ist. ~","~ The relief of a terrible skeleton warrior who is wielding an impressive warhammer. The head of this weapon is enveloped within an unnatural aura. ~",1,0);
	AddPillar({325, 239, 2},"~ Das Relief einer traurigen Szene. Ein junger Holzfï¿½ller, sein Beil in der Linken, wird von einem riesigen, umfallenden Apfelbaum, der pralle Frï¿½chte trï¿½gt, begraben. ~","~ The relief of a tragic scene. A young lumberjack, holding his hatchet in the left hand, is buried beneath a giant, falling apple tree. Its branches bear big, proud fruits. ~",1,0);
	AddPillar({314, 234, 2},"~ Das Relief einer aufgewï¿½hlten See, deren hohe Wogen eine Nussschale von Segelboot bedrï¿½ngen. Es ist eine zusammengekauerte Gestalt an Bord, die ihre Arme um den Mast geschlungen hat. ~","~ The relief of a rough sea pressuring a tiny sailboat. There is a crouching figure on board with her arms wrapped around the mast. ~",1,0);
	AddPillar({323, 234, 2},"~ Das Relief eines gemï¿½tlichen Bauernhauses, das von weiten Feldern umgeben ist. Auf diesen kann man einen Mann mit Schlapphut sehen, der eine Vogelscheuche aufstellt. ~","~ The relief of a comfortable farmhouse surrounded by great fields on which you can recognize a man with slouch hat setting up a scarecrow. ~",1,0);
	AddPillar({314, 237, 2},"~ Das Relief zweier Mï¿½nner, eines Menschen und eines Zwergen. Letzterer steht hinter einem Thresen und poliert Krï¿½ge mit einem dreckigen Tuch. Der Mensch hebt einen Krug an seine Lippen. ~","~ The relief of two men, a human and a dwarf. The latter is standing behind a counter and polishes mugs with a dirty piece of cloth. The other man is lifting a mug to his lips, looking dull. ~",1,0);
	AddPillar({323, 237, 2},"~ Das wirklich detailgetreue Relief einer Taube, die einen Ozean ï¿½berfliegt. Man sieht eine kleine Kapsel, an ihr Bein gebunden, doch sie wird halb verdeckt von einem ihrer ausgestreckten Flï¿½gel. ~","~ The really authentic relief of a dove flying across the ocean. You can see a small tin bound to her leg but it is almost hidden by one of her outspread wings. ~",1,0);
	
	
	
	
	
	---------------- Chimneys ~ Kamine -------------
	-- AddChimney({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west
	
	-- Tol Vanima (Magnus Haus) --
	AddChimney({316,233,1},"~ Das Bild einer Gruppe wurde in den Kaminsims geschnitzt, Gnome. Sie sind um einen Tisch versammelt und fï¿½llen kleine Flaschen, wobei sie alle irgendwie nervï¿½s wirken. ~","~ Carved into the mantelpiece is the image of a group of Gnomes. They are gathered around a table filling small bottles and seem somewhat nervous. ~", 1, 0);



	---------------- Mirrors ~ Spiegel -------------
	-- AddMirror({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west
	
	AddMirror({-28,197,-8}, "bla", "bla", 2, 0);
	AddMirror({-30,196,-8}, "bla", "bla", 1, 0);

end

function AddWeg(Posi,dText,eText,Dir,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Dir));
end

function AddGrave(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+10));
end

function AddPicture(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+20));
end

function AddPennant(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+30));
end

function AddTree(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+40));
end

function AddPillar(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+50));
end

function AddChimney(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+60));
end

function AddMirror(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+70));
end


function CheckAndPlaceItem(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            world:createItemFromId(ItemID,1,Posi,true,333,0);
        end
    else
        world:createItemFromId(ItemID,1,Posi,true,333,0);
    end
end

function PrepareTables(TablePos)
    if (signCoo[TablePos] == nil) then
        signCoo[TablePos] = {};
        signTextDe[TablePos] = {};
        signTextEn[TablePos] = {};
        signPerception[TablePos] = {};
    end
end

-- DirToItemID converts item IDs into local type values for the Add functions to work with

function DirToItemID(Value)
    if (Value==0) then
        return 3081
    elseif (Value==2) then
        return 3084
    elseif (Value==4) then
        return 3082
    elseif (Value==6) then
        return 3083
    elseif (Value==11) then
        return 519
    elseif (Value==13) then
        return 520
    elseif (Value==12) then
        return 521
    elseif (Value==14) then
        return 337
    elseif (Value==21) then
        return 1914
    elseif (Value==22) then
        return 1915
    elseif (Value==31) then
        return 2046
    elseif (Value==32) then
        return 2069
    elseif (Value==33) then
        return 512
    elseif (Value==34) then
        return 2924
    elseif (Value==35) then
        return 2925
    elseif (Value==36) then
        return 2926
    elseif (Value==37) then
        return 2927
    elseif (Value==41) then
        return 308
    elseif (Value==42) then
        return 586
    elseif (Value==43) then
        return 1804
    elseif (Value==44) then
        return 1807
    elseif (Value==45) then
        return 1808
    elseif (Value==46) then
        return 1809
    elseif (Value==47) then
        return 1817
    elseif (Value==51) then
        return 2805
    elseif (Value==52) then
        return 272
    elseif (Value==61) then
		return 268
	elseif (Value==62) then
		return 269
	elseif (Value==71) then
		return 2873
	elseif (Value==72) then
		return 2874
	end
end
