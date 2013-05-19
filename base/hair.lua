humanHairStyles = {
	humanMaleHairStyle = {
		{id=0, nameDe="Glatze", nameEN="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEN="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEN="Medium length hair"},
		{id=3, nameDe="Lange Haare", nameEN="Long hair"}
	},
	humanFemaleHairStyle = {
		{id=0, nameDe="Glatze", nameEN="Bald head"},
		{id=1, nameDe="Mittellange Haare", nameEN="Medium length hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEN="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEN="Long open hair"},
		{id=8, nameDe="Lange Zöpfe", nameEN="Long braided hair"}
	}
}

elfHairStyles = {
	maleElfHairStyle = {
		{id=1, nameDe="Kurze Haare", nameEN="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEN="Medium length hair"}
	},
	femaleElfHairStyle = {
		{id=0, nameDe="Glatze", nameEN="Bald head"},
		{id=1, nameDe="Mittellange Haare", nameEN="Medium length hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEN="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEN="Long open hair"},
		{id=8, nameDe="Pferdeschwanz", nameEN="Ponytail"}
	
	}
}

dwarfHairStyles = {
	maleDwarfHairStyle = {
		{id=0, nameDe="Glatze", nameEN="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEN="Short hair"},
		{id=2, nameDe="Lange Haare (1)", nameEN="Long hair (1)"},
		{id=3, nameDe="Lange Haare (2)", nameEN="Long hair (2)"}
	},
	femaleDwarfHairStyle = {
		{id=0, nameDe="Glatze", nameEN="Bald head"},
		{id=1, nameDe="Zöpfe", nameEN="Braided hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEN="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEN="Long open hair"},
		{id=9, nameDe="Pferdeschwanz", nameEN="Ponytail"}
	
	}
}

halfingHairStyles = {
	maleHalfingHairStyle = {
		{id=1, nameDe="Kurze Haare", nameEN="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEN="Medium length hair"}
	},
	femaleHalfingHairStyle = {
		{id=1, nameDe="Mittellange, glatte Haare", nameEN="Medium length hair"},
		{id=2, nameDe="Mittellange, buschige Haare", nameEN="Medium bushy hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEN="Pinned up hair"},
		{id=9, nameDe="Pferdeschwanz", nameEN="Ponytail"}
	
	}
}

orcHairStyles = {
	maleOrcHairStyle = {
		{id=0, nameDe="Glatze", nameEN="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEN="Short hair"},
		{id=2, nameDe="Pferdeschwanz", nameEN="Ponytail"},
		{id=3, nameDe="Großes Gewusel", nameEN="Very messy hair"},
		{id=4, nameDe="Gewusel", nameEN="Messy hair"},
		{id=5, nameDe="Langer Pferdeschwanz", nameEN="Long ponytail"},
	},
	femaleOrcHairStyle = {}
}

hairStyles = {dwarfHairStyles, halfingHairStyles, elfHairStyles, orcHairStyles}
hairStyles[0] = humanHairStyles;


--Beard sytles by race

humanBeard = {}

dwarfBeard = {}