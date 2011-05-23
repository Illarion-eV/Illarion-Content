module("content.gods", package.seeall)

GOD_NONE     =  0
GOD_USHARA   =  1
GOD_BRAGON   =  2
GOD_ELDAN    =  3
GOD_TANORA   =  4
GOD_FINDARI  =  5
GOD_NARGUN   =  6
GOD_ELARA    =  7
GOD_ADRON    =  8
GOD_OLDRA    =  9
GOD_CHERGA   = 10
GOD_MALACHIN = 11
GOD_IRMOROM  = 12
GOD_SIRANI   = 13
GOD_ZHAMBRA  = 14
GOD_RONAGAN  = 15
GOD_MOSHRAN  = 16
GOD_THEFIVE  = 17
GOD_THEDEVS  = 99

GOD_LIST = {GOD_NARGUN,GOD_ELARA,GOD_ADRON,GOD_OLDRA,GOD_CHERGA,GOD_MALACHIN,
			GOD_IRMOROM,GOD_SIRANI,GOD_ZHAMBRA,GOD_RONAGAN,GOD_MOSHRAN,GOD_THEFIVE};

GOD_EN = {
    [GOD_USHARA]   = "Ushara",
    [GOD_BRAGON]   = "Brágon",
    [GOD_ELDAN]    = "Eldan",
    [GOD_TANORA]   = "Tanora",
    [GOD_FINDARI]  = "Findari",
    [GOD_NARGUN]   = "Nargún",
    [GOD_ELARA]    = "Elara",
    [GOD_ADRON]    = "Adron",
    [GOD_OLDRA]    = "Oldra",
    [GOD_CHERGA]   = "Cherga",
    [GOD_MALACHIN] = "Malachín",
    [GOD_IRMOROM]  = "Irmorom",
    [GOD_SIRANI]   = "Sirani",
    [GOD_ZHAMBRA]  = "Zhambra",
    [GOD_RONAGAN]  = "Ronagan",
    [GOD_MOSHRAN]  = "Moshran",
    [GOD_THEFIVE]  = "Five",
    [GOD_THEDEVS]  = "Developers",
}

GOD_DE = {
    [GOD_USHARA]   = "Ushara",
    [GOD_BRAGON]   = "Brágon",
    [GOD_ELDAN]    = "Eldan",
    [GOD_TANORA]   = "Tanora",
    [GOD_FINDARI]  = "Findari",
    [GOD_NARGUN]   = "Nargún",
    [GOD_ELARA]    = "Elara",
    [GOD_ADRON]    = "Adron",
    [GOD_OLDRA]    = "Oldra",
    [GOD_CHERGA]   = "Cherga",
    [GOD_MALACHIN] = "Malachín",
    [GOD_IRMOROM]  = "Irmorom",
    [GOD_SIRANI]   = "Sirani",
    [GOD_ZHAMBRA]  = "Zhambra",
    [GOD_RONAGAN]  = "Ronagan",
    [GOD_MOSHRAN]  = "Moshran",
    [GOD_THEFIVE]  = "Fünf",
    [GOD_THEDEVS]  = "Entwickler",
}

PRAYER_CONVERSION = {
	{skill = "Healing",
		gText = "bitte (.+) heilung",
		eText = "please (.+) healing"
	}
}

PRAYER_MASS = {
	[GOD_NARGUN]   = {gText = "preiset narg[uú]n, gott des chaos",
						eText = "praise narg[uú]n, god of chaos"},
    [GOD_ELARA]    = {gText = "preiset",
						eText = "praise"},
    [GOD_ADRON]    = {gText = "preiset",
						eText = "praise"},
    [GOD_OLDRA]    = {gText = "preiset",
						eText = "praise"},
    [GOD_CHERGA]   = {gText = "preiset",
						eText = "praise"},
    [GOD_MALACHIN] = {gText = "preiset",
						eText = "praise"},
    [GOD_IRMOROM]  = {gText = "preiset",
						eText = "praise"},
    [GOD_SIRANI]   = {gText = "preiset",
						eText = "praise"},
    [GOD_ZHAMBRA]  = {gText = "preiset",
						eText = "praise"},
    [GOD_RONAGAN]  = {gText = "preiset",
						eText = "praise"},
    [GOD_MOSHRAN]  = {gText = "preiset",
						eText = "praise"},
    [GOD_THEFIVE]  = {gText = "preiset",
						eText = "praise"},
}

