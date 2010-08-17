-- ds_131_buch.lua
-- Druidensystem
-- Falk
-- Buch für das Druidensystem
-- Falk
require("base.books")
require("base.common")

module("druid.item.id_131_book_letter", package.seeall)

-- UPDATE common SET com_script='druid.item.id_131_book_letter' WHERE com_itemid = 131;

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
--User:inform("debug 129-1")
    if base.books.InitBook() then
        base.books.AddLanguage("common language",0);

        base.books.AddGermanBookText("Werte Druiden des Waldes,\n",0,0,0);     
        base.books.AddGermanBookText("Ich wende mich voller Ehrfurcht und Respekt an die ehrenwerte Gesellschaft der Druiden des Waldes und hoffe, dass dieser Brief in die Hände der Richtigen gelange.",0,0,0);
        base.books.AddGermanBookText("Es liegt nun einige Jahre zurück, als das Kloster Eldan auf Gobaith im Rahmen einer kriegerischen Auseinandersetzung angegriffen, geplï¿½ndert und gebrandschatzt wurde.",0,0,0);
        base.books.AddGermanBookText("Ich war damals noch ein junger Mann, erst wenige Monate zuvor der Bruderschaft beigetreten und ohne viel Wissen um die uns in dieser Welt umgebenden Krï¿½fte.",0,0,0);
        base.books.AddGermanBookText("Der Abt des Klosters, Falk vom Wald, erkannte wohl, dass die wenigen Mï¿½nche einem massiven Angriff nicht würden standhalten können. Deshalb schickte uns der Alte weg, zwang uns zur Flucht und dazu, ihn alleine zurückzulassen. Widerwillig haben wir uns damals gefï¿½gt und in alle Winde zerstreut. Mich fï¿½hrte das Schicksal an die Gestade des Festlandes, wo ich in aller zurückgezogenheit eine geraume Zeit lebte.",0,0,0);
        base.books.AddGermanBookText("Dort erreicht mich seinerzeit auch die Nachricht von der Niederlegung des Klosters. Vom Alten gab es damals keine einzige Spur. Wiederum einige Zeit später erreichte mich die Nachricht, das Klostergebï¿½ude sei wieder aufgebaut worden und werde seitdem von seinen neuen Besitzern bewohnt. Nie wieder wollte ich an diesen Ort zurückkehren, ich blieb auf dem Festland, legte mein Mï¿½nchsgelï¿½bde nieder und erlernte den Beruf eines Zimmermanns.",0,0,0);
        base.books.AddGermanBookText("Vor nicht allzu langer Zeit erhielt mein Meister, in dessen Dienste als Geselle ich nach meiner Lehrzeit eingetreten war, aus Gobaith den Auftrag, die seit der Brandlegung unzugï¿½nglichen Gewï¿½lbekeller des Klosters  freizulegen und zu restaurieren. So fï¿½hrte mich das Schicksal erneut zum Ort meiner Novizenschaft, wir begannen mit den Arbeiten, die sich als schwierig und zeitraubender als gedacht erwiesen.",0,0,0);
        base.books.AddGermanBookText("Bei diesen Arbeiten stieï¿½en wir auf die Reste eines Raumes, dessen Eingang wir zunï¿½chst nicht lokalisieren konnten. Wie sich herausstellte, war die Tï¿½r entfernt und durch eine massive Mauer ersetzt worden.",0,0,0);
        base.books.AddGermanBookText("Durch den Feuersturm, der auf die Plï¿½nderung des Klosters gefolgt sein muss, war die Decke des Gewï¿½lbe in Teilen eingestï¿½rzt und hatte das Inventar des geheimen Raumes teilweise unter sich begraben. Diesem Umstand ist es wohl zuzuschreiben, dass die Kammer bis zu unserer Ankunft unentdeckt geblieben war.",0,0,0);
        base.books.AddGermanBookText("Mit großer Vorsicht entfernten wir Schutt und Trï¿½mmerteile, bis es uns gelang, die wenigen unversehrten Stellen freizulegen. Der Raum hatte wohl dem Kloster als geheimes Experimentarium gedient, ich erinnere mich vage an Gerï¿½chte, die zur Zeit meiner Novizenschaft unter den Brï¿½dern die Runde machten, wonach der Abt des nachts ï¿½ber eine Wendeltreppe in seiner Turmkammer schleiche, in einen für andere Mï¿½nche unzugï¿½nglichen Bereich, wo er sich seinen Studien der Alchemie widme. Offenbar hatten wir dieses verborgene Labor entdeckt.",0,0,0);
        base.books.AddGermanBookText("Neben allerlei zerbrochenen Behï¿½ltern, verrosteten Werkzeugen und etlichem undefinierbaren Unrat fanden wir auch einige Fï¿½sser mit einem unbekanntem Inhalt, die wir unversehrt bergen konnten. Zusammen mit einigen wenigen alten Bï¿½chern, allesamt angelegt in mir nicht bekannter Sprache, haben wir diese Fï¿½sser zum nahen Ordenshaus der Druiden geschafft. Der Abt hatte uns stets von seiner Freundschaft zu den Druiden berichtet, so dass ich denke, Ihr Ehrenwerten werdet mit dem Fund etwas anzufangen wissen.",0,0,0);
        base.books.AddGermanBookText("Ganz in einer Nische verborgen mussten wir schlieï¿½lich auch die sterblichen ï¿½berreste eines ï¿½lteren Menschen in Mï¿½nchsgewand bergen. Ich hege kein Zweifel, dass es sich bei dem teilweise mumifizierten Leichnam um den des Abtes Falk vom Wald handelt. Nachdem die Mï¿½nche den Alten zurückgelassen und sich in Sicherheit gebracht hatten, muss sich der Abt in den Gewï¿½lbekeller begeben haben. Anhand der zahlreichen zerstï¿½rten Pergamente nehme ich an, dass er bemüht war, die wichtigsten Schriften des Klosters vor den Angreifern zu verbergen. Dazu schaffte er was er tragen konnte aus der einstmals so berï¿½hmten und reichen Bibliothek des Klosters in die Tiefe und Verborgenheit des geheimen Labors. Und so unglaublich es klingen mag, dort angekommen muss der Abt den Eingang eigenhï¿½ndig zugemauert haben. Die Spuren deuten eindringlich darauf hin, dass sich der Unglï¿½ckliche selbst eingemauert hatte und dort in tiefer Dunkelheit den Untergang erwartete. Die Umstï¿½nde des Todes mï¿½gen dramatisch gewesen sein, es lï¿½sst sich nicht mit Sicherheit sagen, ob Falk vom Wald qualvoll verhungerte oder seinem Leben mit einem Gifttrank selbst ein Ende setzte. Die einstï¿½rzenden Mauern begruben dieses Geheimnis wohl für immer unter sich.",0,0,0);
        base.books.AddGermanBookText("Falk vom Wald hï¿½tte sich selbst in Sicherheit bringen mï¿½ssen, stattdessen widmete er seine letzten Stunden der Rettung einiger Schriften, von denen ich nicht einmal sagen kann, ob sie denn überhaupt irgend ein interessanten Inhalt aufweisen. Wenn aber der Abt die Rettung der Bï¿½cher wichtiger als das eigene Leben achtete, so nehme ich an, er wusste um deren Bedeutung.",0,0,0);
        base.books.AddGermanBookText("Den Leichnam des Falk vom Wald haben mein Meister und ich in einem Sarg aus dem Holz der Eldaneiche niedergelegt. Wir bitten Euch, die Druiden des Waldes nun darum, dem Abt ein Andenken zu widmen und den Sarg beizusetzen. Sicherlich hï¿½tte sich der Alte sehr gewï¿½nscht, nicht allzuweit entfernt von seiner geliebten Heimat begraben zu sein, das Kloster hatte ihm stets viel bedeutet.",0,0,0);
        base.books.AddGermanBookText("Mich fï¿½hrt mein Weg indes zurück aufs Festland, nach der Errichtung des neuen Gewï¿½lbekellers gibt es für mich hier auf Gobaith nichts mehr zu tun.",0,0,0);
        base.books.AddGermanBookText("Mit dem Gruß unseres Abtes \'Eldan auf all Euren Wegen\' verbleibe ich in größter Hochachtung und wï¿½nsche dem Druidentum dieses Landes eine von Neuem erblï¿½hende Hochzeit. Mï¿½gen Euch die Götter den Weg weisen, so wie ihn der Alte in seinen Studien so lange Zeit zu ergrï¿½nden und vorauszusehen suchte.",0,0,0);     
        base.books.AddGermanBookText("\n\nIn den Tagen von Siros 26\n\n",0,0,0);
        base.books.AddGermanBookText("\nTuor, Zimmermann aus Koldar-Mar",0,0,0);
