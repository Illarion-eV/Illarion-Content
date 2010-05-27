require("base.books")

module("content.books.cooking", package.seeall)

-- This file contains the book data for the book "Tanner and Dyer"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);

    base.books.AddEnglishBookText("\n \n Basic Cooking and Recipes",0,0,toData);
    base.books.AddEnglishBookText("This text will help aspiring cooks to begin their craft. Basic tools and simple recipes will be discussed.",0,30,toData);
    base.books.AddEnglishBookText("First, the most basic tool needed for cooking is a wooden cooking spoon. These can be obtained from carpenters.",227,30,toData);
    base.books.AddEnglishBookText("Once you've obtained a cooking spoon, you will also need a wooden bucket. Water will be needed in every recipe. These can be obtained from carpenters as well.",51,30,toData);
    base.books.AddEnglishBookText("Lastly, you will need a hot fire to cook the food. You will need logs and a hatchet to create a bonfire. Take the axe in your hands and cut the logs on the ground and stoke a fire.",74,30,toData);
    base.books.AddEnglishBookText("\n Recipes",0,30,toData);
    base.books.AddEnglishBookText("~Rolls~\n Ingredients:\n 1 Measure of Dough",191,30,toData);
    base.books.AddEnglishBookText("Preperation:\n First, need the dough. Dough can be made from mixing flour with water. Remember when cooking to keep water on hand. It can become helpful.",2,30,toData);
    base.books.AddEnglishBookText("Next, use the spoon to position the dough near the fire, and brown all side evenly. They will be warm on the outside and fluffy on the inside.",5,30,toData);
    base.books.AddEnglishBookText("~Mushroom Soup~\n Ingredients:\n 2 Chapignon Mushrooms\n 1 bucket of water\n 1 bowl",2456,30,toData);
    base.books.AddEnglishBookText("Preperation:\n Begin to boil the water and once it is boiling add the mushrooms. Stir and let the mushrooms cook and make a broth. Serve as hot. ",163,30,toData);
    base.books.AddEnglishBookText("~Sausage~\n Ingredients:\n 1 raw ham ",3051,30,toData);
    base.books.AddEnglishBookText("Preperation:\n Take the raw pork and shape in, keeping in natural casings. One raw ham will fill two sausages. Cook until browned. These can be used in more complex dishes or eaten plainly.",307,30,toData);

    base.books.AddGermanBookText("\n \n Das Grundlegende Kochen und die Rezepte",0,0,toData);
    base.books.AddGermanBookText("Dieses Buch wird anstrebenden K�chen helfen, ihr Handwerk zu beginnen. Grundlegende Werkzeuge und einfache Rezepte werden besprochen.",0,30,toData);
    base.books.AddGermanBookText("Das grundlegend erforderlichste Werkzeug um zu kochen ist ein Kochl�ffel. Diese k�nnen bei Schreinern oder Schnitzern erstanden werden.",227,30,toData);
    base.books.AddGermanBookText("Sobald ihr einen Kochl�ffel erhalten habt, werdet Ihr auch einen Holzeimer brauchen. Wasser wird in jedem Rezept erforderlich sein. Eimer k�nnen ebenfalls bei Schreinern erstanden werden.",51,30,toData);
    base.books.AddGermanBookText("Zuletzt braucht ihr ein hei�es Feuer um kochen zu k�nnen. Ihr werdet Holzscheite und ein Beil brauchen, um ein Feuer zu entz�nden. Nehmt das Beil in die Hand und schlagt den Holzscheit auf den Boden und sch�rt ein Feuer.",74,30,toData);
    base.books.AddGermanBookText("\n Rezepte",0,30,toData);
    base.books.AddGermanBookText("~Br�tchen~\n Zutaten:\n 1 St�ck Teig",191,30,toData);
    base.books.AddGermanBookText("Zubereitung:\n Zuerst braucht ihr den Teig. Teig macht ihr, wenn ihr Mehl mit Wasser mischt. Vergesst nicht wenn ihr kocht, Wasser in der Hand zu halten. Es k�nnte euch helfen.",2,30,toData);
    base.books.AddGermanBookText("Als n�chstes benutze den L�ffel um den Teig in die N�he des Feuers zu legen und br�une jede Seite. Die Br�tchen werden aussen knusprig und innen weich sein.",5,30,toData);
    base.books.AddGermanBookText("~Pilzsuppe~\n Zutaten:\n 2 Champignon Pilze\n 1 Eimer Wasser\n 1 Suppensch�ssel",2456,30,toData);
    base.books.AddGermanBookText("Zubereitung:\n Beginnt das Wasser zu erhitzen und sobald es kocht f�gt ihr die Pilze hinzu.  R�hrt um und lasst alles solange  kochen bis es eine Br�he daraus entsteht. Serviere es solange es hei� ist.",163,30,toData);
    base.books.AddGermanBookText("~W�rstchen~\n Zutaten\n 1 roher Schinken",3051,30,toData);
    base.books.AddGermanBookText("Zubereitung:\n Nehmt den rohen Schinken und gebt ihn in Naturd�rme. Ein Schinken f�llt zwei W�rste. Kocht sie bis sie gar sind. Diese k�nnen f�r komplexere Speisen verwendet oder einfach so gegessen werden.",307,30,toData);
end;

function loadTitle(toData)
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Das Grundlegende Kochen und die Rezepte\"",toData);
    base.books.AddEnglishBookTitle("Book with the title \"Guide to Basic Cooking\"",toData);
end;