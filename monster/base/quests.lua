--Generic 'Kill X monsters' quests by Estralis Seborian

module("monster.base.quests", package.seeall)

--TEMPLATE TO ADD A QUEST TO function iniQuests()

--local id=NUMBER; --ID of the quest
--germanTitle[id]="GERMAN TITLE"; --Title of the quest in german
--englishTitle[id]="ENGLISH TITLE"; --Title of the quest in english
--NPCName[id]="Miggs"; --This is the name of the NPC who gives out the quest
--statusId[id]=NUMBER; --the queststatus as used by the NPC
--germanRace[id]="stinkige Gullimumien"; --free description of the foes in german
--englishRace[id]="smelly sewer mummies"; --free description of the foes in english
--table.insert(questList[MONSTERID],id); --Insert the quest into the quest list of the monster race that has to be slain. You can add multiple monsters this way.
--minimumQueststatus[id]=NUMBER1; --quest is only active with this queststatus and above. Each monster slain adds +1. Use a value > 0!
--maximumQueststatus[id]=NUMBER2; --quest is finished if this queststatus is reached, no kill are counted anymore. Difference between NUMBER1 and NUMBER2 is the number of monsters that have to be slain
--questLocation[id]=position(X,Y,Z); --a position around which the monsters have to be slain, e.g. centre of a dungeon or forest
--radius[id]=RADIUS; --in this radius around the questlocation, kills are counted valid

--Comment: If you want a NPC to give out multiple quests, you can do it like this:

--Quest 1: To accept quest 1, set queststatus to 1 with the NPC. Use queststatus 1->11 to count 10 monsters. If the quest is finished, set queststatus to 12 with the NPC.
--Quest 2: To accept quest 2, set queststatus to 13 with the NPC. Use queststatus 13->18 to count 5 monsters. If the quest is finished, set queststatus to 19 with the NPC.
--Quest 3: To accept quest 3, set queststatus to 20 with the NPC. Use queststatus 20->21 to count 1 monster. If the quest is finished, set queststatus to 22 with the NPC.

