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
local lookat = require("base.lookat")

local M = {}

-- UPDATE items SET itm_script='item.paintings' WHERE itm_id IN (264, 265, 748, 749, 750, 751, 1914, 1915);

PaintingListGerman = 
{
"Das Gemälde zeigt eine Waldlichtung mit einem Schrein, voller Tiere und Feen.", 
"Das Gemälde zeigt einen jungen Mann beim Experimentieren mit der Alchemie.",
"Das Gemälde zeigt den weiten Ozean, rasende Wellen und ein Sturm breiten sich dort aus.",
"Das Gemälde zeigt das Abbild eines Halblings bei der Gartenarbeit.",
"Das Gemälde zeigt wie Halblinge bei einem Fest zusammen lachen und tanzen.",
"Das Gemälde zeigt eine Frau die ihren Körper mit Seidentüchern verdeckt.",
"Das Gemälde zeigt eine Gruppe von Musikern auf einem belebtem Marktplatz.",
"Das Gemälde zeigt einen alten Mann mit Wanderstock den Wald entlang gehen, der nach Kräutern Ausschau hält.",
"Das Gemälde zeigt eine nackte Elfe in einer Muschel." ,
"Das Gemälde zeigt eine Elfe alleine den Strand entlang gehend.",
"Das Gemälde zeigt ein Panorama einer großen Festung.",
"Das Gemälde zeigt ein Panorama einer alten, zerstörten Brücke.",
"Das Gemälde zeigt einen Elfen, der seinen Bogen schussbereit gespannt hat.",
"Das Gemälde zeigt ein verschwommenes, nicht identifizierbares Bild.",
"Das Gemälde zeigt einen Herzog auf seinem Thron, um ihm sein Gefolge.",
"Das Gemälde zeigt einen Taschendieb, der sich während eines Festes an die Habseligkeiten anderer hermacht.",
"Das Gemälde zeigt eine nackte Elfenfrau, umhüllt mit Sträuchern und Blättern des Waldes.",
"Das Gemälde zeigt einen zersausten Propheten, der von einer Menschenmenge umgeben ist.",
"Das Gemälde zeigt eine blutige Schlacht zwischen Orks und Menschen.",
"Das Gemälde zeigt zwei Orks beim Zweikampf um ein Orkweibchen.",
"Das Gemälde zeigt einen Orkschamanen beim Zubereiten eines geheimnissvolllen Trankes.",
"Das Gemälde zeigt eine Schatzkammer voller Juwelen und Gold, eine Ratte schleicht sich durch ein Loch herein.",
"Das Gemälde zeigt einen Magier der einen Feuerball zu dir wirft.",
"Das Gemälde zeigt einen Gelehrten beim durchstöbern einer Bibiliothek.",
"Das Gemälde zeigt eine Horde Untote aus ihrem ewigen Schlaf auferstehen, ein gebrechlicher Nekromant steht in der Mitte mit einer befehlenden Geste.",
"Das Gemälde zeigt eine Halblingsdame beim Angeln, der Fisch wehrt sich gewaltig und die Halblingsdame setzt eine große Kraft ein.",
"Das Gemälde zeigt die Landkarte Gobaiths.",
"Das Gemälde zeigt die Landkarte Illarions.",
"Das Gemälde zeigt eine alte zerschlissene Karte.",
"Das Gemälde zeigt einen betrunkenen, dickbäuchigen Mann beim Philosophieren. Ein Passant wirft ihm eine Münze zu.",
"Das Gemälde zeigt einen vernarbten Ork, der dich grimmig ansieht.",
"Das Gemälde zeigt eine Gruppe von Orks beim Feiern des Radosh.",
"Das Gemälde zeigt einen Zwergen, der nach langem Graben einen Edelstein entdeckt hat, ungläubig starrt er ihn an.",
"Das Gemälde zeigt eine Zwergenfrau, beim Schmieden einer Axt.",
"Das Gemälde zeigt eine Gruppe von Zwergen beim Wetttrinken.",
"Das Gemälde zeigt einen Zwergen der einen Rubin begutachtet, ein anderer Zwerg scheint auf eine Antwort zu warten und wedelt bereits mit einem kleinem Beutel.",
"Das Gemälde zeigt ein Panorama einer alten Ruine.",
"Das Gemälde zeigt des Nachts eine Gruppe von Goblins, die in deine Richtung starren.",
"Das Gemälde zeigt wie ein Goblin in Gynk mit einem Menschen verhandelt.",
"Das Gemälde zeigt wie zwei Gnome an einem großem Konstrukt arbeiten, du erkennst nicht, was es darstellen soll.",
"Das Gemälde zeigt ein verlaufenes Bild, es scheint so, als ob eine Fee zentriert im Bild wäre.",
"Das Gemälde zeigt wie ein Elf in den Wald hineinstarrt, du erkennst, dass sich im Wald etwas versteckt, das Ausschau nach dem Elfen hält.",
"Das Gemälde zeigt wie eine Echse aus dem Wasser auftaucht."
};

