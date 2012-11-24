-- ds_3104_pult.lua
-- Pergament für das Druidensystem
-- Falk
require("base.common")
require("druid.base.alchemy")

module("druid.item.id_3104_bookrest", package.seeall, package.seeall(druid.base.alchemy))

-- UPDATE common SET com_script='druid.item.id_3104_bookrest' WHERE com_itemid = 3104;

function init()
	if firsttime == nil then
		rNameDE = {}
		rNameEN = {}
		rKey = {}
		firsttime = 1

	-- Weiï¿½e Flasche / Sprachen lernen
	rKey[1] = 15751754; rNameDE[1] = "Sprachtrunk: Echsisch"      ;rNameEN[1] = "Lizard Language";
	rKey[2] = 32529515; rNameDE[2] = "Sprachtrunk: Elfisch"       ;rNameEN[2] = "Elbian Language";
	rKey[3] = 45942235; rNameDE[3] = "Sprachtrunk: Mensch"        ;rNameEN[3] = "Human Language";
	rKey[4] = 62483256; rNameDE[4] = "Sprachtrunk: Zwergisch"     ;rNameEN[4] = "Dwarf Language";
	rKey[5] = 82897532; rNameDE[5] = "Sprachtrunk: Orkisch"       ;rNameEN[5] = "Orkish Language";
	rKey[6] = 63296636; rNameDE[6] = "Sprachtrunk: Halbling"      ;rNameEN[6] = "Halfling Language";
	rKey[7] = 49582625; rNameDE[7] = "Sprachtrunk: Fee'isch"      ;rNameEN[7] = "Fairy Language";
	rKey[8] = 95738184; rNameDE[8] = "Sprachtrunk: Gnomisch"      ;rNameEN[8] = "Gnomish Language";
	rKey[9] = 53261566; rNameDE[9] = "Sprachtrunk: Goblisch"      ;rNameEN[9] = "Goblin Language";
	rKey[10]= 93538334; rNameDE[10]= "Sprachtrunk: Alten Sprache" ;rNameEN[10]= "Ancient Language";

	-- Schwarze Flasche / Verwandlungen
	rKey[11] = 77744151; rNameDE[11] = "Mensch";   rNameEN[11] = "Human";
	rKey[12] = 18784522; rNameDE[12] = "Zwerg";    rNameEN[12] = "Dwarf";
	rKey[13] = 32699619; rNameDE[13] = "Halbling"; rNameEN[13] = "Halfling";
	rKey[14] = 54876565; rNameDE[14] = "Elb";      rNameEN[14] = "Elf";
	rKey[15] = 61348438; rNameDE[15] = "Orc";      rNameEN[15] = "Orc";
	rKey[16] = 71378653; rNameDE[16] = "Echse";    rNameEN[16] = "Lizzard";
	rKey[17] = 58548893; rNameDE[17] = "Gnom";     rNameEN[17] = "Gnome";
	rKey[18] = 45634355; rNameDE[18] = "Oger";     rNameEN[18] = "Ogre";
	rKey[19] = 75529399; rNameDE[19] = "Mumie";    rNameEN[19] = "Mummy";
	rKey[20] = 44554428; rNameDE[20] = "Skelett";  rNameEN[20] = "Skeleton";
	rKey[21] = 18861363; rNameDE[21] = "Beholder"; rNameEN[21] = "Beholder";
	rKey[22] = 26562174; rNameDE[22] = "Fliege";   rNameEN[22] = "Fly";
	rKey[23] = 47418515; rNameDE[23] = "Schaf";    rNameEN[23] = "Sheep";
	rKey[24] = 58151138; rNameDE[24] = "Spinne";   rNameEN[24] = "Spider";
	rKey[25] = 22551786; rNameDE[25] = "Rotes Skelett"; rNameEN[25] = "Red Skeleton";
	rKey[26] = 72225438; rNameDE[26] = "Rotwurm";       rNameEN[26] = "Redworm";
	rKey[27] = 99992352; rNameDE[27] = "Big Demon";     rNameEN[27] = "Big Demon";
	rKey[28] = 38114786; rNameDE[28] = "Skorpion";      rNameEN[28] = "Scorpion";
	rKey[29] = 95371655; rNameDE[29] = "Schwein";       rNameEN[29] = "Pig";
	rKey[30] = 71796337; rNameDE[30] = "Unsichtbar";    rNameEN[30] = "Air";
	rKey[31] = 87611881; rNameDE[31] = "Schï¿½del";       rNameEN[31] = "Skull";
	rKey[32] = 31231973; rNameDE[32] = "Wespe";         rNameEN[32] = "Wasp";
	rKey[33] = 14523375; rNameDE[33] = "Waldtroll";       rNameEN[33] = "Forest Troll";
	rKey[34] = 46852135; rNameDE[34] = "Geister-Skelett"; rNameEN[34] = "Shadow Skeleton";
	rKey[35] = 37531813; rNameDE[35] = "SteinGolem";      rNameEN[35] = "Stone Golem";
	rKey[36] = 85293266; rNameDE[36] = "Goblin";          rNameEN[36] = "Goblin";
	rKey[37] = 86659455; rNameDE[37] = "Gnoll";           rNameEN[37] = "Gnoll";
	rKey[38] = 51464953; rNameDE[38] = "Drache";          rNameEN[38] = "Dragon";
	rKey[39] = 97171535; rNameDE[39] = "Drow";            rNameEN[39] = "Drow";
	rKey[40] = 77577615; rNameDE[40] = "Drow-Frau";       rNameEN[40] = "Female Drow";
	rKey[41] = 11695753; rNameDE[41] = "Kleiner Dämon";   rNameEN[41] = "Lower Demon";
	rKey[42] = 62545579; rNameDE[42] = "Kuh";             rNameEN[42] = "Cow";
	rKey[43] = 81519773; rNameDE[43] = "Hirsch";          rNameEN[43] = "Deer";
	rKey[44] = 95153618; rNameDE[44] = "Wolf";            rNameEN[44] = "Wolve";
	rKey[45] = 52728756; rNameDE[45] = "Panther";         rNameEN[45] = "Panther";
	rKey[46] = 91986793; rNameDE[46] = "Hase";            rNameEN[46] = "Rabbit";
	rKey[47] = 19831914; rNameDE[47] = "Gnom";            rNameEN[47] = "Gnome";

	-- Gelbe Flasche / Viruskrankheiten
	rKey[48] = 83795161; rNameDE[48] = "Gwenwyn Anghenfil Twymyn";   rNameEN[48] = "Gwenwyn Anghenfil Twymyn";
	rKey[49] = 26343194; rNameDE[49] = "Gwenwyn Morfa Cwlwm Gwythi"; rNameEN[49] = "Gwenwyn Morfa Cwlwm Gwythi";
	rKey[50] = 98886573; rNameDE[50] = "Gwenwyn Trolio Caethineb";   rNameEN[50] = "Gwenwyn Trolio Caethineb";
	rKey[51] = 65336351; rNameDE[51] = "Gwenwyn Corrach Rhithdyb";   rNameEN[51] = "Gwenwyn Corrach Rhithdyb";
	rKey[52] = 28455363; rNameDE[52] = "Gwenwyn Rhag Vein-Syndrome"; rNameEN[52] = "Gwenwyn Rhag Vein-Syndrome";
	rKey[53] = 95819741; rNameDE[53] = "Gwenwyn Draig Brech Moddion";rNameEN[53] = "Gwenwyn Draig Brech Moddion";
	rKey[54] = 15386558; rNameDE[54] = "Gwenwyn Sgorpion Epidemig";  rNameEN[54] = "Gwenwyn Sgorpion Epidemig";
	rKey[55] = 58595367; rNameDE[55] = "Gwenwyn Blaidd Haint";       rNameEN[55] = "Gwenwyn Blaidd Haint";

	-- Orange Flasche / Virus-Medizin   !!! Codecs nochmal prï¿½fen !!!
	rKey[56] = 27315949; rNameDE[56] = "Rhag Anghenfil Twymyn";              rNameEN[56] = "Rhag Anghenfil Twymyn";
	rKey[57] = 84767916; rNameDE[57] = "Rhag Morfa Cwlwm Gwythi";            rNameEN[57] = "Rhag Morfa Cwlwm Gwythi";
	rKey[58] = 12224537; rNameDE[58] = "Trolio Caethineb Meddyginiaeth";     rNameEN[58] = "Trolio Caethineb Meddyginiaeth";
	rKey[59] = 45774759; rNameDE[59] = "Corrach Rhithdyb Gwrthwenwyn";       rNameEN[59] = "Corrach Rhithdyb Gwrthwenwyn";
	rKey[60] = 82655747; rNameDE[60] = "Rhag Vein-Syndrome Meddyginiaeth";   rNameEN[60] = "Rhag Vein-Syndrome Meddyginiaeth";
	rKey[61] = 15291369; rNameDE[61] = "Draig Brech Moddion";                rNameEN[61] = "Draig Brech Moddion";
	rKey[62] = 95724552; rNameDE[62] = "Gwrthwenwyn Rhag Sgorpion Epidemig"; rNameEN[62] = "Gwrthwenwyn Rhag Sgorpion Epidemig";
	rKey[63] = 52515743; rNameDE[63] = "Blaidd Haint Meddyginiaeth";         rNameEN[63] = "Blaidd Haint Meddyginiaeth";

	-- Hellblaue Flasche / Pasten
	rKey[64] = 95555555; rNameDE[64] = "Metall-Pflegeï¿½l";              rNameEN[64] = "Metal Care Product";
	rKey[65] = 59555555; rNameDE[65] = "Wunderpaste für Lebensmittel"; rNameEN[65] = "Foodstuff Panaceas";
	rKey[66] = 55955555; rNameDE[66] = "Lederfett";                    rNameEN[66] = "Dubbin";
	rKey[67] = 55595555; rNameDE[67] = "Edelstein-Politur";            rNameEN[67] = "Gemstone Polish" ;
	rKey[68] = 55559555; rNameDE[68] = "Edelmetall-Pflege";            rNameEN[68] = "Noble Metal Polish";
	rKey[69] = 55555955; rNameDE[69] = "Holzpolitur";                  rNameEN[69] = "Wood Preserver";
	rKey[70] = 55555595; rNameDE[70] = "Textilpflegemittel";           rNameEN[70] = "Textile Care Product";
	rKey[71] = 55555559; rNameDE[71] = "Hornfett";                     rNameEN[71] = "Horn Preserver";

	-- Dunkelblaue Flasche / Einzelwirkungen, Wurfgeschosse
	rKey[72] = 66475155; rNameDE[72] = ""; rNameEN[72] = ""; --Voller Hitpoint-Schaden auf 1er-Feld
	rKey[73] = 93531588; rNameDE[73] = ""; rNameEN[73] = ""; --Voller Hitpoint-Schaden auf 9er-Feld
	rKey[74] = 84254555; rNameDE[74] = ""; rNameEN[74] = ""; --Aufgeteilter Hitpoint-Schaden auf 9er Feld
	rKey[75] = 75568356; rNameDE[75] = ""; rNameEN[75] = ""; --Voller Hitpoint-Schaden auf 21er-Feld
	rKey[76] = 36835636; rNameDE[76] = ""; rNameEN[76] = ""; --Aufgeteilter Hitpoint-Schaden auf 21er Feld
	rKey[77] = 24968253; rNameDE[77] = ""; rNameEN[77] = ""; --Voller Mana-Schaden auf 1er-Feld
	rKey[78] = 16359531; rNameDE[78] = ""; rNameEN[78] = ""; --Voller Mana-Schaden auf 9er-Feld
	rKey[79] = 71943574; rNameDE[79] = ""; rNameEN[79] = ""; --Aufgeteilter Mana-Schaden auf 9er Feld
	rKey[80] = 47564545; rNameDE[80] = ""; rNameEN[80] = ""; --Voller Mana-Schaden auf 21er-Feld
	rKey[81] = 33421656; rNameDE[81] = ""; rNameEN[81] = ""; --Aufgeteilter Mana-Schaden auf 21er Feld
	rKey[82] = 63155452; rNameDE[82] = ""; rNameEN[82] = ""; --Voller Sattmacher-Schaden auf 1er-Feld
	rKey[83] = 21915579; rNameDE[83] = ""; rNameEN[83] = ""; --Voller Sattmacher-Schaden auf 9er-Feld
	rKey[84] = 64312656; rNameDE[84] = ""; rNameEN[84] = ""; --Aufgeteilter Sattmacher-Schaden auf 9er Feld
	rKey[85] = 87783632; rNameDE[85] = ""; rNameEN[85] = ""; --Voller Sattmacher-Schaden auf 21er-Feld

	rKey[86] = 62358491; rNameDE[86] = ""; rNameEN[86] = ""; --Aufgeteilter Sattmacher-Schaden auf 21er Feld
	rKey[87] = 84613666; rNameDE[87] = ""; rNameEN[87] = ""; --Hasenbarriere auf 9er-Feld
	rKey[88] = 29732752; rNameDE[88] = ""; rNameEN[88] = ""; --Hasenbarriere auf 21er-Feld
	rKey[89] = 55938556; rNameDE[89] = ""; rNameEN[89] = ""; --Voller Haltbarkeits-Schaden auf Rüstungen auf 1er Feld
	rKey[90] = 43245354; rNameDE[90] = ""; rNameEN[90] = ""; --Voller Haltbarkeits-Schaden auf Rüstungen auf 9er Feld
	rKey[91] = 95257533; rNameDE[91] = ""; rNameEN[91] = ""; --Aufgeteilter Haltbarkeits-Schaden auf Rüstungen auf 9er Feld
	rKey[92] = 59159412; rNameDE[92] = ""; rNameEN[92] = ""; --Voller Haltbarkeits-Schaden auf Rüstungen auf 21er Feld
	rKey[93] = 36557188; rNameDE[93] = ""; rNameEN[93] = ""; --Aufgeteilter Haltbarkeits-Schaden auf Rüstungen auf 21er Feld
	rKey[94] = 98538617; rNameDE[94] = ""; rNameEN[94] = ""; --Voller Qualitäts-Schaden auf Rüstungen auf 1er Feld
	rKey[95] = 79684787; rNameDE[95] = ""; rNameEN[95] = ""; --Voller Qualitäts-Schaden auf Rüstungen auf 9er Feld
	rKey[96] = 32484266; rNameDE[96] = ""; rNameEN[96] = ""; --Aufgeteilter Qualitäts-Schaden auf Rüstungen auf 9er Feld
	rKey[97] = 96261935; rNameDE[97] = ""; rNameEN[97] = ""; --Voller Qualitäts-Schaden auf Rüstungen auf 21er Feld
	rKey[98] = 26372612; rNameDE[98] = ""; rNameEN[98] = ""; --Aufgeteilter Qualitäts-Schaden auf Rüstungen auf 21er Feld
	rKey[99] = 56548394; rNameDE[99] = ""; rNameEN[99] = ""; --Voller Haltbarkeits-Schaden auf Waffen auf 1er Feld
	rKey[100] = 81876627; rNameDE[100] = ""; rNameEN[100] = ""; --Voller Haltbarkeits-Schaden auf Waffen auf 9er Feld
	rKey[101] = 86656358; rNameDE[101] = ""; rNameEN[101] = ""; --Aufgeteilter Haltbarkeits-Schaden auf Waffen auf 9er Feld
	rKey[102] = 77254231; rNameDE[102] = ""; rNameEN[102] = ""; --Voller Haltbarkeits-Schaden auf Waffen auf 21er Feld
	rKey[103] = 32185872; rNameDE[103] = ""; rNameEN[103] = ""; --Aufgeteilter Haltbarkeits-Schaden auf Waffen auf 21er Feld
	rKey[104] = 91357421; rNameDE[104] = ""; rNameEN[104] = ""; --Voller Qualitäts-Schaden auf Waffen auf 1er Feld
	rKey[105] = 52761593; rNameDE[105] = ""; rNameEN[105] = ""; --Voller Qualitäts-Schaden auf Waffen auf 9er Feld
	rKey[106] = 19123643; rNameDE[106] = ""; rNameEN[106] = ""; --Aufgeteilter Qualitäts-Schaden auf Waffen auf 9er Feld
	rKey[107] = 35471525; rNameDE[107] = ""; rNameEN[107] = ""; --Voller Qualitäts-Schaden auf Waffen auf 21er Feld
	rKey[108] = 32812622; rNameDE[108] = ""; rNameEN[108] = ""; --Aufgeteilter Qualitäts-Schaden auf Waffen auf 21er Feld
	rKey[109] = 12836431; rNameDE[109] = ""; rNameEN[109] = ""; --Voller Haltbarkeits-Schaden auf Holzitems auf 1er Feld
	rKey[110] = 43185342; rNameDE[110] = ""; rNameEN[110] = ""; --Voller Haltbarkeits-Schaden auf Holzitems auf 9er Feld
	rKey[111] = 57771997; rNameDE[111] = ""; rNameEN[111] = ""; --Aufgeteilter Haltbarkeits-Schaden auf Holzitems auf 9er Feld
	rKey[112] = 13245638; rNameDE[112] = ""; rNameEN[112] = ""; --Voller Haltbarkeits-Schaden auf Holzitems auf 21er Feld
	rKey[113] = 88343542; rNameDE[113] = ""; rNameEN[113] = ""; --Aufgeteilter Haltbarkeits-Schaden auf Holzitems auf 21er Feld
	rKey[114] = 67589591; rNameDE[114] = ""; rNameEN[114] = ""; --Voller Qualitäts-Schaden auf Holzitems auf 1er Feld
	rKey[115] = 96566994; rNameDE[115] = ""; rNameEN[115] = ""; --Voller Qualitäts-Schaden auf Holzitems auf 9er Feld
	rKey[116] = 13983419; rNameDE[116] = ""; rNameEN[116] = ""; --Aufgeteilter Qualitäts-Schaden auf Holzitems auf 9er Feld
	rKey[117] = 42218944; rNameDE[117] = ""; rNameEN[117] = ""; --Voller Qualitäts-Schaden auf Holzitems auf 21er Feld
	rKey[118] = 69657293; rNameDE[118] = ""; rNameEN[118] = ""; --Aufgeteilter Qualitäts-Schaden auf Holzitems auf 21er Feld

	-- Rote Flasche / Primärattribute
	rKey[179] = 65555555; rNameDE[179] = "Quelle der Kraft";    rNameEN[179] = "Spring Of Power"; --"strength"
	rKey[180] = 56555555; rNameDE[180] = "Quelle des Willens"; 	rNameEN[180] = "Spring Of Will"; --"willpower"
	rKey[181] = 55655555; rNameDE[181] = "Quelle der Sinne"; 	rNameEN[181] = "Spring Of Senses"; --"perception"
	rKey[182] = 55565555; rNameDE[182] = "Quelle des Wissens"; 	rNameEN[182] = "Spring Of Wit"; --"intelligence"
	rKey[183] = 55556555; rNameDE[183] = "Quelle des Fleisches";rNameEN[183] = "Spring Of Endurance"; --"constitution"
	rKey[184] = 55555655; rNameDE[184] = "Quelle des Windes"; 	rNameEN[184] = "Spring Of The Wind"; --"agility"
	rKey[185] = 55555565; rNameDE[185] = "Quelle des Diebes";	rNameEN[185] = "Spring Of Thieves"; --"dexterity"
	rKey[186] = 55555556; rNameDE[186] = "Quelle des Geistes"; 	rNameEN[186] = "Spring Of Soul"; --"essence"
	rKey[251] = 75555555; rNameDE[251] = "Orden der Kraft";     rNameEN[251] = "Order Of Power"; --"strength"
	rKey[252] = 57555555; rNameDE[252] = "Orden des Willens"; 	rNameEN[252] = "Order Of Will"; --"willpower"
	rKey[253] = 55755555; rNameDE[253] = "Orden der Sinne"; 	rNameEN[253] = "Order Of Senses"; --"perception"
	rKey[254] = 55575555; rNameDE[254] = "Orden des Wissens"; 	rNameEN[254] = "Order Of Wit"; --"intelligence"
	rKey[255] = 55557555; rNameDE[255] = "Orden des Fleisches"; rNameEN[255] = "Order Of Endurance"; --"constitution"
	rKey[256] = 55555755; rNameDE[256] = "Orden des Windes";	rNameEN[256] = "Order Of The Wind"; --"agility"
	rKey[119] = 55555575; rNameDE[119] = "Orden des Diebes"; 	rNameEN[119] = "Order Of Thieves"; --"dexterity"
	rKey[120] = 55555557; rNameDE[120] = "Orden des Geistes";	rNameEN[120] = "Order Of Soul"; --"essence"
	rKey[121] = 85555555; rNameDE[121] = "Tempel der Kraft";    rNameEN[121] = "Temple Of Power"; --"strength"
	rKey[122] = 58555555; rNameDE[122] = "Tempel des Willens"; 	rNameEN[122] = "Temple Of Will"; --"willpower"
	rKey[123] = 55855555; rNameDE[123] = "Tempel der Sinne"; 	rNameEN[123] = "Temple Of Senses"; --"perception"
	rKey[124] = 55585555; rNameDE[124] = "Tempel des Wissens";	rNameEN[124] = "Temple Of Wit"; --"intelligence"
	rKey[125] = 55558555; rNameDE[125] = "Tempel des Fleisches";rNameEN[125] = "Temple Of Endurance"; --"constitution"
	rKey[126] = 55555855; rNameDE[126] = "Tempel des Windes";	rNameEN[126] = "Temple Of The Wind"; --"agility"
	rKey[127] = 55555585; rNameDE[127] = "Tempel des Diebes";	rNameEN[127] = "Temple Of Thieves"; --"dexterity"
	rKey[128] = 55555558; rNameDE[128] = "Tempel des Geistes"; 	rNameEN[128] = "Temple Of Soul"; --"essence"
	rKey[131] = 95555555; rNameDE[131] = "Siegel der Kraft";    rNameEN[131] = "Sanctuary Of Power"; --"strength"
	rKey[132] = 59555555; rNameDE[132] = "Siegel des Willens";  rNameEN[132] = "Sanctuary Of Will"; --"willpower"
	rKey[133] = 55955555; rNameDE[133] = "Siegel der Sinne"; 	rNameEN[133] = "Sanctuary Of Senses"; --"perception"
	rKey[134] = 55595555; rNameDE[134] = "Siegel des Wissens";  rNameEN[134] = "Sanctuary Of Wit"; --"intelligence"
	rKey[135] = 55559555; rNameDE[135] = "Siegel des Fleisches";rNameEN[135] = "Sanctuary Of Endurance"; --"constitution"
	rKey[136] = 55555955; rNameDE[136] = "Siegel des Windes";	  rNameEN[136] = "Sanctuary Of The Wind"; --"agility"
	rKey[137] = 55555595; rNameDE[137] = "Siegel des Diebes";   rNameEN[137] = "Sanctuary Of Thieves"; --"dexterity"
	rKey[138] = 55555559; rNameDE[138] = "Siegel des Geistes";  rNameEN[138] = "Sanctuary Of Soul"; --"essence"

	rKey[141] = 45555555; rNameDE[141] = "Kerker der Kraft";    rNameEN[141] = "Dungeon Of Power";     --"strength"
	rKey[142] = 54555555; rNameDE[142] = "Kerker des Willens";  rNameEN[142] = "Dungeon Of Will";      --"willpower"
	rKey[143] = 55455555; rNameDE[143] = "Kerker der Sinne";    rNameEN[143] = "Dungeon Of Senses";    --"perception"
	rKey[144] = 55545555; rNameDE[144] = "Kerker des Wissens";  rNameEN[144] = "Dungeon Of Wit";       --"intelligence"
	rKey[145] = 55554555; rNameDE[145] = "Kerker des Fleisches";rNameEN[145] = "Dungeon Of Endurance"; --"constitution"
	rKey[146] = 55555455; rNameDE[146] = "Kerker des Windes";   rNameEN[146] = "Dungeon Of The Wind";  --"agility"
	rKey[147] = 55555545; rNameDE[147] = "Kerker des Diebes";   rNameEN[147] = "Dungeon Of Thieves"; --"dexterity"
	rKey[148] = 55555554; rNameDE[148] = "Kerker des Geistes";  rNameEN[148] = "Dungeon Of Soul";    --"essence"
	rKey[151] = 35555555; rNameDE[151] = "Höhle der Kraft";     rNameEN[151] = "Cave Of Power";      --"strength"
	rKey[152] = 53555555; rNameDE[152] = "Höhle des Willens";   rNameEN[152] = "Cave Of Will";       --"willpower"
	rKey[153] = 55355555; rNameDE[153] = "Höhle der Sinne";     rNameEN[153] = "Cave Of Senses";     --"perception"
	rKey[154] = 55535555; rNameDE[154] = "Höhle des Wissens";   rNameEN[154] = "Cave Of Wit";        --"intelligence"
	rKey[155] = 55553555; rNameDE[155] = "Höhle des Fleisches"; rNameEN[155] = "Cave Of Endurance";  --"constitution"
	rKey[156] = 55555355; rNameDE[156] = "Höhle des Windes";    rNameEN[156] = "Cave Of The Wind";   --"agility"
	rKey[157] = 55555535; rNameDE[157] = "Höhle des Diebes";    rNameEN[157] = "Cave Of Thieves";    --"dexterity"
	rKey[158] = 55555553; rNameDE[158] = "Höhle des Geistes";   rNameEN[158] = "Cave Of Soul";       --"essence"
	rKey[161] = 25555555; rNameDE[161] = "Hï¿½lle der Kraft";     rNameEN[161] = "Hell Of Power";      --"strength"
	rKey[162] = 52555555; rNameDE[162] = "Hï¿½lle des Willens";   rNameEN[162] = "Hell Of Will";       --"willpower"
	rKey[163] = 55255555; rNameDE[163] = "Hï¿½lle der Sinne";     rNameEN[163] = "Hell Of Senses";     --"perception"
	rKey[164] = 55525555; rNameDE[164] = "Hï¿½lle des Wissens";   rNameEN[164] = "Hell Of Wit";        --"intelligence"
	rKey[165] = 55552555; rNameDE[165] = "Hï¿½lle des Fleisches"; rNameEN[165] = "Hell Of Endurance";  --"constitution"
	rKey[166] = 55555255; rNameDE[166] = "Hï¿½lle des Windes";    rNameEN[166] = "Hell Of The Wind";   --"agility"
	rKey[167] = 55555525; rNameDE[167] = "Hï¿½lle des Diebes";    rNameEN[167] = "Hell Of Thieves";    --"dexterity"
	rKey[168] = 55555552; rNameDE[168] = "Hï¿½lle des Geistes";   rNameEN[168] = "Hell Of Soul";       --"essence"
	rKey[171] = 15555555; rNameDE[171] = "Ende der Kraft";      rNameEN[171] = "Abyss Of Power";     --"strength"
	rKey[172] = 51555555; rNameDE[172] = "Ende des Willens";    rNameEN[172] = "Abyss Of Will";      --"willpower"
	rKey[173] = 55155555; rNameDE[173] = "Ende der Sinne";      rNameEN[173] = "Abyss Of Senses";    --"perception"
	rKey[174] = 55515555; rNameDE[174] = "Ende des Wissens";    rNameEN[174] = "Abyss Of Wit";       --"intelligence"
	rKey[175] = 55551555; rNameDE[175] = "Ende des Fleisches";  rNameEN[175] = "Abyss Of Endurance"; --"constitution"
	rKey[176] = 55555155; rNameDE[176] = "Ende des Windes";     rNameEN[176] = "Abyss Of The Wind";  --"agility"
	rKey[177] = 55555515; rNameDE[177] = "Ende des Diebes";     rNameEN[177] = "Abyss Of Thieves";   --"dexterity"
	rKey[178] = 55555551; rNameDE[178] = "Ende des Geistes";    rNameEN[178] = "Abyss Of Soul";      --"essence"

	-- Lila Flasche / Sekundï¿½rattribute
	rKey[201] = 65555555; rNameDE[201] = "Quelle des Lebens";  rNameEN[201] = "Spring Of Life";      --"hitpoints"
	rKey[202] = 56555555; rNameDE[202] = "Quelle des Riesen";  rNameEN[202] = "Spring Of Giants";    --"body_height"
	rKey[203] = 55655555; rNameDE[203] = "Quelle der Quellen"; rNameEN[203] = "Spring Of Sources";   --"foodlevel"
	rKey[204] = 55565555; rNameDE[204] = "Quelle des Glücks";  rNameEN[204] = "Spring Of Luck";      --"luck"
	rKey[205] = 55556555; rNameDE[205] = "Quelle der Qualen";  rNameEN[205] = "Spring Of Pain";      --"poisonvalue"
	rKey[206] = 55555655; rNameDE[206] = "Quelle des Ethos" ;  rNameEN[206] = "Spring Of Ethos";     --"attitude"
	rKey[207] = 55555565; rNameDE[207] = "Quelle des Fleißes"; rNameEN[207] = "Spring Of Diligence"; --"mental capacity"
	rKey[208] = 55555556; rNameDE[208] = "Quelle des Zaubers"; rNameEN[208] = "Spring Of Magic";     --"mana"
	rKey[211] = 75555555; rNameDE[211] = "Orden des Lebens";   rNameEN[211] = "Order Of Life"; --"hitpoints"
	rKey[212] = 57555555; rNameDE[212] = "Orden des Riesen";   rNameEN[212] = "Order Of Giants"; --"body_height"
	rKey[213] = 55755555; rNameDE[213] = "Orden der Quellen";  rNameEN[213] = "Order Of Sources"; --"foodlevel"
	rKey[214] = 55575555; rNameDE[214] = "Orden des Glücks";   rNameEN[214] = "Order Of Luck"; --"luck"
	rKey[215] = 55557555; rNameDE[215] = "Orden der Qualen";   rNameEN[215] = "Order Of Pain"; --"poisonvalue"
	rKey[216] = 55555755; rNameDE[216] = "Orden des Ethos";    rNameEN[216] = "Order Of Ethos"; --"attitude"
	rKey[217] = 55555575; rNameDE[217] = "Orden des Fleißes";  rNameEN[217] = "Order Of Diligence"; --"mental capacity"
	rKey[218] = 55555557; rNameDE[218] = "Orden des Zaubers";  rNameEN[218] = "Order Of Magic"; --"mana"
	rKey[221] = 85555555; rNameDE[221] = "Tempel des Lebens";  rNameEN[221] = "Temple Of Life"; --"hitpoints"
	rKey[222] = 58555555; rNameDE[222] = "Tempel der Riesen";  rNameEN[222] = "Temple Of Giants"; --"body_height"
	rKey[223] = 55855555; rNameDE[223] = "Tempel der Quellen"; rNameEN[223] = "Temple Of Sources"; --"foodlevel"
	rKey[224] = 55585555; rNameDE[224] = "Tempel des Glücks";  rNameEN[224] = "Temple Of Luck"; --"luck"
	rKey[225] = 55558555; rNameDE[225] = "Tempel der Qualen";  rNameEN[225] = "Temple Of Pain"; --"poisonvalue"
	rKey[226] = 55555855; rNameDE[226] = "Tempel des Ethos";   rNameEN[226] = "Temple Of Ethos"; --"attitude"
	rKey[227] = 55555585; rNameDE[227] = "Tempel des Fleißes"; rNameEN[227] = "Temple Of Diligence"; --"mental capacity"
	rKey[228] = 55555558; rNameDE[228] = "Tempel des Zaubers"; rNameEN[228] = "Temple Of Magic"; --"mana"
	rKey[231] = 95555555; rNameDE[231] = "Siegel des Lebens";  rNameEN[231] = "Sanctuary Of Life"; --"hitpoints"
	rKey[232] = 59555555; rNameDE[232] = "Siegel des Riesen";  rNameEN[232] = "Sanctuary Of Giants"; --"body_height"
	rKey[233] = 55955555; rNameDE[233] = "Siegel der Quellen"; rNameEN[233] = "Sanctuary Of Sources"; --"foodlevel"
	rKey[234] = 55595555; rNameDE[234] = "Siegel des Glücks";  rNameEN[234] = "Sanctuary Of Luck"; --"luck"
	rKey[235] = 55559555; rNameDE[235] = "Siegel der Qualen";  rNameEN[235] = "Sanctuary Of Pain"; --"poisonvalue"
	rKey[236] = 55555955; rNameDE[236] = "Siegel des Ethos";   rNameEN[236] = "Sanctuary Of Ethos"; --"attitude"
	rKey[237] = 55555595; rNameDE[237] = "Siegel des Fleißes"; rNameEN[237] = "Sanctuary Of Diligence"; --"mental capacity"
	rKey[238] = 55555559; rNameDE[238] = "Siegel des Zaubers"; rNameEN[238] = "Sanctuary Of Magic"; --"mana"

	rKey[241] = 45555555; rNameDE[241] = "Kerker des Lebens";  rNameEN[241] = "Dungeon Of Life"; --"hitpoints"
	rKey[242] = 54555555; rNameDE[242] = "Kerker des Riesen";  rNameEN[242] = "Dungeon Of Giants"; --"body_height"
	rKey[243] = 55455555; rNameDE[243] = "Kerker der Quellen"; rNameEN[243] = "Dungeon Of Sources"; --"foodlevel"
	rKey[244] = 55545555; rNameDE[244] = "Kerker des Glücks";  rNameEN[244] = "Dungeon Of Luck"; --"luck"
	rKey[245] = 55554555; rNameDE[245] = "Kerker der Qualen" ; rNameEN[245] = "Dungeon Of Pain"; --"poisonvalue"
	rKey[246] = 55555455; rNameDE[246] = "Kerker des Ethos";   rNameEN[246] = "Dungeon Of Ethos"; --"attitude"
	rKey[247] = 55555545; rNameDE[247] = "Kerker des Fleißes"; rNameEN[247] = "Dungeon Of Diligence"; --"mental capacity"
	rKey[248] = 55555554; rNameDE[248] = "Kerker des Zaubers"; rNameEN[248] = "Dungeon Of Magic"; --"mana"
	rKey[249] = 35555555; rNameDE[249] = "Höhle des Lebens";   rNameEN[249] = "Cave Of Life"; --"hitpoints"
	rKey[250] = 53555555; rNameDE[250] = "Höhle des Riesen";   rNameEN[250] = "Cave Of Giants"; --"body_height"
	rKey[239] = 55355555; rNameDE[239] = "Höhle der Quellen";  rNameEN[239] = "Cave Of Sources"; --"foodlevel"
	rKey[240] = 55535555; rNameDE[240] = "Höhle des Glücks";   rNameEN[240] = "Cave Of Luck"; --"luck"
	rKey[229] = 55553555; rNameDE[229] = "Höhle der Qualen";   rNameEN[229] = "Cave Of Pain"; --"poisonvalue"
	rKey[230] = 55555355; rNameDE[230] = "Höhle des Ethos";    rNameEN[230] = "Cave Of Ethos"; --"attitude"
	rKey[219] = 55555535; rNameDE[219] = "Höhle des Fleißes";  rNameEN[219] = "Cave Of Diligence"; --"mental capacity"
	rKey[220] = 55555553; rNameDE[220] = "Höhle des Zaubers";  rNameEN[220] = "Cave Of Magic"; --"mana"
	rKey[209] = 25555555; rNameDE[209] = "Hï¿½lle des Lebens";   rNameEN[209] = "Hell Of Life"; --"hitpoints"
	rKey[210] = 52555555; rNameDE[210] = "Hï¿½lle des Riesen";   rNameEN[210] = "Hell Of Giants"; --"body_height"
	rKey[190] = 55255555; rNameDE[190] = "Hï¿½lle der Quellen";  rNameEN[190] = "Hell Of Sources"; --"foodlevel"
	rKey[191] = 55525555; rNameDE[191] = "Hï¿½lle des Glücks";   rNameEN[191] = "Hell Of Luck"; --"luck"
	rKey[192] = 55552555; rNameDE[192] = "Hï¿½lle der Qualen";   rNameEN[192] = "Hell Of Pain"; --"poisonvalue"
	rKey[193] = 55555255; rNameDE[193] = "Hï¿½lle des Ethos";    rNameEN[193] = "Hell Of Ethos"; --"attitude"
	rKey[194] = 55555525; rNameDE[194] = "Hï¿½lle des Fleißes";  rNameEN[194] = "Hell Of Diligence"; --"mental capacity"
	rKey[195] = 55555552; rNameDE[195] = "Hï¿½lle des Zaubers";  rNameEN[195] = "Hell Of Magic"; --"mana"
	rKey[196] = 15555555; rNameDE[196] = "Ende des Lebens";    rNameEN[196] = "Abyss Of Life"; --"hitpoints"
	rKey[197] = 51555555; rNameDE[197] = "Ende des Riesen";    rNameEN[197] = "Abyss Of Giants"; --"body_height"
	rKey[198] = 55155555; rNameDE[198] = "Ende der Quellen";   rNameEN[198] = "Abyss Of Sources"; --"foodlevel"
	rKey[199] = 55515555; rNameDE[199] = "Ende des Glücks";    rNameEN[199] = "Abyss Of Luck"; --"luck"
	rKey[200] = 55551555; rNameDE[200] = "Ende der Qualen";    rNameEN[200] = "Abyss Of Pain"; --"poisonvalue"
	rKey[189] = 55555155; rNameDE[189] = "Ende des Ethos";     rNameEN[189] = "Abyss Of Ethos"; --"attitude"
	rKey[188] = 55555515; rNameDE[188] = "Ende des Fleißes";   rNameEN[188] = "Abyss Of Diligence"; --"mental capacity"
	rKey[187] = 55555551; rNameDE[187] = "Ende des Zaubers";   rNameEN[187] = "Abyss Of Magic"; --"mana"
	end
