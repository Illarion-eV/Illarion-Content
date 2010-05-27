require("base.books")

module("content.books.cakebible", package.seeall)

-- This file contains the book data for the book "Cakebible"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);
    
    base.books.AddEnglishBookText("The Cakebible",0,0,toData);
    base.books.AddEnglishBookText("Table of Contents:\nDedication Page 3\nPreparation Page 4-5\nRecipes Page 6-13\nSubclasses Page 14-17\nPhilosophies Page 18-19\nAcknowledgement Page 20-23",0,0,toData);
    base.books.AddEnglishBookText("Dedication:\n\nTo all who have a sweet tooth\nThe authors Lana von Maibach and Cassandria Littlethorn",0,0,toData);
    base.books.AddEnglishBookText("Preparation:\n\nBefore you get started on baking you surely need a lot of dough, a rolling pin to roll out the dough, a peel and of course the respective ingredients.",0,0,toData);
    base.books.AddEnglishBookText("After making the preparations let the fun begin.",0,0,toData);
    base.books.AddEnglishBookText("Breath of apple:\n\nTake two lumps of dough, put them on a surface covered with flour and knead them to a round form. Peel the apples and cut them into small pieces. Take one of the formed dough lumps",353,0,toData); -- ### Apple pie ###
    base.books.AddEnglishBookText("and distribute the apple slices on it more or further apart according to taste. Then put the remaining dough on top and bake it on moderate heat until the crust is golden brown. Let the cake cool down",0,0,toData);
    base.books.AddEnglishBookText("outdoor for half an hour and watch out that no halfling comes by to steal your cake. Then enjoy your meal!",0,0,toData);
    base.books.AddEnglishBookText("Cherry dream:\n\nFirst knead two lumps of dough to a round form. Then pit two times two handful of cherries. Distribute the cherries on one part of the dough and put the other part on top again. Bake",303,0,toData); -- ### Cherry cake ###
    base.books.AddEnglishBookText("it until the crust is light brown and then let the cake cool down for half an hour, but be careful that nobody steals it. Enjoy eating the cake with closed eyes!",0,0,toData);
    base.books.AddEnglishBookText("Symphony of sweet and sweeter:\nThis time knead three lumps of dough to a round form. Take the first part of the dough and distribute halved strawberries on it. Then repeat that with the second part",354,0,toData); -- ### Strawberry cake ###
    base.books.AddEnglishBookText("and cover the ensemble with the remaining dough. Then smooth the dough so that there are no gaps between the layers. Bake it on moderate heat until the crust is golden brown. Let the cake cool down",0,0,toData);
    base.books.AddEnglishBookText("for half an hour and after that put a few more strawberries on the edge. Close your eyes and enjoy the sweet symphony! Taste it!",0,0,toData);
    base.books.AddEnglishBookText("Blackberry cloud:\n\nTake two small dough lumps. Form one like a beaker and the other like a plate. Heat a honeycomb until it is completely fluid. Add a handfull ripe blackberries to the honey and",454,0,toData); -- ### Blackberry muffin ###
    base.books.AddEnglishBookText("pour it in the dough beaker. Put the dough plate on top and bake it about ten minutes. Now you can sleep on (blackberry) clouds!",0,0,toData);
    base.books.AddEnglishBookText("Sweet seduction:\n\nRoll out a piece of dough and cut out little cookies. Heat a honeycomb until it is completely fluid and brush the cookies with honey. After baking them in moderate heat for about",453,0,toData); -- ### Cookie ###
    base.books.AddEnglishBookText("fifteen minutes you may give in to temptation.",0,0,toData);
    base.books.AddEnglishBookText("Philosophies:\n\nThe quality of cakes (applicable to all kinds of sweets): The quality of cakes is measured against the bite marks in it. If there are so many bite marks that there isn't any cake",0,0,toData);
    base.books.AddEnglishBookText("left, you could say the cake was a good one.",0,0,toData);
    base.books.AddEnglishBookText("Acknowledgement: \n\nWe would like to thank all cakes, muffins and cookies which we eat up and which inspired us to write this bible. Furthermore we would like to thank the bakers without which all",0,0,toData);
    base.books.AddEnglishBookText("these treats wouldn't exist. Last but not least our friends who supplied us with sweets while we wrote this book.\n\n\nThe authors Lana von Maibach and Cassandria Littlethorn",0,0,toData);
    base.books.AddEnglishBookText("Have fun in Baking!",0,0,toData);
    
    base.books.AddGermanBookText("Die Kuchenbibel",0,0,toData);
    base.books.AddGermanBookText("Inhaltsverzeichnung:\nWidmung Seite 3\nVorbereitung Seite 4-5\nRezepte Seite 5-15\nUnterformen Seite 16-20\nPhilosophisches Seite 21-22\nDanksagen, Seite",0,0,toData);
    base.books.AddGermanBookText("Widmung:\n\n An alle Freunde der s��en Leckereien\n\n\n Die Autoren Lana von Maibach und Cassandria",0,0,toData);
    base.books.AddGermanBookText("Vorbereitung:\n Um losbacken zu k�nnen, braucht man nat�rlich erstmal ganz viel Teig, ein Nudelholz, um den Teig auszuw�llen, einen Ofenschieber und n�t�rlich die jeweigen Zutaten. Man lege sich dies",0,0,toData);
    base.books.AddGermanBookText("alles zurecht und schon kann der Backspass beginnen.",0,0,toData);
    base.books.AddGermanBookText("Apfelhauch:\n\n Man nehme zwei Batzen Teig und fome daraus erstmal eine Runde Form. Dann sch�llt und entkern man die �pfel, a�erbem muss man sie noch in St�ck schneiden. Man nimmt eine der rrunden",353,0,toData); -- ### Apfelkuchen ###
    base.books.AddGermanBookText("Teiformen und setze darauf vorsichtig die einzelnen Apfelscheiben je nach Geschmack n�her oder weiter auseinander Dann denkt man den Kuchen mit der anderen Teigform zu und backt sie bei mittlerer",0,0,toData);
    base.books.AddGermanBookText("Hitze bis sich eine goldbrauene Kruste gebildet hat. Man l�sst denn Kuchen eine halbe Stunde im Freien abk�hlen und passt auf, das kein Halbling vorbeikommt um ihn zu klauen und dann guten Appetit!",0,0,toData);
    base.books.AddGermanBookText("Kirschtraum:\n\nMan forme erstmal wieder aus zwei Batzen Teig eine runde Form. Dann entkerme man etwa zwei mal zwei Hand Kirschen. Die eine Teigform wird daraufhin mit den entkernten Kirschen belegt,",303,0,toData); -- ### Kirschtorte ###
    base.books.AddGermanBookText("woraufhin man diese Teigform mit der anderen zudeckt. Man schiene das ganze in den fen und backe es mit mittlerer Hitze, bis sich eine hellbraune Kruste bildet. Das ganze l�sst man dann noch etwa eine",0,0,toData);
    base.books.AddGermanBookText("halbe Stunde abk�hlen und passt auf, das es nicht geklaut wird. Dann mit viel Genu� und geschlossenen Augen die Torte essen.",0,0,toData);
    base.books.AddGermanBookText("Sinfonie aus s�� und s��er:\n\n Diesmal Forme man aus drei Batzen Teig drei runde Formen. Man belege die erste Form mit halbierten Erdeerscheiben und deckte die zweite darauf, genauso verf�hrt man mit",354,0,toData); -- ### Erdbeertorte ###
    base.books.AddGermanBookText("der zweiten Tortenform. Nun deckr man die dritte auch noch auf die Zweite und verstreicht den Rand mit ein bisschen zus�tzlichem Teig, sodass keine L�cke zwischen den Teigschichten mehr ist. Man b�ckt",0,0,toData);
    base.books.AddGermanBookText("nun das ganze auf mittlerer Hitze bis sich eine goldbraune Kruste bildet. Danach l�sst man das ganze eine halbe Stunde lang abk�hlen und gibt auf die Kruste noch ein paar Erdbeeren. Man schlie�t die",0,0,toData);
    base.books.AddGermanBookText("Augen und schmeckt die s��e Sinfonie (essen!!!).",0,0,toData);
    base.books.AddGermanBookText("Brombeerwolke:\n\nMan nehme zwei Batzen Teig, aus einem Forme man ein becherformiges Beh�ltnis, aus dem anderen ein Tellerformiges. Nun erhitzt man eine Honigwabe in einem Becher, bis sich diese",454,0,toData); -- ### Brombeermuffin ###
    base.books.AddGermanBookText("vollst�ndig verfl�ssigt hat. Dann gibt man etwa eine Handvoll reifer Brombeeren in den Honig und sch�ttet beidess in das kelchf�rmige Teigbeh�ltnis. Dann deckt man das ganze mit den tellerf�rmigen",0,0,toData);
    base.books.AddGermanBookText("Teigbeh�ltnis zu und b�ckt das ganze etwa 10 Minuten und dann kann man auf Brombeerwolken schweben.",0,0,toData);
    base.books.AddGermanBookText("S��e Verf�hrung:\n\nMan w�llt einen Teigklumpen aus und macht Ausstecherchen. Dann erhitzt man Honig, bis sich dieser vollst�ndig verfl�ssigt hat und bestreiche die Ausstecher mit einem Pinzel mit",453,0,toData); -- ### Kekse ###
    base.books.AddGermanBookText("Honig. Das ganze wird dann noch etwa 15 Minuten bei mittlerer Hitze gebacken und man kann sich dann der Verf�hrung hingeben.",0,0,toData);
    base.books.AddGermanBookText("Die G�te des Kuchens:\n(Auch auf andere Schleckereien anwendbar)\n\nDie Qualit�t eines Kuchen wird an den Bisstellen im Kuchen gemessen. Sollten soviele Bisstellen vorhanden sein, dass kein Kuchen",0,0,toData);
    base.books.AddGermanBookText("mehr da ist, kann man davon ausgehen, dass der Kuchen ein guter Kucchen war.",0,0,toData);
    base.books.AddGermanBookText("Danksagung:\n\n Wir danken allen Kuchen, Keksen und Muffins, die von uns verspeist wurden und uns zu dieser Bibel inspiriert haben. Desweiteren m�chten wir den B�ckern danken, ohne die es diese",0,0,toData);
    base.books.AddGermanBookText("Leckerein nicht gebe, au�erdem unseren Freunden, die uns mit Leckerein versorgt haben, w�hrend wir dieses Buch schrieben\n\n Die Autoren\n Lana von Maibach und Cassandria",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Die Kuchenbibel\"",toData);
    base.books.AddEnglishBookTitle("Book with the title \"The Cake Bible\"",toData);
end;