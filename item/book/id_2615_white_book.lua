--SYMBOL THICK WHITE BOOK 

require("base.books")

module("item.book.id_2615_white_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2615_white_book' WHERE com_itemid = 2615;

function UseItem(User, SourceItem, TargetItem, Counter, Param) 
      if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then 
          world:erase(SourceItem,1); 
      else 
          if base.books.InitBook() then 
              base.books.AddLanguage("Ancient Language",0); 
        
             base.books.AddGermanBookText("\n \nAlbar's Lektion",0,0,0); 
             base.books.AddGermanBookText("Vor langer Zeit ereignete sich eine Gegebenheit in der Stadt Albar, zur Mittagszeit an einem Spï¿½tsommertag hin. Die Sonne stand hoch und wand sich hinter vielen Wolken und einem blauen Himmel. Die",0,50,0); 
             base.books.AddGermanBookText("Wï¿½rme war deutlich zu spï¿½ren, wenn nicht gerade ein kï¿½hler Wind durch die Gassen und Häuser blies. Auf dem Markt herrschte reges Treiben, wo ein Jeder versuchte, seine Waren feilzubieten und die",0,50,0); 
             base.books.AddGermanBookText("Marktschreier sich lauthals Gehï¿½r verschafften. Hier und da waren Stadtwachen, die sich mit strengen Blicken autorithï¿½t verschafften und aufpassten, dass mï¿½glichst niemand auf dumme Gedanken kï¿½me.",0,50,0); 
             base.books.AddGermanBookText("In dieser Masse bemerkte sicherlich niemand den alten Blinden, der, auf seine Krï¿½cke gestï¿½tzt, durch die Straï¿½en wanderte und seinen Umhang enger um den Hals schlug, als sei ihm entweder kalt, oder er",0,50,0); 
             base.books.AddGermanBookText("würde versuchen, seine Scham zu verbergen, dass er in einem solch jï¿½mmerlichen Zustand war: seine Kleidung war alt, und sie stank. Bis auf die schmutzige Augenbinde, war nicht viel von seiner Mimik",0,50,0); 
             base.books.AddGermanBookText("zu erkennen. Weder lï¿½chelte er, noch zeigte er sonst eine Expression.\n So wanderte dieser Alte nun, als ihm eine Schar von Menschen entgegenkam. Er konnte zwar nicht ausmachen, was genau da auf ihn",0,50,0); 
             base.books.AddGermanBookText("zukam, doch seine Ohren verliehen ihm eine weitaus bessere Gabe, die Dinge aufzufassen. Und so schien es, als wï¿½re es ein Trupp von Soldaten, oder ï¿½hnlich bewaffneten Personen. Anstatt ihnen",0,50,0); 
             base.books.AddGermanBookText("auszuweichen, ging er geradewegs in die Masse von Leuten herein. Im nï¿½chsten Augenblick wurde er auch schon unsanft zurückgestoï¿½en und landete hart auf dem Boden.\n \"Verzieh dich, du Penner! Was",0,50,0); 
             base.books.AddGermanBookText("fï¿½llt dir ein, dem großen Hohepriester Brágons im Weg herumzustehen? Scher dich fort\" schien einer der bewaffneten ihn anzuschnauzen. Der Alte rappelte sich ganz gemï¿½chlich auf, lehnte sich wieder",0,50,0); 
             base.books.AddGermanBookText("auf seine Krï¿½cke und ganz plötzlich sah man ein Lï¿½cheln auf seinen Lippen. \"Aber, aber, mein werter Herr. Seid nicht zornig, bitte nicht! Ich habe hier eben diesen goldenen Ring gefunden, und ihr",0,50,0); 
             base.books.AddGermanBookText("kï¿½nnt mir doch sicher sagen, wem er gehï¿½rt, habe ich recht?\"\n Mit diesem Satz zog der Alte einen unscheinbaren goldenen Ring aus seiner Tasche und hielt ihn hï¿½her in die Luft. \"Ein Ring aus Gold?",0,50,0); 
             base.books.AddGermanBookText("Gib ihn her, sofort! Ich will ihn haben, er gehï¿½rt mir und meiner heiligen Sache!\" hï¿½rte der Alte nun eine andere Stimme, die etwas geschwollener klang und irgendwie musste dieser sprechende Mensch",0,50,0); 
             base.books.AddGermanBookText("Gib ihn her, sofort! Ich will ihn haben, er gehï¿½rt mir und meiner heiligen Sache!\" hï¿½rte der Alte nun eine andere Stimme, die etwas geschwollener klang und irgendwie musste dieser sprechende Mensch",0,50,0); 
             base.books.AddGermanBookText("wahnsinnig fett gewesen sein. Ein ekliges Lachen folgte, als man dem alten Mann den Ring aus der Hand riss und ihn wieder davonstieï¿½.\n Mit einer geschickten Bewegung schob sich der fettleibige",0,50,0); 
             base.books.AddGermanBookText("Priester den Ring ï¿½ber den kleinen Finger, doch wollte er nicht passen. Er fluchte, zog daran, doch abziehen konnte er ihn auch nicht. Eine ziemlich verhexte Situation, wie jener Mensch schon bald",0,50,0); 
             base.books.AddGermanBookText("finden würde, denn just als es ihm gelang, den Ring mit einem gewaltsamen Ruck abzuziehen, hatte er keinen Ring mehr in der Hand, sondern eine lebensechte goldene Schlange, die zu wachsen schien.",0,50,0); 
             base.books.AddGermanBookText("Zischend und blitzschnell schlï¿½ngelte sie sich um seinen Hals und wand sich immer enger. Ein klï¿½gliches Rï¿½cheln war das letzte, was dem dicken Kerl entwich, bevor er erstickte und zu Boden fiel.",0,50,0); 
             base.books.AddGermanBookText("Vom Alten keine Spur, er schien verschwunden.",0,50,0); 

             base.books.AddEnglishBookText("\n \nAlbar's Lesson",0,0,0); 
             base.books.AddEnglishBookText("A long time ago happened a situation in the town of Albar to midday on a late summerday. The sun stood high and looped behind many clouds on a blue sky. The heat was clear to feel when not a cool",0,50,0); 
             base.books.AddEnglishBookText("wind blew through the alleys and houses. On the market was a busy ado where everyone tried to offer his wares for sale and the mountebanks enforce hearing on the top of their voices. Here and there",0,50,0); 
             base.books.AddEnglishBookText("were townguards which enforced authority with stern looks and paid attention that at best no one aquires stupid cogitations.\n Probably no one in this crowd paid attention to the old blind who,",0,50,0); 
             base.books.AddEnglishBookText("supported by his cruth, wandered through the streets and wrapped his cloak tight around his body as if he was either freezing or as if he tried to cover his shame that he was in such a bad shape: his",0,50,0); 
             base.books.AddEnglishBookText("cohort of human accommodated. He couldn't spot what exactly approached but his hearing awarded him a by far better gift to understand the things.And so it seems to be some kind of troop of soldiers or",0,50,0); 
             base.books.AddEnglishBookText("another kind of weaponed people. Instead of avoiding the group, he ran right in the middle of it. In the next moment he was pushed ruggedly and landed hard on the floor.\n \"Get lost, burn! What comes",0,50,0); 
             base.books.AddEnglishBookText("to your mind by standing in the way of the high priest of Brágon? Go away!\" seemed to scream one of the weaponed. The old man got slowly back on his feet and leaned once again on his crutch and",0,50,0); 
             base.books.AddEnglishBookText("suddelny one could see a smile on his lips.\"Now, now mylord. Don't be angry, please don't. I just found this golden ring and you can surely tell me to whom it belongs, am I right?\"\n With this",0,50,0); 
             base.books.AddEnglishBookText("sentence drew the old man a inconsiderable golden ring out of his bag and held it higher into the air. \"A golden ring? Give it to me, immediantly! I want it, it belongs to me and my holy affair!\"",0,50,0); 
             base.books.AddEnglishBookText("heard the old man now anoth voice which sounded a bit more billowed and somehow this speaking man must have been immense fat. A distgusting laughter followed when someone pulled the ring out of the",0,50,0); 
             base.books.AddEnglishBookText("hand of the old man and pushed him aside once again.\n With a handy movement the fat man hustled the ring on his pinky finger but it wouldn't fit. He cursed and pulled on it but he couldn't remove it",0,50,0); 
             base.books.AddEnglishBookText("either. A pretty jinxed situation, like every person will find soon enough, because just in the moment when he removed the ring with a usurping jerk, he didn't have a ring in his hand but a living",0,50,0); 
             base.books.AddEnglishBookText("golden snake which seemed to grow. Fizzling and as quick as a flash the snake meandered around his neck and hedged tighter around it. A miserable stertorousness was the last thing that escaped from",0,50,0); 
             base.books.AddEnglishBookText("this fat man befor he choked and fell to the floor.\n \nFrom the old man was no trace left, he seemed to have vanished. ",0,50,0); 

             -------------
             
             base.books.AddLanguage("Ancient Language",1); 
             
             base.books.AddGermanBookText("\n \nGynk's Lektion",0,0,1); 
             base.books.AddGermanBookText("Ein paar Monate später ereignete sich eine ganz andere Situation in einer der Hauptstï¿½dte der Gynkeesh, die zu den freien menschlichen Handelsvï¿½lker zï¿½hlen. Es war frï¿½h am Morgen, und auf den Straï¿½en",0,50,1); 
             base.books.AddGermanBookText("waren nochnicht viele Menschen zu sehen. Nur ein paar Frauen rollten ihre Fï¿½sser zum Fluss, um sie für die kommenden Tage mit Trinkwasser zu fï¿½llen. Mancher Hï¿½ndler war schon dabei, seinen Stand fï¿½r",0,50,1); 
             base.books.AddGermanBookText("den Tag vorbereiten und ein anderer war mit einem großen Karren unterwegs, der voll beladen mit Gï¿½tern wie Wein, Wolle, Hafer, Kohl und anderen Nachrungsmitteln war. Dahinter noch ein Karren, dann",0,50,1); 
             base.books.AddGermanBookText("noch einer und so weiter. Es mag für Menschen aus anderen Gefilden merkwï¿½rdig sein, diese ziemlich lange Karawane von Karren zu sehen, aber scheinbar war dies einer der größten Hï¿½ndler für Waren",0,50,1); 
             base.books.AddGermanBookText("dieser Art in der nï¿½heren Umgebung.\n So stand dieser stolze Kerl also vorne auf dem ersten Wagen und lenkte die Wagenkolonne mitten durch die Stadt zum Bestimmungsort, wo sie hinsollte. Wenn jemand",0,50,1); 
             base.books.AddGermanBookText("im Weg stand, so wurde er einfach ï¿½berrollt - Hier galt ganz klar sein Recht, und wenn Er hier fuhr, dann hatten alle anderen von \"seiner\" Straï¿½e zu gehen. So war das nunmal, und dabei würde es auch",0,50,1); 
             base.books.AddGermanBookText("bleiben, wï¿½re da nicht plötzlich dieser alte blinde Mann am Straï¿½enrand, der lautstark seinen Namen rief und mit einem Arm winkte. Es kï¿½mmerte ihn nicht sonderlich, schlieï¿½lich war er eine sehr",0,50,1); 
             base.books.AddGermanBookText("Bekannte Person, doch dann erregte etwas an dem Alten seine Aufmerksamkeit. Er schien eine goldene Kugel in der Hand zu halten und sie hin und herzuschwenken. Neugierig rief der Hï¿½ndler lautstark, um",0,50,1); 
             base.books.AddGermanBookText("sicher irgendwo gestohlen!\".\n \"Nein, nein, mein Herr. Ihr liegt falsch, sie lag hier herum! Ich stolperte ï¿½ber sie und nun weiï¿½ ich nicht wohin damit.\" - \"Lag hier herum, hm? Ich glaube dir",0,50,1); 
             base.books.AddGermanBookText("kein Wort, alter Kerl. Du gibst mir besser die Kugel, ich werde sie nehmen und in meinem Bekanntenkreis herumfragen, wem sie gehï¿½rt! Ich bin eine starke Persï¿½nlichkeit.\" sagte der Hï¿½ndler und",0,50,1); 
             base.books.AddGermanBookText("lï¿½chelte selbstsicher. Natï¿½rlich würde er die Kugel für sich behalten und einen tollen Preis dafür erhalten. Damit könnte er sich dann so einige Wï¿½nsche erfï¿½llen, und natürlich nochmehr Reichtum",0,50,1); 
             base.books.AddGermanBookText("anhï¿½ufen.\n \"Sehr nobel von euch, mein Herr. So nehmt sie, nehmt sie!\" sprach der Alte und warf sie dem Hï¿½ndler vor die Füße. Dieser bï¿½ckte sich nach der Kugel und wollte sie aufheben. Sie war",0,50,1); 
             base.books.AddGermanBookText("furchtbar schwer, aber seine Gier war so groß, dass er sie mit aller Kraft hochzog und zu seinem Karren brachte. Es kam ihm vor, als würde sie immer schwerer und schlieï¿½lich musste er sie",0,50,1); 
             base.books.AddGermanBookText("fallenlassen. In all der Anstrengung hatte er den Alten aus den Augen verloren, so schien es nun, also wï¿½re er von der Bildflï¿½che verschwunden. Mit den Schultern zuckend wandte er sich nun wieder der",0,50,1); 
             base.books.AddGermanBookText("garstigen Kugel zu, traute jedoch seinen Augen nicht. Das, was vorher eine Kugel aus purem Gold war, verwandelte sich in etwas unfï¿½rmiges. Ein Brummen war zu hï¿½ren. Erst leise, dann immer lauter, und",0,50,1); 
             base.books.AddGermanBookText("schlieï¿½lich war es so laut, dass er sich die Ohren zuhalten musste. Nun ging alles blitzschnell: Es gab einen Knall und schon war in einem Schwarm aus surrenden goldenen Kï¿½fern, die ihn jedoch",0,50,1); 
             base.books.AddGermanBookText("ignorierten und schnurstracks auf alles zuflogen, was er auf seinen Karren geladen hatte, und es innerhalb von Sekunden aufaï¿½en. Sie labten sich an allem, was sie fanden, erhoben sich dann hoch in",0,50,1); 
             base.books.AddGermanBookText("die Luft, schwirrten davon, und waren niemehr gesehen.\n",0,50,1); 
                
             base.books.AddEnglishBookText("\n \nGynk's Lesson",0,0,1); 
             base.books.AddEnglishBookText("A few months later happened an entire different situation in one of the capitols of the Gynkeesh, which county to the free human merchant folk. It was early in the morning and there weren't many",0,50,1); 
             base.books.AddEnglishBookText("people to be seen on the streets. Only a few women rolled their barrels to the river to fill them with drinking water for the upcoming days. Some merchants were busy to prepare their stand for the",0,50,1);              
             base.books.AddEnglishBookText("day, another was on his way with a big cart, which was loaded with goods like wine, wool, oats, cabbage and other food. After this cart came another one, which was followed by another one and so on.",0,50,1); 
             base.books.AddEnglishBookText("It might look a little bit weird for people from other countries to see this long caravan of carts but apparently was this merchant one of the biggest for goods like that in the nearer surrounding.",0,50,1); 
             base.books.AddEnglishBookText("So was this proud man standing in the front of the first cart and led the caravan through the city to its destination. When someone stood in his way he or she was just ran over - here clearly obtained",0,50,1); 
             base.books.AddEnglishBookText("his right and when He drove right here everyone had to leave \"his\" street. It just was like that and it would stay like that when not a old blind man stood on the side of the street suddenly, who",0,50,1); 
             base.books.AddEnglishBookText("shouted his name loudly and waved with his hand. It didn't concern him much, after all he was a well-known person but something on the old man caught his attention. He seemed to hold a golden ball in",0,50,1); 
             base.books.AddEnglishBookText("his hand and swung it from side to side. Curiously the merchant shouted loudly to bring all his carts to a stand and jumped from his cart. He approached the ragged one and said to him: \"What do you",0,50,1); 
             base.books.AddEnglishBookText("have sucha big, golden ball here, old man? You surely stole it somewhere!\".\n \"No, no sir. You're wrong, it was laying here around! I stumbled over it and now I don't know where to with it.\"",0,50,1); 
             base.books.AddEnglishBookText("\"Was laying here around, hm? I do not believe you a word, old guy. You better give me the ball, I'll take it and ask in my circle of friends to whom it belongs! I'm a strong personality.\" said",0,50,1); 
             base.books.AddEnglishBookText("the merchant and smiled self-confident. Of course he would keep the ball for himself and receive a great price for it. He could make some dreams come true with it and of course accumulate more wealth.",0,50,1); 
             base.books.AddEnglishBookText("\"Very noble of you, sir. Take it than, take it!\" said the old man and threw it to the feet of the merchant. He bend down and wanted to pick it up. It was terribly heavy, but his greed was that big",0,50,1); 
             base.books.AddEnglishBookText("that he pulled it up with all his strenght and brought it to his cart. It seemed to him that it became heavier and in the end he needed to let it fall. In all the effort he lost sight of the old man,",0,50,1); 
             base.books.AddEnglishBookText("so it seemed now that he vanished into thin air. He shruged and turned back to the nasty ball but didn't trust his eyes. That, what was a ball made of pure gold before, transformed in something",0,50,1); 
             base.books.AddEnglishBookText("misshaped. A buz could be heared. At first quiet but it grew louder and finally it was so loud that he had to cover his ears. Now everything happened like a flash: There was a band and he found",0,50,1); 
             base.books.AddEnglishBookText("himself in a swarm of golden bugs, which ignored him and flew on the shortest way to everything what he had loaded on his carts and ate it withing seconds. They refrshed themselves on everything they",0,50,1); 
             base.books.AddEnglishBookText("could find, rose high into the sky, twanged away and were never seen again.",0,50,1); 
--             base.books.AddEnglishBookText("burning was burning nevertheless in the dusty and dry city. Everyone somehow followed his work except for a few begger who made themselves comfortable in some shadowly palces to relax a little but or",0,50,1); 
--             base.books.AddEnglishBookText("to enjoy the wine they bought from the panhanded money. Although the Salkamaerians were known to be honorable, one considered to avoid the begger and poor ones of the city. They were not hated but",0,50,1); 
--             base.books.AddEnglishBookText("avoided.\n A lonely man was sitting there under a slim tree and snoozed a bit, when he suddenly got a visitor. An old, blind dodderer greeted him friendly. \"Hello my friend, may I join you?\" he said",0,50,1); 
--             base.books.AddEnglishBookText("and smiled friendly. The lonely looked up shortly and noded slowly. \"Sure, sit down, as long as you don't take the shadow from me or disturb me somehow!\" he said; followed by a dirty, broad grin.",0,50,1); 
--             base.books.AddEnglishBookText("Instead of sitting down the blind kept standing and moved his head towards the lonely. He stared so intensive that one could mean hat he actually had eyes under his bandage with which he could",0,50,1); 
--             base.books.AddEnglishBookText("observe everthing.Like a statue he stood there, bending forward slightly. \"What are you standing there? When you want to sit down, sit down, otherwise don't stare at me and keep you trab shut!\"",0,50,1); 
--             base.books.AddEnglishBookText("said the lonely harsh. Then one could suddenly see a movement in the legs of the blind. He leaned back and finally sat down next to the lonely. With one hand he stroked over his beard, pulled slightly",0,50,1); 
--             base.books.AddEnglishBookText("on it as if he was thinking and looked with a absent gaze down the street. Now the old man started to talk, leaving the gaze how it was. \"You know, I travelled long under the human and I watched",0,50,1); 
--             base.books.AddEnglishBookText("them. I tested them of their believe and their longings. And everwhere the humans are the same, the rich and the poor! They take what they can get and are greedy and aggressive. And no big city of men",0,50,1); 
--             base.books.AddEnglishBookText("may it be what so famous was different.\" explained the old man in slow, thoughful words. \"And now I'm sitting here with you, one armed man! Do not get disturbed by me philosophising Maybe it is a",0,50,1); 
--             base.books.AddEnglishBookText("test on you, I tell you openly! I wan't to test you as well. Until now I didn't loose the trust into men!\" he said and smiled faintly. In the lonely happened a change; but it wasn't of positive",0,50,1); 
--             base.books.AddEnglishBookText("nature. He frowned and looked to the old one \"What are you talking there for a bullshit, old man? Get lost!\" he said angry and beat with the hand in direction of the old. Hit with pain the old stood",0,50,1); 
--             base.books.AddEnglishBookText("up quickly and hobbled away, his face branded with sadness and disappointed. The lonely grined broadly behind him jeered and bellowed of happiness. On the next day he was found in some alley, first",0,50,1); 
--             base.books.AddEnglishBookText("up quickly and hobbled away, his face branded with sadness and disappointed. The lonely grined broadly behind him jeered and bellowed of happiness. On the next day he was found in some alley, first",0,50,1); 
--             base.books.AddEnglishBookText("robbed and then killed; probably from his own kind.\n \nThe old man was never seen again.",0,50,1); 
             
             ---------
             
             base.books.AddLanguage("Ancient Language",2);            

             base.books.AddGermanBookText("\n \nSalkamar's Lektion",0,0,2); 
             base.books.AddGermanBookText("Der letzte Schauplatz, an dem man den merkwï¿½rdigen Blinden jemals sah, war die große Stadt Salkamaeria. Es war später Nachmittag und dennoch",0,50,2); 
             base.books.AddGermanBookText("brannte die Hitze in der staubigen, trockenen Stadt. Jeder ging hier irgendwie seiner Arbeit nach, bis auf ein paar Bettler, die es sich an einigen schattigen Plï¿½tzen gemï¿½tlich gemacht haben, um sich",0,50,2); 
             base.books.AddGermanBookText("ein wenig zu entspannen oder von dem erbettelten Geld dem Wein zu frï¿½hnen. Obwohl die Salkamaerikaner als sehr ehrenvoll galten, war man doch eher besonnen, den Bettlern und Armen der Stadt aus dem",0,50,2); 
             base.books.AddGermanBookText("Weg zu gehen. Ihnen wurde kein Hass entgegengebracht, aber man mied sie.\n Ein einsamer Mann saï¿½ nun dort unter einem schmalen Baum und dï¿½ste vor sich hin, als er unerwarteten Besuch bekam. Ein",0,50,2); 
             base.books.AddGermanBookText("alter, blinder Tattergreis setzte sich neben ihn und größte ihn freundlich. \"Hallo, mein Freund, darf ich mich zu dir setzen?\" sprach er besonnen und lï¿½chelte freundlich. Der Einsame blickte",0,50,2); 
             base.books.AddGermanBookText("kurz auf und nickte nur langsam. \"Klar, nimm Platz, solange du mir nicht den Schatten wegnimmst oder mich irgendwie stï¿½rst!\" sagte er; dann folgte ein breites, dreckiges Grinsen auf seinen Lippen.",0,50,2); 
             base.books.AddGermanBookText("Anstatt sich hinzusetzen, blieb der Blinde jedoch stehen und richtete seinen Kopf auf den Einsamen. Er stierte ihn so intensiv an, dass man annehmen könnte, er hï¿½tte tatsï¿½chlich Augen unter der Binde,",0,50,2); 
             base.books.AddGermanBookText("mit denen er alles genaustens wahrnimmt. Wie eine Statue stand er dort, leicht nach vorne gebeugt. \"Was stehst du da so blï¿½d herum?\" Wenn du dich setzen willst, dann setz dich, ansonsten glotz mich",0,50,2); 
             base.books.AddGermanBookText("nicht an, und halt bloss dein Maul!\" sagte der Einsame barsch. Dann sah man plötzlich eine kaum wahrnehmbares Bewegung in den Beinen des Alten. Er lehnte sich zurück und setzte sich endlich neben den",0,50,2); 
             base.books.AddGermanBookText("Einsamen. Mit einer Hand streifte er sich ï¿½ber den Bart, zog etwas daran, als würde er nachdenken und schaute mit abwesendem Blick in die etwas ferner gelegenen Straï¿½en. Nun find der Alte an zu",0,50,2); 
             base.books.AddGermanBookText("erzählen, den Blick jedoch behielt er bei. \"Wisst ihr, ich bin sehr lange unter den Menschen umhergereist, und ich habe sie beobachtet. Ich habe sie auf ihren Glauben geprï¿½ft und auf ihre Gelï¿½ste.",0,50,2); 
             base.books.AddGermanBookText("Und überall sind die Menschen gleich, Reiche und Arme! Sie nehmen, was sie kriegen können und sind gierig und aggressiv. Und keine der großen Stï¿½dte der Menschen, sei sie noch so berï¿½hmt, hat sich",0,50,2); 
             base.books.AddGermanBookText("bisher irgendwie abgehoben.\" erklï¿½rte der Alte in langsam gesprochenen, bedï¿½chtigen Worten. \"Und nun sitze ich bei euch, einarmiger Mann! Lasst euch nicht daran stï¿½ren, dass ich hier philosophiere.",0,50,2); 
             base.books.AddGermanBookText("Vielleicht ist es ein Test an euch, das sage ich euch ganz offen! Auch euch möchte ich prï¿½fen! Noch habe ich die Hoffnung in die Menschen nicht verloren!\" sagte er dann und lï¿½chelte etwas. In dem",0,50,2); 
             base.books.AddGermanBookText("Einsamen ging eine Verï¿½nderung vor; doch war sie nicht von positiver Natur. Er legte seine Stirn in Falten, runzelte etwas und schaute dann zu dem Alten. \"Was faselst du da für einen Mist, alter",0,50,2); 
             base.books.AddGermanBookText("Mann? Scher dich fort!\" sagte er dann wï¿½tend und schlug mit der Hand nach dem Alten aus. Von Pein getroffen stand der Alte schnellstens auf und humpelte davon, sein Gesicht von Trauer und",0,50,2); 
             base.books.AddGermanBookText("Enttï¿½uschung gezeichnet. Der Einsame grinste ihm noch breit hinterher, johlte und grï¿½hlte vor Freude. Am nï¿½chsten Tag fand man ihn in irgendeiner Gasse liegen, erst ausgeraubt, dann erschlagen;",0,50,2); 
             base.books.AddGermanBookText("wahrscheinlich von anderen seiner Sorte.\n \nDer Alte wurde niemehr gesehen.",0,50,2);         

             base.books.AddEnglishBookText("\n \nSalkamar's Lesson",0,0,2); 
             base.books.AddEnglishBookText("The last scene where the old strange bild was seen, was the great city Salkamaeria. It was late afternoon but the heat",0,50,2); 
             base.books.AddEnglishBookText("burning was burning nevertheless in the dusty and dry city. Everyone somehow followed his work except for a few begger who made themselves comfortable in some shadowy places to relax a little but or",0,50,2); 
             base.books.AddEnglishBookText("to enjoy the wine they bought from the panhanded money. Although the Salkamaerians were known to be honorable, one considered to avoid the begger and poor ones of the city. They were not hated but",0,50,2); 
             base.books.AddEnglishBookText("avoided.\n A lonely man was sitting there under a slim tree and snoozed a bit, when he suddenly got a visitor. An old, blind dodderer greeted him friendly. \"Hello my friend, may I join you?\" he said",0,50,2); 
             base.books.AddEnglishBookText("and smiled friendly. The lonely looked up shortly and noded slowly. \"Sure, sit down, as long as you don't take the shadow from me or disturb me somehow!\" he said; followed by a dirty, broad grin.",0,50,2); 
             base.books.AddEnglishBookText("Instead of sitting down the blind kept standing and moved his head towards the lonely. He stared so intensive that one could mean hat he actually had eyes under his bandage with which he could",0,50,2); 
             base.books.AddEnglishBookText("observe everthing.Like a statue he stood there, bending forward slightly. \"What are you standing there? When you want to sit down, sit down, otherwise don't stare at me and keep you trab shut!\"",0,50,2); 
             base.books.AddEnglishBookText("said the lonely harsh. Then one could suddenly see a movement in the legs of the blind. He leaned back and finally sat down next to the lonely. With one hand he stroked over his beard, pulled slightly",0,50,2); 
             base.books.AddEnglishBookText("on it as if he was thinking and looked with a absent gaze down the street. Now the old man started to talk, leaving the gaze how it was. \"You know, I travelled long under the human and I watched",0,50,2); 
             base.books.AddEnglishBookText("them. I tested them of their believe and their longings. And everwhere the humans are the same, the rich and the poor! They take what they can get and are greedy and aggressive. And no big city of men",0,50,2); 
             base.books.AddEnglishBookText("may it be what so famous was different.\" explained the old man in slow, thoughful words. \"And now I'm sitting here with you, one armed man! Do not get disturbed by me philosophising Maybe it is a",0,50,2); 
             base.books.AddEnglishBookText("test on you, I tell you openly! I wan't to test you as well. Until now I didn't loose the trust into men!\" he said and smiled faintly. In the lonely happened a change; but it wasn't of positive",0,50,2); 
             base.books.AddEnglishBookText("nature. He frowned and looked to the old one \"What are you talking there for a bullshit, old man? Get lost!\" he said angry and beat with the hand in direction of the old. Hit with pain the old stood",0,50,2); 
             base.books.AddEnglishBookText("up quickly and hobbled away, his face branded with sadness and disappointed. The lonely grined broadly behind him jeered and bellowed of happiness. On the next day he was found in some alley, first",0,50,2); 
             base.books.AddEnglishBookText("up quickly and hobbled away, his face branded with sadness and disappointed. The lonely grined broadly behind him jeered and bellowed of happiness. On the next day he was found in some alley, first",0,50,2); 
             base.books.AddEnglishBookText("robbed and then killed; probably from his own kind.\n \nThe old man was never seen again.",0,50,2); 
             
             ---------------
             
             base.books.AddLanguage("Ancient Language",3); 

             base.books.AddGermanBookText("\n \nLetztes Kapitel",0,0,3); 
             base.books.AddGermanBookText("Niemehr? Vielleicht doch, aber kann man das nicht sicher sagen, weil nie groß darï¿½ber erzählt wurde. Es gab einen dunklen Wald, fernab von jeder Zivilisation. Sowohl Tags, als auch Nachts war es",0,50,3); 
             base.books.AddGermanBookText("dort immer dunkel, neben den Straï¿½en begann sofort das Unterholz und das Dickicht, durch das kaum jemand durchdringen konnte. In diesem Wald wanderte eines Tages ein alter Mann, die Augen mit einer",0,50,3);         
             base.books.AddGermanBookText("Binde abgedeckt. Langsam und bedï¿½chtig ging er durch diesen Wald. Die Bewohner der umliegenden Dï¿½rfer hï¿½tten diesen Alten sofort für geisteskrank erklï¿½rt, dass er sich alleine durch diesen Wald traut.",0,50,3); 
             base.books.AddGermanBookText("Weiss doch ein jeder, dass hier Diebe und Gesindel lauert. Es dauerte also auch nicht lange, bis passierte, was passieren musste. Mit lauten Schritten sprang eine Gestalt aus dem Gebï¿½sch und stellte",0,50,3); 
             base.books.AddGermanBookText("sich vor den bliden alten Mann. \"Gib mir alles, was du hast\" schrie er mit schriller Stimme. Der Greis jedoch bewegte sich kein Stï¿½ckchen und hielt sich still auf seine Krï¿½cke gestï¿½tzt. Jene Person,",0,50,3); 
             base.books.AddGermanBookText("die eben aus dem Unterholz kam, schien durch die Ruhe des Alten verunsichert zu sein. Der Dieb hatte nur einen Arm, in dem er ein kleines, rostiges Messer eng umklammert hielt, der andere Arm war ein",0,50,3); 
             base.books.AddGermanBookText("Stumpf. Der Alte bewegte sich immernoch kein Stï¿½ckchen. \"Was ist denn los?! Hï¿½rst du schlecht? Gib mir was du hast, sonst schlitz ich dich auf!\" schrie der Bandit, und fing langsam an zu zittern.",0,50,3); 
             base.books.AddGermanBookText("Irgendwie schien ihn diese Gestalt vor ihm aus der Ruhe zu bringen. Sie war nicht wie andere Leute, die er ï¿½berfallen hatte: Personen, die laut aufschrien und sofort alles hergaben, was sie besassen.",0,50,3); 
             base.books.AddGermanBookText("Oder eben andere, die anfingen zu kï¿½mpfen. Der Alte schien unbeeindruckt, und anstatt sich irgendwie zu bewegen fing er plötzlich an zu reden: \"Was ist mit eurem Arm passiert? Wieso ï¿½berfï¿½llt ein",0,50,3); 
             base.books.AddGermanBookText("junger Bursche wie ihr einen alten schwachen Mann im Wald?\" sagte er seelenruhig. Vï¿½llig irritiert kratzte sich der Dieb mit dem Messer am Kopf. Woher wusste der blinde Kerl, dass er nur einen Arm",0,50,3); 
             base.books.AddGermanBookText("hatte? Nochmal sagte er: \"Gib mir deine Sachen! Bitte, gib schon!\", diesmal jedoch mit weniger Nachdruck und irgendwie klang es nun, als wï¿½re er selber eingeschï¿½chtert. \"Nun sagt es mir schon,",0,50,3); 
             base.books.AddGermanBookText("junger Mann. Wieso mordet ihr? Wieso raubt ihr? Was soll das? Schï¿½men solltet ihr euch! Schï¿½men!\" schimpfte der Alte lautstark. In dem jungen Banditen ging eine merkbare Verï¿½nderung vor. Mit wï¿½tender",0,50,3); 
             base.books.AddGermanBookText("Stimme sagte er dann: \"Ich... hab' doch nichts! Irgendwovon muss ich doch meine Familie ernï¿½hren! Ich hab' drei Kinder und eine Frau, die hungrig sind! Sie sind wichtiger als alles, was es für mich",0,50,3); 
             base.books.AddGermanBookText("gibt, und ich bin nur ein kleiner Dieb! Weisst du eigentlich, wie erbï¿½rmlich ich hausen muss, alter Mann?! Diebstahl ist alles, was mir bleibt!\". Es klang so, als wolle er sich rechtfertigen; als",0,50,3); 
             base.books.AddGermanBookText("hï¿½tte er eine Rechtfertigung für einen Diebstahl! \"Ja, du hast richtig gehï¿½rt, ich bin ein Dieb, aber anders würde ich sterben, und ich stehe dazu!\" sprudelte es nur so aus seinem Mund. Der Alte",0,50,3); 
             base.books.AddGermanBookText("schien sich etwas beruhigt zu haben. Er sprach erneut: \"Soso, und deswegen habt ihr wohl auch keinen Arm, hm? Dieben schlï¿½gt man den Arm ab, damit sie nichtmehr stehlen können\". Dann plötzlich",0,50,3); 
             base.books.AddGermanBookText("lï¿½ste sich das verbitterte Gesicht des Alten und er fing an, herzlich zu lï¿½cheln. \"Ihr seid der erste Mensch seit langem, der die Wahrheit sagt! Ihr seid ein Dieb, Abschaum, aber eure Absicht ist",0,50,3); 
             base.books.AddGermanBookText("gerecht und ihr schï¿½mt euch für eure Taten, das sehe ich euch doch an!\" sagte er dann mit langsamen Worten und lï¿½chelte immernoch. \"Die Götter würden euch sicher eine zweite Chance gewï¿½hren, doch",0,50,3); 
             base.books.AddGermanBookText("was vermag ich zu tun? Ich bin ein gebrochener Mann, und auï¿½er diesem Sand besitze ich nichts. Aber wisst ihr was? Ich schenke es euch, dann braucht ihr mich nicht zu bestehlen. Aber haltet fest an",0,50,3); 
             base.books.AddGermanBookText("eurer Absicht.\" sprach der Alte und nahm das Messer aus der Hand des Banditen. Dann griff er in seine eigene Tasche, zog etwas heraus und drï¿½ckte es in die Hand des jungen Diebes. Neugierig",0,50,3); 
             base.books.AddGermanBookText("ï¿½ffnete dieser seine Hand und im nï¿½chsten Augenblick leuchtete ihm goldfarbener Sand entgegen, der im Dï¿½mmerlicht des Waldes wunderbar schimmerte. Wie gebannt von dem Anblick konnte er seine Augen",0,50,3); 
             base.books.AddGermanBookText("nicht lï¿½sen. Doch plötzlich verbleichte der Sand und wurde zu schmutziger Erde, die durch seine Finger auf den Boden rieselte und verschwand. Ein kalter Wind fuhr durch den Wald und blies ihm die",0,50,3); 
             base.books.AddGermanBookText("Haare um die Ohren. In Gedanken wunderte er sich immernoch ï¿½ber die seltsamen Worte des blinden Mannes. Verstï¿½ndnislos blickte er zu genau jenem. Jedenfalls wollte er zu dem Alten blicken, doch",0,50,3); 
             base.books.AddGermanBookText("der war verschwunden. Der Dieb stand ganz alleine im Wald auf einem kleinen Pfad, neben ihm auf dem Boden ein kleines Messer und ein Hï¿½ufchen Dreck, der durch seine Finger gerieselt war. Verwirrt",0,50,3); 
             base.books.AddGermanBookText("packte er sich an den Kopf, als wolle er ï¿½berprï¿½fen, ob er Fieber oder irgendeine schlimme Krankheit hï¿½tte. Umso Grüßer war der Schock, als er merkte, dass er sich mit der vï¿½llig falschen Hand ï¿½ber",0,50,3); 
             base.books.AddGermanBookText("die Stirn gestrichen hatte. Er fing an, laut, hysterisch und angstvoll zu schreien. An seiner rechten Schulter war ein Arm, anstatt dem Stumpf, der dort vorher gewesen war. Die Hand zu diesem Arm",0,50,3); 
             base.books.AddGermanBookText("war es, mit der er sich ï¿½ber's Gesicht strich. Es war zweifelsfrei seine eigene.\n \nZu seinen Füßen lag die Augenbinde des Alten, von ihm fehlt bis Heute jede Spur.",0,50,3); 

             base.books.AddEnglishBookText("\n \nFinal Chapter",0,0,3); 
             base.books.AddEnglishBookText("Never? Maybe yes but one can not tell for sure because it wasn't told about it. There was a dark forest, far away from civilisation. As well as on the day as in the night it was dark, next to the",0,50,3); 
             base.books.AddEnglishBookText("street started the brushwood and the thicket through which one could hardly pass. Through this forest wandered an old man one day, the eyes covered with a bandage. Slowly and thoughtful he went",0,50,3); 
             base.books.AddEnglishBookText("through the forest. The habitantsa of the surrounding towns would have called the old man crazy for that he passes through the forest alone. Everyone knows that thieves and domestics lurk around.",0,50,3); 
             base.books.AddEnglishBookText("It didn't take long until happened what must have happened. With loud steps jumped a figure out if bushes and stopped right in front of the old man. \"Give me everything you have.\" he screamed with",0,50,3); 
             base.books.AddEnglishBookText("a shrill voice. The old man didn't move a bit and hold on to his crutch. The person which just jumped out of the brushwood seemed to be confused by this calmness. The thief only had one arm in which",0,50,3); 
             base.books.AddEnglishBookText("he hold a small, rusty knief, the other arm was a stump. The old one still didn't move: \"What's wrong? Didn't you hearm me right? Give me everything you have or I cut you open!\" screamed the bandit",0,50,3); 
             base.books.AddEnglishBookText("and started slowly to shake. Somehow this figure in front of him madehim nervous. The old man wasn't like the other people he robbed: People who screamed loudly and immediatly gave him everything they",0,50,3); 
             base.books.AddEnglishBookText("owned or others which started to fight. The old one seemed to be unimpressed and instead to move, he suddenly started to talk: \"What happened to your arm? Why does a young man like you rob an old man",0,50,3); 
             base.books.AddEnglishBookText("like me in the forest?\" he said calmly. Totally confused the thief scratched his head with his knief. Why does this blind guy know that he only has one arm? Again he said: \"Give me your things!",0,50,3); 
             base.books.AddEnglishBookText("Please, give them to me!\" This time with less force and somehow it sounded as if he aline was ntimidated. \"Now tell me young man. Why do you murder? Why do you rob? Shame on you! Shame!\" the old",0,50,3); 
             base.books.AddEnglishBookText("man blustered loudly. Something in the young bandit changed. With an angry voice he said: \"I... have nothing! I need to feed my family from something! I have three children and a wife who are",0,50,3); 
             base.books.AddEnglishBookText("hungry! They are more important to me than anything else and I'm a small thief! Do you even know how lousy I have to reside, man?! Thievery is everything I have left!\". It sounded as if he wanted",0,50,3); 
             base.books.AddEnglishBookText("to justify himself; as if he had an excuse for thievery! \"Yes, I heard right, I'm a thief but I would die otherwise and I stand to it!\" bubbles it out of his mouth. The old man seemed to be calmed",0,50,3); 
             base.books.AddEnglishBookText("down a bit. He said again: \"Well, well and that is the reason you are missing one arm, hm? Because thieves lose one so they can't steal anymore.\" Then suddelny the bitter face vanished from the old",0,50,3); 
             base.books.AddEnglishBookText("man and he started to smiled heartly. \"You are the first person for a long time who tells the truth! You are a thief, filth but your intentions are right and you're ashamed for your deeds, I can see",0,50,3); 
             base.books.AddEnglishBookText("it in your face!\" he said slowly and still smiled. \"The gods would surely give you a second chance but what could I do? I'm a broken man and except for this sand I do not own anything. But you know",0,50,3); 
             base.books.AddEnglishBookText("what? I give it to you than you do not need to rob me. But hold on to your intentions.\" said the old man and took the knief from the hand of the bandit. Then he reached into his won bag, pulled",0,50,3); 
             base.books.AddEnglishBookText("something out and pressed it into the hand of the young bandit. Curiously he opened his hand and in the next moment gleamed golden sand which shimmered wonderful in the crepuscular light of the",0,50,3); 
             base.books.AddEnglishBookText("forest. Paralysed by the moment he couldn't loosen the sight from it. But suddenly the sand started to fade and turned into dirty earth which trickled through his fingers to the ground and vanished",0,50,3); 
             base.books.AddEnglishBookText("forest. Paralysed by the moment he couldn't loosen the sight from it. But suddenly the sand started to fade and turned into dirty earth which trickled through his fingers to the ground and vanished",0,50,3); 
             base.books.AddEnglishBookText("A cold wind blew through the forest and blew him the hair around his ears. In thoughts he still wondered about the words of the blind man. Uncomprehending he looked to him. At least he wanted to",0,50,3); 
             base.books.AddEnglishBookText("the old man but he was gone. The thief sttod alone in the forest on a small path, next to him on the ground layes a small knief and a pile of dirt which trickled through his fingers. Confused",0,50,3); 
             base.books.AddEnglishBookText("he grabbed his head as if he wanted to check if he has an illness of fever. All the more was the shock when he realised that had touched his forehead with the wrong hand. He started to scream loud,",0,50,3);    
             base.books.AddEnglishBookText("hysterical and frighetened. On his right shoulder was an arm instead of the stumb which was there before. The hand of his arm was the one with wich he stroked over his face It was without a doubt his",0,50,3);    
             base.books.AddEnglishBookText("own.\n \nTo his feet he found the blindfold of the old one, who is missing until today.",0,50,4);    

             ------------
             
            base.books.AddLanguage("dwarf language",4 );
            base.books.AddEnglishBookText( "\"I pledge that I will devote the purpose and the power given to me, to aid the community of Silverbrand, and to protect them against wrong. ", 0, 0, 4 );
            base.books.AddEnglishBookText( " To fulfil my duties with honour. And so we may prosper. I vow to reign Just, with no exceptions. ", 0, 0, 4 ); 
            base.books.AddEnglishBookText( " My command ceases at the borders of Silverbrand.\" Tialdin, King of Silverbrand ", 0, 0, 4 );
            base.books.AddEnglishBookText( " Long awaited, it has finally come to pass. The Dwarfs have chosen their king. For now, there is one who will guide them, one who will contend for them. ", 0, 0, 4 );
            base.books.AddEnglishBookText( " Here also will today be announced, which Dwarfs will be employed with office and duty. ", 0, 0, 4 ); 
            base.books.AddEnglishBookText( " Our fellow Dwarf Rugosch will find his place next to the king. He stands for the beliefs to our god of Dwarfs Irmorom. One for all those who seek advice, even the king himself. ", 0, 0, 4 );
            base.books.AddEnglishBookText( " Furthermore, our well known and much respected fellow Dwarf Bombor will be positioned as Herald of Silverbrand. ", 0, 0, 4 );  
            base.books.AddEnglishBookText( " He will be our negotiator in times of war as in times of peace. His word will carry the demands of the king at all times. His voice is, the voice of the king.", 0, 0, 4 );
            base.books.AddEnglishBookText( " On a further note, the Clan of the Axe under the leadership of their own announced chief will be charged with the duty of Sentinels. ", 0, 0, 4 );  
            base.books.AddEnglishBookText( " When all diplomatic efforts have failed, they will be the ones to inflict destruction upon our enemies. ", 0, 0, 4 );
            base.books.AddEnglishBookText( " They will determine wrongdoings and protect the boarders so that no harm may enter Silverbrand. Every visitor will conform to the regulations upheld by these Sentinels. ", 0, 0, 4 );  
            base.books.AddEnglishBookText( " To arrest any confusion, every Dwarf who wishes to vow his communal pledge to Silverbrand may do so and be registered in the communal listings. All Dwarfs are welcomed in our halls. ", 0, 0, 4 );
            base.books.AddEnglishBookText( " The community list will be placed out on display so all that feel that they have fulfilled the pledge may sign and be added. ", 0, 0, 4 );  
            base.books.AddEnglishBookText( " I thank all Dwarfs who have entrusted their faith in me and am pleased that the thought of creating our own realm has fruited with so many. ", 0, 0, 4 );
            base.books.AddEnglishBookText( " It has been hard work though now, it has been achieved. ", 0, 0, 4 );  
            base.books.AddEnglishBookText( " Translated from Bombor, Herald from Silverbrand ", 0, 0, 4 );
            base.books.AddGermanBookText( " \"Ich gelobe, dass ich meine Kraft und meinen Willen dem Wohl des Volkes von Silberbrand widmen, Schaden von ihm wenden,  ", 0, 0, 4 );   
            base.books.AddGermanBookText( " seinen Nutzen mehren und schï¿½tzen, meinen Pflichten gewissenhaft nachkommen und Gerechtigkeit gegen jedermann ï¿½ben werde. ", 0, 0, 4 );
            base.books.AddGermanBookText( " Meine Macht endet an den Grenzen Silberbrands\" Tialdin, König von Silberbrand ", 0, 0, 4 );   
            base.books.AddGermanBookText( " Lange ersehnt ist es nun Vollbracht die Zwerge haben ihren König bestimmt. Nunmehr gibt es einen der sie leitet, der für sie streitet. ", 0, 0, 4 );   
            base.books.AddGermanBookText( " Somit soll nun und heute verkï¿½ndet sein, welche Zwerge des Weiteren in Amt und würden gestellt seien. ", 0, 0, 4 );
            base.books.AddGermanBookText( " Unser Mitzwerg Rugosch wird seinen Platz finden an der Seite des Kï¿½nigs, er stehe für Belange des Glaubens an Irmorom den Gott der Zwerge,  ", 0, 0, 4 );   
            base.books.AddGermanBookText( " einem jeden der Rat suchet an der Seite, auch dem König. ", 0, 0, 4 );   
            base.books.AddGermanBookText( " Fï¿½rderhin wird unser allseits bekannter und respektierter Mitzwerg Bombor in den Stand des Heroldes von Silberbrand bestellt. Er mï¿½ge im Krieg und im Frieden unser Unterhï¿½ndler sein. ", 0, 0, 4 );
            base.books.AddGermanBookText( " Seine Stimme wird den Willen des Kï¿½nigs allseits verkï¿½nden. Seine Stimme ist die Stimme des Kï¿½nigs. ", 0, 0, 4 );     
            base.books.AddGermanBookText( " Des Weiteren wird der Klan der Axt unter der Fï¿½hrung ihres Selbstbestimmten Hauptmannes die Aufgaben der Garde ï¿½bernehmen. Wenn die Diplomatie versage werde er die Faust sein die unsere ", 0, 0, 4 );    
            base.books.AddGermanBookText( " Feinde zerschmettert. Er werde Straftï¿½ter festsetzen und die Eingï¿½nge bewachen, dass kein Unbill herein gelange nach Silberbrand. ", 0, 0, 4 );    
            base.books.AddGermanBookText( " Jeder Besucher hat sich den Anweisungen der Garde innerhalb unserer Hallen zu beugen. ", 0, 0, 4 );    
            base.books.AddGermanBookText( " Um der Verwirrung Einhalt zu gebieten, jeder Zwerg der es wï¿½nsche und willens ist den Bï¿½rgereid von Silberbrand zu leisten, kann sich in die Bï¿½rgerrolle eintragen. ", 0, 0, 4 );    
            base.books.AddGermanBookText( " Jeder Zwerg sei uns in unseren Hallen willkommen.", 0, 0, 4 );     
            base.books.AddGermanBookText( " Die Bï¿½rgerrolle werde ausgelegt auf das sich jeder eintragen kï¿½nne der den Eid als den seinen als geleistet betrachtet. ", 0, 0, 4 );    
            base.books.AddGermanBookText( " Ich danke allen Zwergen die mir ihr Vertrauen geschenkt haben und freue mich dass der Gedanke unser eigenes Reich zu schaffen so viele beseelt hat. ", 0, 0, 4 );    
            base.books.AddGermanBookText( " Es war viel Arbeit und Mï¿½he doch nunmehr ist es vollbracht.", 0, 0, 4 );    

            --------------------------------------

            base.books.AddLanguage("common language",5);

            base.books.AddEnglishBookText("\n\n~~Topaz~~",198,0,5);
            base.books.AddEnglishBookText("The energies of Topaz appear to have the most different effects, independent of the item you let them flow into.",0,0,5);
            base.books.AddEnglishBookText("This is why magic topaz are used and appreciated by nearly all stratums. They tend to belong to the most rare gems, they are also the most valuable.",0,0,5);
            base.books.AddEnglishBookText("Weapons: The energies of magic topaz that are bound in a weapon are used to sharpen the blade and therefore cause more damage.",205,0,5);
            base.books.AddEnglishBookText("Armors and shields: Topaz energies enhance protection against slashing damage.",2403,0,5);
            base.books.AddEnglishBookText("Magic wands: Topaz energies flowing through wands enhance the mana regeneration of their bearers.",2782,0,5);
            base.books.AddEnglishBookText("Tools: Items crafted by a tool empowered by topaz energies have a better quality than usual.",724,0,5);
            base.books.AddEnglishBookText("Trinkets: In trinkets, magic energies tend to raise the essence as well as the willpower of the bearer. Although, both of these attributes are only raised half as strong as they are by other trinkets.",83,0,5);
            base.books.AddEnglishBookText("There is one important thing to note: One should never let the energies of a topaz flow into a trinket in which there is another stone embedded.",0,0,5);

			base.books.AddGermanBookText("\n\n~~Topase~~",198,0,5);
            base.books.AddGermanBookText("Topasenergien von magischen Topasen haben wohl die unterschiedlichsten Wirkungen, abhï¿½ngig davon, in welchen Gegenstand man ihre Energien flieï¿½en lï¿½sst.",0,0,5);
            base.books.AddGermanBookText("So werden magische Topase von fast allen Schichten gleichermaï¿½en verwendet und geschï¿½tzt. Da sie zudem zu den seltensten Edelsteinen gehï¿½ren, macht sie das gleichzeitig auch zu den wertvollsten.",0,0,5);
            base.books.AddGermanBookText("Waffen:\n\nDie Engerien von magischen Topasen, die in eine Waffe gebunden werden machen die Klinge schï¿½rfer und verursachen so mehr Schaden beim Gegner.",205,0,5);
            base.books.AddGermanBookText("Rüstungen und Schilde:\n\nIn Rüstungen und Schilden bewirken Topasenergien einen hï¿½heren Schutz vor Schneidschaden.",2403,0,5);
            base.books.AddGermanBookText("Magierstï¿½be:\n\nTopasenergien, welche durch Magierstï¿½be flieï¿½en erhï¿½hen die Manaregernation des Trï¿½gers.",2782,0,5);
            base.books.AddGermanBookText("Werkzeuge:\n\nGegenstï¿½nde, die mit einem Werkzeug hergestellt wurden, welches mit Topasenergien verstï¿½rkt wurde, haben grundsï¿½tzlich eine hï¿½hereQualität als es normal der Fall wï¿½re.",724,0,5);
            base.books.AddGermanBookText("Schmuckstï¿½cke:\n\nIn Schmuckstï¿½cken erhï¿½hen die magischen Energien von Topasen sowohl die Essenz als auch die Willenskraft des Trï¿½gers. Beides jedoch nur in halben maï¿½e, als es bei anderen Ringen der Fall ist.",83,0,5);
            base.books.AddGermanBookText("Zu beachten ist hierbei, dass man niemals die Energien eines Topases in ein Schmuckstï¿½ck flieï¿½en lassen sollte, in welches ein andersartiger Stein eingefasst wurde.",0,0,5);
            
            ---------------------------
            
            base.books.AddLanguage("common language",6);
            base.books.AddLanguage("lizard language",6);

			base.books.AddEnglishBookText("Written down from\nDarzog,\nnovice of Tanora\n\ntranslate by\nAshayen Cromwell",0,20,6);
			base.books.AddEnglishBookText("Oh Zelphia\nWater of life\nSpring of being",0,20,6);
			base.books.AddEnglishBookText("You bring calmness and considerateness to us.\nYou give us strength and justice.\nYou endow wisdom and endurance.",0,20,6);
			base.books.AddEnglishBookText("\n\nOh, Zelphia",0,20,6);
			base.books.AddEnglishBookText("\n\non your path weï¿½ll follow!",0,20,6);
			
			base.books.AddGermanBookText("Niedergeschrieben von\nDarzog,\nNovice von Tanora\n\nï¿½bersetzt von\nAshayen Cromwell",0,20,6);
			base.books.AddGermanBookText("Oh Zelphia\nWasser unseres Lebens\nQuelle unseres Seins",0,20,6);
			base.books.AddGermanBookText("Du bringst uns Ruhe und Besonnenheit\nDu gibts uns Stärke und Gerechtigkeit\nDu schenkst uns Weisheit und Geduld",0,20,6);
			base.books.AddGermanBookText("\n\nOh Zelphia",0,20,6);
			base.books.AddGermanBookText("\n\nauf Deinen Pfaden folgen wir!",0,20,6);
			
            ---------------------------
			
			base.books.AddLanguage("common language",7);

			base.books.AddEnglishBookText("Brewyn the Liar\n \n \n by P. Woodscribe",0,5,7);
			base.books.AddEnglishBookText("\n This story begins in a house, by a fire.\n Propped in his armchair sat Brewyn, a liar.\n",0,5,7);
			base.books.AddEnglishBookText("Now I warn you this story, is not for the faint of heart.\n This halfer's morals were quite far apart.\n \n",0,5,7);
			base.books.AddEnglishBookText("So in a chair he sat, free of labour and strife.\n Wherein, through the hill door, stepped Annie, his wife.\n",0,5,7);
			base.books.AddEnglishBookText("She stooped to his side, and assaulted his ear.\n She nagged, whilst he pretended not to hear.\n\n",0,5,7);
			base.books.AddEnglishBookText("\"This harvest,\" she scolded, \"has not been brought in.\"\n \"And those cloaks,\" she informed him, \"have worn very thin.\"\n",0,5,7);
			base.books.AddEnglishBookText("\"You have chores not done, and that condemns us ill.\"\n \"And by winter, I tell you, your tummy won't fill!\"\n \n",0,5,7);
			base.books.AddEnglishBookText("With a cry and a holler, he made quite a show.\n \"Oh, blasted woman! It was done ages ago!\"\n",0,5,7);
			base.books.AddEnglishBookText("\"The fruit I picked yesterweek I stored down in the cellar.\"\n \"And new cloaks, finest of make, I just bought from some fella.\"\n \n",0,5,7);
			base.books.AddEnglishBookText("He prodded and teased her, made a big deal.\n \"The bitter and cold, this Fall you won't feel!\"\n",0,5,7);
			base.books.AddEnglishBookText("\"I've worked and I've worked. Worked myself red!\"\n \"I did this and more, just to keep you fed!\"\n \n",0,5,7);
			base.books.AddEnglishBookText("With that he stormed out the door, all in a huff.\n But when, out of sight, he cried \"I still need all that stuff!\"\n",0,5,7);
			base.books.AddEnglishBookText("He rushed in a panic, looking for a stall.\n But, as predicted, they had closed for the Fall.\n \n",0,5,7);
			base.books.AddEnglishBookText("Every Halfling, everyone who had worked oh-so-hard,\n had all been ready, even the bard.\n",0,5,7);
			base.books.AddEnglishBookText("All sat cosy, with food and with wine.\n The work month was over, so they had a good time.\n \n",0,5,7);
			base.books.AddEnglishBookText("Brewyn knocked on their doors, but to no avail.\n None like a liar and so none answered his hail.\n",0,5,7);
			base.books.AddEnglishBookText("Brewyn sat and he cried, all in a pity.\n When down fluttered a fairy, to sing him a ditty!\n \n",0,5,7);
			base.books.AddEnglishBookText("\"Please listen dear, as I do this dance,\n I shall, as a fairy, give you one chance.\"\n",0,5,7);
			base.books.AddEnglishBookText("\"If in truth you answer, then you shall be spared.\"\n \"If a lie, you tell, then you should be scared.\"\n \n",0,5,7);
			base.books.AddEnglishBookText("She asked her question, and watched how he fared.\n \"Next year, and next harvest...will you be prepared?\"\n",0,5,7);
			base.books.AddEnglishBookText("He did do his best, he really did try.\n But when he open his lips, out popped a lie.\n \n",0,5,7);
			base.books.AddEnglishBookText("\"Well I would've been ready,\" he said, the loudest he could've.\n \"If you hadn't have stopped me, I probably would've!\"\n",0,5,7);
			base.books.AddEnglishBookText("With a scowl, the fairy flew far away.\n \"If you hadn't lied, you'd have lived another day.\"\n \n",0,5,7);
			base.books.AddEnglishBookText("Brewyn hung his head, and made for his hill.\n Annie was right...they were condemned ill.\n",0,5,7);
			base.books.AddEnglishBookText("The liar sat right back down in his seat.\n The unfortunate sod, simply relaxed his feet.\n \n",0,5,7);
			base.books.AddEnglishBookText("An evening passed, Brewyn stayed in his chair.\n Snow fell that night, frosted the morn air.\n",0,5,7);
			base.books.AddEnglishBookText("They ran out of wood, and so out went the fire.\n And frozen in his chair, sat Brewyn... the liar. \n \n",0,5,7);

			base.books.AddGermanBookText("Brewyn der Lï¿½gner\n\n\n by P. Woodscribe \n\n\ntranslated to the Old Language by Pancho Lindenbrook",0,5,7);
			base.books.AddGermanBookText("Die Geschichte beginnt in einem Haus, an dessen Feuer,\n In seinem Sessel versunken saï¿½ Brewyn, dem die Wahrheit nicht teuer.\n",0,5,7);
			base.books.AddGermanBookText("Ich muss euch warnen, dies Geschichte ist nicht für zartes Gemï¿½t.\n Dieser Halbling kein gutes Leben fï¿½hrte, und das unverblï¿½mt.\n \n",0,5,7);
			base.books.AddGermanBookText("In einem Stuhl saï¿½ er also, frei von Mï¿½h und Plagen,\n Als herein durch die Tï¿½r kam seine Frau Annie, ihn zu fragen,\n",0,5,7);
			base.books.AddGermanBookText("an seine Seite zu treten, sich bei ihm zu beschwer'n\n zu nï¿½rgeln, während er so tat als könnte er nicht mehr hï¿½r'n.\n \n",0,5,7);
			base.books.AddGermanBookText("\"Die Ernte\" so schimpft sie \"ist nicht eingefahren.\"\n \"Und diese Mï¿½ntel\" bemerkt sie \"sind zu dï¿½nn sie zu tragen.\"\n",0,5,7);
			base.books.AddGermanBookText("\"Dein Tagewerk hast du nicht verrichtet, schlimmes Schicksal uns droht.\n \"Und im Winter, sag ich dir, wirds uns fehlen an Brot!\"\n \n",0,5,7);
			base.books.AddGermanBookText("Mit Geschrei und Gelï¿½chter, fing er an ihr zu gestehn.\n \"Oh, lustige Ehefrau! Diese Dinge waren lï¿½ngst schon versehn!\"\n",0,5,7);
			base.books.AddGermanBookText("\"Die Früchte pflï¿½ckt ich letzte Woche schon, sie lagern im Keller.\"\n \"Und neue Mï¿½ntel beschafft ich auch, kostet'n sie auch manch teuren Heller!\"\n \n",0,5,7);
			base.books.AddGermanBookText("Er herzt sie und neckt sie, erklï¿½rt eifrig und viel.\n \"Nicht Bitternis noch Kï¿½lte wird diesen Herbst ï¿½ber dich zieh'n!\"\n",0,5,7);
			base.books.AddGermanBookText("\"Hab geschwitzt und geschuftet. Geackert fast bis ins Grab!\n Tat dieses tat jenes, damit du's wohl haben mag'st!\"\n \n",0,5,7);
			base.books.AddGermanBookText("So gesprochen eilte jener hinaus, von ihren Worten verletzt,\n Ungesehn sprach jedoch er \"Nichts von alldem hab getan ich!\" entsetzt.\n",0,5,7);
			base.books.AddGermanBookText("Er lief in seiner Panik suchte Marktbuden auf,\n doch, wie zu erwarten, im Herbst sperrte keiner für ihn auf.\n \n",0,5,7);
			base.books.AddGermanBookText("Jeder Halbling, ein jeder der mï¿½hsam den Rï¿½cken zur Arbeit hatte geneigt,\n alle war'n, sogar der Barde, für den Winter bereit.\n",0,5,7);
			base.books.AddGermanBookText("Sie saï¿½en gemï¿½tlich bei Brot und bei Wein,\n lieï¿½en Arbeit und Erntemonat und Fï¿½nfe gerade sein.\n \n",0,5,7);
			base.books.AddGermanBookText("Brewyn klopfte an ihr Tor, doch war er nirgends gern gesehn,\n niemand mag einen Lï¿½gner, niemand hï¿½rte sein Flehen.\n",0,5,7);
			base.books.AddGermanBookText("Brewyn sank auf die Knie, die Augen mit Trï¿½nen gefï¿½llt.\n Als vom Himmel hinabflog eine Fee, sï¿½ï¿½e Stimme in ein Liedchen gehï¿½llt:\n \n",0,5,7);
			base.books.AddGermanBookText("\"Bitte hï¿½r mich an Hï¿½bscher, während ich dich umschwirr,\n als Fee, so schwï¿½r ich, zeig ich einen Weg dir aus deinem Gewirr.\"\n",0,5,7);
			base.books.AddGermanBookText("\"Wenn mit Wahrheit du gibst Antwort, dann, so wirst du verschont.\"\n \"Wenn mir Lï¿½gen du erzï¿½hlst, wirst du alles and're als belohnt!\"\n \n",0,5,7);
			base.books.AddGermanBookText("Und so fragte sie ihre Frage, sah ihn ganz genau an:\n \"Deine Arbeiten im nï¿½chsten Jahr du früher erledigst, darauf vertrauen ich kann?\"\n",0,5,7);
			base.books.AddGermanBookText("Streng gab er sein Bestes, versuchte es zu schaffen,\n doch als Antwort nur Lï¿½gen aus seinem Mund herausklaffen.\n \n",0,5,7);
			base.books.AddGermanBookText("\"Ei! Ich hï¿½tt's dies Jahr schon erledigt!\" rief er aus laut und schlau.\n \"Wï¿½rst du mir als Aufhalt nicht dazwischen gekommen, ja das weiï¿½ ich genau!\"\n",0,5,7);
			base.books.AddGermanBookText("Bï¿½sen Blick ihm die Fee im Abflug mitgab.\n \"Diese Lï¿½ge hat dir geschaufelt dein eigenes Grab.\"\n \n",0,5,7);
			base.books.AddGermanBookText("Brewyn zog mutlos zurück zu seinem Haus in dem Hügel,\n Annie hatte Recht, für den Winter blieb ihnen kein einziger Krï¿½mel.\n",0,5,7);
			base.books.AddGermanBookText("zurück sich der Lï¿½gner in seinen Sessel verzog,\n der Bedauernswerte sich und seine Füße mit Komfort und falscher Sicherheit belog.\n \n",0,5,7);
			base.books.AddGermanBookText("Ein Abend zog vorbei, Brewyn blieb sitzend im Sessel.\n Schnee fiel in dieser Nacht, Wasser gefrierte im Kessel.\n",0,5,7);
			base.books.AddGermanBookText("Denn ohne Brennholz im Haus, legte Kï¿½lte sich ï¿½ber erloschenes Feuer\n Und in seinem Sessel erfroren saï¿½ Brewyn, dem die Wahrheit nicht teuer.\n",0,5,7);
			----------------------------------------------
			
          end 
      end 
      base.books.SendBookPage(User,SourceItem.data,Counter); 
  end 
  
  function LookAtItem(User,Item) 
      if base.books.InitTitle() then 
          base.books.AddGermanBookTitle("Buch mit dem Titel \"Der Alte Mann, Buch 1\"",0);
          base.books.AddEnglishBookTitle("Book with the title \"Old Man's Tale, Book 1\"",0); 
          
          base.books.AddGermanBookTitle("Buch mit dem Titel \"Der Alte Mann, Buch 2\"",1);
          base.books.AddEnglishBookTitle("Book with the title \"Old Man's Tale, Book 2\"",1);
          
          base.books.AddGermanBookTitle("Buch mit dem Titel \"Der Alte Mann, Buch 3\"",2);
          base.books.AddEnglishBookTitle("Book with the title \"Old Man's Tale, Book 3\"",2);
          
          base.books.AddGermanBookTitle("Buch mit dem Titel \"Der Alte Mann, Buch 4\"",3);
          base.books.AddEnglishBookTitle("Book with the title \"Old Man's Tale, Book 4\"",3);
          
          base.books.AddEnglishBookTitle( "Book with the title \" Tialdin's oath \"", 4 );
          base.books.AddGermanBookTitle( "Buch mit dem Titel \" Tialdins Gelï¿½bnis \"", 4 );

		  base.books.AddEnglishBookTitle( "Book with the title \"Topas\"", 5 );
          base.books.AddGermanBookTitle( "Buch mit dem Titel \"Topase\"", 5 );
          
          base.books.AddEnglishBookTitle("Book with the title \"Petition for Zelphia\"",6);
          base.books.AddGermanBookTitle("Buch mit dem Titel \"Gebet für Zelphia\"",6);
          
		  base.books.AddEnglishBookTitle("Book with the title \"Brewyn the Liar\"",7);
		  base.books.AddGermanBookTitle("Buch mit dem Titel \"Brewyn der Lï¿½gner\"",7);
      end 
      base.books.GetBookItemInform(User,Item); 
  end