PRAYER_FOLLOWER = {
	[GOD_NARGUN]   = {gText = "segne mich nargun",
						eText = "bless me nargun"},
    [GOD_ELARA]    = {gText = "segne mich",
						eText = "bless me"},
    [GOD_ADRON]    = {gText = "segne mich",
						eText = "bless me"},
    [GOD_OLDRA]    = {gText = "segne mich",
						eText = "bless me"},
    [GOD_CHERGA]   = {gText = "segne mich",
						eText = "bless me"},
    [GOD_MALACHIN] = {gText = "segne mich",
						eText = "bless me"},
    [GOD_IRMOROM]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_SIRANI]   = {gText = "segne mich",
						eText = "bless me"},
    [GOD_ZHAMBRA]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_RONAGAN]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_MOSHRAN]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_THEFIVE]  = {gText = "segnet mich",
						eText = "bless me"},
}

PRAYER_PRIEST = {
	[GOD_NARGUN]   = {gText = "segne mich erneut nargun",
						eText = "bless me again nargun"},
    [GOD_ELARA]    = {gText = "segne mich",
						eText = "bless me"},
    [GOD_ADRON]    = {gText = "segne mich",
						eText = "bless me"},
    [GOD_OLDRA]    = {gText = "segne mich",
						eText = "bless me"},
    [GOD_CHERGA]   = {gText = "segne mich",
						eText = "bless me"},
    [GOD_MALACHIN] = {gText = "segne mich",
						eText = "bless me"},
    [GOD_IRMOROM]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_SIRANI]   = {gText = "segne mich",
						eText = "bless me"},
    [GOD_ZHAMBRA]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_RONAGAN]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_MOSHRAN]  = {gText = "segne mich",
						eText = "bless me"},
    [GOD_THEFIVE]  = {gText = "segnet mich",
						eText = "bless me"},
}

ALTARS = {
	[GOD_NARGUN]	= position(-69,-100,0),
    [GOD_ELARA]    	= position(0,0,0),
    [GOD_ADRON]    	= position(0,0,0),
    [GOD_OLDRA]    	= position(0,0,0),
    [GOD_CHERGA]   	= position(0,0,0),
    [GOD_MALACHIN] 	= position(0,0,0),
    [GOD_IRMOROM]  	= position(0,0,0),
    [GOD_SIRANI]   	= position(0,0,0),
    [GOD_ZHAMBRA]  	= position(0,0,0),
    [GOD_RONAGAN]  	= position(0,0,0),
    [GOD_MOSHRAN]	= position(0,0,0),
    [GOD_THEFIVE]  	= position(0,0,0)
}

ITEMS_FOLLOWER = {
	[GOD_NARGUN]	= {{id = 2, number = 1}},
    [GOD_ELARA]    	= {{id = 2, number = 1}},
    [GOD_ADRON]    	= {{id = 2, number = 1}},
    [GOD_OLDRA]    	= {{id = 2, number = 1}},
    [GOD_CHERGA]   	= {{id = 2, number = 1}},
    [GOD_MALACHIN] 	= {{id = 2, number = 1}},
    [GOD_IRMOROM]  	= {{id = 2, number = 1}},
    [GOD_SIRANI]   	= {{id = 2, number = 1}},
    [GOD_ZHAMBRA]  	= {{id = 2, number = 1}},
    [GOD_RONAGAN]  	= {{id = 2, number = 1}},
    [GOD_MOSHRAN]	= {{id = 2, number = 1}},
    [GOD_THEFIVE]  	= {{id = 2, number = 1}}
}

ITEMS_PRIEST = {
	[GOD_NARGUN]	= {{id = 2, number = 1}},
    [GOD_ELARA]    	= {{id = 2, number = 1}},
    [GOD_ADRON]    	= {{id = 2, number = 1}},
    [GOD_OLDRA]    	= {{id = 2, number = 1}},
    [GOD_CHERGA]   	= {{id = 2, number = 1}},
    [GOD_MALACHIN] 	= {{id = 2, number = 1}},
    [GOD_IRMOROM]  	= {{id = 2, number = 1}},
    [GOD_SIRANI]   	= {{id = 2, number = 1}},
    [GOD_ZHAMBRA]  	= {{id = 2, number = 1}},
    [GOD_RONAGAN]  	= {{id = 2, number = 1}},
    [GOD_MOSHRAN]	= {{id = 2, number = 1}},
    [GOD_THEFIVE]  	= {{id = 2, number = 1}}
}

-- magic flags
-- category runes
RUNE_HEALING = 1;
-- other runes
RUNE_SMALL = 32;

--[[
DEFAULT = {
	[GOD_NARGUN]	= 
    [GOD_ELARA]    	= 
    [GOD_ADRON]    	= 
    [GOD_OLDRA]    	= 
    [GOD_CHERGA]   	= 
    [GOD_MALACHIN] 	= 
    [GOD_IRMOROM]  	= 
    [GOD_SIRANI]   	= 
    [GOD_ZHAMBRA]  	= 
    [GOD_RONAGAN]  	= 
    [GOD_MOSHRAN]	= 
    [GOD_THEFIVE]  	= 
}
]]
