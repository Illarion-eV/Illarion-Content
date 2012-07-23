require("base.books")

module("druid.content.ruby", package.seeall)

-- This file contains the book data for the book "Ruby"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);

    base.books.AddEnglishBookText("\n\n~~Ruby~~",46,0,toData);
    base.books.AddEnglishBookText("The red colour of rubys is admired and appreciated by warriors and followers of the flame of irmorom in the same measure. Warriors believe that the power of rubys can raise their fighting skills.",0,0,toData);
    base.books.AddEnglishBookText("Followers of Irmorom, on the other hand, are confident that rubys can enhance their crafting skills.",0,0,toData);
    base.books.AddEnglishBookText("Weapons:\n\nIf one focuses the magic energies of a ruby in a weapon, its natural chraging power is raised.",2627,0,toData);
    base.books.AddEnglishBookText("Armors and Shields:\n\nThe magic energies of rubys can provide additional protection from concussion blows.",917,0,toData);
    base.books.AddEnglishBookText("Magic wands:\n\nIf ruby energies flow through a wand, the battle magic of the bearer is strenghtened.",323,0,toData);
    base.books.AddEnglishBookText("Tools:\n\nIf you use a tool which is holding the powers of a ruby, your craftsmanship talents can be enhanced.",102,0,toData);
    base.books.AddEnglishBookText("Trinkets:\n\nTrinkets that store the magic energy of Rubys use to raise the dexterity of the bearer.",67,0,toData);
    base.books.AddEnglishBookText("There is one important thing to note: One should never let the energies of a Ruby flow into a trinket in which there is another stone embedded.",0,0,toData);

    base.books.AddGermanBookText("\n\n~~Rubine~~",46,0,toData);
    base.books.AddGermanBookText("Das Rot der Rubine wird von Kriegern wie auch von den Anhï¿½ngern der Flamme Irmoroms gleichermaï¿½en geschï¿½tzt und bewundert. Krieger glauben, das sie dadurch ihr Kampfgeschick Stärken.",0,0,toData);
    base.books.AddGermanBookText("Die Anhï¿½nger Irmoroms hingegen sind davon ï¿½berzeugt, dass die Krï¿½fte des Rubins ihr handwerkliches können steigern.",0,0,toData);
    base.books.AddGermanBookText("Waffen:\n\nLeitet man die magischen Energien eines Rubins in eine Waffe,so verstï¿½rkt man dadurch deren natürliche Angriffskraft.",2627,0,toData);
    base.books.AddGermanBookText("Rüstungen und Schilde:\n\nIn Rüstungen wie auch in Schilden bewirken die magischen Energien einen zusï¿½tzlichen Schutz vor Hiebschaden.",917,0,toData);
    base.books.AddGermanBookText("Magierstï¿½be:\n\nFlieï¿½en Rubinenergien durch einen Magierstab, so steigert dies die Kampfmagie des Trï¿½gers.",323,0,toData);
    base.books.AddGermanBookText("Werkzeuge:\n\nVerwendet man ein Werkzeug, durch das die magischen Energien eines Rubins flieï¿½en so ist dies fï¿½rderlich für das handwerkliche Talent.",102,0,toData);
    base.books.AddGermanBookText("Schmuckstï¿½cke:\n\nSchmuckstï¿½cke in denen die magische Energie von Rubinen flieï¿½t steigern die Geschicklichkeit des Trï¿½gers.",67,0,toData);
    base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Rubins in ein Schmuckstï¿½ck flieï¿½en lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddEnglishBookTitle("Book with the title \"Ruby\"",toData);
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Rubine\"",toData);
end;
