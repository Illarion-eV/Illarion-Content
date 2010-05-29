require("base.books")

module("druid.content.amethyst", package.seeall)

-- This file contains the book data for the book "Amethyst"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);

    base.books.AddEnglishBookText("\n\n~~Amethysts~~",197,0,toData);
    base.books.AddEnglishBookText("Be it the archer, the mounted envoy or the mariner - Everyone who wants the winds on his side uses the energies of amethysts.",0,0,toData);
    base.books.AddEnglishBookText("If you carry an object with amethyst energies flowing in it, you feel as if everything you start is carried out faster.",0,0,toData);
    base.books.AddEnglishBookText("Weapons:\n\nUsed on a weapon, amethyst energies enhance the speed with which you can swing your arm.",2739,0,toData);
    base.books.AddEnglishBookText("Armor and Shields:\n\nThe powers of amethysts appear to lower the weight of armor and shield, causing the ability of faster movement for the carrier.",2284,0,toData);
    base.books.AddEnglishBookText("Magic wands:\n\nMagic wands with amethyst magic use to literally unfasten your tongue - All the spells appear to be casted faster.",2785,0,toData);
    base.books.AddEnglishBookText("Tools:\n\nWorking with an amethyst-based tool makes your work somehow more easy and faster.",313,0,toData);
    base.books.AddEnglishBookText("Trinkets:\n\nTrinkets with amethyst energies happen to make their bearer faster.",79,0,toData);
    base.books.AddEnglishBookText("There is one important thing to note: One should never let the energies of an amethyst flow into a trinket in which there is another stone embedded.",0,0,toData);

    base.books.AddGermanBookText("\n\n~~Amethysten~~",197,0,toData);
    base.books.AddGermanBookText("Ob Bogensch�tze, Botenreiter oder Seeman...jeder, der sich die Winde zum Freund machen will schw�rt auf die Energien von magischen Amethysten.",0,0,toData);
    base.books.AddGermanBookText("Tr�gt man einen Gegenstand am K�rper, in denen Amethystenergien flie�en, so hat man das Gef�hl, dass einem alles schneller von der Hand geht.",0,0,toData);
    base.books.AddGermanBookText("Waffen:\n\n�bertr�gt man die magischen Energien eines Amethysten auf eine Waffe, so steigert man damit die Geschwindigkeit in der man diese Waffe zu f�hren vermag.",2739,0,toData);
    base.books.AddGermanBookText("R�stungen und Schilde:\n\nSowohl in R�stungen als auch in Schilden erleichtern Amethystenergien das Gewicht und die Tragbarkeit dieser Gegenst�nde, so dass man das Gef�hl hat, dass man sich leichter und schneller bewegen kann.",2284,0,toData);
    base.books.AddGermanBookText("Magierst�be:\n\nMagierst�be, durch die Amethystenergien flie�en locker im wahrsten Sinne des Wortes die Zunge des Tr�gers. Alle Spr�che scheinen ihnen schneller von den Lippen zu gleiten, als es sonst m�glich w�re.",2785,0,toData);
    base.books.AddGermanBookText("Werkzeuge:\n\nAlle Arbeiten scheinen einen viel leichter und schneller von der Hand zu gehen, wenn man ein Werkzeug benutzt, durch das die magischen Energien von Amethysten flie�en.",313,0,toData);
    base.books.AddGermanBookText("Schmuckst�cke:\n\nSchmuckst�cke, durch die Amethystenergien flie�en machen den Tr�ger schneller.",79,0,toData);
    base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Amethysten in ein Schmuckst�ck flie�en lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddEnglishBookTitle("Book with the title \"Amethyst\"",toData);
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Amethysten\"",toData);
end;