require("base.books")

module("druids.content.ruby", package.seeall())

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
    base.books.AddGermanBookText("Das Rot der Rubine wird von Kriegern wie auch von den Anhängern der Flamme Irmoroms gleichermaßen geschätzt und bewundert. Krieger glauben, das sie dadurch ihr Kampfgeschick stärken.",0,0,toData);
    base.books.AddGermanBookText("Die Anhänger Irmoroms hingegen sind davon überzeugt, dass die Kräfte des Rubins ihr handwerkliches Können steigern.",0,0,toData);
    base.books.AddGermanBookText("Waffen:\n\nLeitet man die magischen Energien eines Rubins in eine Waffe,so verstärkt man dadurch deren natürliche Angriffskraft.",2627,0,toData);
    base.books.AddGermanBookText("Rüstungen und Schilde:\n\nIn Rüstungen wie auch in Schilden bewirken die magischen Energien einen zusätzlichen Schutz vor Hiebschaden.",917,0,toData);
    base.books.AddGermanBookText("Magierstäbe:\n\nFließen Rubinenergien durch einen Magierstab, so steigert dies die Kampfmagie des Trägers.",323,0,toData);
    base.books.AddGermanBookText("Werkzeuge:\n\nVerwendet man ein Werkzeug, durch das die magischen Energien eines Rubins fließen so ist dies förderlich für das handwerkliche Talent.",102,0,toData);
    base.books.AddGermanBookText("Schmuckstücke:\n\nSchmuckstücke in denen die magische Energie von Rubinen fließt steigern die Geschicklichkeit des Trägers.",67,0,toData);
    base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Rubins in ein Schmuckstück fließen lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddEnglishBookTitle("Book with the title \"Ruby\"",toData);
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Rubine\"",toData);
end;