function iniQuests()

    --Initilisation
    
    statusId={};
    germanTitle={};
    englishTitle={};
    NPCName={};
    germanRace={};
    englishRace={};
    questList={};
    minimumQueststatus={};
    maximumQueststatus={};
    questLocation={};
    radius={};

    questList[1]={}; --Human
    questList[2]={}; --Human Warrior
    questList[3]={}; --Human Mage
    questList[4]={}; --Human Necromancer
    questList[5]={}; --Human Thief
    questList[6]={}; --Friendly Human
    questList[11]={}; --Dwarf
    questList[12]={}; --Dwarven Warrior
    questList[13]={}; --Dwarven Priest
    questList[14]={}; --Dwarven Smith
    questList[15]={}; --Dwarven Hunter
    questList[16]={}; --Friendly Dwarf
    questList[21]={}; --Halfling
    questList[22]={}; --Halfling Warrior
    questList[23]={}; --Halfling Thief
    questList[24]={}; --Halfling Peasant
    questList[25]={}; --Halfling Hunter
    questList[26]={}; --Friendly Halfling
    questList[31]={}; --Elf
    questList[32]={}; --Elven Warrior
    questList[33]={}; --Elven Priest
    questList[34]={}; --Elven Mage
    questList[35]={}; --Elven Hunter
    questList[36]={}; --Friendly Elf
    questList[41]={}; --Orc
    questList[42]={}; --Orc Warrior
    questList[43]={}; --Orc Thief
    questList[44]={}; --Orc Hunter
    questList[45]={}; --Orc Shaman
    questList[46]={}; --Friendly Orc
    questList[51]={}; --Lizard
    questList[52]={}; --Lizard Temple Warrior
    questList[53]={}; --Lizard Mage
    questList[54]={}; --Lizard Priest
    questList[55]={}; --Lizard Thief
    questList[56]={}; --Friendly Lizard
    questList[61]={}; --Drow Archer
    questList[62]={}; --Drow Warrior
    questList[63]={}; --Drow Mage
    questList[64]={}; --Drow Priest
    questList[65]={}; --Drow Patriarch
    questList[71]={}; --Female Drow Archer
    questList[72]={}; --Female Drow Warrior
    questList[73]={}; --Female Drow Mage
    questList[74]={}; --Female Drow Priest
    questList[75]={}; --Drow Matriarch
    questList[91]={}; --Forest Troll
    questList[92]={}; --Forest Troll Warrior
    questList[93]={}; --Forest Troll Shaman
    questList[94]={}; --Forest Troll Hunter
    questList[95]={}; --Forest Troll Forester
    questList[96]={}; --Friendly Forest Troll
    questList[101]={}; --Mummy
    questList[102]={}; --Enbalmed Slave
    questList[103]={}; --Enbalmed Servant
    questList[104]={}; --Poisonous Mummy
    questList[106]={}; --Worker Mummy
    questList[107]={}; --Mummy of Madness
    questList[111]={}; --Skeleton
    questList[112]={}; --Scruffy Skeleton
    questList[113]={}; --Armored Skeleton
    questList[114]={}; --Crippled Skeleton
    questList[115]={}; --Mystic Skeleton
    questList[116]={}; --Friendly Skeleton
    questList[121]={}; --Gazer
    questList[122]={}; --Googly
    questList[123]={}; --Eye of Horror
    questList[124]={}; --Deadly Eye
    questList[125]={}; --Terror Eye
    questList[131]={}; --Shadow Eye
    questList[132]={}; --Eye of Darkness
    questList[141]={}; --Ghost Eye
    questList[142]={}; --Unholy Ghost Eye
    questList[143]={}; --Horrible Ghost Eye
    questList[151]={}; --Rotten Mummy
    questList[152]={}; --Smelly Mummy
    questList[171]={}; --Mummiefied Priest
    questList[172]={}; --Mummiefied Temple Servant
    questList[173]={}; --Mummiefied Highpriest
    questList[181]={}; --Sheep
    questList[182]={}; --Lamb
    questList[191]={}; --Rekrap Retep
    questList[192]={}; --Pitservant
    questList[193]={}; --Tarantula
    questList[195]={}; --SpiderQueen
    questList[196]={}; --Small Spider
    questList[201]={}; --Demon Skeleton
    questList[202]={}; --Mystic Demon Skeleton
    questList[203]={}; --Unholy Akolyth
    questList[204]={}; --Unholy Archmage
    questList[205]={}; --Lich
    questList[211]={}; --Firespider
    questList[221]={}; --Gynkese Widow
    questList[231]={}; --Kingsfright
    questList[232]={}; --Shadowmuncher
    questList[241]={}; --Pig
    questList[251]={}; --Boar
    questList[252]={}; --Young Boar
    questList[253]={}; --Hog
    questList[261]={}; --Nightmare Spider
    questList[262]={}; --Soulpain
    questList[271]={}; --Wasp
    questList[272]={}; --Hornet
    questList[273]={}; --Wasp Queen 
    questList[274]={}; --Wasp Drone
    questList[278]={}; --Fire Wasp
    questList[301]={}; --Stone Golem
    questList[302]={}; --Son of the Mountains
    questList[311]={}; --Clay Golem
    questList[321]={}; --Lava Golem
    questList[331]={}; --Silver Golem
    questList[341]={}; --Diamond Golem
    questList[371]={}; --Cow
    questList[381]={}; --Bull
    questList[382]={}; --Young Bull
    questList[391]={}; --Wolf
    questList[392]={}; --Welp
    questList[393]={}; --Young Wolf
    questList[394]={}; --GiantWolf
    questList[395]={}; --Pack Leader
    questList[396]={}; --Peaceful Wolf
    questList[401]={}; --Ghost Wolf
    questList[411]={}; --Lambslaughterer
    questList[421]={}; --Grey Tail
    questList[431]={}; --Redwolf
    questList[491]={}; --Silverback
    questList[492]={}; --Young Silverback
    questList[501]={}; --Black Bear
    questList[502]={}; --Young Black Bear
    questList[511]={}; --Grizzly Bear
    questList[512]={}; --Young Grizzly Bear
    questList[521]={}; --Snapper
    questList[522]={}; --Terrorbeast
    questList[523]={}; --Scalebeast
    questList[524]={}; --Fireraptor
    questList[525]={}; --Rippertooth
    questList[531]={}; --Walking Dead
    questList[532]={}; --Limping Zombie
    questList[533]={}; --Zombie
    questList[534]={}; --Zombiegiant
    questList[541]={}; --Crippled Deamonbeast
    questList[542]={}; --Deamonbeast
    questList[543]={}; --Giant Deamonbeast
    questList[551]={}; --Imp
    questList[552]={}; --Jack of all Imps
    questList[553]={}; --Cursed Imp
    questList[561]={}; --Iron Golem
    questList[562]={}; --Steelgolem
    questList[571]={}; --Nuzzler
    questList[572]={}; --Baiter
    questList[581]={}; --Dog
    questList[582]={}; --Vicious Dog
    questList[583]={}; --Watchdog
    questList[584]={}; --Docile Stray Dog
    questList[591]={}; --Peaceful Beetle
    questList[592]={}; --Hunter Beetle
    questList[593]={}; --Scarab
    questList[594]={}; --Coffin Crawler
    questList[601]={}; --Foxwhelp
    questList[602]={}; --Redfox
    questList[603]={}; --Fox Mother
    questList[604]={}; --Fireridge
    questList[611]={}; --Stinky Slime
    questList[612]={}; --Slimey Slime
    questList[613]={}; --Smouldy Slime
    questList[614]={}; --Cauterizing Slime
    questList[621]={}; --Chicken
    questList[622]={}; --Angry Chicken
    questList[631]={}; --Bone Dragon
    questList[641]={}; --Black Dragonskeleton
    questList[651]={}; --Undead Firedragon
    questList[661]={}; --Nightmare Dragon
    questList[671]={}; --Undead Swampdragon
    questList[681]={}; --Shiny Deathdragon
    questList[691]={}; --Golden Bonedragon
    questList[701]={}; --Chergas Servant
    questList[711]={}; --Palace Guard
    questList[721]={}; --Forgotten Mummy
    questList[731]={}; --Dead King
    questList[741]={}; --Phantomskeleton
    questList[742]={}; --Bone Schemes
    questList[743]={}; --Bone Ghost
    questList[744]={}; --Phantom Archer
    questList[751]={}; --Graveguard
    questList[752]={}; --Mystic Graveguard
    questList[753]={}; --Graveguard Archer
    questList[754]={}; --Ancient Graveguard
    questList[761]={}; --Armored Swamphorror
    questList[762]={}; --Crippled Swamphorror
    questList[763]={}; --Scruffy Swamphorror
    questList[764]={}; --Mystic Swamphorror
    questList[782]={}; --Golden Legionnaire
    questList[783]={}; --Golden Magus
    questList[784]={}; --Golden Archer
    questList[791]={}; --Bridge Troll
    questList[792]={}; --Bridge Troll Shaman
    questList[801]={}; --Mountain Troll
    questList[802]={}; --Mountain Troll Archer
    questList[811]={}; --Firespitter
    questList[812]={}; --Keeper of fire
    questList[821]={}; --Bog Body
    questList[822]={}; --Ragged Bog Body
    questList[831]={}; --Poltergeist
    questList[832]={}; --Horrible Poltergeist
    questList[841]={}; --Coffinguard
    questList[842]={}; --Undead Warlock
    questList[851]={}; --Shadowrunner
    questList[852]={}; --Shadowfright
    questList[853]={}; --Giant Shadowrunner
    questList[861]={}; --Crippled Ghostbeast
    questList[862]={}; --Ghostbeast
    questList[863]={}; --Giant Ghostbeast
    questList[871]={}; --Crippled Swampbeast
    questList[872]={}; --Swampbeast
    questList[873]={}; --Giant Swampbeast
    questList[881]={}; --Bloodhunter
    questList[882]={}; --Monstrosity
    questList[883]={}; --Bloodsniffler
    questList[891]={}; --Fire Imp
    questList[892]={}; --Cures Fire Imp
    questList[893]={}; --Mystic Fire Imp
    questList[901]={}; --Shadow Wimp
    questList[902]={}; --Shadow Imp
    questList[903]={}; --Shadow Dancer
    questList[911]={}; --Merinium Golem
    questList[912]={}; --Gold Golem
    questList[921]={}; --Sewer Rat
    questList[922]={}; --Giant Sewer Rat
    questList[931]={}; --Contaminated Ratchild
    questList[932]={}; --Contaminated Ratman
    questList[941]={}; --Crazy Rat Alchemist
    questList[942]={}; --Ratpriest
    questList[951]={}; --Attack Dog
    questList[961]={}; --Hounrin
    questList[962]={}; --Young Hounrin
    questList[971]={}; --Orchound
    questList[972]={}; --Young Orchound
    questList[981]={}; --Corpseeater
    questList[991]={}; --Copperling
    questList[1001]={}; --Graveraper
    questList[1011]={}; --Bonescraper
    questList[1021]={}; --Grey Fox
    questList[1022]={}; --Young Grey Fox
    questList[1031]={}; --Bloodslime
    questList[1032]={}; --Wandering Pool of Blood
    questList[1033]={}; --Wandering Demonblood
    questList[1041]={}; --Wandering Garbage
    questList[1042]={}; --Wandering Sewage
    questList[1043]={}; --Corpsebile
    questList[1051]={}; --Ectoplasm
    questList[1052]={}; --Malicious Ectoplasm
    questList[1053]={}; --Doomed Ectoplasm
    questList[1061]={}; --Brown Chicken
    questList[1071]={}; --Crazy Chicken
    questList[1081]={}; --Black Chicken
    questList[2000]={}; --Guards

    --Quest 1: Galmair Sewers I (77)
    
    local id=1;
    germanTitle[id]="Die Kanalisation von Galmair I"; 
    englishTitle[id]="Galmair Sewers I";
    NPCName[id]="Miggs"; 
    statusId[id]=77;
    germanRace[id]="Rattenmenschen"; 
    englishRace[id]="ratmen";
    table.insert(questList[921],id); 
    table.insert(questList[922],id); 
    table.insert(questList[931],id); 
    table.insert(questList[932],id); 
    table.insert(questList[941],id); 
	table.insert(questList[942],id);
    minimumQueststatus[id]=1; 
    maximumQueststatus[id]=11; 
    questLocation[id]=position(298,352,-6); 
    radius[id]=50;

    --Quest 2: Galmair Sewers II (77)

    local id=2;
    germanTitle[id]="Die Kanalisation von Galmair II"; 
    englishTitle[id]="Galmair Sewers II";
    NPCName[id]="Miggs"; 
    statusId[id]=77;
    germanRace[id]="stinkige Gullimumien"; 
    englishRace[id]="smelly sewer mummies";
    table.insert(questList[101],id); 
    table.insert(questList[102],id); 
    table.insert(questList[103],id); 
    table.insert(questList[104],id); 
    --table.insert(questList[105],id); 
    table.insert(questList[106],id);    
    table.insert(questList[107],id); 
    minimumQueststatus[id]=13; 
    maximumQueststatus[id]=18; 
    questLocation[id]=position(298,352,-6); 
    radius[id]=50;

    --Quest 3: Galmair Sewers III (77)

    local id=3;
    germanTitle[id]="Die Kanalisation von Galmair III"; 
    englishTitle[id]="Galmair Sewers III";
    NPCName[id]="Miggs"; 
    statusId[id]=77;
    germanRace[id]="Halblingdiebe"; 
    englishRace[id]="halfling thieves";
    table.insert(questList[23],id); 
    minimumQueststatus[id]=20; 
    maximumQueststatus[id]=21; 
    questLocation[id]=position(298,352,-6); 
    radius[id]=50;

    --Quest 4: Sir Reginald's Tomb I (78)

    local id=4;
    germanTitle[id]="Sir Reginalds Gruft I"; 
    englishTitle[id]="Sir Reginald's Tomb I";
    NPCName[id]="Grakamesh"; 
    statusId[id]=78;
    germanRace[id]="Mumien"; 
    englishRace[id]="mummies";
    table.insert(questList[101],id); 
    table.insert(questList[102],id); 
    table.insert(questList[103],id); 
    table.insert(questList[104],id); 
    --table.insert(questList[105],id); 
    table.insert(questList[106],id);    
    table.insert(questList[107],id); 
    minimumQueststatus[id]=1; 
    maximumQueststatus[id]=11;
    questLocation[id]=position(135,655,-4); 
    radius[id]=50; 

    --Quest 5: Sir Reginald's Tomb II (78)

    local id=5;
    germanTitle[id]="Sir Reginalds Gruft II"; 
    englishTitle[id]="Sir Reginald's Tomb II";
    NPCName[id]="Grakamesh"; 
    statusId[id]=78;
    germanRace[id]="Skelette"; 
    englishRace[id]="skeletons";
    table.insert(questList[111],id); 
    table.insert(questList[112],id); 
    table.insert(questList[113],id); 
    table.insert(questList[114],id); 
    table.insert(questList[115],id); 
    minimumQueststatus[id]=13; 
    maximumQueststatus[id]=18;
    questLocation[id]=position(135,655,-4); 
    radius[id]=50; 

    --Quest 6: Sir Reginald's Tomb III (78)

    local id=6;
    germanTitle[id]="Sir Reginalds Gruft III"; 
    englishTitle[id]="Sir Reginald's Tomb III";
    NPCName[id]="Grakamesh"; 
    statusId[id]=78;
    germanRace[id]="Geister"; 
    englishRace[id]="ghosts";
    table.insert(questList[741],id); 
    minimumQueststatus[id]=20; 
    maximumQueststatus[id]=21;
    questLocation[id]=position(135,655,-4); 
    radius[id]=50; 

    --Quest 7: A cave in the Woods I (79)

    local id=7;
    germanTitle[id]="Eine Höhle im Wald I"; 
    englishTitle[id]="A cave in the Woods I";
    NPCName[id]="Myrthe Mildthorn"; 
    statusId[id]=79;
    germanRace[id]="Wölfe"; 
    englishRace[id]="wolves";
    table.insert(questList[391],id); 
    table.insert(questList[392],id); 
    table.insert(questList[393],id); 
    table.insert(questList[394],id); 
    minimumQueststatus[id]=1; 
    maximumQueststatus[id]=11; 
    questLocation[id]=position(774,711,0); 
    radius[id]=40; 

    --Quest 8: A cave in the Woods II (79)

    local id=8;
    germanTitle[id]="Eine Höhle im Wald II"; 
    englishTitle[id]="A cave in the Woods II";
    NPCName[id]="Myrthe Mildthorn"; 
    statusId[id]=79;
    germanRace[id]="Hunde"; 
    englishRace[id]="dogs";
    table.insert(questList[581],id); 
    table.insert(questList[582],id); 
    table.insert(questList[583],id); 
    table.insert(questList[584],id); 
    minimumQueststatus[id]=13; 
    maximumQueststatus[id]=18; 
    questLocation[id]=position(774,711,0); 
    radius[id]=40; 

    --Quest 9: A cave in the Woods III (79)

    local id=9;
    germanTitle[id]="Eine Höhle im Wald III"; 
    englishTitle[id]="A cave in the Woods III";
    NPCName[id]="Myrthe Mildthorn"; 
    statusId[id]=79;
    germanRace[id]="Spinnen"; 
    englishRace[id]="spiders";
    table.insert(questList[196],id); 
    minimumQueststatus[id]=20; 
    maximumQueststatus[id]=21; 
    questLocation[id]=position(774,711,0); 
    radius[id]=40;

    --Quest 10: The Poacher I (4)

    local id=10;
    germanTitle[id]="Der Wilderer I"; 
    englishTitle[id]="The Poacher I";
    NPCName[id]="Eugene Burton"; 
    statusId[id]=4;
    germanRace[id]="Wildschweine"; 
    englishRace[id]="boars";
	table.insert(questList[241],id); --Pig
	table.insert(questList[251],id); --Boar
	table.insert(questList[252],id); --Young Boar
	table.insert(questList[253],id); --Hog
    minimumQueststatus[id]=1; 
    maximumQueststatus[id]=7; 
    questLocation[id]=position(775,475,0); 
    radius[id]=75; 

    --Quest 11: The Poacher II (4)

    local id=11;
    germanTitle[id]="Der Wilderer II"; 
    englishTitle[id]="The Poacher II";
    NPCName[id]="Eugene Burton"; 
    statusId[id]=4;
    germanRace[id]="Rinder"; 
    englishRace[id]="bulls";
    table.insert(questList[371],id); --Cow
	table.insert(questList[381],id); --Bull
	table.insert(questList[382],id); --Young Bull
    minimumQueststatus[id]=9; 
    maximumQueststatus[id]=21; 
    questLocation[id]=position(775,475,0); 
    radius[id]=75; 

    --Quest 12: The Poacher III (4)

    local id=12;
    germanTitle[id]="Der Wilderer III"; 
    englishTitle[id]="The Poacher III";
    NPCName[id]="Eugene Burton"; 
    statusId[id]=4;
    germanRace[id]="Wölfe"; 
    englishRace[id]="wolves";
    table.insert(questList[391],id); 
    table.insert(questList[392],id); 
    table.insert(questList[393],id); 
    table.insert(questList[394],id); 
    minimumQueststatus[id]=23; 
    maximumQueststatus[id]=29; 
    questLocation[id]=position(775,475,0); 
    radius[id]=75; 

    --Quest 13: The Poacher IV (4)

    local id=13;
    germanTitle[id]="Der Wilderer IV"; 
    englishTitle[id]="The Poacher IV";
    NPCName[id]="Eugene Burton"; 
    statusId[id]=4;
    germanRace[id]="elfische Wildhüter"; 
    englishRace[id]="elven rangers";
    table.insert(questList[35],id); 
    minimumQueststatus[id]=30; 
    maximumQueststatus[id]=31; 
    questLocation[id]=position(775,475,0); 
    radius[id]=75; 

    --Quest 14: The Craven Orc II (3)

    local id=14;
    germanTitle[id]="Der feige Ork II"; 
    englishTitle[id]="The Craven Orc II";
    NPCName[id]="Graznok"; 
    statusId[id]=3;
    germanRace[id]="'Lumpenmanns'"; 
    englishRace[id]="'ragmen'";
    table.insert(questList[101],id); 
    table.insert(questList[102],id); 
    table.insert(questList[103],id); 
    table.insert(questList[104],id); 
    --table.insert(questList[105],id); 
    table.insert(questList[106],id);    
    table.insert(questList[107],id); 
    minimumQueststatus[id]=3; 
    maximumQueststatus[id]=8; 
    questLocation[id]=position(665,415,0); 
    radius[id]=35; 

    --Quest 15: The Craven Orc III (3)

    local id=15;
    germanTitle[id]="Der feige Ork III"; 
    englishTitle[id]="The Craven Orc III";
    NPCName[id]="Graznok"; 
    statusId[id]=3;
    germanRace[id]="'Knochenmanns'"; 
    englishRace[id]="'bonemen'";
    table.insert(questList[111],id); 
    table.insert(questList[112],id); 
    table.insert(questList[113],id); 
    table.insert(questList[114],id); 
    table.insert(questList[115],id); 
    minimumQueststatus[id]=10; 
    maximumQueststatus[id]=20; 
    questLocation[id]=position(665,415,0); 
    radius[id]=35; 

    --Quest 16: The Errant Crusade II

    local id=16;
    germanTitle[id]="The Errant Crusade II"; 
    englishTitle[id]="Der fehlgeleitete Kreuzzug II";
    NPCName[id]="Arenius Batavius"; 
    statusId[id]=104;
    englishRace[id]="mummies"; 
    germanRace[id]="Mumien";
    table.insert(questList[101],id); 
    table.insert(questList[102],id); 
    table.insert(questList[103],id); 
    table.insert(questList[104],id); 
    table.insert(questList[106],id);    
    table.insert(questList[107],id);
    minimumQueststatus[id]=3; 
    maximumQueststatus[id]=9; 
    questLocation[id]=position(705,410,-3); 
    radius[id]=75; 

    --Quest 17: The Errant Crusade III

    local id=17;
    germanTitle[id]="The Errant Crusade III"; 
    englishTitle[id]="Der fehlgeleitete Kreuzzug III";
    NPCName[id]="Arenius Batavius"; 
    statusId[id]=104;
    englishRace[id]="skeletons"; 
    germanRace[id]="Skelette";
    table.insert(questList[111],id); 
    table.insert(questList[112],id); 
    table.insert(questList[113],id); 
    table.insert(questList[114],id); 
    table.insert(questList[115],id); 
    minimumQueststatus[id]=11; 
    maximumQueststatus[id]=23; 
    questLocation[id]=position(705,410,-3); 
    radius[id]=75; 

    --Quest 18: The Errant Crusade IV

    local id=18;
    germanTitle[id]="The Errant Crusade IV"; 
    englishTitle[id]="Der fehlgeleitete Kreuzzug IV";
    NPCName[id]="Arenius Batavius"; 
    statusId[id]=104;
    englishRace[id]="blood mages"; 
    germanRace[id]="Blutmagier";
    table.insert(questList[4],id); 
    minimumQueststatus[id]=26; 
    maximumQueststatus[id]=28; 
    questLocation[id]=position(705,410,-3); 
    radius[id]=75; 

    --Quest 19: The Errant Crusade V

    local id=19;
    germanTitle[id]="The Errant Crusade V"; 
    englishTitle[id]="Der fehlgeleitete Kreuzzug V";
    NPCName[id]="Arenius Batavius"; 
    statusId[id]=104;
    englishRace[id]="demon skeleton warrior"; 
    germanRace[id]="Dämonenskelettkrieger";
    table.insert(questList[201],id); 
    minimumQueststatus[id]=30; 
    maximumQueststatus[id]=31; 
    questLocation[id]=position(705,410,-3); 
    radius[id]=75; 

    --Quest 20: The Errant Crusade VI

    local id=20;
    germanTitle[id]="The Errant Crusade VI"; 
    englishTitle[id]="Der fehlgeleitete Kreuzzug VI";
    NPCName[id]="Arenius Batavius"; 
    statusId[id]=104;
    englishRace[id]="undead fire dragons"; 
    germanRace[id]="untote Feuerdrachen";
    table.insert(questList[651],id); 
    minimumQueststatus[id]=33; 
    maximumQueststatus[id]=34; 
    questLocation[id]=position(705,410,-3); 
    radius[id]=75; 
	
	--Quest 21: The Ghost Oak IV

    local id=21;
    germanTitle[id]="The Ghost Oak IV"; 
    englishTitle[id]="Die Geistereiche IV";
    NPCName[id]="Madoquar"; 
    statusId[id]=112;
    germanRace[id]="Geist der Eiche"; 
    englishRace[id]="Oak Ghost";
    table.insert(questList[743],id); 
    minimumQueststatus[id]=9; 
    maximumQueststatus[id]=10; 
    questLocation[id]=position(501,107,0); 
    radius[id]=15;
	
	--Quest 22: Tutorial Groknar

    local id=22;
    germanTitle[id]="Tutorial"; 
    englishTitle[id]="Tutorial";
    NPCName[id]="Groknar"; 
    statusId[id]=311;
    germanRace[id]="Schweine"; 
    englishRace[id]="pig";
    table.insert(questList[241],id); 
    minimumQueststatus[id]=2; 
    maximumQueststatus[id]=5; 
    questLocation[id]=position(41,46,100); 
    radius[id]=50;