---
				base.books.AddEnglishBookText("Most Revered Order of the Druids of the Forest,\n\n",0,0,0);

				base.books.AddEnglishBookText("I, your humble servant, address all those of the Ancient Order of Druids with deep respect and only hope that it finds it's way into the proper hands.",0,0,0);

				base.books.AddEnglishBookText("Came to pass in times well gone, that the Eldan Monastery on the mouth of Three Finger Bay upon the isle of Gobaith was laid siege to, pillaged, and left to burn in a great martial conflict. In those days I, but little more than a boy, had contracted with the Brotherhood only so recently and, as any youth, lived blissfully unaware of the hidden forces that surround all in existence.",0,0,0);

				base.books.AddEnglishBookText("'Twas the most wise and venerable Abbot, Falk vom Wald, who judged rightly that those few Friars could not long survive a struggle whilst outnumbered so. And so it came to pass that the old man sent us fleeing, and there in the monastery he stayed alone. Reluctant, certainly, but in respect for the wizened Abbot, we fled to the four winds.",0,0,0);

				base.books.AddEnglishBookText("'Twas Providence that watched over me in my long journey to the mainland. There, I bided my time living the life of a hermit, expecting nothing more than to live my life in solitude. 'Twas an unexpected visitor I recieved, a letter bearing the message that the Monastery had indeed fallen, and yet, mysteriously, the Old Man of the Abbey left no corpse, nor any sign of escape. Soon after a new missive arrived at my doorstep, this time saying the old Monastery had been rebuilt into it's former glory and inviting back its' attendants. 'Twas well before then I my mind had made up to never set foot upon the Isle again, and certainly not those hallowed halls once besieged and had I resolved to discard the oath I once held solemn which bound me as a monk. 'Twas then I became an apprentice under a local carpenter.",0,0,0);

				base.books.AddEnglishBookText("However, Fate is a trickster, and in more recent days my master, to whose service I joined as a journeyman following my apprenticeship was contracted by the very Abbey at which I sent my youth to unveil and restore the vaulted cellars of the old Monastery, which had been left blocked off since that fateful battle so long ago. In such a way I found myself in the place I once cloistered. Our toil would seem never-ending.",0,0,0);

				base.books.AddEnglishBookText("And so it was that we came across a mysterious chamber hidden behind a massive mural, which in the ruination of battle was further blocked by fallen debris and thus, it can be surmised, left untouched since those days.",0,0,0);

				base.books.AddEnglishBookText("So with great diligence we removed the heavy rubble until we had laid bare those parts rare places within that were left undamaged. We were amazed to have discovered some sort of secret laboratory and at that moment I recalled rumors which made the rounds among the novices, of how the Old Man of the Abbey would creep in the shadows of night to dissapear into some unkown place to practice the secrets of Alchemy. It was immediately obvious to me that we had discovered his hidden laboratory.",0,0,0);

				base.books.AddEnglishBookText("There among broken vessels, rusty tools, and shattered glass we found Among all kinds of broken vessels, rusty tools and plenty of garbage we found several casks with strange fluids that we were able to salvage, as well as some few dusty tomes, all in an ancient and unknown tongue. The artifacts we moved to the nearby House of the Druids for safekeeping, as the Abbot was known to be fond of the druid. And so it is that this letter has reached your Great Old Order along with these resurfaced oddities. It is my sincere hope that your great society will know what to do with these, of which you have been entrusted.",0,0,0);

				base.books.AddEnglishBookText("Alas it is that in the depths of the ruins at thrice-shadowed alcove we were to uncover the partially mummfied remains of an elderly man in the robe and cowl of an Abbot. There can be little doubt that this is him: The Old Man of the Abbey, Falk vom Wald. It must have been that as the monks fled the Abbot sequestered into the hidden laboratory, carrying what secret works he could rescue from the Monastery's library, and therewithin walled himself in to await perdition. It cannot be told wether he suffered those final hours or released himself with poison.",0,0,0);

				base.books.AddEnglishBookText("What can be told is that he spent his darkest hour on writings which he deemed more important than his very life, and these I leave, yet unread even by myself, and intrust in your care.",0,0,0);

				base.books.AddEnglishBookText("As to the remains, we laid Falk vom Wald in a coffin of Eldan Wood and ask that you lay these to rest and perform the final rites in your age old traditions. Having left no last will and testament, it can only be assured that the Old Man would wish to be put to rest no great distance from the Monastery of which was his the fullness of his life.",0,0,0);

				base.books.AddEnglishBookText("As for myself, my path leads back across the ocean, to what has become my home in the Salkamar mainlands. With the Monastery renewed to it's former glory, the isle of Gobaith holds nothing for me any longer.",0,0,0);

				base.books.AddEnglishBookText("As the Abbot was once often heard to say, \"Eldan Always On Your Path.\" With utmost admiration and respect for your great institution, it is my fervent hope that these articles I entrust in your hands will help revisit and renew ancient Druidic thought and the practice of Alchemy. May the Gods ever guide you along your path as certainly as the Old Man foresaw it.",0,0,0);

				base.books.AddEnglishBookText("\n\nOn the 26th Day of Siros,\n\n",0,0,0);
				base.books.AddEnglishBookText("Tuor, Journeyman Carpenter of Koldamar",0,0,0);

   end
   base.books.SendBookPage(User,SourceItem.id_data,Counter);
end

function UseItemWithField( User, SourceItem, TargetPos, Counter, Param, ltstate )
--User:inform("debug 129-2")
   world:erase(SourceItem,1)
end

function UseItemWithCharacter( User, SourceItem, TargetCharacter, Counter, Param, ltstate )
--User:inform("debug 129-3")
   world:erase(SourceItem,1)
end

function LookAtItem( User, Item )
--User:inform("debug 129-4")
   if base.books.InitTitle() then
      base.books.AddGermanBookTitle("Buch mit dem Titel \"Brief an die Druiden\"",0);
      base.books.AddEnglishBookTitle("Book with the title \"Letter for the druids\"",0);
   end
   base.books.GetBookItemInform(User,Item);
end
