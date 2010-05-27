module("content.lookat.custom", package.seeall)

--[[
  content for Custom LookAt
  use function addDescription to add content
  addDescription( ItemId, ItemData, CustomText, NoQuality, NoName, NewGender )
  @param integer - item.id
  @param integer - item.data-2^30
  @param string - the custom text in German
  @param string - the custom text in English
  @param boolean - true if the quality and durability text shall be removed. false if not
  @param boolean - true if the normal item name shall be removed, remember to add your custom name in CustomText. false if the normal name shall be used
  @param boolean / integer - false if original gender shall be used. For new gender set integer: 0=male, 1=female, 2=neuter
  
  you may use this layout:
	generic:
	addDescription(	id,	data,	"DE", "EN", NoQual, NoName, NewGender );
	only extension:
	addDescription(	,	,	"", "", false, false, false );
]]
function InitCustomLookAt()

	addDescription(	 16,	1,	"bemalt mit einem blutroten Sch�del", "with a crimson skull painted on it", false, false, false );
	addDescription(	 16,	2,	"bemalt mit einem silbernen Sch�del", "with a silver skull painted on it", false, false, false );
	addDescription(	 23,	1,	"mit fein verziertem Griff. Auf dem Kopf ist 'Lexis K.' eingraviert", "with a finely ornamented handle. There is 'Lexis K.' engraved on its head", false, false, false );
	addDescription(	 55,	1,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription(	 55,	2,	"gr�ne Sch�lerrobe mit der Stickerei der Druiden des Waldes", "green student's robe with the embroidery of the Druids of the Forest", false, true, false );
	addDescription(	 62,	1,	"Smaragdamulett, dessen Anh�nger in der Form eines laubbedeckten Baumes gearbeitet wurde", "emerald amulet whose pendant is shaped like a full, leafy tree", false, true, false );
	addDescription(	 67,	1,	"Rubinkette, ein Drache ist im Inneren des Rubins zu erkennen", "rubin amulet, there is a dragon inside the ruby", false, true, false );
	addDescription(	 67,	2,	"Lederhalsband mit einem Rubinanh�nger, auf dem du das Profil einer jungen langhaarigen Frau erkennen kannst", "leather necklace with a rubin pendant on which you can perceive the profile of a young, long-haired woman", false, true, 2 );
	addDescription(	 67,	3,	"Kette mit einem von einer st�hlernen Kralle gehaltenen Rubin", "ruby amulet held by a steel claw", false, true, false );
	addDescription(	 68,	1,	"Siranis Kuss", "Sirani's kiss", true, true, false ); -- for Alsaya
	addDescription(	 68,	2,	"mit dem Zeichen von Troll's Bane", "with the mark of Troll's Bane", false, false, false );
	addDescription(	 71,	1,	"Halskette mit einer Phiole gef�llt mit den Tr�nen Siranis", "necklace with a phial filled with the tears of Sirani", true, true, false ); -- for Alsaya
	addDescription(	 82,	1,	"zerissene Schwarzsteinkette", "ripped blackstone amulet", true, true, false ); -- for Alsaya
	addDescription(  82,	2,  "Auf dem Schwarzstein des Amulettes ist ein mysteri�ses Zeichen eingraviert und um es herum die Worte 'Ab initio'.", "On the blackstone of the amulet is a mysterious sign engraved and around it the words 'Ab initio'.", true, true, false ); --for Alsaya
	addDescription(	 83,	1,	"Firnisorden von Varshikar", "Firnis Medal of Varshikar", false, true, 0 );
	addDescription(	180,	1,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription( 181,	1,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription(	182,	1,	"mit dem Wappen von Caelum auf der R�ckseite", "with Caelum coat of arms on the back", false, false, false );
	addDescription(	193,	1,	"bestickt mit dem Wappen der Riverside Grovestrider", "embroidered with the Riverside Grovestrider coat of arms", false, false, false );
	addDescription(	193,	2,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription( 193,	3,	"bestickt mit dem Wappen von Silberbrand", "embroidered with the Silverbrand coat of arms", false, false, false );
	addDescription(	193,	4,	"k�nigsblaue Robe mit dem Wappen Silberbrands, rechts auf der Brust", "royal blue robe with the crest of Silverbrand embroidered to the right, on the chest", false, true, false );
	addDescription(	195,	1,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription(	196,	1,	"grauer Mantel mit dem Wappen von Troll's Bane auf der R�ckseite", "grey cloak with Troll's Bane coat of arms on the back", false, true, false );
	addDescription(	196,	2,	"mit einer Stickerei eines gro�en, roten Diamanten auf der R�ckseite", "with a large red diamond embroidered on the back", false, false, false );
	addDescription(	196,	3,	"bestickt mit einer grauen Rose", "embroidered with a grey rose", false, false, false );
	addDescription(	196,	4,	"mit goldenem Saum und dem Wappen der Grauen Rose auf der rechten Brust", "with a golden hemline including the Grey Rose coat of arms on the right chest", false, false, false );
	addDescription(	207,	1,	"Eichenstab mit den Symbolen der Naturelemente", "oak staff with the symbols of nature's elements", false, true, false );
	addDescription(	208,	1,	"Stab des Geistes", "Staff of Spirit", false, true, false );
	addDescription( 224,	1,	"Pokal f�r den 1. Platz", "1st place trophy", true, true, false );
	addDescription(	235,	1,	"mit der Gravur 'Kernland ~ Graue Orden'", "with the gravure 'Core Territory ~ Grey Orders", false, false, false );
	addDescription(	235,	2,	"mit der Gravur 'K�nig der Ringer'", "with the gravure 'Wrestler King'", false, false, false );
	addDescription(	235,	3,	"mit der Gravur 'K�nig der Schmiede'", "with the gravure 'Smith King'", false, false, false );
	addDescription(	235,	4,	"mit der Gravur 'K�nig der Schreiner'", "with the gravure 'Carpenter King'", false, false, false );
	addDescription(	235,	5,	"mit der Gravur 'K�nig der Schneider'", "with the gravure 'Tailor King'", false, false, false );
	addDescription(	235,	6,	"mit der Gravur 'K�nig der L�ufer'", "with the gravure 'Runner King'", false, false, false );
	addDescription(	235,	7,	"mit der Gravur 'K�nig der Bergleute'", "with the gravure 'Miner King'", false, false, false );
	addDescription(	235,	8,	"mit der Gravur 'K�nig der Dichter'", "with the gravure 'Poet King'", false, false, false );
	addDescription(	235,	9,	"mit der Gravur 'K�nig der Barden'", "with the gravure 'Bard King'", false, false, false );
	addDescription(	235,	10,	"mit der Gravur 'K�nig der Krieger'", "with the gravure 'Warrior King'", false, false, false );
	addDescription(	277,	1,	"zierlicher Goldring, der mit einem herzf�rmigen Amethysten verziert ist", "graceful golden ring which is ornamented with an amethyst in the shape of a heart", false, true, false );
	addDescription(	279,	1,	"mit der Gravur 'Sie entzog sich meinen Tr�umen'", "with the gravure 'She dodged my dreams'", false, false, false );
	addDescription(	280,	1,	"mit einer eleganten Gravur auf der Innenseite: 'Vanima erwartet ~Khallimar'", "elegantly engraved on the inside with the words 'Vanima awaits ~Khallimar'", false, false, false );
	addDescription(	281,	1,	"mit dem Zeichen von Troll's Bane", "with the mark of Troll's Bane", false, false, false );
	addDescription(	293,	1,	"kunstvoll verzierten Wurfspeer", "elaborately ornamented throwing spear", true, true, false );
	addDescription(	335,	1,	"Adrons Laute", "Adron's lute", true, true, false ); -- for Alsaya
	addDescription(	362,	1,	"Lederweste, an den �rmeln verziert mit gr�n schimmernden Ranken, welche ein G und D bilden", "leather vest, ornamented on the sleeves with green gleaming tendrils which form a G and D", false, true, false );
	addDescription(	383,	1,	"mit der Gravur 'Orkj�ger'", "with the gravure 'Orc Hunter'", false, false, false );
	addDescription(	385,	1,	"bestickt mit dem Wappen des Littlethorn Clans", "embroidered with the emblem of the Littlethorn Clan", false, false, false );
	addDescription(	385,	2,	"seidenes, blaues Kleid mit roten Seidenb�ndern an den R�ndern", " silken, blue dress with red silk ribbons lining the fringes", false, true, false );
	addDescription( 457,	1,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription( 458,	1,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription(	558,	1,	"mit Blausteinen als Kn�pfe und auf der linken Brust bestickt mit einer blauen Flamme, welche eine kleinere rote Flamme umschlie�t", "with bluestones as buttons and on the left chest embroidered with a blue flame that embraces another smaller red flame", false, false, false );
	addDescription(1840,	1,	"Pokal f�r den 3. Platz", "3rd place trophy", true, true, false );
	addDescription(1858,	1,	"Pokal f�r den 2. Platz", "2nd place trophy", true, true, false );
	addDescription(2284,	1,	"mit dem Siegel von Troll's Bane", "with the seal of Troll's Bane", false, false, false );
	addDescription(2295,	1,	"verziert mit einer bl�henden Rose und den Initialen 'L C'", "ornamented with a blooming rose and the initials 'L C'", false, false, false );
	addDescription(2357,	1,	"Harnisch des Stammesf�rsten", "Chieftain's Plate", false, true, false );
	addDescription(2357,	2,	"finsteren Schattenharnisch mit dem Abbild eines roten Ork-Totenkopf auf der Brust", "sinister shadowplate with an image of a red orc skull on the chest", false, true, false );
	addDescription(2377,	1,	"mit dem Wappen von Caelum auf der R�ckseite", "with Caelum coat of arms on the back", false, false, false );
	addDescription(2377,	2,	"bestickt mit dem Schriftzug 'Erzmagier'", "embroidered with the lettering 'Archmage'", false, false, false );
	addDescription(2377,	3,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription(2377,	4,	"bunte Robe mit dem Wappen des Littlethorn Clans rechts auf der Brust", "colorful robe with the emblem of the Littlethorn Clan on the right chest", false, true, false );
	addDescription(2377,	16,	"roter Mantel mit einem goldenen, aufgeb�umten Pferd", "red mantle with gold rampant horse", false, true, 0 );
	addDescription(2380,	1,	"bestickt mit dem Schriftzug 'W�chter des Weststrands'", "embroidered with the lettering 'Guard of Weststrand", false, false, false );
	addDescription(2380,	2,	"mit dem Wappen des Littlethorn Clans rechts auf der Brust", "with the emblem of the Littlethorn Clan on the right chest", false, false, false );
	addDescription(2380,	3,	"k�nigsblauen Mantel mit dem Wappen Silberbrands, rechts auf der Brust", "royal blue coat with the crest of Silverbrand embroidered to the right, on the chest", false, true, false );
	addDescription(2380,	4,	"mit dem Wappen Silberbrands, rechts auf der Brust", "with the crest of Silverbrand embroidered to the right, on the chest", false, false, false );
	addDescription(2384,	1,	"Mantel aus schwarzen Rabenfedern", "coat made of black raven feathers", false, true, false );
	addDescription(2384,	2,	"mit dem Abzeichen des Kommandanten der Troll's Bane Wache", "with the insignia of the Troll's Bane guard captain", false, false, false );
	addDescription(2384,	3,	"mit dem Abzeichen des Leutnants der Troll's Bane Wache", "with the insignia of the Troll's Bane guard lieutenant", false, false, false );
	addDescription(2384,	4,	"mit dem Wappen des Prinzen am R�cken", "bearing the crest of the prince on its back", false, false, false ); -- for Zot
	addDescription(2390,	1,	"mit dem Wappen Silberbrands", "with the crest of Silverbrand", false, false, false );
	addDescription(2400,	1,	"mit dem Emblem eines goldenen L�wenkopfes", "with the emblem of a golden lion head", false, false, false );
	addDescription(2400,	2,	"R�stung des Kriegsherrn", "Warlord's Plate", false, true, false );
	addDescription(2400,	3,	"mit der Gravur 'A.Y.R.' auf der Brust", "with the gravure 'A.Y.R.' on the chest", false, false, false );
	addDescription(2400,	4,	"graviert mit dem Zeichen der Erzherzogin von Troll's Bane", "marked with the insignia of the Archduchess of Troll's Bane", false, false, false );
	addDescription(2416,	1,	"bestickt mit dem Wappen von Silberbrand", "embroidered with the Silverbrand coat of arms", false, false, false );
	addDescription(2418,	16,	"grauer Mantel mit einem gelbem, aufgeb�umten Pferd", "grey mantle with yellow rampant horse", false, true, 0 );
	addDescription(2419,	1,	"bestickt mit dem Wappen von Silberbrand", "embroidered with the Silverbrand coat of arms", false, false, false );
	addDescription(2420,	1,	"bestickt mit dem Wappen von Silberbrand", "embroidered with the Silverbrand coat of arms", false, false, false );
	addDescription(2421,	1,	"wei�e Robe mit der Stickerei der Druiden des Waldes", "white robe with the embroidery of the Druids of the Forest", false, true, false );
	addDescription(2421,	2,	"langes wei�es Gewand", "long white garment", false, true, 2 );
	addDescription(2421,	16,	"wei�er Mantel mit einem blauen, aufgeb�umten Pferd", "white mantle with blue rampant horse", false, true, 0 );
	addDescription(2547,	1,	"wei�es St�ck Leder mit einem gr�nen Band und dem Zeichen der Nordmark eingebrandt", "white piece of leather with a green ribbon and the emblem of the Nordmark burnt in", true, true, false );
	addDescription(2547,	2,	"wei�es St�ck Leder mit einem roten Band und dem Zeichen der Nordmark eingebrandt", "white piece of leather with a red ribbon and the emblem of the Nordmark burnt in", true, true, false );
	addDescription(2547,	3,	"wei�es St�ck Leder mit einem blauen Band und dem Zeichen der Nordmark eingebrandt", "white piece of leather with a blue ribbon and the emblem of the Nordmark burnt in", true, true, false );
	addDescription(2547,	4,	"wei�es St�ck Leder mit einem gelben Band und dem Zeichen der Nordmark eingebrandt", "white piece of leather with a yellow ribbon and the emblem of the Nordmark burnt in", true, true, false );
	addDescription(2547,	5,	"wei�es St�ck Leder mit einem schwarzen Band und dem Zeichen der Nordmark eingebrandt", "white piece of leather with a black ribbon and the emblem of the Nordmark burnt in", true, true, false );
	addDescription(2547,	6,	"wei�es St�ck Leder mit einem grauen Band und dem Zeichen der Nordmark eingebrandt", "white piece of leather with a grey ribbon and the emblem of the Nordmark burnt in", true, true, false );
	addDescription(2547,	7,	"wei�es St�ck Leder mit einem gr�n blauen Band und dem Zeichen der Nordmark eingebrandt", "white piece of leather with a green blue ribbon and the emblem of the Nordmark burnt in", true, true, false );
	addDescription(2660,	1,	"mit dem Wappen Silberbrands", "with Silverbrand coat of arms", false, false, false );
	addDescription(2660,	2,	"mit dem Wappen Silberbrands", "with the crest of Silverbrand", false, false, false );
	addDescription(2744,	1,	"knorrige, alte Pfeife, deren Kopf stets mit Sibanac gef�llt ist", "knotty old pipe, the head of which is always filled with Sibanac", true, true, false );
	addDescription(2785,	1,	"mit der Gravur 'Eigentum von Eli Travinus'", "with the gravure 'Property of Eli Travinus'", false, false, false );
	addDescription(2785,	2,	"mit der Gravur 'Johann Braun, Magier'", "with the gravure 'Johann Braun, Mage'", false, false, false );
	
end

function addDescription( ItemId, ItemData, CustomText_DE, CustomText_EN, NoQuality, NoName, NewGender )
	
	if CustomLookAt == nil then
		CustomLookAt = {};
	end
	if CustomLookAt[ItemId] == nil then
		CustomLookAt[ItemId] = {};
	end
	CustomLookAt[ItemId][ItemData] = { CustomText_DE, CustomText_EN, NoQuality, NoName, NewGender };
end