end


function checkQuest(User,Monster)

    local MonID = Monster:getMonsterType();
    local qList = questList[MonID]; 
    local queststatus = 0;

    if qList then

        for _,quest in pairs(qList) do

            queststatus = User:getQuestProgress(statusId[quest]);
 
            if (queststatus >= minimumQueststatus[quest]) and (queststatus < maximumQueststatus[quest]) and (User:isInRangeToPosition(questLocation[quest],radius[quest])) and (User:isInRange(Monster,12)) then --valid kill

                User:setQuestProgress(statusId[quest],queststatus+1);
                
                if ((queststatus+1) == (maximumQueststatus[quest])) then --quest finished

                    base.common.InformNLS(User,"[Queststatus] "..germanTitle[quest]..": Du hast "..(queststatus+1-minimumQueststatus[quest]).." von "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..germanRace[quest].." besiegt. Kehre zu "..NPCName[quest].." zurück, um deine Belohnung zu erhalten." ,"[Quest status] "..englishTitle[quest]..": You have slain "..(queststatus+1-minimumQueststatus[quest]).." of "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..englishRace[quest]..". Return to "..NPCName[quest].." to claim your reward."); 

                else --quest not finished

                    base.common.InformNLS(User,"[Queststatus] "..germanTitle[quest]..": Du hast "..(queststatus+1-minimumQueststatus[quest]).." von "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..germanRace[quest].." besiegt." ,"[Quest status] "..englishTitle[quest]..": You have slain "..(queststatus+1-minimumQueststatus[quest]).." of "..(maximumQueststatus[quest]-minimumQueststatus[quest]).." "..englishRace[quest].."."); 

                end
            end
        end
    end
end