end

function skilllost(User)
	-- TODO: WTF is this!?
	if ft == nil then
		ft = 1
		skL = {}
		grL = {}

		skL[1] = "ancient language"; 	grL[1] = 1;
		skL[2] = "common language";		grL[2] = 1;
		skL[3] = "dwarf language";		grL[3] = 1;
		skL[4] = "elf language"; 		grL[4] = 1;
		skL[5] = "fairy language";		grL[5] = 1;
		skL[6] = "gnoll language";		grL[6] = 1;
		skL[7] = "gnome language";		grL[7] = 1;
		skL[8] = "goblin language"; 	grL[8] = 1;
		skL[9] = "halfling language"; 	grL[9] = 1;
		skL[10] = "human language"; 	grL[10] = 1;
		skL[11] = "lizard language";	grL[11] = 1;
		skL[12] = "orc language"; 		grL[12] = 1;
		skL[13] = "tailoring";			grL[13] = 2;
		skL[14] = "cookingAndBaking"; 			grL[14] = 2;
		skL[15] = "blacksmithing";		grL[15] = 2;
		skL[16] = "carpentry";			grL[16] = 2;
		skL[17] = "fishing";			grL[17] = 2;
		skL[18] = "gemcutting";			grL[18] = 2;
		skL[19] = "glass blowing";		grL[19] = 2;
		skL[20] = "goldsmithing";		grL[20] = 2;
		skL[21] = "herb lore";			grL[21] = 2;
		skL[22] = "lumberjacking";		grL[22] = 2;
		skL[23] = "mining";				grL[23] = 2;
		skL[24] = "peasantry";			grL[24] = 2;
		skL[25] = "smithing";			grL[25] = 2;
		skL[26] = "commotio";			grL[26] = 3;
		skL[27] = "desicio";			grL[27] = 3;
		skL[28] = "genese";				grL[28] = 3;
		skL[29] = "pervestigatio";		grL[29] = 3;
		skL[30] = "tranfreto";			grL[30] = 3;
		skL[31] = "transformo";			grL[31] = 3;
		skL[32] = "transfreto";			grL[32] = 3;
		skL[33] = "library research";	grL[33] = 4;
		skL[34] = "magic resistance";	grL[34] = 4;
		skL[35] = "attitude";			grL[35] = 4;
		skL[36] = "faith";				grL[36] = 4;
		skL[37] = "wrestling";			grL[37] = 5;
		skL[38] = "concussion weapons"; grL[38] = 5;
		skL[39] = "distance fighting";	grL[39] = 5;
		skL[40] = "distance weapons";	grL[40] = 5;
		skL[41] = "dodge";				grL[41] = 5;
		skL[42] = "parry";				grL[42] = 5;
		skL[43] = "poisoning";			grL[43] = 5;
		skL[44] = "poisonstrength";		grL[44] = 5;
		skL[45] = "puncture weapons";	grL[45] = 5;
		skL[46] = "slashing weapons";	grL[46] = 5;
		skL[47] = "tactics";			grL[47] = 5;
		skL[48] = "veneficium";			grL[48] = 6;
		skL[49] = "alchemy";			grL[49] = 6;
		skL[50] = "exsecratio";			grL[50] = 6;
		skL[51] = "pharmacia";			grL[51] = 6;
		skL[52] = "salutaris";			grL[52] = 6;


	end
	num = math.random(table.getn(skL))
	if User:getSkill( skL[num] ) > 0 then
		User:increaseSkill(grL[num],skL[num],-3)
	end
