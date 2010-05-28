require("base.common")

module("item.id_paintings", package.seeall)

-- UPDATE common SET com_script='item.id_paintings' WHERE com_itemid IN (264, 265, 748, 749, 750, 751, 1914, 1915);

PaintingListGerman = 
{
"Du siehst eine Waldlichtung mit einem Schrein, voller Tiere und Feen.", 
"Du siehst einen jungen Mann beim Experimentieren mit der Alchemie.",
"Du siehst den weiten Ozean, rasende Wellen und ein Sturm breiten sich dort aus.",
"Du siehst das Abbild eines Halblings bei der Gartenarbeit.",
"Du siehst wie Halblinge bei einem Fest zusammen lachen und tanzen.",
"Du siehst eine Frau die ihren K�rper mit Seident�chern verdeckt.",
"Du siehst eine Gruppe von Musikern auf einem belebtem Marktplatz.",
"Du siehst einen alten Mann mit Wanderstock den Wald entlang gehen, der nach Kr�utern Ausschau h�lt.",
"Du siehst eine nackte Elfe in einer Muschel." ,
"Du siehst eine Elfe alleine den Strand entlang gehend.",
"Du siehst ein Panorama einer gro�en Festung.",
"Du siehst ein Panorama einer alten, zerst�rten Br�cke.",
"Du siehst einen Elfen, der seinen Bogen schussbereit gespannt hat.",
"Du siehst ein verschwommenes, nicht identifizierbares Bild.",
"Du siehst einen Herzog auf seinem Thron, um ihm sein Gefolge.",
"Du siehst einen Taschendieb, der sich w�hrend eines Festes an die Habseligkeiten anderer hermacht.",
"Du siehst eine nackte Elfenfrau, umh�llt mit Str�uchern und Bl�ttern des Waldes.",
"Du siehst einen zersausten Propheten, der von einer Menschenmenge umgeben ist.",
"Du siehst eine blutige Schlacht zwischen Orks und Menschen.",
"Du siehst zwei Orks beim Zweikampf um ein Orkweibchen.",
"Du siehst einen Orkschamanen beim Zubereiten eines geheimnissvolllen Trankes.",
"Du siehst eine Schatzkammer voller Juwelen und Gold, eine Ratte schleicht sich durch ein Loch herein.",
"Du siehst einen Magier der einen Feuerball zu dir wirft.",
"Du siehst einen Gelehrten beim durchst�bern einer Bibiliothek.",
"Du siehst eine Horde Untote aus ihrem ewigen Schlaf auferstehen, ein gebrechlicher Nekromant steht in der Mitte mit einer befehlenden Geste.",
"Du siehst eine Halblingsdame beim Angeln, der Fisch wehrt sich gewaltig und die Halblingsdame setzt eine gro�e Kraft ein.",
"Du siehst die Landkarte Gobaiths.",
"Du siehst die Landkarte Illarions.",
"Du siehst eine alte zerschlissene Karte.",
"Du siehst einen betrunkenen, dickb�uchigen Mann beim Philosophieren. Ein Passant wirft ihm eine M�nze zu.",
"Du siehst einen vernarbten Ork, der dich grimmig ansieht.",
"Du siehst eine Gruppe von Orks beim Feiern des Radosh.",
"Du siehst einen Zwergen, der nach langem Graben einen Edelstein entdeckt hat, ungl�ubig starrt er ihn an.",
"Du siehst eine Zwergenfrau, beim Schmieden einer Axt.",
"Du siehst eine Gruppe von Zwergen beim Wetttrinken.",
"Du siehst einen Zwergen der einen Rubin begutachtet, ein anderer Zwerg scheint auf eine Antwort zu warten und wedelt bereits mit einem kleinem Beutel.",
"Du siehst ein Panorama einer alten Ruine.",
"Du siehst des Nachts eine Gruppe von Goblins, die in deine Richtung starren.",
"Du siehst wie ein Goblin in Gynk mit einem Menschen verhandelt.",
"Du siehst wie zwei Gnome an einem gro�em Konstrukt arbeiten, du erkennst nicht, was es darstellen soll.",
"Du siehst ein verlaufenes Bild, es scheint so, als ob eine Fee zentriert im Bild w�re.",
"Du siehst wie ein Elf in den Wald hineinstarrt, du erkennst, dass sich im Wald etwas versteckt, das Ausschau nach dem Elfen h�lt.",
"Du siehst wie eine Echse aus dem Wasser auftaucht."
};

PaintingListEnglish = 
{
"You see a clearing with a shrine that's full of animals and fairies.",
"You see a young man, experimenting with alchemy.",
"You see a wide ocean, wild waves and a storm are spreading everywhere.",
"You see a picture of an halfling, working in the garden.",
"You see halflings laughing and dancing together at a party.",
"You see a woman who covers her body in silk cloth." ,
"You see a group of musicians on a lively marketplace." ,
"You see an old man with a walking cane going through the forest, looking out for herbs.", 
"You see a naked elfess in a shell." ,
"You see a lonely elfess walking along the beach." ,
"You see the panorama of a great fortress." ,
"You see the panorama of an old, destroyed bridge." ,
"You see an elf with his bow ready to shoot." ,
"You see a blurred picture, which you can't seem to identify." ,
"You see a duke sitting on his throne, surrounded by his retinue." ,
"You see a pickpocket on a festival, who pounces on the belongings of others." ,
"You see a naked elfess surrounded by bushes and leaves from the forest." ,
"You see a dishevelled prophet surrounded by a crowd of humans." ,
"You see a bloody battle between orcs and humans." ,
"You see two orcs fighting a duel for an orcess." ,
"You see an orc shaman, brewing a mysterious potion." ,
"You see a treasury filled with jewels and gold, and a rat which sneaks through a hole." ,
"You see a mage, throwing a fireball at you." ,
"You see a scholar, ransacking a library." ,
"You see a horde of undead raising from their eternal sleep; A fragile necromancer is standing in the middle with commanding gesture." ,
"You see a fishing halfling woman. She has big trouble to cope with the struggling fish." ,
"You see a map of Gobaith." ,
"You see a map of Illarion." ,
"You see an old, tattered map." ,
"You see a drunk, paunchy man whilst he is philosophising. A passerby throws a coin to him." ,
"You see a scarred orc who looks grimly at you." ,
"You see a group of orcs celebrating Radosh." ,
"You see a dwarf who has found a gem after a long period of mining - He gazes at it in disbelieve." ,
"You see a female dwarf, forging an axe." ,
"You see a group of dwarves in a drinking contest." ,
"You see a dwarf examining a ruby. Another dwarf seems to wait for an answer and waggles with a pouch." ,
"You see the panorama of an ancient ruin." ,
"You see a group of Goblins at night, staring at you.", 
"You see a Goblin negotiating with a human in Gynk." ,
"You see two Gnomes working on a big construct, you are not able to make out what it could be." ,
"You see a smeared painting. It appears as if a fairy is placed in the middle of the picture." ,
"You see an elf who stares into the forest and you recognize that something is hiding and lurking inside." ,
"You see a lizard coming up from the water.",
};


function LookAtPaintingItem( User, Item )
    local val = 0;
    if ( Item.data == 0 ) then
        val = ((Item.pos.x + Item.pos.y + Item.pos.z) % table.getn(PaintingListGerman))+1;
    else
        val = (Item.data % table.getn(PaintingListGerman))+1;
    end
    
    world:itemInform( User, Item, base.common.GetNLS(User, PaintingListGerman[val], PaintingListEnglish[val]) );
end

function LookAtItem(User,Item)
    LookAtPaintingItem(User,Item);
end