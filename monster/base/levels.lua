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

level[1]=5; --Human
level[2]=6; --Human Warrior
level[3]=5; --Human Mage
level[4]=5; --Human Necromancer
level[5]=4; --Human Thief
level[6]=0; --Friendly Human
level[7]=7; --Dark Paladin
level[9]=9; --Cursed Knight
level[11]=5; --Dwarf
level[12]=6; --Dwarven Warrior
level[13]=5; --Dwarven Priest
level[14]=4; --Dwarven Smith
level[15]=5; --Dwarven Hunter
level[16]=0; --Friendly Dwarf
level[21]=3; --Halfling
level[22]=4; --Halfling Warrior
level[23]=4; --Halfling Thief
level[24]=3; --Halfling Peasant
level[25]=4; --Halfling Hunter
level[26]=0; --Friendly Halfling
level[31]=5; --Elf
level[32]=6; --Elven Warrior
level[33]=5; --Elven Priest
level[34]=5; --Elven Mage
level[35]=5; --Elven Hunter
level[36]=0; --Friendly Elf
level[41]=5; --Orc
level[42]=6; --Orc Warrior
level[43]=4; --Orc Thief
level[44]=5; --Orc Hunter
level[45]=5; --Orc Shaman
level[46]=0; --Friendly Orc
level[51]=5; --Lizard
level[52]=6; --Lizard Temple Warrior
level[53]=5; --Lizard Mage
level[54]=5; --Lizard Priest
level[55]=4; --Lizard Thief
level[56]=0; --Friendly Lizard
level[61]=6; --Drow Archer
level[62]=6; --Drow Warrior
level[63]=6; --Drow Mage
level[64]=6; --Drow Priest
level[65]=6; --Drow Leader
level[66]=7; --Drow Matriarch
level[91]=4; --Forest Troll
level[92]=5; --Forest Troll Warrior
level[93]=5; --Forest Troll Shaman
level[94]=5; --Forest Troll Hunter
level[95]=6; --Forest Troll Forester
level[96]=0; --Friendly Forest Troll
level[101]=2; --Mummy
level[102]=3; --Enbalmed Slave
level[103]=2; --Enbalmed Servant
level[104]=2; --Poisonous Mummy
level[105]=4; --Chergas Servant
level[106]=0; --Worker Mummy
level[107]=2; --Mummy of Madness
level[108]=5; --Palace Guard
level[109]=6; --Forgotten Mummy
level[110]=7; --Dead King
level[111]=3; --Skeleton
level[112]=3; --Scruffy Skeleton
level[113]=4; --Armoured Skeleton
level[114]=2; --Crippled Skeleton
level[115]=3; --Mystic Skeleton
level[116]=0; --Friendly Skeleton
level[117]=5; --Weakened Lich
level[121]=6; --Gazer
level[122]=6; --Gawker
level[123]=7; --Eye of Horror
level[124]=7; --Deadly Eye
level[125]=8; --Terror Eye
level[131]=7; --Shadow Eye
level[132]=8; --Eye of Darkness
level[141]=4; --Ghost Eye
level[142]=5; --Unholy Ghost Eye
level[143]=6; --Horrible Ghost Eye
level[151]=2; --Rotten Mummy
level[152]=3; --Smelly Mummy
level[171]=3; --Mummified Priest
level[172]=2; --Mummified Temple Servant
level[173]=4; --Mummified High Priest
level[181]=0; --Sheep
level[182]=0; --Lamb
level[191]=5; --Dread Spider
level[192]=5; --Pit Servant
level[193]=6; --Tarantula
level[195]=7; --Spider Queen
level[196]=2; --Small Spider
level[201]=6; --Demon Skeleton
level[202]=6; --Mystic Demon Skeleton
level[203]=7; --Unholy Acolyte
level[204]=7; --Unholy Archmage
level[205]=8; --Lich
level[206]=5; --Demon Skeleton Servant
level[211]=4; --Fire Spider
level[221]=6; --Gynkese Widow
level[222]=4; --Juvenile Gynk Spider
level[223]=8; --Giant Enforcer Spider
level[231]=6; --King's Fright
level[232]=7; --Shadow Muncher
level[241]=0; --Pig
level[242]=0; --Boar
level[243]=0; --Young Boar
level[244]=0; --Hog
level[261]=7; --Nightmare Spider
level[262]=8; --Soulpain
level[271]=1; --Wasp
level[272]=2; --Hornet
level[273]=2; --Wasp Queen
level[274]=1; --Wasp Drone
level[278]=1; --Fire Wasp
level[301]=4; --Stone Golem
level[302]=9; --Son of the Mountains
level[303]=3; --Clay Golem
level[304]=5; --Lava Golem
level[305]=6; --Silver Golem
level[306]=7; --Diamond Golem
level[371]=0; --Cow
level[372]=0; --Bull
level[373]=0; --Young Bull
level[391]=3; --Wolf
level[392]=2; --Welp
level[393]=2; --Young Wolf
level[394]=3; --Giant Wolf
level[395]=4; --Pack Leader
level[396]=0; --Peaceful Wolf
level[401]=4; --Ghost Wolf
level[402]=5; --Lamb Slaughterer
level[403]=3; --Grey Tail
level[404]=3; --Red Wolf
level[511]=5; --Grizzly Bear
level[512]=4; --Young Grizzly Bear
level[513]=6; --Silverback
level[514]=5; --Young Silverback
level[515]=4; --Black Bear
level[516]=3; --Young Black Bear
level[521]=4; --Snapper
level[522]=5; --Terror Beast
level[523]=5; --Scale Beast
level[524]=6; --Fire Raptor
level[525]=6; --Ripper Tooth
level[531]=5; --Walking Dead
level[532]=5; --Limping Zombie
level[533]=6; --Zombie
level[534]=7; --Giant Zombie
level[535]=4; --Bog Body
level[536]=3; --Ragged Bog Body
level[537]=5; --Poltergeist
level[538]=6; --Horrible Poltergeist
level[539]=4; --Coffin Guard
level[540]=5; --Undead Warlock
level[541]=6; --Crippled Demon Beast
level[542]=7; --Demon Beast
level[543]=7; --Giant Demon Beast
level[551]=3; --Imp
level[552]=4; --Satyr
level[553]=4; --Cursed Imp
level[561]=6; --Iron Golem
level[562]=7; --Steel Golem
level[563]=9; --Merinium Golem
level[564]=8; --Gold Golem
level[571]=3; --Snuffler
level[572]=4; --Baiter
level[573]=2; --Sewer Rat
level[574]=3; --Giant Sewer Rat
level[575]=3; --Contaminated Ratchild
level[576]=4; --Contaminated Ratman
level[577]=2; --Crazy Rat Alchemist
level[578]=3; --Rat Priest
level[581]=0; --Dog
level[582]=1; --Vicious Dog
level[583]=2; --Watchdog
level[584]=0; --Docile Stray Dog
level[591]=0; --Peaceful Beetle
level[592]=1; --Hunter Beetle
level[593]=2; --Scarab
level[594]=3; --Coffin Crawler
level[601]=1; --Fox Cub
level[602]=2; --Redfox
level[603]=3; --Fox Mother
level[604]=4; --Fire Ridge
level[605]=3; --Grey Fox
level[606]=2; --Young Grey Fox
level[611]=3; --Stinky Slime
level[612]=3; --Glutinous Slime
level[613]=4; --Mouldy Slime
level[614]=5; --Cauterising Slime
level[615]=0; --Friendly Slime
level[616]=0; --Old Slime
level[621]=0; --Chicken
level[622]=1; --Angry Chicken
level[623]=1; --Crazy Chicken
level[631]=8; --Bone Dragon
level[632]=9; --Black Dragon Skeleton
level[633]=7; --Undead Fire Dragon
level[634]=8; --Nightmare Dragon
level[635]=7; --Undead Swamp Dragon
level[636]=7; --Shiny Death Dragon
level[637]=8; --Golden Bone Dragon
level[638]=9; --Black Dragon Skeleton of Madness
level[741]=5; --Phantom Skeleton
level[742]=6; --Bone Schemes
level[743]=7; --Bone Ghost
level[744]=6; --Phantom Archer
level[751]=5; --Grave Guard
level[752]=3; --Mystic Grave Guard
level[753]=3; --Grave Guard Archer
level[754]=4; --Ancient Grave Guard
level[761]=4; --Armoured Swamp Horror
level[762]=2; --Crippled Swamp Horror
level[763]=3; --Scruffy Swamp Horror
level[764]=4; --Mystic Swamp Horror
level[782]=5; --Golden Legionnaire
level[783]=5; --Golden Magus
level[784]=5; --Golden Archer
level[791]=4; --Bridge Troll
level[792]=5; --Bridge Troll Shaman
level[793]=5; --Mountain Troll
level[794]=6; --Mountain Troll Archer
level[795]=6; --Fire Spitter
level[796]=7; --Keeper of Fire
level[851]=5; --Shadow Runner
level[852]=6; --Shadow Fright
level[853]=7; --Giant Shadow Runner
level[861]=5; --Crippled Ghost Beast
level[862]=6; --Ghost Beast
level[863]=7; --Giant Ghost Beast
level[871]=3; --Crippled Swamp Beast
level[872]=4; --Swamp Beast
level[873]=5; --Giant Swamp Beast
level[881]=2; --Blood Hunter
level[882]=3; --Monstrosity
level[883]=4; --Blood Sniffer
level[891]=2; --Fire Imp
level[892]=3; --Cursed Fire Imp
level[893]=4; --Mystic Fire Imp
level[901]=4; --Shadow Wimp
level[902]=5; --Shadow Imp
level[903]=6; --Shadow Dancer
level[951]=3; --Attack Dog
level[952]=3; --Hound
level[953]=2; --Young Hound
level[954]=3; --Orc Hound
level[955]=2; --Young Orc Hound
level[981]=3; --Corpse Eater
level[982]=1; --Copperling
level[983]=2; --Grave Reaper
level[984]=3; --Bone Scraper
level[1031]=1; --Blood Slime
level[1032]=2; --Wandering Pool of Blood
level[1033]=3; --Wandering Demon Blood
level[1041]=2; --Wandering Garbage
level[1042]=3; --Wandering Sewage
level[1043]=4; --Corpse Bile
level[1051]=1; --Ectoplasm
level[1052]=2; --Malicious Ectoplasm
level[1053]=3; --Doomed Ectoplasm
level[1054]=0; --Friendly Slime
level[1111]=1; --Rat
level[1112]=1; --Small Rat
level[1113]=1; --Aggressive Rat
level[1114]=1; --Muskrat
level[1115]=1; --Plague Rat
level[1116]=2; --Sewer Rat
level[1121]=6; --Night Dragon
level[1122]=7; --Shadow Dragon
level[1123]=8; --Dragon of Death
level[1131]=0; --Rabbit
level[1132]=0; --Hare
level[1133]=0; --Forest Rabbit
level[1134]=0; --Forest Hare
level[1135]=0; --Desert Rabbit
level[1136]=0; --Desert Hare
level[1141]=9; --Enraged Akaltut
level[1142]=6; --Akaltut
level[1151]=0; --Fairy
level[1152]=0; --Blood fairy
level[1153]=0; --Mystical Fairy
level[1154]=0; --Elemental Fairy
level[1155]=0; --Trickster Fairy
level[1161]=0; --Red Deer
level[1162]=0; --White Tail Deer
level[1163]=0; --Mule Deer
level[1164]=0; --Eld's Deer
level[1165]=0; --Fallow Deer
level[1171]=4; --Ettin
level[1172]=4; --Deformed Ettin
level[1173]=5; --Ettin Sorcerer
level[1174]=5; --Ettin Cannibal
level[1175]=6; --Evil Crazed Ettin

function M.getLevel(monsterId)

    if level[monsterId] then
        return level[monsterId]
    else
        return 0
    end
    
end

return M
