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
            base.books.AddEnglishBookText("Nargún is the God of Chaos. He loves playing tricks and inacting a cunning revenge. His humor is very dark and his true form is often kept hidden from mortals.",0,0,0); 
            base.books.AddEnglishBookText("Malachin is the God of Hunting and Battle. He is very dignified and serious, usually neutral on subjects. He is said to appear as a strong knight or a clothed ranger. Many follow this honorable God.",0,0,0); 
            base.books.AddEnglishBookText("Irmorom is the God of Crafts and Trade. He loves wealth and Justice. Those who worship him take pride in their excellent crafts and monetary wealth.",0,0,0); 
            base.books.AddEnglishBookText("Sirani is the Goddess of Love and Pleasure. She usually appears as an attractive female. She is very amiable and intelligent, as well as sympathetic.",0,0,0); 
            base.books.AddEnglishBookText("Zhambra is the God of Friendship and Loyalty. He is said to appear as a young noble who is very sympathetic, until he is betrayed. He does not stand for such things.",0,0,0); 
            base.books.AddEnglishBookText("Ronagan is the God of Thieves and Shadows. He stands for spreading wealth to the needed and does not agree with strict set of laws. He is said to help honorable thieves.",0,0,0); 
            base.books.AddEnglishBookText("Moshran is the God of Blood and Bones. The orcs were created with his anger and despair, for he was cursed after saving the land. Afterwards, his status of a great warrior was not as such.",0,0,0); 
            
            base.books.AddGermanBookText("\n \n Illarions Götterwelt",0,0,0); 
            base.books.AddGermanBookText("Die Alten Götter",0,0,0); 
            base.books.AddGermanBookText("Die Alten Gottheiten bestanden aus fünf Erscheinungen, die gemeinsam die Welt erschufen. Warum sie das taten - das wird ihr Geheimnis bleiben.",0,0,0); 
            base.books.AddGermanBookText("Bragon ist der alte Feuergott. Von ihm sagt man, er sei verschwenderisch und liebe alles Goldene. Er wird als stark, gerecht und großzügig beschrieben. ",0,0,0); 
            base.books.AddGermanBookText("Eldan ist der alte Gott des Geistes. Man sagt von ihm, er sei sehr weise und habe nur wenige Anhänger. Er hatte nie viel Kontakt zu den Lebenden, vielleicht eine Grund für seine geringe Gefolgschaft.",0,0,0); 
            base.books.AddGermanBookText("Der alten Gott der Luft ist Findari. Sie ist sehr einfallsreich und von daher auch zuständig für die Kunst. Auch ihre Anhänger sind dünn gesäht, in aller Regel Wahrsager und Bänkelsänger.",0,0,0); 
            base.books.AddGermanBookText("Tanora ist die alte Göttin des Wassers. Sie gilt als die Mutter der Echsenmenschen und wird von ihnen Zelphia genannt. Sie ist die einzige unter den alten Göttern, die möglicherweise heute noch unter den Lebenden in Erscheinung tritt.",0,0,0);
            base.books.AddGermanBookText("Die alte Gottheit Ushara wacht über die Erde. Von ihr sagt man, sie lehne jede Form von Prunk ab, weshalb ihr Altar auch die Erde selbst sei.",0,0,0); 
            base.books.AddGermanBookText("Die Jüngeren Götter",0,0,0); 
            base.books.AddGermanBookText("Die Jüngeren unter den Gottheiten waren elf herausragende Bürgerliche, die, auserwählt von den Alten, bestimmt wurden, zu Göttern aufzusteigen.",0,0,0); 
            base.books.AddGermanBookText("Elara ist die Göttin des Wissens. Sie wird hauptsächlich von Zauberern und Gelehrten verehrt. Gerüchteweise soll sie das Leben des Einsiedlers bevorzugen, manchmal erscheine sie auch als großgewachsene alterslose Frau.",0,0,0); 
            base.books.AddGermanBookText("Adrons ist der Gott der Feste. Man sagt von ihm, er erscheine als ansehnlicher Mann oder auch als Bettler mit Flasche. Er ist aufbrausend und bisweilen streitlustig.",0,0,0); 
            base.books.AddGermanBookText("Cherga is die Göttin der Toten und der Seelen. Sie ist sehr ausgeglichen und stolz. Sie steht für Gerechtigkeit und nimmt solche Dinge sehr ernst.",0,0,0); 
            base.books.AddGermanBookText("Oldra is die Göttin des Lebens und der Fruchtbarkeit. Sie tritt meist als ältere Frau auf. Viele Bauern, Mütter und Familien beten zu ihr.",0,0,0);
            base.books.AddGermanBookText("Nargún ist der Gott des Chaos. Er liebt es, Streiche zu spielen und gerissen Rache zu nehmen. Sein Humor ist dunkel und seine wahre Form ist Sterblichen meist verborgen.",0,0,0);
            base.books.AddGermanBookText("Malachin ist der Gott der Jagd und des Kampfes. Er ist sehr würdevoll, ernst und für gewöhnlich neutral. Man sagt, er erscheint als starker Krieger oder verhüllter Waldläufer. Viele glauben an diesen ehrwürdigen Gott.",0,0,0);
            base.books.AddGermanBookText("Irmorom ist der Gott des Handwerks und des Handels. Er liebt Wohlstand und Gerechtigkeit. Die, die ihn verehren, sind stolz auf ihre handwerklichen Begabungen und ihren Reichtum.",0,0,0);
            base.books.AddGermanBookText("Sirani ist die Göttin der Liebe und des Vergnügens. Für gewöhnlich erscheint Sirani als gut aussehende Frau. Sie ist sehr aufmerksam und intelligent, so wie auch sympathisch.",0,0,0);
            base.books.AddGermanBookText("Zhambra ist der Gott der Freundschaft und der Treue. Man erzählt, er würde als junger Edelmann erscheinen, welcher sympathisch ist, solange man ihn nicht hintergeht. Er hält nichts von solchen Dingen.",0,0,0);
            base.books.AddGermanBookText("Ronagan ist der Gott der Diebe und Schatten. Er steht für das Geben an Bedürftige und hält nichts von strengen Gesetzen. Man erzählt, er helfe ehrwürdigen Dieben.",0,0,0);
            base.books.AddGermanBookText("Moshran ist der Gott des Blutes und der Knochen. Die Orks wurden durch seine Wut und Verzweiflung wegen des, ihm auferlegten, Fluches nachdem er das Land rettete, geschaffen. Danach war sein Ruf als großer Krieger zerbrochen.",0,0,0);

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
            base.books.AddGermanBookText("Allen Unwissenden sei gesagt: Halblinge sehen aus wie Menschenkinder und natürlich fördert ihre ganze Erscheinung solche Vorstellungen.",0,0,1);
            base.books.AddGermanBookText("Neben ihrem geringen Wuchs liegt jedoch der größte Unterschied zu menschen in ihren großen und haarigen Füßen, die sie stolz in aller Öffentlichkeit präsentieren. Sie neigen dazu, älter zu werden als die Menschen.",0,0,1);
            base.books.AddGermanBookText("Halblinge bevorzugen Gegenden, in denen Hügel und Wälder das Bild bestimmen, wo sie ihre Heimstï¿½tten in die Erde eingraben. Im Laufe von Generationen können diese Höhlen eine beachtliche Grüße erreichen.",0,0,1);
            base.books.AddGermanBookText("Ihre Häuser sind voller Möbel und anderer Besitztümer,zumal Halblinge kaum einmal etwas wegwerfen. Auch neigen sie dazu, andere Heime als die ihren als ungemï¿½tlich zu empfinden.",0,0,1);
            base.books.AddGermanBookText("Zuhause leben sie in Großfamilien, denen ein Clanführer vorsteht. Das ist jedoch eher ein Ehrentitel als eine echte Machtposition. Die Aufgabe liegt vor allem darin, Familienfeste zu veranstalten.",0,0,1);
            base.books.AddGermanBookText("Halblinge kreuzen gerne unerwartet zum Essen auf und dürfen erst wieder gehen, wenn sie pappsatt sind, alles andere gï¿½lte als unhï¿½flich. Bï¿½se Zungen behaupten, es gäbe im Leben der Halblinge nur drei wichtige Dinge:",0,0,1);
            base.books.AddGermanBookText("Und zwar Frühstück, Mittagessen und Abendbrot!",0,0,1);
            base.books.AddGermanBookText("Auch zeigen sie starkes Interesse für Essen und Trinken. Sie sind als Schleckermäuler verschrien. Man mag sie oftmals dabei antreffen, wie ihnen ein Halbling einen Vortrag über die Kochkünste hält.",0,0,1);
            base.books.AddGermanBookText("Es ist nicht unüblich, dass Kneipen damit prahlen, einen Halbling als Koch zu beschäftigen.",0,0,1);
            base.books.AddGermanBookText("Halblinge ziehen es vor, von der eigenen Hände Arbeit zu leben. Es gibt Einige, die weltberï¿½hmt wurden für ihre meisterlichen Handarbeiten, aber in erster Linie sind sie Bauern, Jäger und Kräutersammler.",0,0,1);
            base.books.AddGermanBookText("In den Dörfern findet man häufig kleine Oldra-Schreine. Tatsächlich ist das Erntefest der wichtigste Feiertag des gesamten Jahres.",0,0,1);
            base.books.AddGermanBookText("Da sie so naturverbunden sind, haben sie einen hohen Sinn dafür entwickelt, sich flink und gerï¿½uscharm fortzubewegen. Auch wenn das viele nicht zugeben wollen,werden einige dieser Fähigkeiten gerne für Diebstähle genutzt.",0,0,1);
            base.books.AddGermanBookText("Es ist ratsam, Halblinge im Auge zu behalten, die mit dem Zeichen Ronagans geschmï¿½ckt sind, sie kï¿½nnten Bï¿½ses im Schilde fï¿½hren.",0,0,1);
            base.books.AddGermanBookText("Halblinge haben zum Leben eine recht simple Einstellung. Sie sorgen sich selten um die Zukunft und ihr Auskommen, stattdessen bevorzugen sie Entspannung und einen anhaltenden Plausch mit guten Freunden.",0,0,1);
            base.books.AddGermanBookText("Sie haben keinen Sinn für Hierachien, halten aber Familie und Freundschaften für unverzichtbar. Das kann man auch an ihrer lockeren Gesellschaftsstruktur ablesen.",0,0,1);
            base.books.AddGermanBookText("Ihre kindhafte Erscheinung  mag als Wehrlosigkeit missverstanden werden. Sie sind sehr schwer in Wallung zu bringen, vorausgesetzt, man spielt nicht gerade mit ihrem Essen.",0,0,1);
            base.books.AddGermanBookText("Sie sind auch sehr zielstrebig und man sollte einem halbling nicht in die Quere kommen, wenn er sich erst einmal etwas in den Kopf gesetzt hat. Orks wie Menschen mussten das auf die harte Tour lernen.",0,0,1);
            base.books.AddGermanBookText("Weil Halblinge keine großartigen Magier sind, empfiehlt es sich, einem Übenden aus dem Weg zu gehen, für den Fall, sein Zauber zeigt unerwartete Effekte.",0,0,1);
            
            ----------
            
            base.books.AddLanguage("dwarf language",2);
            base.books.AddEnglishBookText( " Since the orc wars, the dwarves lived spread widely amongst the countries, but they always sticked to their belief and their traditions. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " The Festival Of Relationship was of the happiest. It brought them the most cheerful moments.", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " But the war and the everlasting suffering during it, erased the longing for love in the brave heart of the brothers and they seperated from each other more and more. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " The dwarves grew lonely and so it soonly happened, that the tribes of them, which lived in different mountains, lost their bound of friendship between them. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " But Irmorom saw what had happened to his beeings and so he lured Ragnï¿½l, Elrik's son, the great smith and Heimdal, Ralla's daugther, a mighty warrior, who came from different tribes, ", 0, 0, 2 ); 
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
            base.books.AddEnglishBookText( " Only the rings were left, ten of them, five of each tribe. When Ragnï¿½l and Heimdall had watched that scene and realized, that he was their Creator, they kneeled down and he said to them: ", 0, 0, 2 );
            base.books.AddEnglishBookText( "'You, that have pure hearts, take those rings as a present. Such as the mine. The dwarven folk shall never again forget about the worthy bound of friendship and love! ", 0, 0, 2 );  
            base.books.AddEnglishBookText( " May no dwarf ever betray his brothers and sisters for his greed again!' And so he left them there, as the first rulers of the new dwarven realm.", 0, 0, 2 );
            base.books.AddEnglishBookText( " Since that day, the brothers and sisters celebrate their love in the Winds Of Siros. And since that day, it's also a tradition, that the best smith of the mountain smiths two ", 0, 0, 2 ); 
            base.books.AddEnglishBookText( " glorious rings and, after the ceremony, melts them together for ever, so that the dwarves may never ever sperate from each other again. ", 0, 0, 2 );
            base.books.AddEnglishBookText( " Those holy rings are the sign for steadiness and the endless love of the couple, that can be competed by their ability to hold their drinks and their faith only...", 0, 0, 2 );
            base.books.AddGermanBookText( " Seit den Orkkriegen waren die Stï¿½mme der Zwerge weit verteilt ï¿½ber die Lï¿½nder, doch stets hielten sie fest an ihrem Glauben und an ihren Traditionen.  ", 0, 0, 2 );   
            base.books.AddGermanBookText( " So war auch das Fest der Bindung eine von ihnen die den Zwergen oft schon die heitersten Momente brachte...", 0, 0, 2 );
            base.books.AddGermanBookText( " Doch der Krieg und das andauernde Leid während diesem lies den Drang sich an Liebe zu Binden erschwachen in den tapferen Herzen der Brï¿½der und so lebten sie sich immer weiter auseinander. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Die Zwerge wurden einsam und so kam es, dass bald das Band zwischen den einzelnen Stï¿½mmen, die in verschiedenen Bergen hausten, zerriss und sie mehr für sich als für einander waren. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Doch Irmorom sah was seinen Geschï¿½pfen wiederfahren war und so lockte er den großen Schmied Ragnï¿½l Erik's Sohn und die große Kriegerin Heimdal Rallas Tochter, ", 0, 0, 2 );
            base.books.AddGermanBookText( " die beiden verschiedene Stï¿½mme fï¿½hrten mit Hilfe einer List in ein entlegenes Bergwerk das schon seit langem verlassen war. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Und kaum das die beiden für sich waren freundeten sie sich an und trafen sich immer häufiger in der besagten Mine. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Eines Tages beschloï¿½en sie einander zu heiraten und sie wollten die Hochzeit an jenem Ort feiern an dem sie sich so zufï¿½llig getroffen hatten. ", 0, 0, 2 );
            base.books.AddGermanBookText( " Doch die Zwerge waren misstrauisch geworden und engstirnig so das sie nicht einsahen das sie in Zukunft teilen sollten mit den anderen so taten sich die ï¿½ltestenrï¿½te ", 0, 0, 2 );     
            base.books.AddGermanBookText( " beider Seiten zusammen und sprachen zu dem Paar: 'Es sei euch genehmigt zu heiraten und die Stï¿½mme zu vereinen, an dem Tage an dem das Bergwerk das ihr so sehr mï¿½gt wieder ", 0, 0, 2 );
            base.books.AddGermanBookText( " edele Gesteine hervorbringt.' Das stimmte Irmorom nachdenklich doch er war bereit dem Paar zu helfen und so lies er das Bergwerk vor Gold und Edelsteinen geradezu ï¿½berquellen. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Und als dann das Paar mit der frohen Kunde erneut vor die ï¿½ltestenrï¿½te trat da sprachen sie: 'Es ist wie ihr verlangt habt das Bergwerk nun der schönsten Steine Pracht in sich birgt!' ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Kaum das der edle Schmied dies gesagt hatte blitzte die Gier in den Augen der ï¿½ltesten und ohne auch nur ï¿½ber die Hochzeit zu reden machten sie sich auf in die Minen um all das ", 0, 0, 2 );
            base.books.AddGermanBookText( " Gold und die Edelsteinen hinfortzutragen. Das erzï¿½rnte Irmorom so sehr das er persï¿½nlich vom heiligen Berg des Ursprungs herunterkam und als der Langbart, als den man ihn ", 0, 0, 2 );   
            base.books.AddGermanBookText( " schon oft gesehen hatte, unter die Zwerge trat. Er sprach zu den ï¿½ltesten: 'Seht euch an ihr die ihr euch die Weisen und edlen nennt ihr solltet euch schï¿½men der  ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Gier zu frï¿½nen während euer neuer König nach der Liebe einer Kriegernï¿½n trachtet die all eure Probleme lï¿½sen kï¿½nnte.' ", 0, 0, 2 );
            base.books.AddGermanBookText( " Doch sie lauschten ihm nicht denn die Gier hatte sie Blind und taub gleichermaï¿½en gemacht und so erkannten sie ihn auch nicht. ", 0, 0, 2 );   
            base.books.AddGermanBookText( " Und als er sie weiterhin behelligte und sie ermahnte da hoben sie alle ihre Finger und zeigten ihre Ringe die bewiesen das sie die ï¿½ltesten waren und sprachen voller ï¿½bermut zu ihm: ", 0, 0, 2 );   
            base.books.AddGermanBookText( "'Wir sind die Ohren und Mï¿½nder Irmoroms und was wir sagen ist Gesetz ein einfacher wie du sollte sich nicht mit uns messen!' ", 0, 0, 2 );
            base.books.AddGermanBookText( " Da riï¿½ Irmorom der Geduldspfaden und er tobte wie nur selten zuvor, mit einem Wink zerfielen die Toren zu Staub aus dem er sie einst geschaffen hatte, und alles was blieb waren ihre Ringe, ", 0, 0, 2 );     
            base.books.AddGermanBookText( " die zusammengeschmolzen am Boden lagen, Zehn an der Zahl und von beiden Stï¿½mmen Fï¿½nf.", 0, 0, 2 );
            base.books.AddGermanBookText( " Als Ragnï¿½l und Heimdall die Szene beobachteten knieten sie nieder vor ihrem Schï¿½pfer und er sprach zu ihnen:", 0, 0, 2 );   
            base.books.AddGermanBookText( " 'Ihr die ihr reinen Herzens seit wisset diese Ringe als mein Geschenk, genau wie diese Mine. Auf das das Volk der Zwerge nie vergessen mï¿½ge wie wertvoll der Bund der Freundschaft ", 0, 0, 2 );   
            base.books.AddGermanBookText( " und der Liebe sind! Auf das nie mehr Zwerge der Gier wegen ihre Brï¿½der und Schwestern verraten!' ", 0, 0, 2 );
            base.books.AddGermanBookText( " Und so lies er sie zurück die neuen Herscher ï¿½ber das neue Reich der Zwerge!", 0, 0, 2 );   
            base.books.AddGermanBookText( " Seither feiern die Brï¿½der und Schwestern in den Winden des Siros ihren Bund der Liebe, und seither ist es Tradition das der fï¿½higste Schmied des Berges dem Paar ", 0, 0, 2 );   
            base.books.AddGermanBookText( " zwei prï¿½chtige Ringe schmiedet und nach der Zeremonie auf ewig verschmilzt auf das sie sich so wie die Zwerge nie mehr von einander trennen mï¿½gen! ", 0, 0, 2 );
            base.books.AddGermanBookText( " Diese heiligen Ringe sind das Zeichen der Bestï¿½ndigkeit, der Liebe eines Paares, die nur durch die Trinkfestigkeit und den Glauben der Zwerge noch in Konkurrenz gerï¿½t...", 0, 0, 2 );

            --------------------------------------

            base.books.AddLanguage("common language",3);

            base.books.AddEnglishBookText("\n\n~~Sapphires~~",284,0,3);
            base.books.AddEnglishBookText("The calmness that sapphires emanate for most people makes them important for warriors and mages alike.",0,0,3);
            base.books.AddEnglishBookText("It is told that magic energies of sapphires are the base for many kinds of protective magic.",0,0,3);
            base.books.AddEnglishBookText("Weapons:\n\nIf one lets the magic energies of sapphires flow into a weapon, the bearer's ability of defence is raised.",2626,0,3);
            base.books.AddEnglishBookText("Armors and Shields:\n\nThe powers of sapphire help the bearer by providing a higher defence value.",2360,0,3);
            base.books.AddEnglishBookText("Magic wands:\n\nIn a magic wand, sapphire powers cause an empowerment of healing magic and any spells that contain the creation of elements.",208,0,3);
            base.books.AddEnglishBookText("Tools:\n\nThe quality of a tool can be enhanced by sapphire power.",72,0,3);
            base.books.AddEnglishBookText("Trinkets:\n\nTrinkets that are treated with sapphire energy can provide better resistance of the bearer.",71,0,3);
            base.books.AddEnglishBookText("There is one important thing to note: One should never let the energies of a Sapphire flow into a trinket in which there is another stone embedded.",0,0,3);

            base.books.AddGermanBookText("\n\n~~Blausteine~~",284,0,3);
            base.books.AddGermanBookText("Das kï¿½hle Gelassenheit, die Blausteine für die meisten Personen ausstrahlt macht diese Steine für Krieger wie auch für Magier gleichermaï¿½en bedeutsam.",0,0,3);
			base.books.AddGermanBookText("Es heiï¿½t, dass die magischen Energien von solchen Blausteinen die Grundlage für viele Arten von Schutzmagie sind.",0,0,3);
            base.books.AddGermanBookText("Waffen:\n\nLï¿½sst man die magischen Energien von Blausteinen in eine Waffe einflieï¿½en, so steigert sich dadurch die Fï¿½higkeit des Trï¿½gers zur Verteidigung.",2626,0,3);
			base.books.AddGermanBookText("Rüstungen und Schilde:\n\nIn Rüstungen und Schilden bewirken die magischen Krï¿½fte von Blausteinen einen gesteigerten Verteidigungswert.",2360,0,3);			
			base.books.AddGermanBookText("Magierstï¿½be:\n\nIn einem Magierstab hingegen bewirken Blausteinenergien eine Steigerung in der Heilmagie, sowie bei allen Sprï¿½chen, die mit dem Erschaffen von Elementen zu tun haben.",208,0,3);
			base.books.AddGermanBookText("Werkzeuge:\n\nLï¿½sst man die magischen Energien eines Blausteines in ein Werkzeug flieï¿½en, so steigern diese die Qualität des Werkzeuges.",72,0,3);
			base.books.AddGermanBookText("Schmuckstï¿½cke:\n\nIn Schmuckstï¿½cken wie Ringen oder auch Amuletten bewirken die Energien der magischen Blausteine, dass der Körper des Trï¿½ger wiederstandsfï¿½higer wird.",71,0,3);
			base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Blausteins in ein Schmuckstï¿½ck flieï¿½en lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,3);


          end 
      end 
      base.books.SendBookPage(User,SourceItem.data,Counter); 
  end 
  
  function LookAtItem(User,Item) 
      if base.books.InitTitle() then 
        base.books.AddEnglishBookTitle("Book with the title \"Gods of Illarion\"",0); 
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Götter Illarions\"",0); 
          
        base.books.AddEnglishBookTitle("Book with the title \"Halfling Culture and History\"",1);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Halblinge - Kultur und Geschichte\"",1);
          
        base.books.AddEnglishBookTitle( "Book with the title \" The Festival Of Relationship \"", 2 );
        base.books.AddGermanBookTitle( "Buch mit dem Titel \" Das Fest der Bindung \"", 2 );

		base.books.AddEnglishBookTitle("Book with the title \"Sapphires\"",3);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Blausteine\"",3);

      end 
      base.books.GetBookItemInform(User,Item); 
  end
