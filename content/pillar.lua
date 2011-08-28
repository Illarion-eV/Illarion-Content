module("content.pillar", package.seeall)
--UNDER CONSTRUCTION by envi--
function InitPillar()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

    
-------------------- Sï¿½ulen/Statuen  ----------------
    --AddPillar({X,Y,Z},german text,english text, type, needed value of perception);
    -- typs:
    -- 1 = dark column
    -- 2 = statue (woman) south
    -- 3 = golden armor (north)
    -- 4 = golden armor (east)
    -- 5 = silver armor (north)
    -- 6 = silver armor (east)
    -- 7 = riderstatue (east)
    -- 8 = riderstatue (north)
    -- 9 = riderstatue (south)
    -- 10 = riderstatue (west)
    -- 11 = dark column with light

	--[[--Abtruse Dwelling
	AddPillar({54,608,0},"","", 1,5);
	AddPillar({54,602,0},"","", 1,5);
	--Adron's Covert
	AddPillar({725,769,0},"","", 2,5);
	AddPillar({727,769,0},"","", 2,5);
	AddPillar({725,772,0},"","", 2,5);
	AddPillar({727,772,0},"","", 2,5);
	--Anthil Brook
	AddPillar({773,763,0},"","", 1,5);
	AddPillar({774,763,0},"","", 5,5);
	AddPillar({775,763,0},"","", 2,5);
	AddPillar({776,763,0},"","", 1,5);
	--Cadomyr
	AddPillar({118,566,0},"","", 9,5);
	AddPillar({88,655,1},"","", 6,5); --outside
	AddPillar({88,659,1},"","", 6,5); --outside
    AddPillar({108,655,1},"","", 5,5); --outside
    AddPillar({117,655,1},"","", 5,5); --outside
    AddPillar({108,637,1},"","", 5,5); --outside
    AddPillar({117,637,1},"","", 5,5); --outside
    AddPillar({165,642,1},"","", 6,5); --outside
    AddPillar({165,638,1},"","", 6,5); --outside
    AddPillar({86,620,1},"","", 6,5); --guardtower
    AddPillar({86,623,1},"","", 6,5); --guardtower
    AddPillar({84,619,1},"","", 6,5); --guardtower
    AddPillar({84,619,0},"","", 9,5); --guardtower
    AddPillar({91,623,0},"","", 3,5); --guardtower
    AddPillar({90,623,0},"","", 3,5); --guardtower
    AddPillar({128,631,0},"","", 6,5); --townwall
    AddPillar({128,634,0},"","", 6,5); --townwall
    AddPillar({132,619,1},"","", 9,5); --
    AddPillar({136,619,1},"","", 9,5); --
    AddPillar({129,619,1},"","", 6,5); --
    AddPillar({129,628,1},"","", 6,5); --
    AddPillar({139,626,1},"","", 4,5); --
    AddPillar({139,629,1},"","", 4,5); --
    AddPillar({139,632,1},"","", 4,5); --
    AddPillar({139,636,1},"","", 5,5); --
    AddPillar({136,636,1},"","", 5,5); --
  	AddPillar({132,566,0},"","", 11,5); --temple
    AddPillar({132,562,0},"","", 11,5); --temple
    AddPillar({136,560,0},"","", 11,5); --temple
    AddPillar({136,568,0},"","", 11,5); --temple
    AddPillar({137,560,0},"","", 9,5); --temple
    AddPillar({138,560,0},"","", 9,5); --temple
    AddPillar({139,560,0},"","", 9,5); --temple
    AddPillar({140,560,0},"","", 9,5); --temple
	AddPillar({137,568,0},"","", 8,5); --temple
	AddPillar({138,568,0},"","", 8,5); --temple
	AddPillar({139,568,0},"","", 8,5); --temple
	AddPillar({140,568,0},"","", 8,5); --temple ]]--
    AddPillar({143,566,0},"","A young and noble warrior wears a shiny armour covered in blood while he carries fearless a wounded soldier at his shoulders.", 4,0); --temple
    AddPillar({143,562,0},"","A young and noble warrior wears a shiny armour and seems to gave the order to attack while he raises his fists.", 4,0); --temple
    --[[AddPillar({144,566,0},"","", 11,5); --temple
    AddPillar({144,562,0},"","", 11,5); --temple
    AddPillar({124,548,0},"","", 11,0); --palace
    AddPillar({120,548,0},"","", 11,0); --palace
    AddPillar({122,547,1},"","", 2,5); --palace
    AddPillar({119,528,0},"","", 5,5); --palace
    AddPillar({124,528,0},"","", 5,5); --palace
    AddPillar({130,529,0},"","", 2,5); --palace
    AddPillar({149,512,-3},"","", 5,5); --tresuray
    AddPillar({153,516,-3},"","", 9,5); --tresuray
    AddPillar({150,516,-3},"","", 9,5); --tresuray
    AddPillar({147,516,-3},"","", 9,5); --tresuray
    AddPillar({145,516,-3},"","", 9,5); --tresuray
    AddPillar({145,520,-3},"","", 7,5); --tresuray
    AddPillar({145,522,-3},"","", 7,5); --tresuray
    AddPillar({149,519,-3},"","", 10,5); --tresuray
    AddPillar({149,521,-3},"","", 10,5); --tresuray
    AddPillar({80,577,1},"","", 2,5); --inn
    AddPillar({89,601,0},"","", 2,5); --building
    AddPillar({106,667,-4},"","", 1,5); --dungeon
    AddPillar({106,670,-4},"","", 1,5); --dungeon
    AddPillar({133,670,-4},"","", 5,5); --dungeon
    AddPillar({135,670,-4},"","", 5,5); --dungeon
    AddPillar({144,668,-4},"","", 6,5); --dungeon
    AddPillar({144,668,-4},"","", 6,5); --dungeon
    AddPillar({145,660,-4},"","", 5,5); --dungeon
    AddPillar({143,660,-4},"","", 5,5); --dungeon
    AddPillar({155,665,-3},"","", 9,5); --dungeon
    AddPillar({159,665,-3},"","", 9,5); --dungeon
    AddPillar({155,670,-3},"","", 8,5); --dungeon
    AddPillar({159,670,-3},"","", 8,5); --dungeon]]--
	--Chapel of the Five
	AddPillar({476,800,0},"Die Statue entspricht einer zeitlosen und ruhigen Frau mit blondem Haar in einem hell-blauen Kleid, die als Tänzerin posiert.","The statue looks like an ageless and quite woman with blond hair and a light blue dress that postures as dancer.", 6,0);
    AddPillar({476,791,0},"Die Statue entspricht einer ungeschmückten Schönheit. Sie wirkt ruhig, geduldig und etwas traurig.","The statue looks like an unadorned beauty. She appears quite, patient and a little sad.", 6,0);
	AddPillar({470,793,0},"Die Statue entspricht einem dunkelhaarigen Ritter mit seiner Rüstung in Flammen stehen. Er wirkt stark, nobel und hübsch.","The statue looks like a dark-haired knight with his armor on fire. He appears strong, noble and handsome.", 4,0);
    AddPillar({470,798,0},"Die Statue entspricht einer jungen, dunkelhäutigen Frau mit schwarzem Haar und einem schwarzen Kleid. Sie wirkt weise und ruhig.","The statue looks like a young, dark-skinned woman with dark hairs and a dark dress, She appears wise and calm.", 4,0);
    --[[--Cherass‘ Citadel
    AddPillar({568,314,0},"","", 1,5);
    AddPillar({568,319,0},"","", 1,5);
    AddPillar({574,314,0},"","", 1,5);
    AddPillar({574,319,0},"","", 1,5);
    AddPillar({587,314,0},"","", 5,5);
    AddPillar({590,314,0},"","", 5,5);
    AddPillar({593,314,0},"","", 5,5);
    AddPillar({596,314,0},"","", 5,5);
    AddPillar({596,316,0},"","", 1,5);
    AddPillar({585,318,0},"","", 1,5);
    AddPillar({568,329,1},"","", 1,5);
    AddPillar({568,333,1},"","", 1,5);
    AddPillar({572,329,1},"","", 1,5);
    AddPillar({572,333,1},"","", 1,5);
    AddPillar({576,330,1},"","", 1,5);
    AddPillar({576,332,1},"","", 1,5);
    AddPillar({579,330,1},"","", 1,5);
    AddPillar({579,332,1},"","", 1,5);
    AddPillar({567,325,2},"","", 1,5);
    AddPillar({567,325,3},"","", 1,5);
    AddPillar({567,336,2},"","", 1,5);
    AddPillar({567,336,3},"","", 1,5);
    AddPillar({580,325,2},"","", 1,5);
    AddPillar({580,325,3},"","", 1,5);
    AddPillar({580,336,2},"","", 1,5);
    AddPillar({580,336,3},"","", 1,5);
    AddPillar({571,328,2},"","", 7,5);
    AddPillar({571,333,2},"","", 8,5);
    AddPillar({576,328,2},"","", 9,5);
    AddPillar({576,333,2},"","",10,5);
    AddPillar({589,338,0},"","", 7,5);
    AddPillar({589,342,0},"","", 8,5);
    AddPillar({593,342,0},"","",10,5);
    AddPillar({631,355,0},"","", 1,0); --outside
    AddPillar({651,347,0},"","", 1,0); --outside
    --Craven cave
	AddPillar({674,388,2},"","", 1, 5);
	AddPillar({674,393,2},"","", 1, 5);
    AddPillar({661,388,2},"","", 1, 5);
    AddPillar({661,393,2},"","", 1, 5);
    AddPillar({656,388,2},"","", 1, 5);
    AddPillar({656,393,2},"","", 1, 5);
	--Creek Settlement
	AddPillar({189,511,0},"","", 1,5);
	AddPillar({195,511,0},"","", 1,5);
	AddPillar({186,495,0},"","", 1,5);
	AddPillar({186,493,0},"","", 1,5);
	--Cursed Place
    AddPillar({388,551,0},"","", 2,5);
    AddPillar({376,553,0},"","", 1,5);
    AddPillar({376,551,0},"","", 1,5);
    --Death Marsh
    AddPillar({748,337,0},"","", 1,5);
    AddPillar({709,378,0},"","", 1,5);
    AddPillar({732,379,0},"","", 2,5);
    --Death's Stench
    AddPillar({804,549,0},"","", 5, 5);
    AddPillar({784,581,0},"","", 2, 5);
    --Death Swath
    AddPillar({507,465,0},"","", 1, 5);
	AddPillar({512,465,0},"","", 1, 5);
	AddPillar({512,468,0},"","", 1, 5);
	--Eastland
	AddPillar({899,595,0},"","", 2, 5);
	AddPillar({886,589,0},"","", 2, 5);
	AddPillar({888,566,0},"","", 2, 5);
	AddPillar({898,580,0},"","", 2, 5);
    --Elven Ruins
	AddPillar({556,447,0},"","", 2, 5);
	AddPillar({547,431,0},"","", 2, 5);
	AddPillar({530,425,0},"","", 2, 5);
	AddPillar({531,425,0},"","", 1, 5);
	AddPillar({532,425,0},"","", 2, 5);
    AddPillar({583,452,0},"","", 1, 5);
    AddPillar({570,420,0},"","", 2, 5);
	--Firelimes
    AddPillar({538,589,0},"","", 1,5);
    AddPillar({538,590,0},"","", 1,5);
    AddPillar({535,589,0},"","", 1,5);
    AddPillar({535,590,0},"","", 1,5);
    AddPillar({532,589,0},"","", 1,5);
    AddPillar({532,590,0},"","", 1,5);
    AddPillar({529,589,0},"","", 1,5);
    AddPillar({529,590,0},"","", 1,5);
    AddPillar({523,589,0},"","", 1,5);
    AddPillar({523,590,0},"","", 1,5);
    AddPillar({520,589,0},"","", 1,5);
    AddPillar({520,590,0},"","", 1,5);
    AddPillar({517,589,0},"","", 1,5);
    AddPillar({517,590,0},"","", 1,5);
    AddPillar({514,589,0},"","", 1,5);
    AddPillar({514,590,0},"","", 1,5);]]--
    --Galmair
	AddPillar({311,229,1},"","The statue looks like a rich dressed gray skinned and haired dwarf is wearing an apron is holding a golden hammer and tasteful looking beer.", 4,0); --Irmoroms Temple
	AddPillar({311,235,1},"","The statue looks like a rich dressed gray skinned and haired dwarf is wearing an apron is holding a golden hammer and tasteful looking beer.", 4,0); --Irmoroms Temple
    --[[AddPillar({340,283,1},"","", 1,5); --Nagrun Temple
    AddPillar({340,281,1},"","", 1,5); --Nagrun Temple
    AddPillar({334,277,0},"","", 1, 5); --Nagrun Temple
	AddPillar({334,280,0},"","", 1, 5); --Nagrun Temple
	AddPillar({396,237,0},"","", 6,5); --Guard House
	AddPillar({376,240,0},"","", 6,5); --Kiln
	AddPillar({375,216,0},"","", 4, 5); --Council Chamber
	AddPillar({375,216,0},"","", 4, 5); --Council Chamber
	AddPillar({373,214,0},"","", 3, 5); --Council Chamber
	AddPillar({371,214,0},"","", 3, 5); --Council Chamber
	AddPillar({369,214,0},"","", 3, 5); --Council Chamber
	AddPillar({360,217,0},"","", 2, 5); --Council Chamber
	AddPillar({355,226,0},"","", 6, 5); --Council Chamber
	AddPillar({363,234,0},"","", 6, 5); --Don's Council Chamber
	AddPillar({334,218,0},"","", 7, 5); --Galmair's Crest
	AddPillar({340,218,0},"","", 10, 5); --Galmair's Crest
    AddPillar({339,228,0},"","", 3, 5); --Galmair's Crest
    AddPillar({335,228,0},"","", 3, 5); --Galmair's Crest
    AddPillar({331,233,0},"","", 8, 5); --Galmair's Crest
    AddPillar({335,215,0},"","", 2, 5); --Galmair's Crest
    AddPillar({339,215,0},"","", 2, 5); --Galmair's Crest
    AddPillar({338,214,0},"","", 5, 5); --Galmair's Crest
    AddPillar({359,213,0},"","", 4, 5); --Don's Room
    AddPillar({359,210,0},"","", 4, 5); --Don's Room
    AddPillar({359,207,0},"","", 4, 5); --Don's Room
    AddPillar({359,204,0},"","", 4, 5); --Don's Room
    AddPillar({359,201,0},"","", 4, 5); --Don's Room
    AddPillar({359,198,0},"","", 4, 5); --Don's Room
    AddPillar({359,195,0},"","", 4, 5); --Don's Room
    AddPillar({359,192,0},"","", 4, 5); --Don's Room
    AddPillar({359,189,0},"","", 4, 5); --Don's Room
    AddPillar({359,186,0},"","", 4, 5); --Don's Room
    AddPillar({358,184,0},"","", 3, 5); --Don's Room
    AddPillar({360,190,-3},"","", 3, 5); --Treasury
    AddPillar({364,190,-3},"","", 3, 5); --Treasury  ]]--
    AddPillar({384,207,-6},"1. Der Don beschützt dich wenn du die Gebühr bezahlst.","1. The Don protects you if you pay the fee.", 1, 5); --Hog Dens
	AddPillar({385,207,-6},"Die Statue entspricht dem Abbild des Don und ziegt auf die beiden dunklen Säulen neben ihr.","The statue is a representation of the Don as a statue which points the two dark columns next to it.", 3, 0); --Hog Dens
    AddPillar({386,207,-6},"1. Der Don beschützt dich wenn du die Gebühr bezahlst.","1. The Don protects you if you pay the fee.", 1, 5); --Hog Dens
    AddPillar({389,208,-6},"2. Zahl die Abgaben und die Zinsen, und kein Leid soll dir widerfahren.","2. Pay the toll and the interest and no harm will be done.", 1, 5); --Hog Dens
	AddPillar({390,208,-6},"Die Statue entspricht dem Abbild des Don und ziegt auf die beiden dunklen Säulen neben ihr.","The statue is a representation of the Don as a statue which points the two dark columns next to it.", 3, 0); --Hog Dens
    AddPillar({391,208,-6},"2. Zahl die Abgaben und die Zinsen, und kein Leid soll dir widerfahren.","2. Pay the toll and the interest and no harm will be done.", 1, 5); --Hog Dens
    AddPillar({394,211,-6},"3. Handle frei, bleibe und gehe wie es dir beliebt.","3. Trade freely, stay and depart as you wish.", 1, 5); --Hog Dens
	AddPillar({394,212,-6},"Die Statue entspricht dem Abbild des Don und ziegt auf die beiden dunklen Säulen neben ihr.","The statue is a representation of the Don as a statue which points the two dark columns next to it.", 4, 0); --Hog Dens
    AddPillar({394,213,-6},"3. Handle frei, bleibe und gehe wie es dir beliebt.","3. Trade freely, stay and depart as you wish.", 1, 5); --Hog Dens
    AddPillar({387,246,-6},"4. Komm zum Don wenn du Hilfe benötigst. Er ist dein Pate.","4. Come to the Don if you need help. He is your godfather.", 1, 5); --Ronagans Altar
	AddPillar({387,247,-6},"Die Statue entspricht dem Abbild des Don und ziegt auf die beiden dunklen Säulen neben ihr.","The statue is a representation of the Don as a statue which points the two dark columns next to it.", 4, 0); --Ronagans Altar
    AddPillar({387,248,-6},"4. Komm zum Don wenn du Hilfe benötigst. Er ist dein Pate.","4. Come to the Don if you need help. He is your godfather.", 1, 5); --Ronagans Altar
    AddPillar({385,246,-6},"5. Eine Abmachung mit dem Don, ist eine mit deinem Schicksal.","5. A deal with the Don is a deal with your fate.", 1, 5); --Ronagans Altar
	AddPillar({386,247,-6},"Die Statue entspricht dem Abbild des Don und ziegt auf die beiden dunklen Säulen neben ihr.","The statue is a representation of the Don as a statue which points the two dark columns next to it.", 4, 0); --Ronagans Altar
    AddPillar({387,248,-6},"5. Eine Abmachung mit dem Don, ist eine mit deinem Schicksal.","5. A deal with the Don is a deal with your fate.", 1, 5); --Ronagans Altar
    AddPillar({387,284,-6},"6. Hast du Schaden angerichtet, so kompensiere ihn großzügig mit der zweifachen Menge des Schadens.","6. If you did harm, compensate generously, twice the damage.", 1, 5); --Ronagans Altar
	AddPillar({387,285,-6},"Die Statue entspricht dem Abbild des Don und ziegt auf die beiden dunklen Säulen neben ihr.","The statue is a representation of the Don as a statue which points the two dark columns next to it.", 4, 0); --Ronagans Altar
    AddPillar({387,286,-6},"6. Hast du Schaden angerichtet, so kompensiere ihn großzügig mit der zweifachen Menge des Schadens.","6. If you did harm, compensate generously, twice the damage.", 1, 5); --Ronagans Altar
    AddPillar({378,292,-6},"Folge diesen sechs einfachen Regeln des Don, und du kannst tun und lassen was immer du möchtest.","Follow the simple rules of the Don and you can do whatever you like.", 1, 5); --Ronagans Altar
	AddPillar({377,292,-6},"Die Statue entspricht dem Abbild des Don und ziegt auf die beiden dunklen Säulen neben ihr.","The statue is a representation of the Don as a statue which points the two dark columns next to it.", 3, 0); --Ronagans Altar
    AddPillar({376,292,-6},"Folge diesen sechs einfachen Regeln des Don, und du kannst tun und lassen was immer du möchtest.","Follow the simple rules of the Don and you can do whatever you like.", 1, 5); --Ronagans Altar
    --[[AddPillar({384,337,-6},"","", 4, 5); --The Winged Sow Tavern
    AddPillar({384,339,-6},"","", 4, 5); --The Winged Sow Tavern
    AddPillar({384,341,-6},"","", 3, 5); --The Winged Sow Tavern
    AddPillar({386,341,-6},"","", 3, 5); --The Winged Sow Tavern
    AddPillar({337,241,-6},"","", 4, 5); --Scoria Mine
    AddPillar({338,242,-6},"","", 3, 5); --Scoria Mine
    AddPillar({337,247,-6},"","", 4, 5); --Scoria Mine
    AddPillar({338,248,-6},"","", 3, 5); --Scoria Mine
    AddPillar({331,247,-6},"","", 4, 5); --Scoria Mine
    AddPillar({332,248,-6},"","", 3, 5); --Scoria Mine
    AddPillar({331,241,-6},"","", 4, 5); --Scoria Mine
    AddPillar({332,242,-6},"","", 3, 5); --Scoria Mine ]]--
    AddPillar({255,292,-5},"","At the top of the column a huge black raven peers into distance. The raven holds an earring in his beak and the shade of flames appears in the eyes.", 1, 0); --Flicker Swale
    AddPillar({255,294,-5},"","At the top of the column a huge black raven peers into distance. The raven holds an earring in his beak and the shade of flames appears in the eyes.", 1, 0); --Flicker Swale
    --[[AddPillar({255,292,-6},"","", 4, 5); --Flicker Swale
    AddPillar({255,294,-6},"","", 4, 5); --Flicker Swale
    AddPillar({248,298,-5},"","", 3, 5); --Flicker Swale
    AddPillar({251,298,-5},"","", 3, 5); --Flicker Swale
    AddPillar({336,293,-6},"","", 1, 5); --Sewers
    AddPillar({331,293,-6},"","", 1, 5); --Sewers
    AddPillar({293,334,-6},"","", 1, 5); --Sewers
    AddPillar({296,334,-6},"","", 1, 5); --Sewers
	--Galmair Hinterland
    AddPillar({418,289,0},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({420,291,0},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({423,296,1},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({423,298,1},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({417,289,1},"","", 3,5); --Sleepy Bujhaar Inn
    AddPillar({415,298,1},"","", 3,5); --Sleepy Bujhaar Inn
    AddPillar({483,248,0},"","", 6,5); --Copperbridge
    AddPillar({483,251,0},"","", 6,5); --Copperbridge
	--Galmair Plateau
	AddPillar({357,365,1},"","", 4,5);
	--Grugmutz's cave
    AddPillar({169,558,0},"","", 1,5);
    AddPillar({169,561,0},"","", 1,5);
    --Harp of Pain
    AddPillar({132,795,0},"","", 3,5);
	--Harrowd Mount
	AddPillar({541,681,2},"","", 1,5);
	AddPillar({541,681,2},"","", 1,5);
	AddPillar({547,685,2},"","", 7,5);
    AddPillar({548,685,2},"","", 10,5);
    AddPillar({547,687,2},"","", 10,5);
    AddPillar({548,687,2},"","", 7,5);
    AddPillar({547,689,2},"","", 7,5);
    AddPillar({548,689,2},"","", 10,5);
    AddPillar({524,692,2},"","", 1,5);
	AddPillar({524,696,2},"","", 1,5);]]--
	--Igruk's Cave
	AddPillar({656,388,2},"Auf der Säule steht mit Blut geschrieben 'Macht'.","The word 'power' is written with blood at the column.", 1,5);
    AddPillar({661,388,2},"Auf der Säule steht mit Blut geschrieben 'Furcht'.","The word 'fear' is written with blood at the column.", 1,5);
    AddPillar({661,393,2},"Auf der Säule steht mit Blut geschrieben 'Stärke'.","The word 'strength' is written with blood at the column.", 1,5);
    AddPillar({656,393,2},"Auf der Säule steht mit Blut geschrieben 'Blut'.","The word 'blood' is written with blood at the column.", 1,5);
	--Kata Island
	--[[AddPillar({169,834,0},"","", 2,5);
    --Lighthouse
    AddPillar({535,605,0},"","", 2,5);
    AddPillar({537,636,0},"","", 2,5);
	--Lost Building (1)
    AddPillar({256,726,0},"","", 2,5);
    --Lost Building (2)
	AddPillar({272,602,0},"","", 1,5);
    AddPillar({272,603,0},"","", 1,5);
    --Lost Building (3)
	AddPillar({284,476,0},"","", 2,5);
	AddPillar({285,477,0},"","", 2,5);
    --Lost Harbour
	AddPillar({106,831,0},"","", 2,5);
	AddPillar({104,831,0},"","", 2,5);
	--Merryglade
	AddPillar({848,704,0},"","", 2,5);
	AddPillar({841,741,0},"","", 6,5);]]--
	--Moshran's Brood
	AddPillar({401,733,0},"Was ist klein und stinkt? - Ein Zwerg. Was ist groß und stinkt? - Ein Elf. Was ist dumm und stinkt? - Ein Mensch.","What is small and smells? - A Dwarf. What is tall and smells? - An Elf. What is dumb and smells? - A Human.", 1,5);
    AddPillar({389,727,0},"Wer das liest stirbt gleich!","Read this line and die!", 1,5);
	--Mount Zotmore
	AddPillar({361,495,0},"Auf der Säule steht mit großen Buchstaben geschrieben:'Mount Zotmore'.","It is written with big letters at the column:'Mount Zotmore'.", 1,0);
	AddPillar({357,495,0},"Auf der Säule steht mit großen Buchstaben geschrieben:'Mount Zotmore'.","It is written with big letters at the column:'Mount Zotmore'.", 1,0);
	AddPillar({366,497,0},"Auf der Säule steht mit großen Buchstaben geschrieben:'Mount Zotmore'.","It is written with big letters at the column:'Mount Zotmore'.", 1,0);
	AddPillar({366,501,0},"Auf der Säule steht mit großen Buchstaben geschrieben:'Mount Zotmore'.","It is written with big letters at the column:'Mount Zotmore'.", 1,0);
	--[[--Nagrun's Plain
	AddPillar({522,240,0},"","", 2,5);
	AddPillar({534,259,0},"","", 6,5);
	AddPillar({554,262,0},"","", 1,5);
	AddPillar({556,262,0},"","", 1,5);
	AddPillar({557,219,0},"","", 2,5);
	AddPillar({557,226,0},"","", 2,5);
	AddPillar({604,259,0},"","", 1,5);
	AddPillar({604,262,0},"","", 1,5);
	AddPillar({636,270,0},"","", 1,5);
	AddPillar({636,271,0},"","", 2,5);
	AddPillar({636,274,0},"","", 2,5);
	AddPillar({636,275,0},"","", 1,5);
	AddPillar({483,248,0},"","", 6,5);
	AddPillar({483,251,0},"","", 6,5);
    --Oldra's Corner
	AddPillar({645,679,0},"","", 2,5);
	AddPillar({645,683,0},"","", 2,5);]]--
	--Pauldron Isle
	AddPillar({892,387,0},"Auf der Säule steht mit Blut geschrieben 'Cherga bringt Balance'.","The words 'Cherga brings balance' are written with blood at the column.", 1,5); --Temple of Cherga
	AddPillar({892,389,0},"Auf der Säule steht mit Blut geschrieben 'Cherga bringt Gerechtigkeit'.","The words 'Cherga brings justice' are written with blood at the column.", 1,5); --Temple of Cherga
	--Pyramide of Chaos
    --[[AddPillar({227,581,0},"","", 1,5);
    AddPillar({237,590,0},"","", 1,5);
    AddPillar({233,590,0},"","", 1,5);
    AddPillar({237,593,0},"","", 1,5);
    AddPillar({233,593,0},"","", 1,5);
    AddPillar({237,599,0},"","", 1,5);
    AddPillar({233,599,0},"","", 1,5);
    AddPillar({237,602,0},"","", 1,5);
    AddPillar({233,602,0},"","", 1,5);
    AddPillar({237,605,0},"","", 1,5);
    AddPillar({233,605,0},"","", 1,5);
    AddPillar({230,598,0},"","", 1,5);
    AddPillar({230,594,0},"","", 1,5);
    AddPillar({227,598,0},"","", 1,5);
    AddPillar({227,594,0},"","", 1,5);
	--Queens Corner
	AddPillar({301,502,0},"","", 2,5);
	--Runewick
	AddPillar({910,793,1},"","", 1,5); --entrance
	AddPillar({913,796,1},"","", 1,5); --entrance
	AddPillar({958,788,0},"","", 1,5); --garden
	AddPillar({759,789,0},"","", 1,5); --garden
	AddPillar({759,791,0},"","", 1,5); --garden
	AddPillar({758,792,0},"","", 1,5); --garden
	--Runewick Harbour/Farm
	AddPillar({748,795,0},"","", 2,5); --Taverne "Quadruped Red Bird"
	AddPillar({755,800,0},"","", 2,5); --Taverne "Quadruped Red Bird"
	AddPillar({744,796,2},"","", 9,5); --Lighttower
	AddPillar({744,798,2},"","",10,5); --Lighttower
	AddPillar({742,796,2},"","", 7,5); --Lighttower
	AddPillar({742,798,2},"","", 8,5); --Lighttower
	--Runewick Hinterland
	AddPillar({920,929,0},"","", 2,5); --Twin Eyes Islands
	AddPillar({860,931,0},"","", 1,5); --Twin Eyes Islands
	AddPillar({833,864,0},"","", 2,5); --Mermaid
	AddPillar({839,845,0},"","", 1,5); --Oldra's Column
	AddPillar({866,847,0},"","", 2,5); --Woodcutter's Hut
	AddPillar({866,848,0},"","", 2,5); --Woodcutter's Hut
	AddPillar({864,813,0},"","", 1,5); --Entrance
	AddPillar({864,821,0},"","", 1,5); --Entrance
    --Runewick - Tower of Air
	AddPillar({898,832,4},"","", 2, 5);
	AddPillar({901,824,4},"","", 2, 5);
	AddPillar({910,827,4},"","", 2, 5);
    AddPillar({909,826,3},"","", 2, 5); ]]--
    AddPillar({905,824,2},"","A tall and ageless woman rises one of her fingers as she has to mention her advice. In her other hand she holds some books and scrolls.", 2, 0); --elara shrine
    --[[AddPillar({910,828,2},"","", 1, 5); --elara shrine
    AddPillar({910,830,2},"","", 1, 5); --elara shrine
    AddPillar({910,827,1},"","", 2, 5);
    AddPillar({907,824,1},"","", 2, 5);
    --Runewick - Tower of Earth
    AddPillar({954,828,1},"","", 2, 5);
    AddPillar({951,820,1},"","", 2, 5);
	--Runewick - Tower of Fire
	AddPillar({902,759,1},"","", 2, 5);
    AddPillar({900,757,1},"","", 2, 5);
	AddPillar({911,775,2},"","", 2, 5) --hall of elara
    --Runewick - Tower of Water
    AddPillar({750,763,4},"","", 2, 5);
    AddPillar({954,764,3},"","", 2, 5);
    AddPillar({949,758,2},"","", 2, 5);
    AddPillar({953,758,2},"","", 2, 5);
    AddPillar({945,758,1},"","", 2, 5);
    AddPillar({943,758,1},"","", 2, 5);
	--Snakehead Coast
	AddPillar({598,496,0},"","", 2,5);
	AddPillar({650,486,0},"","", 1, 5);
	AddPillar({650,488,0},"","", 1, 5);
	AddPillar({649,483,0},"","", 9, 5);
	AddPillar({654,487,0},"","",10, 5);
	AddPillar({649,492,0},"","", 8, 5);
	AddPillar({644,487,0},"","", 7, 5);]]--
	--Spider's Mouth
	AddPillar({733,310,0},"","An old and drunken man who wears ragged clothes and seems to beg for some coins while he hides a bottle of wine behind himself.", 2, 0);--Temple of Adron
	AddPillar({733,314,0},"","A brown dressed young and attractive man sings and dances around with some grapes and a bottle of wine in his hands.", 2, 0); --Temple of Adron
	--[[AddPillar({696,316,0},"","", 2, 5); --The Hemp Necktie Inn
	AddPillar({696,320,0},"","", 2, 5); --The Hemp Necktie Inn
	AddPillar({698,315,1},"","", 2, 5); --The Hemp Necktie Inn
	AddPillar({698,319,1},"","", 2, 5); --The Hemp Necktie Inn ]]--
	--Tempel of Malachin
	AddPillar({140,684,1},"","A brown haired and green clothed tall ranger bends a bow to aim his target. His arrow has engraved words like law, justice and good manners.", 5,0);
	AddPillar({144,684,1},"","A brown haired and green clothed tall ranger bends a bow to aim his target. His arrow has engraved words like law, justice and good manners.", 5,0);
	AddPillar({148,675,1},"","A gray haired strong tall knight in shiny armour rises his sword while he covers himself behind a big shield, which has engraved words like law, justice and good manners.", 6,0);
	AddPillar({148,680,1},"","A gray haired strong tall knight in shiny armour rises his sword while he covers himself behind a big shield, which has engraved words like law, justice and good manners.", 6,0);
 	--Tempel of Sirani
    AddPillar({176,759,0},"","A young and very attractive woman dances in her long white dress. His hair shines in the surrounding light.", 2,0);
    AddPillar({176,764,0},"","A young and very attractive woman seems to be very furious while she looks at parchment with the insulting word 'bitch'.", 2,0);
    --Tempel of Tanora
    --[[AddPillar({621,590,0},"","", 1,5);
    AddPillar({621,599,0},"","", 1,5);
    AddPillar({630,596,0},"","", 1,5);
    AddPillar({630,592,0},"","", 1,5);
    --The Blood Circle Arena
    AddPillar({256,665,0},"","", 7,5);
    AddPillar({261,665,0},"","", 9,5);
    AddPillar({261,670,0},"","", 10,5);
    AddPillar({256,670,0},"","", 8,5);
    AddPillar({250,683,1},"","", 5,5);
    AddPillar({266,683,1},"","", 5,5);
	--The Royal Academy of Gladiators
    AddPillar({228,714,0},"","", 1,5);
    AddPillar({228,712,0},"","", 1,5);
    AddPillar({233,711,1},"","", 6,5);
    AddPillar({233,713,1},"","", 6,5);
    AddPillar({210,696,0},"","", 7,5);
    AddPillar({216,696,0},"","", 7,5);
    AddPillar({210,696,0},"","", 7,5);
    AddPillar({216,696,0},"","", 10,5);
    AddPillar({210,684,0},"","", 10,5);
    AddPillar({216,684,0},"","", 10,5);
    --The Swamp
    AddPillar({488,143,0},"","", 2,5);
    AddPillar({491,143,0},"","", 2,5);
	--Three Fingertips
	AddPillar({724,576,0},"","", 2,5);
	AddPillar({724,580,0},"","", 2,5);
    --Vrondus Farm
	AddPillar({310,572,0},"","", 2,5);
	--
	AddPillar({524,397,0},"","", 3,5);]]--

    
    
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
    if (Value==51) then
        return 2805
    elseif (Value==52) then
        return 272
    elseif (Value==53) then
        return 692
    elseif (Value==54) then
        return 693
    elseif (Value==55) then
        return 694
    elseif (Value==56) then
        return 695
    elseif (Value==57) then
        return 440
    elseif (Value==58) then
        return 441
    elseif (Value==59) then
        return 442
    elseif (Value==60) then
        return 443
    elseif (Value==61) then
		return 467
	end
end
