--SMALL THICK BLUE BOOK 

require("base.books")

module("item.book.id_2607_blue_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2607_blue_book' WHERE com_itemid = 2607;

function UseItem(User, SourceItem, TargetItem, Counter, Param) 
      if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then 
          world:erase(SourceItem,1); 
      else 
          if base.books.InitBook() then 
              base.books.AddLanguage("common language",0); 

            base.books.AddEnglishBookText("\n \n Gods of Illarion",0,0,0); 
            base.books.AddEnglishBookText("The Elder Gods",0,0,0); 
            base.books.AddEnglishBookText("The Elder Gods were a group of five who have created this world. Their reasons are shrouded in mystery though.",0,0,0); 
            base.books.AddEnglishBookText("Bragon is the Elder God of Fire. He is rumored to be very extravagant and has a love for gold. He is said to be strong, just, and noble. ",0,0,0); 
            base.books.AddEnglishBookText("Eldan is the Elder God of Spirit. He is considered to be very wise and has very few followers. He wasn't known as active amoungst mortals, a possible reason for his scarce followers.",0,0,0); 
            base.books.AddEnglishBookText("Findari is the Elder Goddess of Air. She is very creative and therefore relatable to the arts. Her followers are rare as well, though they tend to be prophets and bards.",0,0,0); 
            base.books.AddEnglishBookText("Tanora is the Elder Goddess of Water. She is is considered the mother of lizardmen and is known as Zelphia to them. She is the only Elder God to possibly be active amoung mortals.",0,0,0); 
            base.books.AddEnglishBookText("Ushara is the Elder Goddess of Earth. She is said to reject any form of wealth and her altars are the earth itself.",0,0,0); 
            base.books.AddEnglishBookText("The Younger Gods",0,0,0); 
            base.books.AddEnglishBookText("The Younger Gods were eleven outstanding citizens that were altered to become Gods, selected by the Elder Gods.",0,0,0); 
            base.books.AddEnglishBookText("Elara is the Goddess of Knowledge. She is often worshipped by mages and scholars. She is rumored to prefer the life of a hermit, and sometimes appears as a tall ageless female.",0,0,0); 
            base.books.AddEnglishBookText("Adrons is the God of Festivities. He is said to appear as an attractive man or an old begger witha bottle. He is very impulsive and can be aggressive at times.",0,0,0); 
            base.books.AddEnglishBookText("Cherga is the Goddess of Death and Souls. She is very neutral and proud. She is for justice and takes pride in such things.",0,0,0); 
            base.books.AddEnglishBookText("Oldra is the Goddess of Life and Fertility. She often appears as an elder woman. Many farmers, mothers, and families pray to her.",0,0,0); 
            base.books.AddEnglishBookText("Narg�n is the God of Chaos. He loves playing tricks and inacting a cunning revenge. His humor is very dark and his true form is often kept hidden from mortals.",0,0,0); 
            base.books.AddEnglishBookText("Malachin is the God of Hunting and Battle. He is very dignified and serious, usually neutral on subjects. He is said to appear as a strong knight or a clothed ranger. Many follow this honorable God.",0,0,0); 
            base.books.AddEnglishBookText("Irmorom is the God of Crafts and Trade. He loves wealth and Justice. Those who worship him take pride in their excellent crafts and monetary wealth.",0,0,0); 
            base.books.AddEnglishBookText("Sirani is the Goddess of Love and Pleasure. She usually appears as an attractive female. She is very amiable and intelligent, as well as sympathetic.",0,0,0); 
            base.books.AddEnglishBookText("Zhambra is the God of Friendship and Loyalty. He is said to appear as a young noble who is very sympathetic, until he is betrayed. He does not stand for such things.",0,0,0); 
            base.books.AddEnglishBookText("Ronagan is the God of Thieves and Shadows. He stands for spreading wealth to the needed and does not agree with strict set of laws. He is said to help honorable thieves.",0,0,0); 
            base.books.AddEnglishBookText("Moshran is the God of Blood and Bones. The orcs were created with his anger and despair, for he was cursed after saving the land. Afterwards, his status of a great warrior was not as such.",0,0,0); 
            
            base.books.AddGermanBookText("\n \n Illarions G�tterwelt",0,0,0); 
            base.books.AddGermanBookText("Die Alten G�tter",0,0,0); 
            base.books.AddGermanBookText("Die Alten Gottheiten bestanden aus f�nf Erscheinungen, die gemeinsam die Welt erschufen. Warum sie das taten - das wird ihr Geheimnis bleiben.",0,0,0); 
            base.books.AddGermanBookText("Bragon ist der alte Feuergott. Von ihm sagt man, er sei verschwenderisch und liebe alles G�ldene. Er wird als stark, gerecht und gro�z�gig beschrieben. ",0,0,0); 
            base.books.AddGermanBookText("Eldan ist der alte Gott des Geistes. Man sagt von ihm, er sei sehr weise und habe nur wenige Anh�nger. Er hatte nie viel Kontakt zu den Lebenden, vielleicht eine Grund f�r seine geringe Gefolgschaft.",0,0,0); 
            base.books.AddGermanBookText("Der alten Gott der Luft ist Findari. Sie ist sehr einfallsreich und von daher auch zust�ndig f�r die Kunst. Auch ihre Anh�nger sind d�nn ges�at, in aller Regel Wahrsager und B�nkels�nger.",0,0,0); 
            base.books.AddGermanBookText("Tanora ist die alte G�ttin des Wassers. Sie gilt als die Mutter der Echsenmenschen und wird von ihnen Zelphia genannt. Sie ist die einzige unter den alten G�ttern, die m�glicherweise heute noch unter den Lebenden in Erscheinung tritt.",0,0,0);
            base.books.AddGermanBookText("Die alte Gottheit Ushara wacht �ber die Erde. Von ihr sagt man, sie lehne jede Form von Prunk ab, weshalb ihr Altar auch die Erde selbst sei.",0,0,0); 
            base.books.AddGermanBookText("Die J�ngeren G�tter",0,0,0); 
            base.books.AddGermanBookText("Die J�ngeren unter den Gottheiten waren elf herausragende B�rgerliche, die, auserw�hlt von den Alten, bestimmt wurden, zu G�ttern aufzusteigen.",0,0,0); 
            base.books.AddGermanBookText("Elara ist die G�ttin des Wissens. Sie wird haupts�chlich von Zauberern und Gelehrten verehrt. Ger�chteweise soll sie das Leben des Einsiedlers bevorzugen, manchmal erscheine sie auch als gro�gewachsene alterslose Frau.",0,0,0); 
            base.books.AddGermanBookText("Adrons ist der Gott der Feste. Man sagt von ihm, er erscheine als ansehnlicher Mann oder auch als Bettler mit Flasche. Er ist aufbrausend und bisweilen streitlustig.",0,0,0); 
            base.books.AddGermanBookText("Cherga is die G�ttin der Toten und der Seelen. Sie ist sehr ausgeglichen und stolz. Sie steht f�r Gerechtigkeit und nimmt solche Dinge sehr ernst.",0,0,0); 
            base.books.AddGermanBookText("Oldra is die G�ttin des Lebens und der Fruchtbarkeit. Sie tritt meist als �ltere Frau auf. Viele Bauern, M�tter und Familien beten zu ihr.",0,0,0);
            base.books.AddGermanBookText("Narg�n ist der Gott des Chaos. Er liebt es, Streiche zu spielen und gerissen Rache zu nehmen. Sein Humor ist dunkel und seine wahre Form ist Sterblichen meist verborgen.",0,0,0);
            base.books.AddGermanBookText("Malachin ist der Gott der Jagd und des Kampfes. Er ist sehr w�rdevoll, ernst und f�r gew�hnlich neutral. Man sagt, er erscheint als starker Krieger oder verh�llter Waldl�ufer. Viele glauben an diesen ehrw�rdigen Gott.",0,0,0);
            base.books.AddGermanBookText("Irmorom ist der Gott des Handwerks und des Handels. Er liebt Wohlstand und Gerechtigkeit. Die, die ihn verehren, sind stolz auf ihre handwerklichen Begabungen und ihren Reichtum.",0,0,0);
            base.books.AddGermanBookText("Sirani ist die G�ttin der Liebe und des Vergn�gens. F�r gew�hnlich erscheint Sirani als gut aussehende Frau. Sie ist sehr aufmerksam und intelligent, so wie auch sympathisch.",0,0,0);
            base.books.AddGermanBookText("Zhambra ist der Gott der Freundschaft und der Treue. Man erz�hlt, er w�rde als junger Edelmann erscheinen, welcher sympathisch ist, solange man ihn nicht hintergeht. Er h�lt nichts von solchen Dingen.",0,0,0);
            base.books.AddGermanBookText("Ronagan ist der Gott der Diebe und Schatten. Er steht f�r das Geben an Bed�rftige und h�lt nichts von strengen Gesetzen. Man erz�hlt, er helfe ehrw�rdigen Dieben.",0,0,0);
            base.books.AddGermanBookText("Moshran ist der Gott des Blutes und der Knochen. Die Orks wurden durch seine Wut und Verzweiflung wegen des, ihm auferlegten, Fluches nachdem er das Land rettete, geschaffen. Danach war sein Ruf als gro�er Krieger zerbrochen.",0,0,0);

            ---------------
            
            base.books.AddLanguage("common language",1);
            base.books.AddEnglishBookText("\n \n Halfling Culture and History",0,0,1);
            base.books.AddEnglishBookText("Halflings, to the ignorant, look like children of humans and indeed their appearance is similar to such associations.",0,0,1);
            base.books.AddEnglishBookText("They most signifigant difference besides their small height are their big and hairy feet, which they proudly present to the public. They tend to live longer than humans.",0,0,1);
            base.books.AddEnglishBookText("Halflings prefer to live in areas dominated by hills and thin forests, where they dig their homes into the earth. Over the generations, these caverns can obtain quite a respectable size.",0,0,1);
            base.books.AddEnglishBookText("Their houses are filled with much furniture and other belongings, for halflings will rarely throw anything away. They tend to find houses other then theirs to be uncomfortable.",0,0,1);
            base.books.AddEnglishBookText("In their homes, they live with large family clans led by a clan chief. This is an honorary title rather than an actual position of power. The function of this position is to organize family events.",0,0,1);
            base.books.AddEnglishBookText("Halflings usually show up to dinner uninvited and must leave with a full stomach, any other way would be impolite. Malicious tongues say that three things are most importan to halflings.",0,0,1);
            base.books.AddEnglishBookText("These are breakfast lunch and dinner!",0,0,1);
            base.books.AddEnglishBookText("Though, they do take serious interest in food in drinks. They are notorious for their sweet tooth. One may often find themselves being lectured by a halfling on the finer parts of cooking.",0,0,1);
            base.books.AddEnglishBookText("In fact, it is common for a tavern to boast that their cook is a halfling.",0,0,1);
            base.books.AddEnglishBookText("Halflings prefer to earn a living from the earth. There are actually some who have become well known for their mastery in handcrafts, but they are generally farmers, hunters, and herbalists.",0,0,1);
            base.books.AddEnglishBookText("In towns, there are often small shrines to Oldra. In fact, their harvest festival is their most important holiday throughout the entire year.",0,0,1);
            base.books.AddEnglishBookText("Living in nature for a while, they have developed a great skill to move nimbly and with little sound. While many won't admit it, most of these skills are used for petty thievery.",0,0,1);
            base.books.AddEnglishBookText("It would be wise to watch halflings that are adorned with symbols of Ronagan, they might mean business around you.",0,0,1);
            base.books.AddEnglishBookText("Halflings have an easy approach to life. They seldom worry about the future and its outcomes, instead they prefer resting and long chats with old friends.",0,0,1);
            base.books.AddEnglishBookText("They do not have a sense for ranks, but highly value the importance of family and friends. This is seen throughout their society and its structure, usually they are loose and dominated by halflings.",0,0,1)
            base.books.AddEnglishBookText("Their childlike appearance may be mistaken as being defenceless. They are very hard to anger, unless you begin to toy with their food of course.",0,0,1);
            base.books.AddEnglishBookText("They are very determined as well, and one would not want to be in the way of a halfling if he has set his path already. Orcs and Humans have learned this the hard way.",0,0,1);
            base.books.AddEnglishBookText("Because halflings are not well in magic, it would be wise to give a practitioner room incase his spell has unwanted effects.",0,0,1);

            base.books.AddGermanBookText("\n \n Kultur und Geschichte der Halblinge",0,0,1);
            base.books.AddGermanBookText("Allen Unwissenden sei gesagt: Halblinge sehen aus wie Menschenkinder und nat�rlich f�rdert ihre ganze Erscheinung solche Vorstellungen.",0,0,1);
            base.books.AddGermanBookText("Neben ihrem geringen Wuchs liegt jedoch der gr��te Unterschied zu menschen in ihren gro�en und haarigen F��en, die sie stolz in aller �fentlichkeit pr�sentieren. Sie neigen dazu, �lter zu werden als die Menschen.",0,0,1);
            base.books.AddGermanBookText("Halblinge bevorzugen Gegenden, in denen H�gel und W�lder das Bild bestimmen, wo sie ihre Heimst�tten in die Erde eingraben. Im Laufe von Generationen k�nnen diese H�hlen eine beachtliche Gr��e erreichen.",0,0,1);
            base.books.AddGermanBookText("Ihre H�user sind voller M�bel und anderer Besitzt�mer,zumal Halblinge kaum einmal etwas wegwerfen. Auch neigen sie dazu, andere Heime als die ihren als ungem�tlich zu empfinden.",0,0,1);
            base.books.AddGermanBookText("Zuhause leben sie in Gro�familien, denen ein Clanf�hrer vorsteht. Das ist jedoch eher ein Ehrentitel als eine echte Machtposition. Die Aufgabe liegt vor allem darin, Familienfeste zu veranstalten.",0,0,1);
            base.books.AddGermanBookText("Halblinge kreuzen gerne unerwartet zum Essen auf und d�rfen erst wieder gehen, wenn sie pappsatt sind, alles andere g�lte als unh�flich. B�se Zungen behaupten, es g�be im Leben der Halblinge nur drei wichtige Dinge:",0,0,1);
            base.books.AddGermanBookText("Und zwar Fr�hst�ck, Mittagessen und Abendbrot!",0,0,1);
            base.books.AddGermanBookText("Auch zeigen sie starkes Interesse f�r Essen und Trinken. Sie sind als Schleckerm�uler verschrien. Man mag sie oftmals dabei antreffen, wie ihnen ein Halbling einen Vortrag �ber die Kochk�nste h�lt.",0,0,1);
            base.books.AddGermanBookText("Es ist nicht un�blich, dass Kneipen damit prahlen, einen Halbling als Koch zu besch�ftigen.",0,0,1);
            base.books.AddGermanBookText("Halblinge ziehen es vor, von der eigenen H�nde Arbeit zu leben. Es gibt Einige, die weltber�hmt wurden f�r ihre meisterlichen Handarbeiten, aber in erster Linie sind sie Bauern, J�ger und Kr�utersammler.",0,0,1);
            base.books.AddGermanBookText("In den D�rfern findet man h�ufig kleine Oldra-Schreine. Tats�chlich ist das Erntefest der wichtigste Feiertag des gesamten Jahres.",0,0,1);
            base.books.AddGermanBookText("Da sie so naturverbunden sind, haben sie einen hohen Sinn daf�r entwickelt, sich flink und ger�uscharm fortzubewegen. Auch wenn das viele nicht zugeben wollen,werden einige dieser F�higkeiten gerne f�r Diebst�hle genutzt.",0,0,1);
            base.books.AddGermanBookText("Es ist ratsam, Halblinge im Auge zu behalten, die mit dem Zeichen Ronagans geschm�ckt sind, sie k�nnten B�ses im Schilde f�hren.",0,0,1);
            base.books.AddGermanBookText("Halblinge haben zum Leben eine recht simple Einstellung. Sie sorgen sich selten um die Zukunft und ihr Auskommen, stattdessen bevorzugen sie Entspannung und einen anhaltenden Plausch mit guten Freunden.",0,0,1);
            base.books.AddGermanBookText("Sie haben keinen Sinn f�r Hierachien, halten aber Familie und Freundschaften f�r unverzichtbar. Das kann man auch an ihrer lockeren Gesellschaftsstruktur ablesen.",0,0,1);
            base.books.AddGermanBookText("Ihre kindhafte Erscheinung  mag als Wehrlosigkeit missverstanden werden. Sie sind sehr schwer in Wallung zu bringen, vorausgesetzt, man spielt nicht gerade mit ihrem Essen.",0,0,1);
            base.books.AddGermanBookText("Sie sind auch sehr zielstrebig und man sollte einem halbling nicht in die Quere kommen, wenn er sich erst einmal etwas in den Kopf gesetzt hat. Orks wie Menschen mussten das auf die harte Tour lernen.",0,0,1);
            base.books.AddGermanBookText("Weil Halblinge keine gro�artigen Magier sind, empfiehlt es sich, einem �benden aus dem Weg zu gehen, f�r den Fall, sein Zauber zeigt unerwartete Effekte.",0,0,1);
            
            ----------
            
            base.books.AddLanguage("dwarf language",2);
            base.books.AddEnglishBookText( " Since the orc wars, the dwarves lived spread widely amongst the countries, but they always sticked to their belief and their traditions. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " The Festival Of Relationship was of the happiest. It brought them the most cheerful moments.", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " But the war and the everlasting suffering during it, erased the longing for love in the brave heart of the brothers and they seperated from each other more and more. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " The dwarves grew lonely and so it soonly happened, that the tribes of them, which lived in different mountains, lost their bound of friendship between them. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " But Irmorom saw what had happened to his beeings and so he lured Ragn�l, Elrik's son, the great smith and Heimdal, Ralla's daugther, a mighty warrior, who came from different tribes, ", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " into a faraway, old mine, by using a guile. And as soon as the two were lonely together, they became friends and soon, started to meet each other more often in the mine. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " One day, they decided to marry. And they wanted to let the wedding take place at the mine, the place they had met each other so haply. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " But the dwarves had grown leery and ignorant, so that they didn't want to be forced to share with each other in the future. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " And so the elders of the two different tribes came together and spoke to the couple: 'You may marry and bring the tribes together here, the day, that this place gives gemstones again!' ", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " That made Irmorom thoughfully, but he open for helping the couple and so he let the mine spit out as many gold and gemstones, as one could ever imagine. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " But when the couple returned to the elders, telling them the good news, greed inflamed in the elders' eyes. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " Without even thinking about the wedding, they went to the mine to carry out all the gems and the gold. ", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " That made Irmorom so angry, that he personally came down from his mountain, appearing under the dwarves as the old longbeard, he had been seen as, often before. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " He raises his voice and said to the elders: 'Look at you, you that call yourselves the wise and noble ones. ", 0, 0, 2 );  
            base.books.AddEnglishBookText( " You should be ashame to feed your greed while your king longs for the love of a warrior, that could end all your problems.' ", 0, 0, 2 );
            base.books.AddEnglishBookText( " But they didn't listen to him, because their greed had made them blind and deaf, so that they didn't recognize him. ", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " When he kept on bothering them, they raised their hands to show their rings, which made clear, that they were the elders. Boisteriously, they said to him: ", 0, 0, 2 );
            base.books.AddEnglishBookText( "'We are the ears and mouths of Irmorom and what we say is the law. An ordinary one like you shouldn't discuss with us!' ", 0, 0, 2 );
            base.books.AddEnglishBookText( " Irmorom lost his patience and raged like he rarely had did before. With a beck of his hands, the fools crumbled to the dust, Irmorom had made them out of. ", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " Only the rings were left, ten of them, five of each tribe. When Ragn�l and Heimdall had watched that scene and realized, that he was their Creator, they kneeled down and he said to them: ", 0, 0, 2 );
            base.books.AddEnglishBookText( "'You, that have pure hearts, take those rings as a present. Such as the mine. The dwarven folk shall never again forget about the worthy bound of friendship and love! ", 0, 0, 2 );  
            base.books.AddEnglishBookText( " May no dwarf ever betray his brothers and sisters for his greed again!' And so he left them there, as the first rulers of the new dwarven realm.", 0, 0, 2 );
            base.books.AddEnglishBookText( " Since that day, the brothers and sisters celebrate their love in the Winds Of Siros. And since that day, it's also a tradition, that the best smith of the mountain smiths two ", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " glorious rings and, after the ceremony, melts them together for ever, so that the dwarves may never ever sperate from each other again. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " Those holy rings are the sign for steadiness and the endless love of the couple, that can be competed by their ability to hold their drinks and their faith only...", 0, 0, 2 );
            base.books.AddGermanBookText( " Seit den Orkkriegen waren die St�mme der Zwerge weit verteilt �ber die L�nder, doch stets hielten sie fest an ihrem Glauben und an ihren Traditionen.  ", 0, 0, 2 );   
            base.books.AddGermanBookText( " So war auch das Fest der Bindung eine von ihnen die den Zwergen oft schon die heitersten Momente brachte...", 0, 0, 2 );
            base.books.AddGermanBookText( " Doch der Krieg und das andauernde Leid w�hrend diesem lies den Drang sich an Liebe zu Binden erschwachen in den tapferen Herzen der Br�der und so lebten sie sich immer weiter auseinander. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Die Zwerge wurden einsam und so kam es, dass bald das Band zwischen den einzelnen St�mmen, die in verschiedenen Bergen hausten, zerriss und sie mehr f�r sich als f�r einander waren. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Doch Irmorom sah was seinen Gesch�pfen wiederfahren war und so lockte er den gro�en Schmied Ragn�l Erik's Sohn und die gro�e Kriegerin Heimdal Rallas Tochter, ", 0, 0, 2 );
            base.books.AddGermanBookText( " die beiden verschiedene St�mme f�hrten mit Hilfe einer List in ein entlegenes Bergwerk das schon seit langem verlassen war. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Und kaum das die beiden f�r sich waren freundeten sie sich an und trafen sich immer h�ufiger in der besagten Mine. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Eines Tages beschlo�en sie einander zu heiraten und sie wollten die Hochzeit an jenem Ort feiern an dem sie sich so zuf�llig getroffen hatten. ", 0, 0, 2 );
            base.books.AddGermanBookText( " Doch die Zwerge waren misstrauisch geworden und engstirnig so das sie nicht einsahen das sie in Zukunft teilen sollten mit den anderen so taten sich die �ltestenr�te ", 0, 0, 2 );     
            base.books.AddGermanBookText( " beider Seiten zusammen und sprachen zu dem Paar: 'Es sei euch genehmigt zu heiraten und die St�mme zu vereinen, an dem Tage an dem das Bergwerk das ihr so sehr m�gt wieder ", 0, 0, 2 );
            base.books.AddGermanBookText( " edele Gesteine hervorbringt.' Das stimmte Irmorom nachdenklich doch er war bereit dem Paar zu helfen und so lies er das Bergwerk vor Gold und Edelsteinen geradezu �berquellen. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Und als dann das Paar mit der frohen Kunde erneut vor die �ltestenr�te trat da sprachen sie: 'Es ist wie ihr verlangt habt das Bergwerk nun der sch�nsten Steine Pracht in sich birgt!' ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Kaum das der edle Schmied dies gesagt hatte blitzte die Gier in den Augen der �ltesten und ohne auch nur �ber die Hochzeit zu reden machten sie sich auf in die Minen um all das ", 0, 0, 2 );
            base.books.AddGermanBookText( " Gold und die Edelsteinen hinfortzutragen. Das erz�rnte Irmorom so sehr das er pers�nlich vom heiligen Berg des Ursprungs herunterkam und als der Langbart, als den man ihn ", 0, 0, 2 );   
            base.books.AddGermanBookText( " schon oft gesehen hatte, unter die Zwerge trat. Er sprach zu den �ltesten: 'Seht euch an ihr die ihr euch die Weisen und edlen nennt ihr solltet euch sch�men der  ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Gier zu fr�nen w�hrend euer neuer K�nig nach der Liebe einer Kriegern�n trachtet die all eure Probleme l�sen k�nnte.' ", 0, 0, 2 );
            base.books.AddGermanBookText( " Doch sie lauschten ihm nicht denn die Gier hatte sie Blind und taub gleicherma�en gemacht und so erkannten sie ihn auch nicht. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Und als er sie weiterhin behelligte und sie ermahnte da hoben sie alle ihre Finger und zeigten ihre Ringe die bewiesen das sie die �ltesten waren und sprachen voller �bermut zu ihm: ", 0, 0, 2 );   
            base.books.AddGermanBookText( "'Wir sind die Ohren und M�nder Irmoroms und was wir sagen ist Gesetz ein einfacher wie du sollte sich nicht mit uns messen!' ", 0, 0, 2 );
            base.books.AddGermanBookText( " Da ri� Irmorom der Geduldspfaden und er tobte wie nur selten zuvor, mit einem Wink zerfielen die Toren zu Staub aus dem er sie einst geschaffen hatte, und alles was blieb waren ihre Ringe, ", 0, 0, 2 );     
            base.books.AddGermanBookText( " die zusammengeschmolzen am Boden lagen, Zehn an der Zahl und von beiden St�mmen F�nf.", 0, 0, 2 );
            base.books.AddGermanBookText( " Als Ragn�l und Heimdall die Szene beobachteten knieten sie nieder vor ihrem Sch�pfer und er sprach zu ihnen:", 0, 0, 2 );   
            base.books.AddGermanBookText( " 'Ihr die ihr reinen Herzens seit wisset diese Ringe als mein Geschenk, genau wie diese Mine. Auf das das Volk der Zwerge nie vergessen m�ge wie wertvoll der Bund der Freundschaft ", 0, 0, 2 );   
            base.books.AddGermanBookText( " und der Liebe sind! Auf das nie mehr Zwerge der Gier wegen ihre Br�der und Schwestern verraten!' ", 0, 0, 2 );
            base.books.AddGermanBookText( " Und so lies er sie zur�ck die neuen Herscher �ber das neue Reich der Zwerge!", 0, 0, 2 );   
            base.books.AddGermanBookText( " Seither feiern die Br�der und Schwestern in den Winden des Siros ihren Bund der Liebe, und seither ist es Tradition das der f�higste Schmied des Berges dem Paar ", 0, 0, 2 );   
            base.books.AddGermanBookText( " zwei pr�chtige Ringe schmiedet und nach der Zeremonie auf ewig verschmilzt auf das sie sich so wie die Zwerge nie mehr von einander trennen m�gen! ", 0, 0, 2 );
            base.books.AddGermanBookText( " Diese heiligen Ringe sind das Zeichen der Best�ndigkeit, der Liebe eines Paares, die nur durch die Trinkfestigkeit und den Glauben der Zwerge noch in Konkurrenz ger�t...", 0, 0, 2 );

            --------------------------------------

            base.books.AddLanguage("common language",3);

            base.books.AddEnglishBookText("\n\n~~Bluestones~~",284,0,3);
            base.books.AddEnglishBookText("The calmness that bluestones emanate for most people makes them important for warriors and mages alike.",0,0,3);
            base.books.AddEnglishBookText("It is told that magic energies of bluestones are the base for many kinds of protective magic.",0,0,3);
            base.books.AddEnglishBookText("Weapons:\n\nIf one lets the magic energies of bluestones flow into a weapon, the bearer's ability of defence is raised.",2626,0,3);
            base.books.AddEnglishBookText("Armors and Shields:\n\nThe powers of bluestone help the bearer by providing a higher defence value.",2360,0,3);
            base.books.AddEnglishBookText("Magic wands:\n\nIn a magic wand, bluestone powers cause an empowerment of healing magic and any spells that contain the creation of elements.",208,0,3);
            base.books.AddEnglishBookText("Tools:\n\nThe quality of a tool can be enhanced by bluestone power.",72,0,3);
            base.books.AddEnglishBookText("Trinkets:\n\nTrinkets that are treated with bluestone energy can provide better resistance of the bearer.",71,0,3);
            base.books.AddEnglishBookText("There is one important thing to note: One should never let the energies of a Bluestone flow into a trinket in which there is another stone embedded.",0,0,3);

            base.books.AddGermanBookText("\n\n~~Blausteine~~",284,0,3);
            base.books.AddGermanBookText("Das k�hle Gelassenheit, die Blausteine f�r die meisten Personen ausstrahlt macht diese Steine f�r Krieger wie auch f�r Magier gleicherma�en bedeutsam.",0,0,3);
			base.books.AddGermanBookText("Es hei�t, dass die magischen Energien von solchen Blausteinen die Grundlage f�r viele Arten von Schutzmagie sind.",0,0,3);
            base.books.AddGermanBookText("Waffen:\n\nL�sst man die magischen Energien von Blausteinen in eine Waffe einflie�en, so steigert sich dadurch die F�higkeit des Tr�gers zur Verteidigung.",2626,0,3);
			base.books.AddGermanBookText("R�stungen und Schilde:\n\nIn R�stungen und Schilden bewirken die magischen Kr�fte von Blausteinen einen gesteigerten Verteidigungswert.",2360,0,3);			
			base.books.AddGermanBookText("Magierst�be:\n\nIn einem Magierstab hingegen bewirken Blausteinenergien eine Steigerung in der Heilmagie, sowie bei allen Spr�chen, die mit dem Erschaffen von Elementen zu tun haben.",208,0,3);
			base.books.AddGermanBookText("Werkzeuge:\n\nL�sst man die magischen Energien eines Blausteines in ein Werkzeug flie�en, so steigern diese die Qualit�t des Werkzeuges.",72,0,3);
			base.books.AddGermanBookText("Schmuckst�cke:\n\nIn Schmuckst�cken wie Ringen oder auch Amuletten bewirken die Energien der magischen Blausteine, dass der K�rper des Tr�ger wiederstandsf�higer wird.",71,0,3);
			base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Blausteins in ein Schmuckst�ck flie�en lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,3);


          end 
      end 
      base.books.SendBookPage(User,SourceItem.data,Counter); 
  end 
  
  function LookAtItem(User,Item) 
      if base.books.InitTitle() then 
        base.books.AddEnglishBookTitle("Book with the title \"Gods of Illarion\"",0); 
        base.books.AddGermanBookTitle("Buch mit dem Titel \"G�tter Illarions\"",0); 
          
        base.books.AddEnglishBookTitle("Book with the title \"Halfling Culture and History\"",1);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Halblinge - Kultur und Geschichte\"",1);
          
        base.books.AddEnglishBookTitle( "Book with the title \" The Festival Of Relationship \"", 2 );
        base.books.AddGermanBookTitle( "Buch mit dem Titel \" Das Fest der Bindung \"", 2 );

		base.books.AddEnglishBookTitle("Book with the title \"Bluestones\"",3);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Blausteine\"",3);

      end 
      base.books.GetBookItemInform(User,Item); 
  end