end

function MetamorphosisDE(User,Difficult,CharLangSkillName)
	local txt = rNameDE[i].."\n\n"..wirkung_de[dataZList[1]].." "..wirkstoff[1].."\n"..wirkung_de[dataZList[2]].." "..wirkstoff[2].."\n"..wirkung_de[dataZList[3]].." "..wirkstoff[3].."\n"..wirkung_de[dataZList[4]].." "..wirkstoff[4].."\n"..wirkung_de[dataZList[5]].." "..wirkstoff[5].."\n"..wirkung_de[dataZList[6]].." "..wirkstoff[6].."\n"..wirkung_de[dataZList[7]].." "..wirkstoff[7].."\n"..wirkung_de[dataZList[8]].." "..wirkstoff[8]
	local modText = ModifyText(User,txt,Difficult,CharLangSkillName)
	return modText
end

function MetamorphosisEN(User,Difficult,CharLangSkillName)
	local txt = rNameEN[i].."\n\n"..wirkung_en[dataZList[1]].." "..wirkstoff[1].."\n"..wirkung_en[dataZList[2]].." "..wirkstoff[2].."\n"..wirkung_en[dataZList[3]].." "..wirkstoff[3].."\n"..wirkung_en[dataZList[4]].." "..wirkstoff[4].."\n"..wirkung_en[dataZList[5]].." "..wirkstoff[5].."\n"..wirkung_en[dataZList[6]].." "..wirkstoff[6].."\n"..wirkung_en[dataZList[7]].." "..wirkstoff[7].."\n"..wirkung_en[dataZList[8]].." "..wirkstoff[8]
	local modText = ModifyText(User,txt,Difficult,CharLangSkillName)
	return modText
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
--User:inform("debug 3104-1")
--Man könnte jetzt hergehen und den Standort des Schreines noch als Bedingung festschreiben. Damit gï¿½be es dann nur einen einzigen Schrein auf der Insel, oder eben mehrere, falls gewï¿½nscht.
	if SourceItem.pos.x == 821 and SourceItem.pos.y == 96 and SourceItem.pos.z == 0 then

	-- Eine Auswahl von Pergamenten anzeigen (nur Deko)
	
	menuList ={131,127,128,129,3110,3111,3112,3113,3114,3115}

		if Param==0 then
			MyMen=MenuStruct()
			for key,value in pairs(menuList) do
				MyMen:addItem(value);
			end
			User:sendMenu(MyMen);
		else
			--User:inform("PARAM = "..Param) -- Param gibt die ID des angewï¿½hlten Items an
			if Param > 126 and Param <132 then
				--Ein Alchemie-Lehrbuch wurde ausgewï¿½hlt
				world:createItemFromId(Param,1,SourceItem.pos,true,333,0)
			end

			--zufï¿½llige Beschreibung der vorhandenen Rezepte

			if Param > 3109 and Param < 3116 then

				if User:getMagicType() == 3 then --and User:getSkill("library research") > math.random(130) then

					init()
					skilllost(User)	--jede Benutzung kostet skills

					if Param == 3110 then
						--Primï¿½r- und Sekundï¿½rattribute
	    				i = math.random(119,256) --Zufallsauswahl des Rezeptes
	    				langSkill=10
	    				langType ="common language"
					elseif Param == 3111 then
						--Pasten
	    				i = math.random(64,71)	--Zufallsauswahl des Rezeptes
	    				langSkill=10
	    				langType ="common language"
					elseif Param == 3112 then
						--Wurfgeschosse
	    				i = math.random(72,118)	--Zufallsauswahl des Rezeptes
	    				langSkill=10
	    				langType ="common language"
					elseif Param == 3113 then
						--Viren und Medizin
	    				i = math.random(48,63)	--Zufallsauswahl des Rezeptes
	    				langSkill=10
	    				langType ="common language"
					elseif Param == 3114 then
						--Sprachen
	    				i = math.random(1,10)	--Zufallsauswahl des Rezeptes
	    				langSkill=10
	    				langType ="common language"
					elseif Param == 3115 then
						--Verwandlungen
	    				i = math.random(11,47)	--Zufallsauswahl des Rezeptes
	    				langSkill=10
	    				langType ="common language"
					end

					dataZList = SplitBottleData(User,rKey[i])

					if User:getPlayerLanguage() == 0 then
						local metaDE=MetamorphosisDE(User,langSkill,langType)
						--User:inform("#b|0|1008|"..rNameDE[i].."\n\n"..wirkung_de[dataZList[1]].." "..wirkstoff[1].."\n"..wirkung_de[dataZList[2]].." "..wirkstoff[2].."\n"..wirkung_de[dataZList[3]].." "..wirkstoff[3].."\n"..wirkung_de[dataZList[4]].." "..wirkstoff[4].."\n"..wirkung_de[dataZList[5]].." "..wirkstoff[5].."\n"..wirkung_de[dataZList[6]].." "..wirkstoff[6].."\n"..wirkung_de[dataZList[7]].." "..wirkstoff[7].."\n"..wirkung_de[dataZList[8]].." "..wirkstoff[8]);
						User:inform("#b|0|1008|"..metaDE)

					else
						local metaEN=MetamorphosisEN(User)
						--User:inform("#b|0|1008|"..rNameEN[i].."\n\n"..wirkung_en[dataZList[1]].." "..wirkstoff[1].."\n"..wirkung_en[dataZList[2]].." "..wirkstoff[2].."\n"..wirkung_en[dataZList[3]].." "..wirkstoff[3].."\n"..wirkung_en[dataZList[4]].." "..wirkstoff[4].."\n"..wirkung_en[dataZList[5]].." "..wirkstoff[5].."\n"..wirkung_en[dataZList[6]].." "..wirkstoff[6].."\n"..wirkung_en[dataZList[7]].." "..wirkstoff[7].."\n"..wirkung_en[dataZList[8]].." "..wirkstoff[8]);
						User:inform("#b|0|1008|"..metaEN)

					end
					base.common.InformNLS(User,"Vorsicht, der Gebrauch dieser Pergamente ist nicht kostenlos. Du bezahlst dein geheimes Wissen mit dem Verlust anderer Fähigkeiten","Be careful! The usage of these parchments is not for free. You pay for that secret knowledge with the loss of other abilities!")
				else
					if User:getPlayerLanguage() == 0 then
						User:inform("#b|0|1008|Dies Geheimnis bleibe dir verborgen");
					else
						User:inform("#b|0|1008|This Riddle Was Not Made For You!"); --Wasn das fürn Scheiß!? ~Estralis
					end
				end
			end	--rezepte auf pergamentrollen
		end	--Menu check
  	end	--position check
end	--function


function LookAtItem( User, Item )
	--  User:inform("debug 3104-4")
end
