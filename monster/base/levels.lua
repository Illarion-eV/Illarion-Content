--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]


local common = require("base.common")

local M = {}

local level = {}

level[1]=5 --Human/Normal/Chain/Slashing
level[2]=6 --Human Warrior/Fighter/Plate/Blunt
level[3]=5 --Human Mage/Mage/Cloth/Blunt
level[4]=5 --Human Necromancer/Mage/Cloth/Blunt
level[5]=4 --Human Thief/Rogue/Leather/Stabbing
level[6]=0 --Friendly Human/Normal/Cloth/None
level[7]=7 --Dark Paladin/Fighter/Plate/Slashing
level[9]=9 --Cursed Knight/Fighter/Chain/Slashing
level[11]=5 --Dwarf/Normal/Plate/Blunt
level[12]=6 --Dwarven Warrior/Fighter/Plate/Blunt
level[13]=5 --Dwarven Priest/Mage/Leather/Blunt
level[14]=4 --Dwarven Smith/Normal/Plate/Blunt
level[15]=5 --Dwarven Hunter/Rogue/Leather/Distance
level[16]=0 --Friendly Dwarf/Normal/Plate/None
level[21]=3 --Halfling/Normal/Cloth/Distance
level[22]=4 --Halfling Warrior/Fighter/Leather/Stabbing
level[23]=4 --Halfling Thief/Rogue/Leather/Stabbing
level[24]=3 --Halfling Peasant/Normal/Cloth/Stabbing
level[25]=4 --Halfling Hunter/Rogue/Leather/Distance
level[26]=0 --Friendly Halfling/Normal/Cloth/None
level[31]=5 --Elf/Normal/Chain/Slashing
level[32]=6 --Elven Warrior/Fighter/Chain/Slashing
level[33]=5 --Elven Priest/Mage/Leather/Blunt
level[34]=5 --Elven Mage/Mage/Cloth/Blunt
level[35]=5 --Elven Hunter/Rogue/Leather/Distance
level[36]=0 --Friendly Elf/Normal/Leather/None
level[41]=5 --Orc/Normal/Leather/Blunt
level[42]=6 --Orc Warrior/Fighter/Leather/Blunt
level[43]=4 --Orc Thief/Rogue/Leather/Stabbing
level[44]=5 --Orc Hunter/Rogue/Leather/Distance
level[45]=5 --Orc Shaman/Mage/Cloth/Blunt
level[46]=0 --Friendly Orc/Normal/Leather/None
level[51]=5 --Lizard/Normal/Chain/Slashing
level[52]=6 --Lizard Temple Warrior/Fighter/Chain/Slashing
level[53]=5 --Lizard Mage/Mage/Cloth/Blunt
level[54]=5 --Lizard Priest/Mage/Leather/Blunt
level[55]=4 --Lizard Thief/Rogue/Leather/Stabbing
level[56]=0 --Friendly Lizard/Normal/Chain/None
level[61]=6 --Drow Archer/Rogue/Chain/Distance
level[62]=6 --Drow Warrior/Fighter/Chain/Slashing
level[63]=6 --Drow Mage/Mage/Cloth/Blunt
level[64]=6 --Drow Priest/Mage/Cloth/Blunt
level[65]=6 --Drow Leader/Fighter/Chain/Slashing
level[66]=7 --Drow Matriarch/Fighter/Chain/Blunt
level[91]=4 --Forest Troll/Normal/Leather/Blunt
level[92]=5 --Forest Troll Warrior/Fighter/Leather/Blunt
level[93]=5 --Forest Troll Shaman/Mage/Cloth/Blunt
level[94]=5 --Forest Troll Hunter/Rogue/Leather/Distance
level[95]=6 --Forest Troll Forester/Rogue/Leather/Blunt
level[96]=0 --Friendly Forest Troll/Normal/Cloth/None
level[101]=2 --Mummy/Normal/Cloth/Stabbing
level[102]=3 --Enbalmed Slave/Normal/Cloth/Stabbing
level[103]=2 --Enbalmed Servant/Normal/Cloth/Stabbing
level[104]=2 --Poisonous Mummy/Normal/Cloth/Stabbing
level[105]=4 --Chergas Servant/Normal/Cloth/Stabbing
level[106]=0 --Worker Mummy/Normal/Cloth/None
level[107]=2 --Mummy of Madness/Normal/Cloth/Stabbing
level[108]=5 --Palace Guard/Fighter/Cloth/Stabbing
level[109]=6 --Forgotten Mummy/Normal/Cloth/Stabbing
level[110]=7 --Dead King/Mage/Cloth/Stabbing
level[111]=3 --Skeleton/Normal/Chain/Slashing
level[112]=3 --Scruffy Skeleton/Normal/Chain/Slashing
level[113]=4 --Armoured Skeleton/Fighter/Chain/Slashing
level[114]=2 --Crippled Skeleton/Normal/Chain/Slashing
level[115]=3 --Mystic Skeleton/Mage/Chain/Slashing
level[116]=0 --Friendly Skeleton/Normal/Cloth/None
level[117]=5 --Weakened Lich/Mage/Chain/Slashing
level[121]=6 --Gazer/Normal/Plate/Stabbing
level[122]=6 --Gawker/Normal/Plate/Stabbing
level[123]=7 --Eye of Horror/Normal/Plate/Stabbing
level[124]=7 --Deadly Eye/Mage/Plate/Stabbing
level[125]=8 --Terror Eye/Normal/Plate/Stabbing
level[131]=7 --Shadow Eye/Normal/Plate/Stabbing
level[132]=8 --Eye of Darkness/Mage/Plate/Stabbing
level[141]=4 --Ghost Eye/Normal/Plate/Stabbing
level[142]=5 --Unholy Ghost Eye/Normal/Plate/Stabbing
level[143]=6 --Horrible Ghost Eye/Mage/Plate/Stabbing
level[151]=2 --Rotten Mummy/Normal/Cloth/Stabbing
level[152]=3 --Smelly Mummy/Normal/Cloth/Stabbing
level[171]=3 --Mummified Priest/Mage/Cloth/Stabbing
level[172]=2 --Mummified Temple Servant/Normal/Cloth/Stabbing
level[173]=4 --Mummified High Priest/Mage/Cloth/Stabbing
level[181]=0 --Sheep/Normal/Cloth/None
level[182]=0 --Lamb/Normal/Cloth/None
level[191]=5 --Dread Spider/Rogue/Plate/Stabbing
level[192]=5 --Pit Servant/Rogue/Plate/Stabbing
level[193]=6 --Tarantula/Rogue/Plate/Stabbing
level[195]=7 --Spider Queen/Mage/Plate/Stabbing
level[196]=2 --Small Spider/Rogue/Plate/Stabbing
level[201]=6 --Demon Skeleton/Fighter/Chain/Slashing
level[202]=6 --Mystic Demon Skeleton/Mage/Chain/Slashing
level[203]=7 --Unholy Acolyte/Mage/Chain/Slashing
level[204]=7 --Unholy Archmage/Mage/Chain/Slashing
level[205]=8 --Lich/Mage/Chain/Slashing
level[206]=5 --Demon Skeleton Servant/Fighter/Chain/Slashing
level[211]=4 --Fire Spider/Rogue/Plate/Stabbing
level[221]=6 --Gynkese Widow/Rogue/Plate/Stabbing
level[222]=4 --Juvenile Gynk Spider/Rogue/Plate/Stabbing
level[223]=8 --Giant Enforcer Spider/Rogue/Plate/Stabbing
level[231]=6 --King's Fright/Rogue/Plate/Stabbing
level[232]=7 --Shadow Muncher/Mage/Plate/Stabbing
level[241]=0 --Pig/Normal/Cloth/None
level[242]=0 --Boar/Normal/Cloth/None
level[243]=0 --Young Boar/Normal/Cloth/None
level[244]=0 --Hog/Normal/Cloth/None
level[261]=7 --Nightmare Spider/Rogue/Plate/Stabbing
level[262]=8 --Soulpain/Mage/Plate/Stabbing
level[271]=1 --Wasp/Rogue/Chain/Stabbing
level[272]=2 --Hornet/Rogue/Chain/Stabbing
level[273]=2 --Wasp Queen/Rogue/Chain/Stabbing
level[274]=1 --Wasp Drone/Rogue/Chain/Stabbing
level[278]=1 --Fire Wasp/Rogue/Chain/Stabbing
level[301]=4 --Stone Golem/Fighter/Plate/Blunt
level[302]=9 --Son of the Mountains/Fighter/Plate/Blunt
level[303]=3 --Clay Golem/Fighter/Plate/Blunt
level[304]=5 --Lava Golem/Fighter/Plate/Blunt
level[305]=6 --Silver Golem/Fighter/Plate/Blunt
level[306]=7 --Diamond Golem/Fighter/Plate/Blunt
level[371]=0 --Cow/Normal/Cloth/None
level[372]=0 --Bull/Normal/Cloth/None
level[373]=0 --Young Bull/Normal/Cloth/None
level[391]=3 --Wolf/Rogue/Leather/Stabbing
level[392]=2 --Welp/Rogue/Leather/Stabbing
level[393]=2 --Young Wolf/Rogue/Leather/Stabbing
level[394]=3 --Giant Wolf/Rogue/Leather/Stabbing
level[395]=4 --Pack Leader/Rogue/Leather/Stabbing
level[396]=0 --Peaceful Wolf/Normal/Cloth/None
level[401]=4 --Ghost Wolf/Rogue/Leather/Stabbing
level[402]=5 --Lamb Slaughterer/Rogue/Leather/Stabbing
level[403]=3 --Grey Tail/Rogue/Leather/Stabbing
level[404]=3 --Red Wolf/Rogue/Leather/Stabbing
level[511]=5 --Grizzly Bear/Fighter/Leather/Slashing
level[512]=4 --Young Grizzly Bear/Fighter/Leather/Slashing
level[513]=6 --Silverback/Fighter/Leather/Slashing
level[514]=5 --Young Silverback/Fighter/Leather/Slashing
level[515]=4 --Black Bear/Fighter/Leather/Slashing
level[516]=3 --Young Black Bear/Fighter/Leather/Slashing
level[521]=4 --Snapper/Fighter/Leather/Stabbing
level[522]=5 --Terror Beast/Fighter/Leather/Stabbing
level[523]=5 --Scale Beast/Fighter/Leather/Stabbing
level[524]=6 --Fire Raptor/Mage/Leather/Stabbing
level[525]=6 --Ripper Tooth/Fighter/Leather/Stabbing
level[531]=5 --Walking Dead/Normal/Chain/Blunt
level[532]=5 --Limping Zombie/Normal/Chain/Blunt
level[533]=6 --Zombie/Normal/Chain/Blunt
level[534]=7 --Giant Zombie/Fighter/Chain/Blunt
level[535]=4 --Bog Body/Normal/Chain/Blunt
level[536]=3 --Ragged Bog Body/Normal/Chain/Blunt
level[537]=5 --Poltergeist/Normal/Chain/Blunt
level[538]=6 --Horrible Poltergeist/Fighter/Chain/Blunt
level[539]=4 --Coffin Guard/Normal/Chain/Blunt
level[540]=5 --Undead Warlock/Mage/Chain/Blunt
level[541]=6 --Crippled Demon Beast/Fighter/Plate/Blunt
level[542]=7 --Demon Beast/Fighter/Plate/Blunt
level[543]=7 --Giant Demon Beast/Fighter/Plate/Blunt
level[551]=3 --Imp/Rogue/Leather/Blunt
level[552]=4 --Satyr/Rogue/Leather/Blunt
level[553]=4 --Cursed Imp/Mage/Leather/Distance
level[561]=6 --Iron Golem/Fighter/Plate/Blunt
level[562]=7 --Steel Golem/Fighter/Plate/Blunt
level[563]=9 --Merinium Golem/Fighter/Plate/Blunt
level[564]=8 --Gold Golem/Fighter/Plate/Blunt
level[571]=3 --Snuffler/Rogue/Leather/Blunt
level[572]=4 --Baiter/Rogue/Leather/Blunt
level[573]=2 --Sewer Rat/Rogue/Leather/Blunt
level[574]=3 --Giant Sewer Rat/Rogue/Leather/Blunt
level[575]=3 --Contaminated Ratchild/Rogue/Leather/Blunt
level[576]=4 --Contaminated Ratman/Rogue/Leather/Blunt
level[577]=2 --Crazy Rat Alchemist/Mage/Cloth/Blunt
level[578]=3 --Rat Priest/Mage/Cloth/Blunt
level[581]=0 --Dog/Normal/Cloth/None
level[582]=1 --Vicious Dog/Rogue/Leather/Stabbing
level[583]=2 --Watchdog/Rogue/Leather/Stabbing
level[584]=0 --Docile Stray Dog/Normal/Cloth/None
level[591]=0 --Peaceful Beetle/Normal/Cloth/None
level[592]=1 --Hunter Beetle/Normal/Plate/Stabbing
level[593]=2 --Scarab/Normal/Plate/Stabbing
level[594]=3 --Coffin Crawler/Normal/Plate/Stabbing
level[601]=1 --Fox Cub/Normal/Leather/Stabbing
level[602]=2 --Redfox/Normal/Leather/Stabbing
level[603]=3 --Fox Mother/Normal/Leather/Stabbing
level[604]=4 --Fire Ridge/Normal/Leather/Stabbing
level[605]=3 --Grey Fox/Normal/Leather/Stabbing
level[606]=2 --Young Grey Fox/Normal/Leather/Stabbing
level[611]=3 --Stinky Slime/Normal/Leather/Blunt
level[612]=3 --Glutinous Slime/Normal/Leather/Blunt
level[613]=4 --Mouldy Slime/Normal/Leather/Blunt
level[614]=5 --Cauterising Slime/Normal/Leather/Blunt
level[615]=0 --Friendly Slime/Normal/Cloth/None
level[616]=0 --Old Slime/Normal/Cloth/None
level[621]=0 --Chicken/Normal/Cloth/None
level[622]=1 --Angry Chicken/Normal/Cloth/Stabbing
level[623]=1 --Crazy Chicken/Normal/Cloth/Stabbing
level[631]=8 --Bone Dragon/Normal/Chain/Slashing
level[632]=9 --Black Dragon Skeleton/Fighter/Chain/Slashing
level[633]=7 --Undead Fire Dragon/Mage/Chain/Slashing
level[634]=8 --Nightmare Dragon/Fighter/Chain/Slashing
level[635]=7 --Undead Swamp Dragon/Mage/Chain/Slashing
level[636]=7 --Shiny Death Dragon/Mage/Chain/Slashing
level[637]=8 --Golden Bone Dragon/Fighter/Chain/Slashing
level[638]=9 --Black Dragon Skeleton of Madness/Fighter/Chain/Slashing
level[741]=5 --Phantom Skeleton/Normal/Chain/Slashing
level[742]=6 --Bone Schemes/Normal/Chain/Slashing
level[743]=7 --Bone Ghost/Normal/Chain/Slashing
level[744]=6 --Phantom Archer/Rogue/Chain/Distance
level[751]=5 --Grave Guard/Normal/Chain/Blunt
level[752]=3 --Mystic Grave Guard/Mage/Chain/Blunt
level[753]=3 --Grave Guard Archer/Rogue/Chain/Distance
level[754]=4 --Ancient Grave Guard/Normal/Chain/Blunt
level[761]=4 --Armoured Swamp Horror/Normal/Chain/Slashing
level[762]=2 --Crippled Swamp Horror/Normal/Chain/Slashing
level[763]=3 --Scruffy Swamp Horror/Normal/Chain/Slashing
level[764]=4 --Mystic Swamp Horror/Mage/Chain/Slashing
level[782]=5 --Golden Legionnaire/Normal/Chain/Slashing
level[783]=5 --Golden Magus/Mage/Chain/Slashing
level[784]=5 --Golden Archer/Rogue/Chain/Distance
level[791]=4 --Bridge Troll/Fighter/Leather/Blunt
level[792]=5 --Bridge Troll Shaman/Mage/Leather/Blunt
level[793]=5 --Mountain Troll/Fighter/Leather/Blunt
level[794]=6 --Mountain Troll Archer/Rogue/Leather/Distance
level[795]=6 --Fire Spitter/Mage/Leather/Blunt
level[796]=7 --Keeper of Fire/Mage/Leather/Blunt
level[851]=5 --Shadow Runner/Fighter/Leather/Blunt
level[852]=6 --Shadow Fright/Fighter/Leather/Blunt
level[853]=7 --Giant Shadow Runner/Fighter/Leather/Blunt
level[861]=5 --Crippled Ghost Beast/Fighter/Leather/Blunt
level[862]=6 --Ghost Beast/Fighter/Leather/Blunt
level[863]=7 --Giant Ghost Beast/Fighter/Leather/Blunt
level[871]=3 --Crippled Swamp Beast/Fighter/Leather/Blunt
level[872]=4 --Swamp Beast/Fighter/Leather/Blunt
level[873]=5 --Giant Swamp Beast/Fighter/Leather/Blunt
level[881]=2 --Blood Hunter/Fighter/Leather/Blunt
level[882]=3 --Monstrosity/Fighter/Leather/Blunt
level[883]=4 --Blood Sniffer/Fighter/Leather/Blunt
level[891]=2 --Fire Imp/Rogue/Leather/Stabbing
level[892]=3 --Cursed Fire Imp/Mage/Leather/Stabbing
level[893]=4 --Mystic Fire Imp/Mage/Leather/Stabbing
level[901]=4 --Shadow Wimp/Rogue/Leather/Distance
level[902]=5 --Shadow Imp/Rogue/Leather/Stabbing
level[903]=6 --Shadow Dancer/Mage/Leather/Stabbing
level[951]=3 --Attack Dog/Rogue/Leather/Stabbing
level[952]=3 --Hound/Rogue/Leather/Stabbing
level[953]=2 --Young Hound/Rogue/Leather/Stabbing
level[954]=3 --Orc Hound/Rogue/Leather/Stabbing
level[955]=2 --Young Orc Hound/Rogue/Leather/Stabbing
level[981]=3 --Corpse Eater/Normal/Plate/Stabbing
level[982]=1 --Copperling/Normal/Plate/Stabbing
level[983]=2 --Grave Reaper/Normal/Plate/Stabbing
level[984]=3 --Bone Scraper/Normal/Plate/Stabbing
level[1031]=1 --Blood Slime/Normal/Leather/Blunt
level[1032]=2 --Wandering Pool of Blood/Normal/Leather/Blunt
level[1033]=3 --Wandering Demon Blood/Normal/Leather/Blunt
level[1041]=2 --Wandering Garbage/Normal/Leather/Blunt
level[1042]=3 --Wandering Sewage/Normal/Leather/Blunt
level[1043]=4 --Corpse Bile/Normal/Leather/Blunt
level[1051]=1 --Ectoplasm/Normal/Leather/Blunt
level[1052]=2 --Malicious Ectoplasm/Normal/Leather/Blunt
level[1053]=3 --Doomed Ectoplasm/Normal/Leather/Blunt
level[1054]=0 --Friendly Slime/Normal/Cloth/None
level[1111]=1 --Rat/Rogue/Leather/Stabbing
level[1112]=1 --Small Rat/Rogue/Leather/Stabbing
level[1113]=1 --Aggressive Rat/Rogue/Leather/Stabbing
level[1114]=1 --Muskrat/Rogue/Leather/Stabbing
level[1115]=1 --Plague Rat/Rogue/Leather/Stabbing
level[1116]=2 --Sewer Rat/Rogue/Leather/Stabbing
level[1121]=6 --Night Dragon/Mage/Chain/Slashing
level[1122]=7 --Shadow Dragon/Mage/Chain/Slashing
level[1123]=8 --Dragon of Death/Mage/Chain/Slashing
level[1131]=0 --Rabbit/Normal/Cloth/None
level[1132]=0 --Hare/Normal/Cloth/None
level[1133]=0 --Forest Rabbit/Normal/Cloth/None
level[1134]=0 --Forest Hare/Normal/Cloth/None
level[1135]=0 --Desert Rabbit/Normal/Cloth/None
level[1136]=0 --Desert Hare/Normal/Cloth/None
level[1141]=9 --Enraged Akaltut/Rogue/Plate/Stabbing
level[1142]=6 --Akaltut/Rogue/Plate/Stabbing
level[1151]=0 --Fairy/Normal/Cloth/None
level[1152]=0 --Blood fairy/Normal/Cloth/None
level[1153]=0 --Mystical Fairy/Normal/Cloth/None
level[1154]=0 --Elemental Fairy/Normal/Cloth/None
level[1155]=0 --Trickster Fairy/Normal/Cloth/None
level[1161]=0 --Red Deer/Normal/Cloth/None
level[1162]=0 --White Tail Deer/Normal/Cloth/None
level[1163]=0 --Mule Deer/Normal/Cloth/None
level[1164]=0 --Eld's Deer/Normal/Cloth/None
level[1165]=0 --Fallow Deer/Normal/Cloth/None
level[1171]=4 --Ettin/Fighter/Plate/Blunt
level[1172]=4 --Deformed Ettin/Rogue/Plate/Distance
level[1173]=5 --Ettin Sorcerer/Mage/Cloth/Blunt
level[1174]=5 --Ettin Cannibal/Fighter/Plate/Blunt
level[1175]=6 --Evil Crazed Ettin/Fighter/Plate/Blunt

function M.getLevel(monster)

    monsterId = monster:getMonsterType()
    if level[monsterId] then
        return level[monsterId]
    else
        return 0
    end
    
end

return M
