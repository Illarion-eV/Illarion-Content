humanHairStyles = {
	humanMaleHairStyle = {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEn="Medium length hair"},
		{id=3, nameDe="Lange Haare", nameEn="Long hair"}
	},
	humanFemaleHairStyle = {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Mittellange Haare", nameEn="Medium length hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEn="Long open hair"},
		{id=8, nameDe="Lange Zöpfe", nameEn="Long braided hair"}
	}
}

elfHairStyles = {
	maleElfHairStyle = {
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEn="Medium length hair"}
	},
	femaleElfHairStyle = {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Mittellange Haare", nameEn="Medium length hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEn="Long open hair"},
		{id=8, nameDe="Pferdeschwanz", nameEn="Ponytail"}
	
	}
}

dwarfHairStyles = {
	maleDwarfHairStyle = {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Lange Haare (1)", nameEn="Long hair (1)"},
		{id=3, nameDe="Lange Haare (2)", nameEn="Long hair (2)"}
	},
	femaleDwarfHairStyle = {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Zöpfe", nameEn="Braided hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEn="Long open hair"},
		{id=9, nameDe="Pferdeschwanz", nameEn="Ponytail"}
	
	}
}

halfingHairStyles = {
	maleHalfingHairStyle = {
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEn="Medium length hair"}
	},
	femaleHalfingHairStyle = {
		{id=1, nameDe="Mittellange, glatte Haare", nameEn="Medium length hair"},
		{id=2, nameDe="Mittellange, buschige Haare", nameEn="Medium bushy hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=9, nameDe="Pferdeschwanz", nameEn="Ponytail"}
	
	}
}

orcHairStyles = {
	maleOrcHairStyle = {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Pferdeschwanz", nameEn="Ponytail"},
		{id=3, nameDe="Großes Gewusel", nameEn="Very messy hair"},
		{id=4, nameDe="Gewusel", nameEn="Messy hair"},
		{id=5, nameDe="Langer Pferdeschwanz", nameEn="Long ponytail"},
	},
	femaleOrcHairStyle = {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
	}
}

hairStyles = {dwarfHairStyles, halfingHairStyles, elfHairStyles, orcHairStyles}
hairStyles[0] = humanHairStyles;


--Beard sytles by race

humanBeard = {
	{id= , nameDe="Kein Bart", nameEn="No beard"},
	{id= , nameDe="Backenbart", nameEn="Short beard"},
	{id= , nameDe="Spitzbart", nameEn="Goatee Beard"},
	{id= , nameDe="Bauschebart", nameEn="Square Beard"},
	{id= , nameDe="Lincolnbart", nameEn="Thin Beard"},
	{id= , nameDe="Vollbart", nameEn="Long Beard"},
	{id= , nameDe="Kaptainsbart", nameEn="Mutton Chops"}

}

dwarfBeard = {
	{id= , nameDe="Kein Bart", nameEn="No beard"},
	{id= , nameDe="Backenbart", nameEn="Short beard"},
	{id= , nameDe="Vollbart", nameEn="Long beard"},
	{id= , nameDe="Rauschebart", nameEn="Long thick beard"}
}

beardStyles = {dwarfBeard}
beardStyles[0] = humanBeard;