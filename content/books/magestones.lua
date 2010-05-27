require("base.books")

module("content.books.magestones", package.seeall)

-- This file contains the book data for the book "Magic stones"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);

    base.books.AddEnglishBookText("Magic stones and their usage",0,0,toData);
    base.books.AddEnglishBookText("Magic stones are the rarest kind of gems in the whole world.",0,0,toData);
    base.books.AddEnglishBookText("The stronger the magic power of such a stone is, the rarer and more valuable it is.",0,0,toData);
    base.books.AddEnglishBookText("Transform at an altar of one of the five gods. Thereby, 3 stones of the same quality result in a stone of higher quality.",0,0,toData);
    base.books.AddEnglishBookText("The transformation of such stones does not always work. The higher the quality you want to reach, the higher the possibility that the transformation fails.",0,0,toData);
    base.books.AddEnglishBookText("Stones with magic attributes can be used to transfer their powers onto certain objects.",0,0,toData);
    base.books.AddEnglishBookText("However, this is only possible when the object is receptive for this kind of magic energies.",0,0,toData);
    base.books.AddEnglishBookText("Axiomatically, an object can only store a certain amount of magic energy.",0,0,toData);
    base.books.AddEnglishBookText("Once transmitted, the magic energy of the stones cannot be removed from the object anymore, neither can it be superimposed by other energies.",0,0,toData);
    base.books.AddEnglishBookText("Axiomatically, weapons, armors, magic wands and tools can store the energies of two stones.",0,0,toData);
    base.books.AddEnglishBookText("Trinkets, however, can only store the energies of one single stone.",0,0,toData);
    base.books.AddEnglishBookText("Additionally, it may be that the energies of the magic stones have to match with stones embedded in the item.",0,0,toData);


    base.books.AddGermanBookText("Magische Steine und ihre Verwendung",0,0,toData);
    base.books.AddGermanBookText("Magische Steine sind die wohl am seltensten vorkommenden Edelsteine auf der Welt.",0,0,toData);
    base.books.AddGermanBookText("Je st�rker die magische Kraft eines solchen Steines ist, desto seltender und wertvoller ist er.",0,0,toData);
    base.books.AddGermanBookText("Man kann magische Edelsteine am Alter eines der f�nf alten G�tter umwandeln. Dabei ergeben immer 3 Steine gleicher St�rke einen Stein von h�herer Qualit�t.",0,0,toData);
    base.books.AddGermanBookText("Das Umwandeln solcher Steine gelingt nicht immer. Je h�her die Qualit�t ist, die erreicht werden soll, desto gr��er ist die Gefahr dass der Umwandlungsversuch fehlschl�gt.",0,0,toData);
    base.books.AddGermanBookText("Steine mit magischen Eigenschaften k�nnen dazu genutzt werden um die ihnen innewohnenden Kr�fte auf bestimmte Gegenst�nde zu �bertragen.",0,0,toData);
    base.books.AddGermanBookText("Dies ist allerdings nur dann m�glich, wenn der Gegenstand f�r solche Art von magischen Energien empf�nglich ist.",0,0,toData);
    base.books.AddGermanBookText("Grunds�tzlich gilt, dass jeder Gegenstand nur eine gewisse Menge magischer Energie aufnehmen kann.",0,0,toData);
    base.books.AddGermanBookText("Einmal �bertragen, kann die magische Energie der Steine nicht mehr aus dem Gegenstand entfernt oder oder mit anderen Energien �berlagert werden.",0,0,toData);
    base.books.AddGermanBookText("Grunds�tzlich l�sst sich sagen, dass Waffen, R�stungen, Magierst�be und Werkzeuge die Engerien von zwei Steinen aufnehmen k�nnen.",0,0,toData);
    base.books.AddGermanBookText("In Ringe hingegen kann lediglich die Energien eines Steines �bertragen werden.",0,0,toData);
    base.books.AddGermanBookText("Zudem ist bei diesen auch zu beachten, dass sich die Energien der magischen Steine mit ggf. eingesetzten Steinen gleichen muss.",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Magische Steine\"",toData);
    base.books.AddEnglishBookTitle("Book with the title \"Magic stones\"",toData);
end;