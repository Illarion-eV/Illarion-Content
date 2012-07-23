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
    base.books.AddGermanBookText("Ob Bogenschütze, Botenreiter oder Seeman...jeder, der sich die Winde zum Freund machen will schwört auf die Energien von magischen Amethysten.",0,0,toData);
    base.books.AddGermanBookText("Trägt man einen Gegenstand am Körper, in denen Amethystenergien fließen, so hat man das Gefühl, dass einem alles schneller von der Hand geht.",0,0,toData);
    base.books.AddGermanBookText("Waffen:\n\nüberträgt man die magischen Energien eines Amethysten auf eine Waffe, so steigert man damit die Geschwindigkeit in der man diese Waffe zu führen vermag.",2739,0,toData);
    base.books.AddGermanBookText("Rüstungen und Schilde:\n\nSowohl in Rüstungen als auch in Schilden erleichtern Amethystenergien das Gewicht und die Tragbarkeit dieser Gegenstände, so dass man das Gefühl hat, dass man sich leichter und schneller bewegen kann.",2284,0,toData);
    base.books.AddGermanBookText("Magierstäbe:\n\nMagierstäbe, durch die Amethystenergien fließen locker im wahrsten Sinne des Wortes die Zunge des Trägers. Alle Sprüche scheinen ihnen schneller von den Lippen zu gleiten, als es sonst möglich wäre.",2785,0,toData);
    base.books.AddGermanBookText("Werkzeuge:\n\nAlle Arbeiten scheinen einen viel leichter und schneller von der Hand zu gehen, wenn man ein Werkzeug benutzt, durch das die magischen Energien von Amethysten fließen.",313,0,toData);
    base.books.AddGermanBookText("Schmuckstücke:\n\nSchmuckstücke, durch die Amethystenergien fließen machen den Träger schneller.",79,0,toData);
    base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Amethysten in ein Schmuckstück fließen lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddEnglishBookTitle("Book with the title \"Amethyst\"",toData);
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Amethysten\"",toData);
end;
