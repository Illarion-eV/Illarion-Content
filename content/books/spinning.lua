require("base.books")

module("content.books.spinning", package.seeall)

-- This file contains the book data for the book "Three Guiding Truths"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);
    
    base.books.AddGermanBookText("\n \n \n ~~~Spinner und Weber~~~ \n \n \n von Trudel Fadenschein",47,0,toData);
    base.books.AddGermanBookText("Lange, weiï¿½e, wollene Fï¿½den werden bevorzugt um einen feinen, starken Stoff zu weben, der wesentlich besser gefï¿½rbt werden kann.",178,5,toData);
    base.books.AddGermanBookText("Gewaltsam jemanden den Hut wegzunehmen wird als eine große Beleidigung angesehen, besonders von Frauen.",357,20,toData);
    base.books.AddGermanBookText("Um reiche Edelleute attraktiver zu machen, sollten Schneider Bekleidung in roter und schwarzer Farbe anbieten, da dies die teuersten und privilegiertesten Farben sind.",2681,50,toData);
    base.books.AddGermanBookText("Die Wolle, die sich die meisten leisten können, ist blau und grï¿½n und wird von der Mittelklasse getragen.",2679,80,toData);
    base.books.AddGermanBookText("Ein guter Schneider misst jeden Kunden aus und macht gewöhnlich alle Art von Kleidung.",0,100,toData);

    base.books.AddEnglishBookText("\n \n \n Spinning And Weaving \n \n from Trudel Fadenschein",47,0,toData);
    base.books.AddEnglishBookText("Long, white wool fibers are preferred as they make a stronger, finer cloth that can be dyed more brilliantly.",178,5,toData);
    base.books.AddEnglishBookText("To forcibly remove someone's hat is great insult, especially to women.",357,20,toData);
    base.books.AddEnglishBookText("To attract wealthy nobles, tailors should offer garments in red and black, for they are the most expensive and prestigious of colors.",2681,50,toData);
    base.books.AddEnglishBookText("The most affordable dyed wools are blue and green and worn by those of the middle class.",2679,80,toData);
    base.books.AddEnglishBookText("A good tailor measures each client and custom makes every article of clothing.",0,100,toData);
end;

function loadTitle(toData)
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Spinner und Weber\"",toData);
    base.books.AddEnglishBookTitle("Book with the title \"Spinning And Weaving\"",toData);
end;