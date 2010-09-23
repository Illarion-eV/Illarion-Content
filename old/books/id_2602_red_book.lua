-- SMALL THIN RED BOOK

require("base.books")

module("item.book.id_2602_red_book", package.seeall)

-- UPDATE common SET com_script='item.book.id_2602_red_book' WHERE com_itemid = 2602;

function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            base.books.AddLanguage("common language",1);
            base.books.AddLanguage("common language",2);
            base.books.AddLanguage("common language",3);

            base.books.AddGermanBookText("Die Höhle von Irundar muss hier irgendwo sein... Ein Waldläufer hat genau diese Bucht beschrieben!",0,0,1);
            base.books.AddGermanBookText("Diese Höhle ist recht enttï¿½uschend.",0,0,1);
            base.books.AddGermanBookText("Wenn ich hier noch lï¿½nger suche werde ich bald den Verstand verlieren...",0,0,1);
            base.books.AddGermanBookText("Ha! Jetzt ist mir alles klar. Dies ist nicht die Höhle von Irundar...dies ist nur eine Passage, ein Zugang.",0,0,1);
            base.books.AddGermanBookText("Wahrscheinlich wurde der Zugang vor langer Zeit verschï¿½ttet verschï¿½ttet...obwohl...was wï¿½re wenn...",0,0,1);
            base.books.AddGermanBookText("Endlich jenseits der Zugangshï¿½hle und nun: Die Höhle von Irundar...die Höhle ist Irundar, Irundar ist die Höhle. Dies ist einfach ï¿½berwï¿½ltigend!",0,0,1);

            base.books.AddEnglishBookText("The Cave of Irundar must be somewhere near...A Ranger described exactly this bay!",0,0,1);
            base.books.AddEnglishBookText("This cave is really disappointing.",0,0,1);
            base.books.AddEnglishBookText("If I continue to search around down here, I will go crazy...",0,0,1);
            base.books.AddEnglishBookText("Ha! Now everything becomes clear to me. This is not the Cave of Irundar...this is just a passage, an entrance.",0,0,1);
            base.books.AddEnglishBookText("The entrance was properbly closed a long time ago...on the other hand...what if...",0,0,1);
            base.books.AddEnglishBookText("Finally I went passed the entrance cave and now: The Cave of Irundar...the cave is Irundar, Irundar is the cave. This is just amazing!",0,0,1);

            base.books.AddGermanBookText("Endlich bin ich in Irundar, der verborgenen Stadt angelangt. Was ein Treiben auf dem Marktplatz! Ich hï¿½tte nicht gedacht dass hier jeder so beschäftigt ist.",0,0,2);
            base.books.AddGermanBookText("Soeben habe ich bei Quartiermeister Solarin in Schloï¿½ Irundar vorgesprochen und ihm das Empfehlungsschreiben von Meister Delarod gezeigt. Ich kann in einer kleinen Wohnung mit Blick auf den Marktplatz wohnen.",0,0,2);
            base.books.AddGermanBookText("Viele Hï¿½ndler scheinen von auï¿½erhalb zu kommen, ich frage mich wie sie die Stadt erreichen; auf meinem Hinweg bin ich nicht vielen Leuten begegnet, bis auf den Torwï¿½chter am eher unscheinbaren Stadttor.",0,0,2);
            base.books.AddGermanBookText("Heute habe ich mich Großmeister Rinaad vorgestellt und ihm das Empfehlungsschreiben von Meister Delarod gezeigt.",0,0,2);
            base.books.AddGermanBookText("Er hat kurz gelï¿½chelt und gemeint: 'Delarod meint also, dass du zum Meister berufen bist? Irenur, richtig? Hmhm...bei mir zï¿½hlt nur harte Arbeit. Folge mir und ich werde dich in der magischen Schmiedekunst unterweisen!'",0,0,2);
            base.books.AddGermanBookText("Die erste Woche war recht hart, so dass ich kaum dazu kam Eintrï¿½ge hinzuzufï¿½gen. Jeden Abend wenn ich von der Arbeit heimkehre bin ich todmüde.",0,0,2);
            base.books.AddGermanBookText("Rinaad ist ein harter aber guter Lehrer. Heute war ich in der Lage meine erste magische Dolchklinge zu schaffen. Auch wenn sie nur zu glï¿½hen vermag, so ist es doch ein Anfang.",0,0,2);
            base.books.AddGermanBookText("Es gibt Probleme mit dem Lieferanten. Er ist seit einer Woche ï¿½berfï¿½llig. Großmeister Rinaad hat mich damit beauftragt nach dem Norden zu wandern und bei den Minen nach ihm zu fragen. Das bedeutet dass ich Zwerge sehen werde!",0,0,2);
            base.books.AddGermanBookText("Auï¿½erdem ist dies die erste Gelegenheit Irundar für einige Zeit zu verlassen und wieder auf der Oberflï¿½che zu wandeln. Ich denke, ich werde wohl einige Zeit unterwegs sein.",0,0,2);

            base.books.AddEnglishBookText("Finally I am in the hidden city of Irundar. What a crowded marketplace! I did not imagine that this was such a busy place.",0,0,2);
            base.books.AddEnglishBookText("Right now I spoke to quartermaster Solarin in Irundar Castle and showed him the EMPFEHLUNGSSCHREIBEN from master Delarod. I can live in a small flat with view on the marketplace.",0,0,2);
            base.books.AddEnglishBookText("Many merchants seem to be commuters, I ask myself how they reach the city; on my way to Irundar I did not meet many people, except the guard at the UNSCHEINBAR city gate.",0,0,2);
            base.books.AddEnglishBookText("Today I introduced myself to grandmaster Rinaad and showed him the EMPFEHLUNGSSCHREIBEN from master Delarod.",0,0,2);
            base.books.AddEnglishBookText("He merely smiled and said: 'So Delarod thinks that you are worthy to become a master? Irenur, correct? Well, well...what counts with me is hard work only. Follow me and I will teach you the art of magic smithing.'",0,0,2);
            base.books.AddEnglishBookText("The first week was really tough, so that I had little time to add new entries. Each evening when I return from work, I am just exhausted and fall asleep.",0,0,2);
            base.books.AddEnglishBookText("Rinaad is a demanding but very able teacher. Today I was able to create my first magic DOLCHblade. Even if it is just able to glow, it is still a beginning.",0,0,2);
            base.books.AddEnglishBookText("Problems with the supplier have occurred. He is one week late. Grandmaster Rinaad has told me to wander to the north and ask for him at the mines. This means that I am going to see dwarfs!",0,0,2);
            base.books.AddEnglishBookText("Furthermore this is my first opportunity to leave Irundar for a longer peroid of time and to wander on the surface again. I will be away for quite a while, I think.",0,0,2);

            base.books.AddGermanBookText("Die ersten Seiten sind herausgerissen...",0,0,3);
            base.books.AddGermanBookText("Zwei leuchtende Dolche für Haredar.",0,0,3);
            base.books.AddGermanBookText("Ein Feuerschwert für Selan.",0,0,3);
            base.books.AddGermanBookText("Ein Giftdolch für Murnan.",0,0,3);
            base.books.AddGermanBookText("Ein giftresistenter Plattenpanzer für den Lord von Krotir.",0,0,3);
            base.books.AddGermanBookText("50 schnelle Stahlbolzen für Serunir.",0,0,3);
            base.books.AddGermanBookText("Ein Smaragdschwert für Haldon.",0,0,3);
            base.books.AddGermanBookText("Ein Ring gegen bï¿½se Geister für Cirdon.",0,0,3);
            base.books.AddGermanBookText("Ein Sï¿½uredolch für Murnan.",0,0,3);
            base.books.AddGermanBookText("Ein sï¿½ureresistenter Plattenpanzer für den Lord von Krotir.",0,0,3);
            base.books.AddGermanBookText("Ein Kurzschwert mit Namensgravur für Juroon.",0,0,3);
            base.books.AddGermanBookText("Ein leichter Metall-Kampfstab für Alatur.",0,0,3);
            base.books.AddGermanBookText("Ein Eisschwert für Welian.",0,0,3);
            base.books.AddGermanBookText("Ein Langschwert mit der Gravur 'Lothlendar' für Erzmagier Liv. (Hat seinen Hut bei mir vergessen! - zurückbringen)",0,0,3);
            base.books.AddGermanBookText("Ein Kï¿½ltedolch für Murnan.",0,0,3);
            base.books.AddGermanBookText("Ein kï¿½lteresistenter Plattenpanzer für den Lord von Krotir.",0,0,3);
            base.books.AddGermanBookText("Ein Eisschwert für Urnon.",0,0,3);
            base.books.AddGermanBookText("Ein Schutzring gegen bï¿½se Geister für Cirdon.",0,0,3);
            base.books.AddGermanBookText("Ein Reiseamulett mit eingefasstem gesegnetem Wasser für Norolith.",0,0,3);
            base.books.AddGermanBookText("Ein Skimitar des Waldes für Erenar.",0,0,3);
            base.books.AddGermanBookText("Ein Feuerdolch für Murnan.",0,0,3);
            base.books.AddGermanBookText("Ein feuerresistenter Plattenpanzer für den Lord von Krotir.",0,0,3);
            base.books.AddGermanBookText("Ein Schutzring für Cirdon. (gegen bï¿½se Geister)",0,0,3);
            base.books.AddGermanBookText("Eine Katana der Kraft für Ordar.",0,0,3);

            base.books.AddEnglishBookText("The first pages have been torn out...",0,0,3);
            base.books.AddEnglishBookText("Two shining daggers for Haredar.",0,0,3);
            base.books.AddEnglishBookText("A firesword for Selan.",0,0,3);
            base.books.AddEnglishBookText("A poison dagger for Murnan.",0,0,3);
            base.books.AddEnglishBookText("A poison resistent plate armor for the Lord of Krotir.",0,0,3);
            base.books.AddEnglishBookText("50 fast steel bolts for Serunir.",0,0,3);
            base.books.AddEnglishBookText("A smaragd sword for Haldon.",0,0,3);
            base.books.AddEnglishBookText("A ring against evil spirits for Cirdon.",0,0,3);
            base.books.AddEnglishBookText("An acid dagger for Murnan.",0,0,3);
            base.books.AddEnglishBookText("An acid resistent plate armor for the Lord of Krotir.",0,0,3);
            base.books.AddEnglishBookText("A short sword with engraved name for Juroon.",0,0,3);
            base.books.AddEnglishBookText("A lightweight metall battle staff for Alatur.",0,0,3);
            base.books.AddEnglishBookText("An ice sword for Welian.",0,0,3);
            base.books.AddEnglishBookText("A longsword with the engraved word 'Lothlendar' for the archmage Liv. (He left his hat behind! - have to bring it back)",0,0,3);
            base.books.AddEnglishBookText("A frost dagger for Murnan.",0,0,3);
            base.books.AddEnglishBookText("A frost resistent plate armor for the Lord of Krotir.",0,0,3);
            base.books.AddEnglishBookText("An ice sword for Urnon.",0,0,3);
            base.books.AddEnglishBookText("A ring of protection against evil spirits for Cirdon.",0,0,3);
            base.books.AddEnglishBookText("A travel amulet with embedded blessed water for Norolith.",0,0,3);
            base.books.AddEnglishBookText("A scimitar of the forrest for Erenar.",0,0,3);
            base.books.AddEnglishBookText("A fire dagger for Murnan.",0,0,3);
            base.books.AddEnglishBookText("A fire resistent plate armor for the Lord of Krotir.",0,0,3);
            base.books.AddEnglishBookText("A ring of protection for Cirdon. (against evil spirits)",0,0,3);
            base.books.AddEnglishBookText("A katana of power for Ordar.",0,0,3);
            
            -----------------------------------------------------------
            
             
        end
        base.books.SendBookPage(User,SourceItem.data,Counter);
    end
end  -- function

function LookAtItem(User,Item)
    if base.books.InitTitle() then
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Tagebuch eines Abenteurers\"",1);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Irenurs Tagebuch\"",2);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Rinaads Auftragsbuch\"",3);

        base.books.AddEnglishBookTitle("Book with the title \"Diary of an adventurer\"",1);
        base.books.AddEnglishBookTitle("Book with the title \"Irenur's diary\"",2);
        base.books.AddEnglishBookTitle("Book with the title \"Rinaad's order book\"",3);
    end
    base.books.GetBookItemInform(User,Item);
end
