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
local M = {}

M.GOD_NONE     =  0
M.GOD_USHARA   =  1
M.GOD_BRAGON   =  2
M.GOD_ELDAN    =  3
M.GOD_TANORA   =  4
M.GOD_FINDARI  =  5
M.GOD_NARGUN   =  6
M.GOD_ELARA    =  7
M.GOD_ADRON    =  8
M.GOD_OLDRA    =  9
M.GOD_CHERGA   = 10
M.GOD_MALACHIN = 11
M.GOD_IRMOROM  = 12
M.GOD_SIRANI   = 13
M.GOD_ZHAMBRA  = 14
M.GOD_RONAGAN  = 15
M.GOD_MOSHRAN  = 16
M.GOD_THEFIVE  = 17
M.GOD_THEDEVS  = 99

M.GOD_LIST = {M.GOD_NARGUN,M.GOD_ELARA,M.GOD_ADRON,M.GOD_OLDRA,M.GOD_CHERGA,M.GOD_MALACHIN,
			M.GOD_IRMOROM,M.GOD_SIRANI,M.GOD_ZHAMBRA,M.GOD_RONAGAN,M.GOD_MOSHRAN,M.GOD_THEFIVE};

M.GOD_EN = {
    [M.GOD_USHARA]   = "Ushara",
    [M.GOD_BRAGON]   = "Brágon",
    [M.GOD_ELDAN]    = "Eldan",
    [M.GOD_TANORA]   = "Tanora",
    [M.GOD_FINDARI]  = "Findari",
    [M.GOD_NARGUN]   = "Nargún",
    [M.GOD_ELARA]    = "Elara",
    [M.GOD_ADRON]    = "Adron",
    [M.GOD_OLDRA]    = "Oldra",
    [M.GOD_CHERGA]   = "Cherga",
    [M.GOD_MALACHIN] = "Malachín",
    [M.GOD_IRMOROM]  = "Irmorom",
    [M.GOD_SIRANI]   = "Sirani",
    [M.GOD_ZHAMBRA]  = "Zhambra",
    [M.GOD_RONAGAN]  = "Ronagan",
    [M.GOD_MOSHRAN]  = "Moshran",
    [M.GOD_THEFIVE]  = "Five",
    [M.GOD_THEDEVS]  = "Developers",
}

M.GOD_DE = {
    [M.GOD_USHARA]   = "Ushara",
    [M.GOD_BRAGON]   = "Brágon",
    [M.GOD_ELDAN]    = "Eldan",
    [M.GOD_TANORA]   = "Tanora",
    [M.GOD_FINDARI]  = "Findari",
    [M.GOD_NARGUN]   = "Nargún",
    [M.GOD_ELARA]    = "Elara",
    [M.GOD_ADRON]    = "Adron",
    [M.GOD_OLDRA]    = "Oldra",
    [M.GOD_CHERGA]   = "Cherga",
    [M.GOD_MALACHIN] = "Malachín",
    [M.GOD_IRMOROM]  = "Irmorom",
    [M.GOD_SIRANI]   = "Sirani",
    [M.GOD_ZHAMBRA]  = "Zhambra",
    [M.GOD_RONAGAN]  = "Ronagan",
    [M.GOD_MOSHRAN]  = "Moshran",
    [M.GOD_THEFIVE]  = "Fünf",
    [M.GOD_THEDEVS]  = "Entwickler",
}

PRAYER_CONVERSION = {
	{skill = "Healing",
		gText = "bitte (.+) heilung",
		eText = "please (.+) healing"
	}
}

PRAYER_MASS = {
	[M.GOD_NARGUN]   = {gText = "preiset narg[uú]n, gott des chaos",
						eText = "praise narg[uú]n, god of chaos"},
    [M.GOD_ELARA]    = {gText = "preiset",
						eText = "praise"},
    [M.GOD_ADRON]    = {gText = "preiset",
						eText = "praise"},
    [M.GOD_OLDRA]    = {gText = "preiset",
						eText = "praise"},
    [M.GOD_CHERGA]   = {gText = "preiset",
						eText = "praise"},
    [M.GOD_MALACHIN] = {gText = "preiset",
						eText = "praise"},
    [M.GOD_IRMOROM]  = {gText = "preiset",
						eText = "praise"},
    [M.GOD_SIRANI]   = {gText = "preiset",
						eText = "praise"},
    [M.GOD_ZHAMBRA]  = {gText = "preiset",
						eText = "praise"},
    [M.GOD_RONAGAN]  = {gText = "preiset",
						eText = "praise"},
    [M.GOD_MOSHRAN]  = {gText = "preiset",
						eText = "praise"},
    [M.GOD_THEFIVE]  = {gText = "preiset",
						eText = "praise"},
}

PRAYER_FOLLOWER = {
	[M.GOD_NARGUN]   = {gText = "segne mich nargun",
						eText = "bless me nargun"},
    [M.GOD_ELARA]    = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_ADRON]    = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_OLDRA]    = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_CHERGA]   = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_MALACHIN] = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_IRMOROM]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_SIRANI]   = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_ZHAMBRA]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_RONAGAN]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_MOSHRAN]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_THEFIVE]  = {gText = "segnet mich",
						eText = "bless me"},
}

PRAYER_PRIEST = {
	[M.GOD_NARGUN]   = {gText = "segne mich erneut nargun",
						eText = "bless me again nargun"},
    [M.GOD_ELARA]    = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_ADRON]    = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_OLDRA]    = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_CHERGA]   = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_MALACHIN] = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_IRMOROM]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_SIRANI]   = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_ZHAMBRA]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_RONAGAN]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_MOSHRAN]  = {gText = "segne mich",
						eText = "bless me"},
    [M.GOD_THEFIVE]  = {gText = "segnet mich",
						eText = "bless me"},
}

