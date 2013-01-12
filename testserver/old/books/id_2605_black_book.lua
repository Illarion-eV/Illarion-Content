-- BIG NORMAL BLACK BOOK

require("base.books")

module("item.book.id_2605_black_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2605_black_book' WHERE com_itemid = 2605;

function UseItem(User, SourceItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            base.books.AddLanguage("common language",0);
            
            base.books.AddGermanBookText("Das Tagebuch von Noira Liv",0,0,0);
            base.books.AddGermanBookText("Dies sind die Aufzeichnungen von Noira Liv, hohe Priesterin Eldan's.",0,0,0);
            base.books.AddGermanBookText("Vorwort:",0,0,0);
            base.books.AddGermanBookText("Das Zeitalter des Kampfes ist vorï¿½ber. Die alten Götter verlassen uns. Sie gehen ï¿½ber das Meer. Ich bin die letzte hohe Priesterin Eldan's. Dies ist meine Geschichte.",0,0,0);
            base.books.AddGermanBookText("Mï¿½ge dieses Vermï¿½chtnis die Zeiten ï¿½berdauern, mï¿½gen die versiegelten Altï¿½re in Vergessenheit geraten: Eines Tages werden die Erben kommen.",0,0,0);
            base.books.AddGermanBookText("Die alten Bï¿½cher werden gefunden werden und alte Lehre wird sich mit neuer vermengen, denn das Wissen stirbt nicht solange wir leben, es schlï¿½ft nur. Und der Schlaf mag lange andauern. Sehr lange.",0,0,0);
            base.books.AddGermanBookText("Kapitel I: Auf der Suche nach Eldan:",0,0,0);
            base.books.AddGermanBookText("Heute begegnete ich einem Jï¿½nger Findaris. Er riet mir meine Wanderung nach Murinaa zu dokumentieren. Als Erinnerung.",0,0,0);
            base.books.AddGermanBookText("Murinaa: Noch liegt es wenige Tagesmï¿½rsche entfernt und doch ist die glanzvolle Stadt schon in der Ferne ï¿½ber dem glitzernden Sand zu erkennen.",0,0,0);
            base.books.AddGermanBookText("Wie viele Anwï¿½rter auf die Priesterschaft zieht es mich nach Murinaa, die nï¿½chste Grüßere Stadt in der sich Heiligtï¿½mer aller Götter befinden.",0,0,0);
            base.books.AddGermanBookText("Je näher ich Murinaa komme desto mehr Anhï¿½nger Bragons, Usharas, Eldans, Tanoras und Findaris kreuzen meinen Weg. Es sind ihrer nicht hunderte aber dennoch einige Dutzend.",0,0,0);
            base.books.AddGermanBookText("Endlich in Murinaa: Die Bibliothek ist gigantisch. Ich habe das Buch der Priester Eldans gefunden und gelesen. Sehr rï¿½tselhaft.",0,0,0);
            base.books.AddGermanBookText("Es scheint als würde von mir erwartet werden das Gebet zur Weihe selber zu finden. Mein einziger Anhaltspunkt ist das Buch der Priester Eldans.",0,0,0);
            base.books.AddGermanBookText("Dieses Buch ist mir ein Rï¿½tsel. Und die Weihen rï¿½cken näher. Unaufhaltsam. Wie soll ich es nur deuten?!",0,0,0);
            base.books.AddGermanBookText("Einer der Novizen bemerkte heute meine Mï¿½hen in der Bibliothek. Er hat gesagt dass es genau fï¿½nf Götter seien - Als ob ich das nicht wï¿½sste.",0,0,0);
            base.books.AddGermanBookText("Auï¿½erdem sprach er von einem Zyklus des Erschaffens. Offensichtlich wollte er mir einen Hinweis zukommen lassen. Was er wohl meinte?",0,0,0);
            base.books.AddGermanBookText("Ich habe eine interessante Beobachtung gemacht: Alle fï¿½nf Tage fï¿½llt das Licht durch einen Spalt in der Decke genau auf das Buch der Priester Eldans.",0,0,0);
            base.books.AddGermanBookText("Wie ich beobachten konnte gilt dies auch für die Bï¿½cher der anderen Priester der Fï¿½nf.",0,0,0);
            base.books.AddGermanBookText("Endlich konnte ich dem Text innerhalb des Buches das Gebet entreiï¿½en.",0,0,0);
            base.books.AddGermanBookText("Allerdings muss ich Eldan bei der Weihe ein Opfer darbringen. Der Ritualmeister wies mich darauf hin, dass ich Eldan etwas opfern muss was er mag.",0,0,0);
            base.books.AddGermanBookText("Das war der unglaublichste Tag in meinem Leben: Ich hielt die Flasche in der Hand und rief Eldan an das Opfer anzunehmen.",0,0,0);
            base.books.AddGermanBookText("Daraufhin erfasste mich ein gewaltigiger Sog und es zog mich weit in die Ferne. Ein unglaubliches Gefï¿½hl. Dort angekommen sah ich einen großen Altarraum vor mir.",0,0,0);
            base.books.AddGermanBookText("Ich vermute es war ein geheimer Altarraum Eldans in Nabranoo, der Stadt der Götter. Dieser Raum sah aus wie für die Ewigkeit geschaffen.",0,0,0);
            base.books.AddGermanBookText("Dort sprach ich, am Altar knieend, das Gebet und ich konnte Eldans Blick auf mir spï¿½ren als er mich zur Novizin berief.",0,0,0);
            base.books.AddGermanBookText("Kapitel II: Die Reise geht weiter:",0,0,0);
            base.books.AddGermanBookText("Du verstehst diese Sprache nicht.",0,0,0);
            
            base.books.AddEnglishBookText("The diary of Noira Liv",0,0,0);
            base.books.AddEnglishBookText("These are the notes of Noira Liv, high priestess of Eldan.",0,0,0);
            base.books.AddEnglishBookText("Preface:",0,0,0);
            base.books.AddEnglishBookText("The age of fighting has passed. The old gods abandoned us. They crossed the sea. I am the last high priestess of Eldan. This is my story.",0,0,0);
            base.books.AddEnglishBookText("May this legacy outlast the times, may the sealed altars fall into oblivion: One day the heirs will come.",0,0,0);
            base.books.AddEnglishBookText("The old books will be found and old teachings will mix up with new one, because the knowledge doesn't die as long as we are alive, it just sleeps. The sleep may last long, very long.",0,0,0);
            base.books.AddEnglishBookText("Chapter I: The search for Eldan:",0,0,0);
            base.books.AddEnglishBookText("Today I met a disciple of Findari. He advised me to document the walking tour to Murinaa, as a memory.",0,0,0);
            base.books.AddEnglishBookText("Murinaa: There still lays a journey of a few days between me and the city but nevertheless the splendid city is yet to be seen far away above the glittering sand.",0,0,0);
            base.books.AddEnglishBookText("Like many of the candidates for the priesthood, I am attracted to Murinaa, the next bigger city in which there are the shrines of all the gods.",0,0,0);
            base.books.AddEnglishBookText("The more I approach Murinaa, the more followers of Bragon, Ushara, Eldan, Tanora and Findari cross my way. There are not hundreds of them but nevertheless a few dozen.",0,0,0);
            base.books.AddEnglishBookText("Finally in Murinaa: The library is gigantic. I have found and read the book of the priests of Eldan. It is very mysterious.",0,0,0);
            base.books.AddEnglishBookText("It seems, that I am expected to find the prayer for the consecration on my own. My only clue is the Book of the priests of Eldan.",0,0,0);
            base.books.AddEnglishBookText("This book is an enigma for me. And the consecrations approach. Unstoppable. How shall i read it?!",0,0,0);
            base.books.AddEnglishBookText("One of the novices noticed my trouble in the library today. He said that there were exactly five gods, as if I didn't know that.",0,0,0);
            base.books.AddEnglishBookText("Besides he talked about a cycle of creation. Obviously he wanted to give me a hint. I wonder what he meant.",0,0,0);
            base.books.AddEnglishBookText("I have made an interesting observation: every fifth day the light falls through a gap in the ceiling exactly onto the book of the priests of Eldan.",0,0,0);
            base.books.AddEnglishBookText("I observed that this is also valid for the books of the other priests of the five.",0,0,0);
            base.books.AddEnglishBookText("Finally I managed to snatch the prayer from the text in the book.",0,0,0);
            base.books.AddEnglishBookText("However I have to make Eldan a sacrifice during the consecration. The master of the ritual emphasized that I have to sacrifice something to Eldan, that he likes.",0,0,0);
            base.books.AddEnglishBookText("This was the most incredible day in my life: I held the bottle in my hand and called Eldan to accept my sacrifice.",0,0,0);
            base.books.AddEnglishBookText("After that a powerful suction grasped me and it draw me far away. It was an incredible feeling. As i arrived there, I saw a large altar room in front of me.",0,0,0);
            base.books.AddEnglishBookText("I suppose it was a secret altar room of Eldan in Nabranoo, the city of the gods. This room looked like it was built for the eternity.",0,0,0);
            base.books.AddEnglishBookText("There I spoke the prayer, kneeling in front of the altar, and I could feel Eldans look on me as he appointed me to a novice.",0,0,0);
            base.books.AddEnglishBookText("Chapter II: The journey continues:",0,0,0);
            base.books.AddEnglishBookText("You don't understand this language",0,0,0);
            
            ---------------------
            
            base.books.AddLanguage("dwarf language",1);

            base.books.AddEnglishBookText("Slashing weapons\n\nThe axe is the mother of all weapons, that's why dwarves are using them.",0,0,1);
            base.books.AddEnglishBookText("With these weapons you can perform mighty attacks and, used with enough skill, they replace every shield.",0,0,1);
            base.books.AddEnglishBookText("Dwarvenaxe",2660,0,1); -- ### dwarvenaxe ###
            base.books.AddEnglishBookText("The most used axe by dwarves, it unites all attributes a real dwarveweapon needs. Power, rapidness and dexterity",0,0,1);
            base.books.AddEnglishBookText("Power, with the dwarvenaxe you can perform mighty attacks.",0,0,1);
            base.books.AddEnglishBookText("Rapidness, because of it's balanced production the dwarvenaxe can be handled quick and easy.",0,0,1);
            base.books.AddEnglishBookText("Dexterity, the thin handle and the rakish blade gives a precise handling to the axe.",0,0,1);
            base.books.AddEnglishBookText("Legends tell that there are magicial dwarvenaxes too.",0,0,1);
            base.books.AddEnglishBookText("Waraxe",383,0,1); -- ### waraxe ###
            base.books.AddEnglishBookText("The waraxe is qualified for battles and unites all important attributes of an axe.",0,0,1);
            base.books.AddEnglishBookText("But because of it's production and it's shape it'll never reach tha quality of a dwarvenaxe, smithed by dwarven smiths.",0,0,1);
            base.books.AddEnglishBookText("Legends tell that there are magicial and fire waraxes.",0,0,1);
            base.books.AddEnglishBookText("Battleaxe",2629,0,1); -- ### battleaxe ###
            base.books.AddEnglishBookText("The battleaxe is not really a good axe, that's why dwarves use them mostly for training because the damage causes it's causes isn't big.",0,0,1);
            base.books.AddEnglishBookText("Doubleaxe",205,0,1); -- ### doubleaxe ###
            base.books.AddEnglishBookText("With size and dimensions of this axe, strikes with this weapon can inevitably terminates lives.",0,0,1);
            base.books.AddEnglishBookText("But only few can handle this axe with enough skill, even after long years of training.",0,0,1);
            base.books.AddEnglishBookText("Written by\nBoindil Al'Ad Kï¿½zï¿½r\n1st Zhas in the 24th year",0,0,1);

            base.books.AddGermanBookText("Hiebwaffen\n\nDie Axt ist die Mutter aller Waffen, deswegen nutzen wir Zwerge sie.",0,0,1);
            base.books.AddGermanBookText("Mit diesen Waffen lassen sich heftige Angriffe ausfï¿½hren und geschickt gefï¿½hrt ersetzen sie jedes Schild.",0,0,1);
            base.books.AddGermanBookText("Zwergenaxt",2660,0,1); -- ### dwarvenaxe ###
            base.books.AddGermanBookText("Die meistgenutzte Axt der Zwerge, vereint alle Eigenschaften die eine wahre Zwergenwaffe brauch. Kraft, Schnelligkeit und Geschicklichkeit.",0,0,1);
            base.books.AddGermanBookText("Kraft, mit der Zwergenaxt können verheerende Angriffe ausgefï¿½hrt werden.",0,0,1);
            base.books.AddGermanBookText("Schnelligkeit, durch ihre ausbalancierte Fertigung lï¿½sst sie sich leicht und schnell fï¿½hren.",0,0,1);
            base.books.AddGermanBookText("Geschicklichkeit, der schlank Griff und die schnittige Klinge geben der Axt eine präzise Handhabung. ",0,0,1);
            base.books.AddGermanBookText("Legenden zufolge soll es sogar magische Zwergenï¿½xte geben.",0,0,1);
            base.books.AddGermanBookText("Kriegsaxt",383,0,1); -- ### waraxe ###
            base.books.AddGermanBookText("Die Kriegsaxt eignet sich gut zum kï¿½mpfen auch sie vereint die wichtigen Werte einer Axt. ",0,0,1);
            base.books.AddGermanBookText("Doch wird sie durch ihre Fertigung und Form nie an eine Zwergenaxt heranreichen welche durch zwergische Schmiede geformt wurde.",0,0,1);
            base.books.AddGermanBookText("Legenden zufolge soll es auch magische und Feuer-Kriegsï¿½xte geben.",0,0,1);
            base.books.AddGermanBookText("Schlachtaxt",2629,0,1); -- ### battleaxe ###
            base.books.AddGermanBookText("Die Schlachtaxt an sich ist keine sehr gute Axt, von Zwergen wird sie allenfalls zum Trainieren genutzt da man mit ihr keinen großen Schaden anrichten kann.",0,0,1);
            base.books.AddGermanBookText("Doppelaxt",205,0,1); -- ### doubleaxe ###
            base.books.AddGermanBookText("Durch Grüße und Masse ï¿½berzeugt die Doppelaxt, Treffer die mit dieser Axt angerichtet werden beenden unweigerlich Leben.",0,0,1);
            base.books.AddGermanBookText("Doch sind nur wenige in der Lage solch eine wuchtige Waffe, auch nach jahrelangem Training, richtig zu fï¿½hren.",0,0,1);
            base.books.AddGermanBookText("Geschrieben von\nBoindil Al'Ad Kï¿½zï¿½r\n1. Zhas im Jahre 24",0,0,1);

			------------------------
			
			base.books.AddLanguage("common language",2);
			
			base.books.AddEnglishBookText("Everyone who wants to make use of my 'services', approach Pilnock Wimnab and ask for me. \n\n ~The Dark Brewer~",2499,0,2);
			
			base.books.AddGermanBookText("Jeder, der meine 'Dienste' in Anspruch nehmen will, soll sich an Pilnock Wimnab wenden und nach mir fragen. \n\n ~Der Dunkle Brauer~",2499,0,2);
			--------------------------------------------------
			
			base.books.AddLanguage("common language",3);
			
			base.books.AddEnglishBookText("Prologue\nA few words of warning. Cooking is fun, but it takes time to become a good cook.",0,0,3);
			base.books.AddEnglishBookText("Cooking goes well with farming. You can make some money, selling your food, if you grow your own vegetables and hunt for yourself.",0,0,3);

			base.books.AddGermanBookText("Einfï¿½hrung\nEin paar Worte der Warnung: Kochen macht Spaï¿½, aber es dauert, eh' man ein guter Koch wird.",0,0,3);
			base.books.AddGermanBookText("Kochen und Feldarbeit passen gut zusammen. Wenn du dein eigenes Gemï¿½se anbaust und selbst jagst, kannst du gut zu Geld kommen.",0,0,3);

			base.books.AddEnglishBookText("Many people will be willing to bring you ingredients if you cook for them. A good way to become an appreciated member of your community.",0,0,3);
			base.books.AddEnglishBookText("A word to the wise. Never undersell your dishes. It's hard enough to get to make them. Do not accept big orders, as you will sweat while the others have fun, adventuring and earning the easy silvers!",0,0,3);
			base.books.AddEnglishBookText("Here are some of my favourite recipes. Price in coppers are only suggestions.",0,0,3);


			base.books.AddGermanBookText("Viele Leute werden dir bereitwillig Zutaten heranschaffen, wenn du für sie kochst. Ein guter Weg, um ein angesehenes Mitglied in Deiner Gemeinschaft zu werden.",0,0,3);
			base.books.AddGermanBookText("Ein Wort der Weisheit: Verkaufe deine Gerichte nie unter Preis. Es ist schwer genug sie anzurichten.",0,0,3);
			base.books.AddGermanBookText("Nimm auch keine Großbestellungen an, da du sonst schuften muï¿½t, während die anderen Spaï¿½ haben, auf Abenteuer gehen und leicht verdiente Silberlinge einstecken.",0,0,3);
			base.books.AddGermanBookText("Im Folgenden nun einige meiner Lieblingsgerichte. Die angegebenen Preise in Kupfer sind nur ein Vorschlag.",0,0,3);


			base.books.AddEnglishBookText("Fish filet\n Basic ingredients: trout filets, cabbage, tomatoes\n Easy, 25 cps.",2459,0,3); -- ### fish filet dish ###
			base.books.AddEnglishBookText("Chop two cups of cabbage finely and start cooking it adding a glass of white wine.",0,0,3);
			base.books.AddEnglishBookText("Dice two tomatoes and add to the cabbage. Mix in some herbs; I love sand berries with trout! Let it simmer until the cabbage is tender. ",2459,0,3); -- ### fish fillet dish ###
			base.books.AddEnglishBookText("Take a nice fresh trout and fillet it delicately. Put the fillets, with the skin up, on the simmering vegetables. Cover and let cook a few minutes, until the skin comes off the filets.",73,0,3); -- ### trout ###
			base.books.AddEnglishBookText("Serve immediately. Accompany this delicate dish with a goblet of Banes Claret or some light chilled Greenbriar Mead",2497,0,3); -- ### bottle of mead ###

			base.books.AddGermanBookText("Fischfilet\n Grundzutaten: Forellenfilets, Kohl, Tomaten \n Einfach, 25 Kupfer.",2459,0,3); -- ### fish filet dish ###
			base.books.AddGermanBookText("Hacke zwei Handvoll Kohl klein und koche ihn mit einem Glas Weiï¿½wein. ",0,0,3);
			base.books.AddGermanBookText("Wï¿½rfel zwei Tomaten und fï¿½ge sie zum Kohl hinzu. Verfeinere es noch mit Kräutern; ich liebe Sandbeeren mit Forelle! Lass es kï¿½cheln, bis der Kohl gar ist.",2459,0,3); -- ### fish filet dish ###
			base.books.AddGermanBookText("Nimm nun eine gute, frische Forelle und filetier sie sorgsam. Leg die Filets mit der Haut nach oben zeigend auf das kï¿½chelnde Gemï¿½se.",0,0,3);
			base.books.AddGermanBookText("Bedecke es nun und lass es ein paar Minuten kochen, bis sich die Haut vom Filet zu lï¿½sen beginnt. ",73,0,3); -- ### trout ###
			base.books.AddGermanBookText("Sofort servieren. Begleitend zu diesem Gericht passt ein Kelch 'Banes Claret' oder ein leicht gekï¿½hlter greenbriarscher Met.",2497,0,3); -- ### bottle of mead ###

			base.books.AddEnglishBookText("Salmon dish\n Basic ingredients: salmon steaks, onions, tomatoes\n Easy, 30 cps.",556,0,3); -- ### salmon dish ###
			base.books.AddEnglishBookText("Chop 2 cups of onion finely and brown them in some light oil. Add 2 diced tomatoes and some slices of champignons. Leave aside, keeping it warm. ",2952,0,3); -- ### plate ###
			base.books.AddEnglishBookText("Take a couple of thick salmon steaks and roast them on both sides for a few minutes, until tender. You could also poach them in a vegetable broth.",355,0,3); -- ### salmon ###
			base.books.AddEnglishBookText("Serve with the vegetables sauce and some buttered toasts. Accompany this nourishing dish with a sweet white wine from the Siranis.",2500,0,3); -- ### bottle of wine ###

			base.books.AddGermanBookText("Lachsgericht\n Grundzutaten: Lachssteaks, Zwiebeln, Tomaten\n Einfach, 30 Kupfer.",556,0,3); -- ### salmon dish ###
			base.books.AddGermanBookText("Zerkleinere 2 Zwiebeln sehr fein und brï¿½une sie in einem leichten ï¿½l an. Fï¿½ge 2 gewï¿½rfelte Tomaten und ein paar Champignonscheiben hinzu. Stell es zum Warmhalten beiseite. ",2952,0,3); -- ### plate ###
			base.books.AddGermanBookText("Nimm ein paar dicke Lachssteaks und rï¿½ste sie auf beiden seiten für ein paar Minuten, bis sie zart sind. Du könntest sie auch in einer Gemï¿½sebrï¿½he pochieren.",355,0,3); -- ### salmon ###
			base.books.AddGermanBookText("Serviere mit der Gemï¿½sesoï¿½e und etwas Toast mit Butter. Passend zu diesem nahrhaften Gericht wï¿½re ein sï¿½ï¿½er Weiï¿½wein aus den Trauben der Drei Schwestern Siranis.",2500,0,3); -- ### bottle of wine ###

			base.books.AddEnglishBookText("Meat dish\n Basic ingredients: steak, onions, carrots\n Medium easy, 35 cps.",557,0,3); -- ### meat dish ###
			base.books.AddEnglishBookText("Make a duxelles out of 2 small onions, 2 carrots and some birth mushrooms. Add some cream and reduce to a paste. ",162,0,3); -- ### birth mushroom ###
			base.books.AddEnglishBookText("Fry thin slices of steak in a black butter, flank steak is the best. Do not overcook it!",2940,0,3); -- ### steak ###
			base.books.AddEnglishBookText("Serve the steaks with a generous topping of the duxelles sauce. Accompany this savory dish with a mug of dark beer from Silverbrand.",2501,0,3); -- ### bottle of dark beer ###

			base.books.AddGermanBookText("Fleischgericht\n Grundzutaten: Steak, Zwiebeln, Karotten\n Mittel bis leicht, 35 Kupfer.",557,0,3); -- ### meat dish ###
			base.books.AddGermanBookText("Bereite aus zwei kleinen Zwiebeln, zwei Karotten und etwas Geburtspilz ein Duxelles. Fï¿½ge etwas Sahne hinzu und reduziere es zu einer Paste.",162,0,3); -- ### birth mushroom ###
			base.books.AddGermanBookText("Brate dï¿½nne Scheiben Steak in Butter. Steak aus der Flanke ist das Beste. Lass es nicht anbrennen!",2940,0,3); -- ### steak ###
			base.books.AddGermanBookText("Serviere die Steaks mit einer großzï¿½gigen Menge Duxelles darauf. Zu diesem pikanten Gericht passt ein Krug silverbrandsches Schwarzbier.",2501,0,3); -- ### bottle of dark beer ###

			base.books.AddEnglishBookText("Sausage dish\n Basic ingredients: sausages, cabbage, carrots\n Medium, 40 cps.",2922,0,3); -- ### sausage dish ###
			base.books.AddEnglishBookText("Grate or chop finely about 2 cups of carrots and cabbage. Add some blue birdsberry, a dash of wine vinegar and sea-salt. Mix well and leave aside in a cool place for two hours ",753,0,3); -- ### blue birdsberry ###
			base.books.AddEnglishBookText("Roast some good pork sausages. The pork from Varshikar is the leanest and the best tasting.",3051,0,3); -- ### sausage ###
			base.books.AddEnglishBookText("Serve the hot sausages in a slitted bread roll, adding the grated vegetables on top. Accompany this popular dish with a mug of light beer or some root beer from Tol Vanima.",2501,0,3); -- ### bottle of dark beer ###

			base.books.AddGermanBookText("Würstchen mit Beilage\n Grundzutaten: Wï¿½rste, Kohl, Karotten\n Mittel, 40 Kupfer.",2922,0,3); -- ### sausage dish ###
			base.books.AddGermanBookText("Schneide oder hacke etwa 2 Karotten und den Kohl in Streifen. Fï¿½ge schwarze Vogelbeeren, einen Spritzer Weinessig und Meersalz hinzu. Mixe es sehr gut und stell es für circa zwei Stunden an einen kï¿½hlen Platz.",753,0,3); -- ### blue birdsberry ###
			base.books.AddGermanBookText("Rï¿½ste einige Wï¿½rste aus Schweinefleisch. Varshikarisches Schweinefleisch ist das magerste und wohlschmeckendste.",3051,0,3); -- ### sausage ###
			base.books.AddGermanBookText("Serviere die heiï¿½en wï¿½rste in einem aufgeschnittenem Brötchen, belege es mit ein wenig des Gemï¿½sesalates. Passend zu diesem beliebten Gericht ist ein Krug leichten Bieres oder Rootbeer aus Tol Vanima.",2501,0,3); -- ### bottle of dark beer ###

			base.books.AddEnglishBookText("Rabbit dish\n Basic ingredients: rabbit, carrots, tomatoes, cabbage\n Medium difficult, 45 cps.",555,0,3); -- ### rabbit dish ###
			base.books.AddEnglishBookText("Make a stew of tomatoes, carrots and cabbages (about 2 cups of each). Let simmer a nice saddle of rabbit in that stew, until the bones fall to the bottom of the pot. ",553,0,3); -- ### rabbit meat ###
			base.books.AddEnglishBookText("Put the rabbit meat with the vegetables and some liquid into a deep pie plate lined with dough. Bake in a hot oven until the liquid has evaporated.",555,0,3); -- ### rabbit dish ###
			base.books.AddEnglishBookText("Serve the rabbit pie with a salad of meadow rhubarb. Accompany this country dish with some cider from the Union orchard.",2499,0,3); -- ### bottle of cider ###

			base.books.AddGermanBookText("Hase\n Grundzutaten: Hasenfleisch, Karotten, Tomaten, Kohl\n Mittleschwer, 45 Kupfer.",555,0,3); -- ### rabbit dish ###
			base.books.AddGermanBookText("Mach aus je zwei Handvoll Tomaten, Karotten und Kohl einen Eintopf. Lass dann ein gutes Stück Hasenrï¿½cken in dem Eintopf kï¿½cheln, bis die Knochen vom Hasenfleisch abfallen und zum Topfboden sinken.",553,0,3); -- ### rabbit meat###
			base.books.AddGermanBookText("Leg nun Fleisch, Gemï¿½se und ein Teil der Flï¿½ssigkeit auf ein Kuchenblech, ummantele es mit etwas Teig und lass es in einem heiï¿½en Ofen backen, bis die Flï¿½ssigkeit verdampft ist.",555,0,3); -- ### rabbit dish ###
			base.books.AddGermanBookText("Serviere dieses Gericht mit einem Wiesenrhabarbersalat. Cidre aus den Fï¿½ssern der Bauernunion passt zu diesem lï¿½ndlichen Gericht ausgezeichnet.",2499,0,3); -- ### bottle of cider ###

			base.books.AddEnglishBookText("Lamb dish\n Basic ingredients: lamb, carrots, tomatoes, onions\n difficult, 55 cps.",559,0,3); -- ### lamb dish ###
			base.books.AddEnglishBookText("Cook the tomatoes, carrots and onions (about 2 cups of each, diced) with a cup of red wine and some powdered life root. Leave aside.",0,0,3);
			base.books.AddEnglishBookText("Roast some lamb cutlets over a lively fire until browned and juicy. Serve with the vegetables and muffins.",2934,0,3); -- ### lamb meat ###
			base.books.AddEnglishBookText("The lamb cutlets would go well with a lively mature wine or a rather strong mead.",2500,0,3); -- ### bottle of wine###
			base.books.AddEnglishBookText("Note that lamb dish is probably the best compromise between price and nutritive value.",559,0,3); -- ### lamb dish ###

			base.books.AddGermanBookText("Lamm\n Grundzutaten: Lamm, Karotten, Tomaten, Zwiebeln\n Schwierig, 55 Kupfer.",559,0,3); -- ### lamb dish ###
			base.books.AddGermanBookText("Koche etwa je zwei Handvoll gewï¿½rfelte Tomaten, Karotten und Zwiebeln mit einem Schluck Rotwein und einer Prise Lebenswurzpulver und stell es dann zur Seite.",0,0,3);
			base.books.AddGermanBookText("Grill die Lammkoteletts ï¿½ber Flammen bis sie braun und saftig sind. Serviere sie mit dem Gemï¿½se und einem Muffin als Nachtisch.",2934,0,3); -- ### lamb meat ###
			base.books.AddGermanBookText("Zu den Lammkoteletts würde gut ein lebendiger, gereifter Wein oder ein sehr starker Met passen. ",2500,0,3); -- ### bottle of wine ###
			base.books.AddGermanBookText("Als Randnotiz: Lammgerichte stellen möglicherweise das beste Preis / Leistungsverhï¿½ltnis dar.",559,0,3); -- ### lamb dish ###

			base.books.AddEnglishBookText("Venison dish : venison (deer meat), onions, cabbages, berries \n very difficult, 75 cps. \nNote that the berries are not the blackberries used to make muffins.",554,0,3); -- ### venison dish ###
			base.books.AddEnglishBookText("Marinate some onions and cabbage thickly sliced into 1 part sea salt, 1 part wine vinegar and 1 part sweet mead. Add the wood berries. It should be ready in about 10 days.",81,0,3); -- ### berries ###
			base.books.AddEnglishBookText("I also add some secret ingredients like night angels blossomï¿½!",138,0,3); -- ### night angels blossom ###
			base.books.AddEnglishBookText("The venison meat should be properly aged to become palatable. There are no fixed rules, but it should hang in a cool, airy place for at least 10 days.",552,0,3); -- ### deer meat ###
			base.books.AddEnglishBookText("The venison meat should always be cooked on a hot fire or in a hot oven. Do not overcook it! Serve with the ï¿½sauerkrautï¿½.",552,0,3); -- ### deer meat ###
			base.books.AddEnglishBookText("This hearty meal goes well with old wine or mead, or even with some strong clear liquor.",2502,0,3); -- ### gynkese fire ###

			base.books.AddGermanBookText("Reh\n Grundzutaten: Rehfleisch, Zwiebeln, Kohl, Beeren \n Sehr schwierig, 75 Kupfer. \n Beachte, dass hier Beeren aus dem Wald benï¿½tigt werden und nicht die Brombeeren.",554,0,3); -- ### venison dish ###
			base.books.AddGermanBookText("Wende die dick geschnittenen Zwiebeln und den Kohl in einer Marinade aus einem Teil Meersalz, einem Teil Weinessig und einem Teil sï¿½ï¿½en Met. Fï¿½ge dann die Waldbeeren hinzu. Nach etwa zehn Tagen ruhig stehend ist es gut durchgezogen.",81,0,3); -- ### berries ###
			base.books.AddGermanBookText("Persï¿½nlich verfeinere ich noch mit ein paar geheimen Zutaten, wie etwa Nachtengelsblï¿½ten...!",138,0,3); -- ### night angels blossom ###
			base.books.AddGermanBookText("Das Rehfleisch sollte gut abgehangen sein, damit es wohlschmeckend ist. Es gibt hierbei keine festen Regeln aber es sollte an einem kï¿½hlen, luftigen Platz für mindestens zehn Tage hï¿½ngen.",552,0,3);
			base.books.AddGermanBookText("Das Rehfleisch sollte immer ï¿½ber einem heiï¿½en Feuer oder in einem heiï¿½en Ofen zubereitet werden. Koch es aber nicht 'zu' lange! Servier das Fleisch mit dem 'Sauerkraut'.",552,0,3); -- ### deer meat ###
			base.books.AddGermanBookText("Dieses herzhafte Mahl geht am besten mit einem alten Wein oder Met, oder sogar einem Likï¿½r. ",2502,0,3); -- ### gynkese fire ###


			base.books.AddEnglishBookText("I hope you will enjoy these recipes. Just try them for yourselves. Be creative!",0,0,3);
			base.books.AddEnglishBookText("Also see the volumes about Making Hearty Soups and The Compleat Baker, by the same author",0,0,3);

			base.books.AddGermanBookText("Ich hoffe, dass du an den Gerichten freude haben wirst. Versuch sie einfach selbst nachzukochen und sei kreativ!",0,0,3);
			base.books.AddGermanBookText("Weiterfï¿½hrende Bï¿½nde der selben Autorin liegen unter den Titeln: 'Kochen herzhafter Suppen' und 'Der Compleat Bï¿½cker' vor.",0,0,3);
			
			
			
			
			---------------------------------------------
        end
    end
	base.books.SendBookPage(User,SourceItem.data,Counter);
end  -- function

function LookAtItem(User,Item)
    if base.books.InitTitle() then
        base.books.AddEnglishBookTitle("Book with the title \"Diary of Noira Liv\"",0);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Tagebuch von Noira Liv\"",0);
        
        base.books.AddEnglishBookTitle("Book with the title \"Warguide of the Dwarves I\"",1);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Kriegshandbuch der Zwerge I\"",1);
		
		base.books.AddEnglishBookTitle("",2);
		base.books.AddGermanBookTitle("Vergilbtes schwarzes Buch",2);
		
		base.books.AddEnglishBookTitle("Book with the title \"Cooking in Illarion, volume 1\n Fish and Meat\" Leva Beliu",3);
		base.books.AddGermanBookTitle("Buch mit dem Titel \"Kochen auf Illarion, Band 1\n Fisch und Fleisch \" Leva Beliu",3);
		
		
    end
    base.books.GetBookItemInform(User,Item);
end
