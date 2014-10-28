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

humanHairStyles = {
	{
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEn="Medium length hair"},
		{id=3, nameDe="Lange Haare", nameEn="Long hair"}
	},
	{
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Mittellange Haare", nameEn="Medium length hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEn="Long open hair"},
		{id=8, nameDe="Lange Zöpfe", nameEn="Long braided hair"}
	}
}

elfHairStyles = {
	{
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEn="Medium length hair"}
	},
	 {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Mittellange Haare", nameEn="Medium length hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEn="Long open hair"},
		{id=8, nameDe="Pferdeschwanz", nameEn="Ponytail"}
	
	}
}

dwarfHairStyles = {
	 {
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Lange Haare (1)", nameEn="Long hair (1)"},
		{id=3, nameDe="Lange Haare (2)", nameEn="Long hair (2)"}
	},
	{
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Zöpfe", nameEn="Braided hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEn="Long open hair"},
		{id=9, nameDe="Pferdeschwanz", nameEn="Ponytail"}
	
	}
}

halfingHairStyles = {
	{
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Mittellange Haare", nameEn="Medium length hair"}
	},
	{
		{id=1, nameDe="Mittellange, glatte Haare", nameEn="Medium length hair"},
		{id=2, nameDe="Mittellange, buschige Haare", nameEn="Medium bushy hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=9, nameDe="Pferdeschwanz", nameEn="Ponytail"}
	
	}
}

orcHairStyles = {
	{
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=2, nameDe="Pferdeschwanz", nameEn="Ponytail"},
		{id=3, nameDe="Großes Gewusel", nameEn="Very messy hair"},
		{id=4, nameDe="Gewusel", nameEn="Messy hair"},
		{id=5, nameDe="Langer Pferdeschwanz", nameEn="Long ponytail"}
	},
	{
		{id=0, nameDe="Glatze", nameEn="Bald head"},
		{id=1, nameDe="Kurze Haare", nameEn="Short hair"},
		{id=4, nameDe="Hochgesteckte Haare", nameEn="Pinned up hair"},
		{id=7, nameDe="Lange, offene Haare", nameEn="Long open hair"}
	}
}

M.hairStyles = {dwarfHairStyles, halfingHairStyles, elfHairStyles, orcHairStyles}
M.hairStyles[0] = humanHairStyles;


--Beard sytles by race

humanBeard = {
	{id=0 , nameDe="Kein Bart", nameEn="No beard"},
	{id=1 , nameDe="Backenbart", nameEn="Short beard"},
	{id=3 , nameDe="Spitzbart", nameEn="Goatee Beard"},
	{id=4 , nameDe="Bauschebart", nameEn="Square Beard"},
	{id=5 , nameDe="Lincolnbart", nameEn="Thin Beard"},
	{id=6 , nameDe="Vollbart", nameEn="Long Beard"},
	{id=8 , nameDe="Kaptainsbart", nameEn="Mutton Chops"}

}

dwarfBeard = {
	{id=0 , nameDe="Kein Bart", nameEn="No beard"},
	{id=1 , nameDe="Backenbart", nameEn="Short beard"},
	{id=2 , nameDe="Vollbart", nameEn="Long beard"},
	{id=4 , nameDe="Rauschebart", nameEn="Long thick beard"}
}

M.beardStyles = {dwarfBeard}
M.beardStyles[0] = humanBeard;

return M