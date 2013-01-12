--WIDE THIN BLUE BOOK

require("base.books")

module("item.book.id_2609_blue_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2609_blue_book' WHERE com_itemid = 2609;

function UseItem(User, SourceItem)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            base.books.AddLanguage("common language",0);

            base.books.AddGermanBookText("\n \n Elfische Geschichte und Kultur",0,0,0);
            base.books.AddGermanBookText("Die Elfen sind eine mysteriï¿½se Rasse und Informationen ï¿½ber sie sind oft schwer zu besorgen. Meist vermeiden sie zu viel Aufmerksamkeit und sehr wenige haben Einsicht in ihre Kultur gewonnen.",0,0,0);
            base.books.AddGermanBookText("Was man ï¿½ber ihre Geschichte weiï¿½, ist, daï¿½ sie eine der ersten Rassen waren, die in Illarion erschienen. Ihnen wurde mï¿½rchenhafte Langlebigkeit verliehen. So sagt man, sie lebten Tausende von Jahren.",0,0,0);
            base.books.AddGermanBookText("Von ihnen wird gesagt, daï¿½ sie um das Alter von 180 erwachsen werden. Dies ist der Beweis, daï¿½ die Sage ihres langen Lebens nicht nur eine Sage sondern Realitï¿½t ist.",0,0,0);
            base.books.AddGermanBookText("Elfen sind bekannt dafür, eine enge Beziehung zur Natur zu haben und sie wie ein fï¿½hlendes Wesen zu behandeln. Es wurde gesehen, daï¿½ sie große Sorge tragen, wenn sie deren Wachstum pflegen.",0,0,0);
            base.books.AddGermanBookText("Sie versuchen einen ausgeglichenen Lebensstil zu fï¿½hren, so ersetzen sie alles, was sie aus der Natur entnehmen. Ihre Häuser sind oft um Bäume gebaut und paï¿½en sich ihrer natürlichen Umgebung an.",0,0,0);
            base.books.AddGermanBookText("Es ist gut möglich, dass Jemand, der sich im Wald verirrt, mitten durch eine Elfenzivilisation geht, ohne es zu bemerken. Ihre Häuser würden nur gesehen werden, wenn durch einen Elf gekennzeichnet.",0,0,0);
            base.books.AddGermanBookText("Das fï¿½hrte zu Gerï¿½chten, Elfen brauchten Magie, um ihre Häuser vor anderen zu verbergen. Einige glauben sogar, sie kï¿½nnten das Wachstum der Bäume kontrollieren, um einen Raum für Häuser zu schaffen.",0,0,0);
            base.books.AddGermanBookText("Alles in allem erscheinen ihre Behausungen sehr zerbrechlich, als ob sie Gï¿½ste wï¿½ren und die ursprï¿½ngliche Form der Natur wiederherstellen würden. ",0,0,0);
            base.books.AddGermanBookText("Ihre Gesellschaft hat eine dezentralisierte Clan-Struktur. Es gibt keine offizielle Regierung oder Fï¿½hrung. Stattdessen stellt das Alter des Elfen den entscheidenden Faktor seiner Position dar.",0,0,0);
            base.books.AddGermanBookText("Im Allgemeinen sind Elfen von gemäßigtem Gemï¿½t und freundlich, nicht nur gegenï¿½ber den Ihren, sondern auch gegenï¿½ber anderen Rassen. Trotzdem fï¿½hlen sie sich mit anderen Elfen wohler.",0,0,0);
            base.books.AddGermanBookText("Wï¿½hrend seinem Leben kann sich ein Elf entscheiden, die Welt zu entdecken und die Heimat zu verlassen. Wenn sie sich entscheiden zu gehen, ist es normal für sie, den Kontakt mit ihrer Art zu halten.",0,0,0);
            base.books.AddGermanBookText("Der Name dieser Wanderung lautet Navro'anai, bis jetzt ist seine ï¿½bersetzung den anderen Raï¿½en unbekannt.",0,0,0);
            base.books.AddGermanBookText("Die früher erwï¿½hnte Ausgeglichenheit und Gelassenheit trifft auf die Jüngeren nicht zu. Die ganz jungen Elfen neigen mehr dazu, in Konflikte zu geraten. Dies ï¿½ndert sich jedoch mit der Zeit.",0,0,0);
            base.books.AddGermanBookText("Die Langlebigkeit der Elfen beinfluï¿½t oft ihre Sicht auf Probleme. Grüßere Probleme eines Menschen sind nicht so tragisch für einen Elfen, da sie schon früher Dinge dieser Natur erfahren haben.",0,0,0);
            base.books.AddGermanBookText("Da sie viel Zeit haben, warten sie oft, bis ein gesellschaftlicher Konflikt vorbei ist. Ihre Geduld ist riesig und kann nicht mit der der anderen Rassen verglichen werden.",0,0,0);
            base.books.AddGermanBookText("Sie sind bekannt für ihr Geschick mit Bogen und langen einhï¿½ndigen Schwertern. Bedingt durch ihre Waffenwahl bevorzugen sie leichte Rüstung. Ihre Sinne sind sehr gut entwickelt, vor allem im Dunkeln. ",0,0,0);
            base.books.AddGermanBookText("Elfen sind in beinahe allen magischen Schulen talentiert, sie haben jedoch eine Neigung zu Kräuterkunde und allen ï¿½hnlichen Dinge. Der Grund dafür ist ihre enge Verbindung zur Natur.",0,0,0);
            base.books.AddGermanBookText("Elfisches Handwerk kann sehr erlesen sein, jedoch ist das nicht auf irgend ein spezielles Talent zurückzufï¿½hren, sondern auf die Menge an Zeit, welche sie brauchen um ihre Produkte zu perfektionieren.",0,0,0);
            base.books.AddGermanBookText("Der Familienname wird einem Fremden nie gesagt, um Flï¿½che auf die Familie zu verhindern.",0,0,0);

            base.books.AddEnglishBookText("\n \n Elven History and Culture",0,0,0);
            base.books.AddEnglishBookText("The elves are a mysterious race and information on them is often hard to procure. They often avoid being a spectacle and very few have gained insight to their personal culture.",0,0,0);
            base.books.AddEnglishBookText("What is known about their history is that they were one of the first races to appear in Illarion. They were given a fabled longevity of life. It is said they live thousands of years.",0,0,0);
            base.books.AddEnglishBookText("They are said to mature around the age of 180. This is proof that they fable of long life is not only a fable, but reality.",0,0,0);
            base.books.AddEnglishBookText("Elves are known to have a close bond to nature and treat it as a sentient being. They have been seen to take great care when they tend to its growth.",0,0,0);
            base.books.AddEnglishBookText("They try to lead a very balanced lifestyle, so what they take from nature they will replace. Their houses are often built around trees and fit in with the natural environment.",0,0,0);
            base.books.AddEnglishBookText("It is quite possible that people who get lost in the woods pass right by Elven civilizations without even knowing it. They houses were only seen because it was noted by an elf.",0,0,0);
            base.books.AddEnglishBookText("This led to rumors that elves use magic to mask their homes from others. Some even believe they can control a trees growth to make natural rooms for their houses.",0,0,0);
            base.books.AddEnglishBookText("All in all, their homes appear to be very fragile as if they are guests and will restore nature's original form.",0,0,0);
            base.books.AddEnglishBookText("Their society has a decentralized clan structure. There is no official government or leadership. Instead, the determining factor of an elf's position is dependent on their age.",0,0,0);
            base.books.AddEnglishBookText("In general, elves are often mild-tempered and friendly, not only to their own kin, but to other races. Though, they are more comfortable with their own kind.",0,0,0);
            base.books.AddEnglishBookText("During an elf's life, he or she must choose to wander around the rest of the world and leave their homeland. If they choose to leave, it is common for them to maintain contact with their kind.",0,0,0);
            base.books.AddEnglishBookText("The name of this wandering of an elf is defined as Navro'anai, yet its translation is still unknown to the other races.",0,0,0);
            base.books.AddEnglishBookText("The aforementioned balance and serenity of the Elves is not true for the younger ones. The very young elves tend to get into more conflicts, though this changes with time.",0,0,0);
            base.books.AddEnglishBookText("The Elves longevity often effect their outlook on problems. Larger problems to humans aren't as tragic to an elf as they have experienced things of the nature before.",0,0,0);
            base.books.AddEnglishBookText("Since they have much time, they often wait for a communities conflict to pass. Their patience is very vast and it cannot compare to the other races.",0,0,0);
            base.books.AddEnglishBookText("They are known for their skill in bows and long one handed swords, and due to their weapon choice they enjoy light types of armor. Their sense are very well developed, especially in the dark.",0,0,0);
            base.books.AddEnglishBookText("Elves are talented in nearly all schools of magic, though they have a great affinity for herbal lore and all things related. This is because of their close connection to the earth.",0,0,0);
            base.books.AddEnglishBookText("Elven crafts can be quite exquisite, though this is not for any special talent, but the sheer amount of time they have to spend on perfecting their items.",0,0,0);
            base.books.AddEnglishBookText("The family name is never told to strangers so they may prevent curses on their family.",0,0,0);
            
            -----------------
            
            base.books.AddLanguage("common language",1);

			base.books.AddEnglishBookText("Written down from\nScribe and Dominus the forge of\nGandela G.\ncontravened officer of the archdwarvenbrotherhood Xelark\n\ntranslate by\nAshayen Cromwell",0,20,1);
			base.books.AddEnglishBookText("You gently touched me once.\nMy thinking henceforth pursued by you.\nThe words you gave to me,",0,20,1);
			base.books.AddEnglishBookText("I just wanted to live and breath for them.\nThe wisdom i wanted to learn,\nasinisty i wanted to remove.",0,20,1);
			base.books.AddEnglishBookText("But shadow arose,\nothers my thinking will be?\nNEVER! I would let them control me.",0,20,1);
			base.books.AddEnglishBookText("Will hate these chains forever.\nWich locked me into my promise,\ntaking vengeance for the past.",0,20,1);
			base.books.AddEnglishBookText("However i spoke well and burly,\nlet shed blood of enemies.\nLet slaugther wife and child,",0,20,1);
			base.books.AddEnglishBookText("butchering like the farmerï¿½s cattle.\nAllowed to burn down helpless enemyï¿½s towns,\nto search for the reason i contemned.",0,20,1);
			base.books.AddEnglishBookText("However in the deepest night,\nyou guarded me along.\nIn my dreams i saw you,",0,20,1);
			base.books.AddEnglishBookText("there you showed me, what i am.\nYou bit by bit,\nbrought me back out of the dark shade.",0,20,1);
			base.books.AddEnglishBookText("And again you gently touched me,\nand again you gentle seduced me.\nGave me the wisdom,",0,20,1);
			base.books.AddEnglishBookText("wisdow which controls my actions.\nMy thinking you gave to me,\nand thats i am thankful for.",0,20,1);
			
			base.books.AddGermanBookText("Niedergeschrieben von\nScribe und Dominus der Schmiede\nGandela G.\nverstoï¿½ener Offizier der Erzzwergenbruderschaft Xelark\nï¿½bersetzt von\n\nAshayen Cromwell",0,20,1);
			base.books.AddGermanBookText("Hast mich einst sanft berï¿½hrt,\nmein denken fortan du gefï¿½hrt.\nDie Worte die du mir hast gegeben,",0,20,1);
			base.books.AddGermanBookText("einzig nach ihnen wollt ich leben.\nDie Weisheit wollt ich lernen,\nDummheit wollt ich entfernen.",0,20,1);
			base.books.AddGermanBookText("Doch Schatten brach hinein,\nandere mein denken sein?\nNIE! Werd ich mich lenken lassen,",0,20,1);
			base.books.AddGermanBookText("werd ewig diese Ketten hassen.\nDie mich banden ans Versprechen,\newig Vergangenheit zu rï¿½chen.",0,20,1);
			base.books.AddGermanBookText("Doch ich sprach stramm und gut,\nlieï¿½ vergieï¿½en Feindes Blut.\nLieï¿½ schlachten Weib und Kind,",0,20,1);
			base.books.AddGermanBookText("schlachten wie des Bauerns Rind.\nLieï¿½ verbrennen hilflos Feindes Stï¿½dte,\nden Grund zu suchen ich verschmï¿½hte.",0,20,1);
			base.books.AddGermanBookText("Doch in tiefster schwarzer Nacht,\ndu weiter ï¿½ber mich gewacht.\nIn meinen Trï¿½umen ich dich sah,",0,20,1);
			base.books.AddGermanBookText("dort zeigtest du mir was ich war.\nHast mich Stück für Stück,\naus dunklem Schatten gerï¿½ckt.",0,20,1);
			base.books.AddGermanBookText("Und wieder hast mich sanft berï¿½hrt,\nund wieder hast mich sanft verfï¿½hrt.\nHast mir die Weisheit geschenkt,",0,20,1);
			base.books.AddGermanBookText("Weisheit die mein Handeln lenkt.\nMein Denken gabst du mir,\nund dafür dank ich dir.",0,20,1);
			
			---------------------------------
			
			base.books.AddLanguage("halfling language",2); 

			base.books.AddEnglishBookText("Chronicle recording of the Blumfuï¿½ens family tree.",0,11,2); 
			base.books.AddEnglishBookText("Dear reader, my name is Willibald Blumfuï¿½ens, I live in Firnismill. And I am now at this age when a halfling starts wondering, where he came from originally and who were his forefathers. ",0,11,2); 
			base.books.AddEnglishBookText("I need to tell no one, that this is one of the most exciting questions, one occupies oneself during his life. Many of my relatives and acquaintances have helped me magnanimous and",0,11,2); 
			base.books.AddEnglishBookText("even lend me the some books. Therefore I wish to thank them again at this point, with all my heart.",0,11,2); 
			base.books.AddEnglishBookText("Well, the family of the Blumfuï¿½ens left their very first tracks already a long time ago. It is of course especially difficult to investigate suspects that have taken place this far past, but there are",0,11,2); 
			base.books.AddEnglishBookText("signs to be found that Perigren Blumigfluss has been the first one in our line, of whom we know of. He lived unthinkable two-thousand years ago, in the years of the century-wars. The name must",0,11,2); 
			base.books.AddEnglishBookText("have changed, as it happens oftenly, when this lot of time passes. Perigren was father to the known agitator Pippiat Blumigfluss, whose lion-hearted role in the battle of Firnismill",0,11,2); 
			base.books.AddEnglishBookText("in the year 1777 before the fall of the evil sorcerer Mordak Alï¿½Kharud is known everywhere. Perigren is said to have been a satisfied blacksmith and as the stories report, he himself and also his son",0,11,2); 
			base.books.AddEnglishBookText("had the special habit to cover their feet with gaiters, one in our family still widespread custom. Furthermore, Pippiat is said to have had an unusually broad backside and I wish to praise our family",0,11,2); 
			base.books.AddEnglishBookText("for that, too. Therefore, all circumstances point to the fact that Perigren Blumigfluss from the time of the war of centuries the first forefather is we know of.",0,11,2); 
			base.books.AddEnglishBookText("But later on, the track of our clan is lost a bit and for four hundred years, it is especially difficult to find a fitting halfling. Well, there has been a lot of time passing, of course.",0,11,2); 
			base.books.AddEnglishBookText("Three hundred years before the round thousand, in -1342, one reads the name Blumfussig for the first time. It is the same writing, in which my mothers grandmother, my grand-grandmother therefore,",0,11,2); 
			base.books.AddEnglishBookText("used to say our name. Esmeralda Blumfussig is mentioned in the duplication of a cookery book. In that cookery book, her recipe for a special soup is written down.",0,11,2); 
			base.books.AddEnglishBookText("This soup is said to have tasted so well, that Esmeralda got remarkably old.",0,11,2); 
			base.books.AddEnglishBookText("Another sixhoundred years later, the time whose chronicles are reachable for our generation, starts. And from the year -622 men and women of our family, being called Blumfussig our Blumfuï¿½ens",0,11,2); 
			base.books.AddEnglishBookText("alternatingly, are mentioned regularly in chronicles of heads of a family and in other books. Likewise for example Marijana Blumfuï¿½ens, who won the competition about the most delicious cake",0,11,2); 
			base.books.AddEnglishBookText("in Firnismill in the year -534. Or Kalimac Blumfussig (mentioned -322), who earned the reputation of being an extraordinairy good carpenter.",0,11,2); 
			base.books.AddEnglishBookText("In the year -284 Esmealda Blumfuï¿½ens managed to be honoured for especially grand and gorgeous pumpkins. She was my grand-grandmothers mother, who had been named after her mother.",0,11,2); 
			base.books.AddEnglishBookText("She married Bilber Blumenkohl and had two sons and one daughter. Mairane Blumenkohl, Fungus Blumfuï¿½ens and Thomas Blumfuï¿½ens. The wohle family was able to enjoy a quiet and contemplative life,",0,11,2); 
			base.books.AddEnglishBookText("for they had a small comfortable farm outside of Firnismill. Mairane was wed to Volker Sandhï¿½gel and she gave birth to five merry children. The girls were called Ewari, Maria and Rosalinde whereas",0,11,2); 
			base.books.AddEnglishBookText("the boys were called Andreas and Anton. Fugus deseased from a bad illness before he was able to marry his beloved Elizabeth Leafhollow. Thomas Blumfuï¿½ens, my grandfather, married Adelie Willowsheep.",0,11,2); 
			base.books.AddEnglishBookText("They had a son, Holden Blumfuï¿½ens, who managed in -85 to again grow the most beautiful pumpkins of all Firnismill. At the big festival in that year he met my mother Anita Berryard and the presented",0,11,2); 
			base.books.AddEnglishBookText("me with the name Willibald Blumfuï¿½ens./n/n/n/n~The end of the records in the seventh year after the fall of the evil sorcerer Mordak Alï¿½Kharud.",0,11,2); 
			
			base.books.AddGermanBookText("Die Stammbaumaufzeichnung der Blumfuï¿½ens.",0,11,2); 
			base.books.AddGermanBookText("Lieber Leser, mein Name ist Willibald Blumfuï¿½ens, ich lebe in Firnismï¿½hle. Und ich bin nun in jenem Alter, wo sich ein Halbling zu fragen beginnt, wo er eigentlich herkommt und wer den seine Vorfahren",0,11,2); 
			base.books.AddGermanBookText("waren. Ich brauche niemanden zu erzählen, dass es sich hierbei wohl um die aufregendsten Fragen handelt, mit denen man sich im Laufe seines Lebens beschäftigt. Viele meiner Verwandten und Bekannten",0,11,2); 
			base.books.AddGermanBookText("mir großmï¿½tig geholfen und auch das eine oder andere Buch hergeliehen. Deshalb möchte ich, ihnen allen an dieser Stelle nochmalig von Herzen dafür danken.",0,11,2); 
			base.books.AddGermanBookText("Nun die allerersten Spuren hat die Familie der Blumfuï¿½ens bereits vor sehr langer Zeit hinterlassen. Es ist natürlich besonders schwer so lang Vergangenes zu erforschen, doch es finden sich Zeichen",0,11,2); 
			base.books.AddGermanBookText("dafür, dass Perigren Blumigfluss wohl der Erste unserer Reihe ist, von dem wir wissen. Er lebte bereits vor unvorstellbaren zweitausend Jahren in den Jahren der Jahrhundertkriege. Der Name muss sich",0,11,2); 
			base.books.AddGermanBookText("ein wenig gewandelt haben, wie es ï¿½fters passiert, wenn so viel Zeit vorï¿½ber geht. Perigren war der Vater des bekannten Unruhestifters Pippiat Blumigfluss, dessen heldenhafte Rolle im Kampf um",0,11,2); 
			base.books.AddGermanBookText("Firnismï¿½hle im Jahre 1777 vor dem Fall des ï¿½blen Hexers Mordak Al'Kharud allerorts bekannt ist. Perigren soll ein zufriedener Hufschmied gewesen sein und wie die Geschichten berichten hatten er und",0,11,2); 
			base.books.AddGermanBookText("wie die Geschichten berichten hatten er und auch sein Sohn die besondere Angewohnheit mit Gamaschen ihre Füße zu schï¿½tzen. Eine in unserer Familie immer noch weit verbreitete Gepflogenheit.",0,11,2); 
			base.books.AddGermanBookText("Weiters soll Pippiat ein ungewöhnlich breites Gesï¿½ï¿½ gehabt haben und ich möchte auch unsere Familie dafür rï¿½hmen. So deuten alle Gegebenheiten darauf hin das wohl Perigren Blumigfluss aus den",0,11,2); 
			base.books.AddGermanBookText("Jahrhundertkriegen der erste Vorfahre ist von dem wir wissen./n/n/nDoch anschlieï¿½end verliert sich die Spur unserer Sippe ein wenig und für 400 Jahre ist es besonders schwierig einen",0,11,2); 
			base.books.AddGermanBookText("zutreffenden Halbling zu finden. Nun es ist ja auch besonders viel Zeit vergangen. 300 Jahre vor der runden Tausend, im Jahr -1342 liest man das Erste Mal von dem Namen Blumfussig. Es ist die selbe",0,11,2); 
			base.books.AddGermanBookText("Schreibweise, in dem die Großmutter meiner Mutter, meine Ur-Oma also, unseren Namen aus zu sprechen pflegte. Esmeralda Blumfussig, wird in der Abschrift eines Kochbuches erwï¿½hnt. In dem Kochbuch wird",0,11,2); 
			base.books.AddGermanBookText("ihr Rezept für die spezielle Suppe beschrieben. Diese Suppe soll so sehr geschmeckt haben, dass Esmeralda besonders Alt geworden ist.",0,11,2); 
			base.books.AddGermanBookText("Weitere 600 Jahre später beginnt die Zeit, deren Aufzeichnungen unserer Generation zugï¿½nglich ist. Und Seit dem Jahr -622 werden Mï¿½nner und Frauen unserer Familie,",0,11,2); 
			base.books.AddGermanBookText("abwechselnd Blumfussig oder Blumfuï¿½ens genannt, Regelmäßig in Chroniken der Familienvï¿½ter und anderen Bï¿½chern genannt. So zum Beispiel Marijana Blumfuï¿½ens, die den Wettbewerb im Jahr -534 um den",0,11,2); 
			base.books.AddGermanBookText("schmackhaftesten Kuchen von Firnismï¿½hle gewann. Oder Kalimac Blumfussig (erwï¿½hnt -322), der sich einen besonderen Ruf als Schreiner erarbeitete. Im Jahr -284 gelang es Esmealda Blumfuï¿½ens fï¿½r",0,11,2); 
			base.books.AddGermanBookText("besonders große und prï¿½chtige Kï¿½rbisse geehrt zu werden. Sie war die Mutter meiner Ur-Oma die nach ihrer Mutter geheiï¿½en hatte. Sie heiratete Bilber Blumenkohl und hatte zwei Sï¿½hne und eine Tochter.",0,11,2); 
			base.books.AddGermanBookText("Mairane Blumenkohl, Fungus Blumfuï¿½ens und Thomas Blumfuï¿½ens. Die gesamte Familie konnte sich an einem ruhigen beschaulichen Leben erfreuen, denn sie hatten einen kleinen gemï¿½tlichen Hof vor",0,11,2); 
			base.books.AddGermanBookText("Firnismï¿½hle. Mairane heiratete Volker Sandhï¿½gel und gebar 5 lebensfrohe Kinder. Ewari, Maria, Rosalinde, die Mï¿½dchen und Andreas, sowie Anton die Buben. Fungus verstarb an einer schweren Krankheit",0,11,2); 
			base.books.AddGermanBookText("bevor er seine Liebe Elizabeth Leafhollow heiratete. Thomas Blumfuï¿½ens, mein Großvater heiratete Adelie Willowsheep. Sie hatten einen Sohn, Holden Blumfuï¿½ens, er schaffte es abermals,",0,11,2); 
			base.books.AddGermanBookText("im Jahr -85 die schönsten Kï¿½rbisse von ganz Firnismï¿½hle zu ziehen. Beim großen Fest in diesem Jahr lernte er meine Mutter Anita Berryard kennen und sie schenkten mir den Namen Willibald Blumfuï¿½ens.",0,11,2); 
			base.books.AddGermanBookText("~Ende der Aufzeichnungen im Jahr 7 nach dem Fall des ï¿½blen Hexers Mordak Alï¿½Kharud.",0,11,2);
			
        end
    end
    SendBookPage(User,SourceItem.data,Counter);
end

function LookAtItem(User,Item)
    if base.books.InitTitle() then
        base.books.AddEnglishBookTitle("Book with the title \"Elven History and Culture\"",0);
        base.books.AddGermanBookTitle("Book with the title \"Elfische Geschichte und Kultur\"",0);

        base.books.AddEnglishBookTitle("Book with the title \"Petition in the name of Findari\"",1);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Gebet im Namen Findari\"",1);
        
        base.books.AddEnglishBookTitle("Book with the title \"Chronicle of the Blumfuï¿½ens\"",2); 
		base.books.AddGermanBookTitle("Buch mit dem Titel \"Stammbaum der Blumfuï¿½ens\"",2);
    end
    base.books.GetBookItemInform(User,Item);
end