ALTARS = {
	[M.GOD_NARGUN]	= position(-69,-100,0),
    [M.GOD_ELARA]    	= position(0,0,0),
    [M.GOD_ADRON]    	= position(0,0,0),
    [M.GOD_OLDRA]    	= position(0,0,0),
    [M.GOD_CHERGA]   	= position(0,0,0),
    [M.GOD_MALACHIN] 	= position(0,0,0),
    [M.GOD_IRMOROM]  	= position(0,0,0),
    [M.GOD_SIRANI]   	= position(0,0,0),
    [M.GOD_ZHAMBRA]  	= position(0,0,0),
    [M.GOD_RONAGAN]  	= position(0,0,0),
    [M.GOD_MOSHRAN]	= position(0,0,0),
    [M.GOD_THEFIVE]  	= position(0,0,0)
}

ITEMS_FOLLOWER = {
	[M.GOD_NARGUN]	= {{id = 2, number = 1}},
    [M.GOD_ELARA]    	= {{id = 2, number = 1}},
    [M.GOD_ADRON]    	= {{id = 2, number = 1}},
    [M.GOD_OLDRA]    	= {{id = 2, number = 1}},
    [M.GOD_CHERGA]   	= {{id = 2, number = 1}},
    [M.GOD_MALACHIN] 	= {{id = 2, number = 1}},
    [M.GOD_IRMOROM]  	= {{id = 2, number = 1}},
    [M.GOD_SIRANI]   	= {{id = 2, number = 1}},
    [M.GOD_ZHAMBRA]  	= {{id = 2, number = 1}},
    [M.GOD_RONAGAN]  	= {{id = 2, number = 1}},
    [M.GOD_MOSHRAN]	= {{id = 2, number = 1}},
    [M.GOD_THEFIVE]  	= {{id = 2, number = 1}}
}

ITEMS_PRIEST = {
	[M.GOD_NARGUN]	= {{id = 2, number = 1}},
    [M.GOD_ELARA]    	= {{id = 2, number = 1}},
    [M.GOD_ADRON]    	= {{id = 2, number = 1}},
    [M.GOD_OLDRA]    	= {{id = 2, number = 1}},
    [M.GOD_CHERGA]   	= {{id = 2, number = 1}},
    [M.GOD_MALACHIN] 	= {{id = 2, number = 1}},
    [M.GOD_IRMOROM]  	= {{id = 2, number = 1}},
    [M.GOD_SIRANI]   	= {{id = 2, number = 1}},
    [M.GOD_ZHAMBRA]  	= {{id = 2, number = 1}},
    [M.GOD_RONAGAN]  	= {{id = 2, number = 1}},
    [M.GOD_MOSHRAN]	= {{id = 2, number = 1}},
    [M.GOD_THEFIVE]  	= {{id = 2, number = 1}}
}

-- magic flags
-- category runes
RUNE_HEALING = 1;
-- other runes
RUNE_SMALL = 32;

DESCRIPTION_EN = {
	[M.GOD_USHARA]="Goddess of earth";
    [M.GOD_BRAGON]="God of fire";
    [M.GOD_ELDAN]="God of spirit";
    [M.GOD_TANORA]="Goddess of water";
    [M.GOD_FINDARI]="Goddess of air";
    [M.GOD_NARGUN]="God of chaos";
    [M.GOD_ELARA]="Goddess of wisdom and knowledge";
    [M.GOD_ADRON]="God of festivities and wine";
    [M.GOD_OLDRA]="Goddess of life and fertility";
    [M.GOD_CHERGA]="Goddess of spirits and the underworld";
    [M.GOD_MALACHIN]="God of battle and hunting";
    [M.GOD_IRMOROM]="God of trade and craftsmanship";
    [M.GOD_SIRANI]="Goddess of love and pleasure";
    [M.GOD_ZHAMBRA]="God of friendship and loyalty";
    [M.GOD_RONAGAN]="God of thieves and shadows";
    [M.GOD_MOSHRAN]="God of blood and bones";
}
	
DESCRIPTION_DE ={
    [M.GOD_BRAGON]="der Gott des Feuers";
    [M.GOD_ELDAN]="der Gott des Geistes";
    [M.GOD_FINDARI]="die Göttin der Luft";
    [M.GOD_TANORA]="die Göttin des Wassers";
    [M.GOD_USHARA]="die Göttin der Erde";
    [M.GOD_ADRON]="der Gott des Weines und der Feste";
    [M.GOD_CHERGA]="die Göttin der Geister und der Unterwelt";
    [M.GOD_ELARA]="die Göttin des Wissens und der Weisheit";
    [M.GOD_IRMOROM]="der Gott des Handels und des Handwerks";
    [M.GOD_MALACHIN]="der Gott der Jagd und der Schlachten";
    [M.GOD_MOSHRAN]="der Gott des Blutes und der Gebeine";
    [M.GOD_NARGUN]="der Gott des Chaos";
    [M.GOD_OLDRA]="die Göttin der Fruchtbarkeit und des Lebens";
    [M.GOD_RONAGAN]="der Gott der Diebe und der Schatten";
    [M.GOD_SIRANI]="die Göttin der Liebe und der Freude";
    [M.GOD_ZHAMBRA]="der Gott der Freundschaft und Treue";
}

return M