PaintingListEnglish = 
{
"The painting shows a clearing with a shrine that's full of animals and fairies.",
"The painting shows a young man, experimenting with alchemy.",
"The painting shows a wide ocean, wild waves and a storm are spreading everywhere.",
"The painting shows a picture of an halfling, working in the garden.",
"The painting shows halflings laughing and dancing together at a party.",
"The painting shows a woman who covers her body in silk cloth." ,
"The painting shows a group of musicians on a lively marketplace." ,
"The painting shows an old man with a walking cane going through the forest, looking out for herbs.", 
"The painting shows a naked elfess in a shell." ,
"The painting shows a lonely elfess walking along the beach." ,
"The painting shows the panorama of a great fortress." ,
"The painting shows the panorama of an old, destroyed bridge." ,
"The painting shows an elf with his bow ready to shoot." ,
"The painting shows a blurred picture, which you can't seem to identify." ,
"The painting shows a duke sitting on his throne, surrounded by his retinue." ,
"The painting shows a pickpocket on a festival, who pounces on the belongings of others." ,
"The painting shows a naked elfess surrounded by bushes and leaves from the forest." ,
"The painting shows a dishevelled prophet surrounded by a crowd of humans." ,
"The painting shows a bloody battle between orcs and humans." ,
"The painting shows two orcs fighting a duel for an orcess." ,
"The painting shows an orc shaman, brewing a mysterious potion." ,
"The painting shows a treasury filled with jewels and gold, and a rat which sneaks through a hole." ,
"The painting shows a mage, throwing a fireball at you." ,
"The painting shows a scholar, ransacking a library." ,
"The painting shows a horde of undead raising from their eternal sleep; A fragile necromancer is standing in the middle with commanding gesture." ,
"The painting shows a fishing halfling woman. She has big trouble to cope with the struggling fish." ,
"The painting shows a map of Gobaith." ,
"The painting shows a map of Illarion." ,
"The painting shows an old, tattered map." ,
"The painting shows a drunk, paunchy man whilst he is philosophising. A passerby throws a coin to him." ,
"The painting shows a scarred orc who looks grimly at you." ,
"The painting shows a group of orcs celebrating Radosh." ,
"The painting shows a dwarf who has found a gem after a long period of mining - He gazes at it in disbelieve." ,
"The painting shows a female dwarf, forging an axe." ,
"The painting shows a group of dwarves in a drinking contest." ,
"The painting shows a dwarf examining a ruby. Another dwarf seems to wait for an answer and waggles with a pouch." ,
"The painting shows the panorama of an ancient ruin." ,
"The painting shows a group of Goblins at night, staring at you.", 
"The painting shows a Goblin negotiating with a human in Gynk." ,
"The painting shows two Gnomes working on a big construct, you are not able to make out what it could be." ,
"The painting shows a smeared painting. It appears as if a fairy is placed in the middle of the picture." ,
"The painting shows an elf who stares into the forest and you recognize that something is hiding and lurking inside." ,
"The painting shows a lizard coming up from the water.",
};    
			  

function M.LookAtItem(User, Item)
    
    local lookAt = lookat.GenerateLookAt(User, Item)
    if lookAt.description == "" then
        val = ((Item.pos.x + Item.pos.y + Item.pos.z) % #PaintingListGerman)+1;
        lookAt.description = common.GetNLS(User, PaintingListGerman[val], PaintingListEnglish[val])
    end

    return lookAt
end
return M

