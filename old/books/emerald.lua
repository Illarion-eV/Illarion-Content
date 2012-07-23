require("base.books")

module("druid.content.emerald", package.seeall)

-- This file contains the book data for the book "Emeralds"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);

    base.books.AddEnglishBookText("\n\n~~Emeralds~~",45,0,toData);
    base.books.AddEnglishBookText("The green of emeralds often reminds of the fresh green of a spring meadow or a summerforest. It is therefore not too surprising that these stones are likely to be used by poeple with a close bond to nature.",0,0,toData);
    base.books.AddEnglishBookText("The powers of magic emeralds are different, depending on the object they are attached to. It is said that they can help in sharpening the bearer's senses in order to provide a better perception.",0,0,toData);
    base.books.AddEnglishBookText("Weapons: Emerald energies flowing through a weapon can provide a better aim. This is very helpful not only for distance weapons.",2780,0,toData);
    base.books.AddEnglishBookText("Armor and Shields: Used on Armor or Shielding, emerald powers can protect from piercing damage.",20,0,toData);
    base.books.AddEnglishBookText("Magic Wands: Emerald energies can bundle the bearer's powers and therefore enable a higher casting range.",76,0,toData);
    base.books.AddEnglishBookText("Tools: If one uses emerald power on tools, a higher durability of the items crafted by the tool can be achieved.",172,0,toData);
    base.books.AddEnglishBookText("Trinkets: If you bear a trinket with the energy of an emerald, you will be able to percept your surrounding better.",62,0,toData);
    base.books.AddEnglishBookText("There is one important thing to note: One should never let the energies of a Emerald flow into a trinket in which there is another stone embedded.",0,0,toData);

    base.books.AddGermanBookText("\n\n~~Smaragde~~",45,0,toData);
    base.books.AddGermanBookText("Das Grün der Smaragde erinnert oft an das frische Grün einer Frühlingswiese oder eines Sommerwaldes. Darum ist es nicht verwunderlich, dass diese Steine häufig von naturverbundenen Personen getragen werden.",0,0,toData);
    base.books.AddGermanBookText("Die Kräfte magischer Smaragde sind je nach Gegenstand, auf den sie übertragen werden unterschiedlich. Es lässt sich jedoch oft erkennen, dass sie helfen sich und die Umgebung besser wahrzunehmen.",0,0,toData);
    base.books.AddGermanBookText("Waffen:\n\nüberträgt man die magischen Kräfte eines Smaragdes auf eine Waffe, so steigert sie die Zielgenauigkeit der Waffe. Besonders bei Fernkampfwaffen ist dies ein nicht zu unterschätzender Vorteil.",2780,0,toData);
    base.books.AddGermanBookText("Rüstungen und Schilde:\n\nAuf ein Rüstungsteil oder ein Schild übertragen schützen die magischen Kräfte eines Smaragdes zusätzlich vor Stichschaden.",20,0,toData);
    base.books.AddGermanBookText("Magierstäbe:\n\nSmaragdenergien in einem Magierstab bündeln die Kräfte des Trägers und erlauben es ihm so seine Zauber mit größerer Reichweite zu sprechen.",76,0,toData);
    base.books.AddGermanBookText("Werkzeuge:\n\nVerstärkt man ein Werkzeug mit der magischen Energie eines Smaragdes, so wird man feststellen, dass die Gegenstände die man mit diesem Werkzeug herstellt eine größere Haltbarkeit aufweisen.",172,0,toData);
    base.books.AddGermanBookText("Schmuckstücke:\n\nTrägt man ein Schmuckstück, welches Smaragdenergien enthält, so kann man seine Umgebung besser wahrnehmen. ",62,0,toData);
    base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Smaragdes in ein Schmuckstück fließen lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddEnglishBookTitle("Book with the title \"Emeralds\"",toData);
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Smaragde\"",toData);
end;
