--WIDE THICK GREY BOOK

require("base.books")

module("items.books.2617_grey_book", package.seeall)

-- UPDATE common SET com_script='items.books.2617_grey_book' WHERE com_itemid = 2617;

function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            base.books.AddLanguage("common language",0);

            base.books.AddGermanBookText("\n \n Die Feiertage des Jahres",0,0,0);
            base.books.AddGermanBookText("~Fr�hling~\n Elos: Lichterfest\n Zhas: Neirume (Tag der Kirschbl�te)\n \n~Sommer~\n Siros: Fest der Bindung\n Eldas: Erdh�hlenfest\n \n~Herbst~\n Olos: Erntedankdest",0,15,0);
            base.books.AddGermanBookText("~Winter~\n Mas: Radosh (Bluttage)",0,15,0);
            base.books.AddGermanBookText("~Das Lichterfest~\n Wird von allen V�lkern zu Beginn eines neuen Jahres gefeiert. Dabei werden in den D�rfern und St�dten gro�e Lagerfeuer entfacht und die H�user mit Lampen und Laternen geschm�ckt.",0,15,0);
            base.books.AddGermanBookText("Die Feierlichkeiten gipfeln in der Verbrennung einer Strohpuppe, die \"Schattenmann\" oder \"Dunkelmann\" genannt wird. Das Lichterfest dient zur Vertreibung des Unheils und Verderbens, welches durch den",0,15,0);
            base.books.AddGermanBookText("Monat Mas Eingang in diese Welt gefunden hat.\n Die Urspr�nge dieser Feier liegen in den Schriften des Nokorakan Zyklus, der Versuch einer Zusammenfassung der Prophezeiungen aus vergangenen",0,15,0);
            base.books.AddGermanBookText("Zeitaltern. Dort ist folgendes Nachzulesen:\n\"Fliehet den Zeichen der langen Nacht. Flehet auf Knien um eure unsterbliche Seele, wenn sich das Licht dem neuen Tage versagt. Denn er wird sich aus den",0,15,0);
            base.books.AddGermanBookText("S�mpfen der Qual erneut erheben und sein Schatten wird die Welt in Dunkelheit h�llen. Auf den Schwingen des Todes reitet er dahin und dort, wo seine Schritte weilen, werden die Sterblichen vergehen.",0,15,0);
            base.books.AddGermanBookText("Dann werden nur die Tr�ger des Feuers seinem Kommen Einhalt gebieten. Und ihr Licht wird erstrahlen wie tausend Sonnen, der Dunkelheit zu trotzen. In der glei�enden Helligkeit, die sie entfachen, mag",0,15,0);
            base.books.AddGermanBookText("er verbrennen, auf dass seine Spuren vom Antlitz der Erde getilgt werden.\"\n \n~Neirume~\n Ein rein elbischer Gedenktag, der abh�ngig vom Beginn der Kirschbl�te meist am Ende des Monats Zhas oder",0,15,0);
            base.books.AddGermanBookText("Beginn des Monats Ushos begangen wird. Es wird erinnert an die Abspaltung des Hauses Narn�l, deren Namen seither aus den Analen der Elben getilgt wurde und welche seitdem \"erume-lie\" genannt werden.",0,15,0);
            base.books.AddGermanBookText("Aufgrund der Namens�hnlichkeit in der Elbischen Sprache und ihrem Symbol als Innbegriff der Verg�nglichkeit werden an diesem Gedenktag die Bl�tter der Kirschbl�te (Neirume) in B�che und Fl�sse",0,15,0);
            base.books.AddGermanBookText("gestreut, begleitet von Liedern und Ges�ngen. Eines dieser Lieder sei hier exemplarisch aufgef�hrt:\n \n 'Zum Fluss bin ich allein gegangen,\n Wasser zu sch�pfen.",0,15,0);
            base.books.AddGermanBookText(" Um mich herum fielen zart wie Schnee,\n die Bl�tter der Kirschbl�te.\n Mit anmutiger Leichtigkeit gleiten sie dahin,\n in ihrer sterbenden Sch�nheit.\n Das Wasser trug die wei�e Pracht hinfort,",0,15,0);
            base.books.AddGermanBookText(" mein Herz ihnen folgend.\n Fr�stelnd zittern die leeren �ste,\n k�hl ist mir im Wind. \n \n~Fest Der Bindung~\n Dieses Fest wird von allen V�lkern gefeiert, doch wird es je nach Volk und Region ganz",0,15,0);
            base.books.AddGermanBookText("unterschiedlich begangen. Es sind meist ausgelassene Volksfeste, die jungen Paaren die M�glichkeit zu einem �ffentlichen Eheversprechen gibt. Es gibt kein genaues Datum f�r dieses Fest, doch meist",0,15,0);
            base.books.AddGermanBookText("wird es um den 12. Siros abgehalten. H�ufig sprechen sich auch benachbarte D�rfer ab, um die Feste an unterschiedlichen Tagen im jeweiligen Dorf abzuhalten.\n - bei den Elben liegt die Initiative",0,15,0);
            base.books.AddGermanBookText("zumeist bei den M�nnern, welche am Hauseingang ihrer Geliebten in der Zeit des Festes Zweige des Mevrannonbaums anbringen. Dieser Baum lebt in Symbiose mit einer anderen Pflanze mit Namen Levrenni.",0,15,0);
            base.books.AddGermanBookText("Diese bl�hende Kletterpflanze beginnt schon in der fr�hen Wachstumsphase des Baumes an diesem emporzuwachsen. Eine Pflanze kann dabei ohne die andere nur f�r relativ kurze Zeit �berleben. Wird das",0,15,0);
            base.books.AddGermanBookText("Ansinnen des Mannes erh�rt, so flechtet die Frau eine Levrenniranke in den dargebotenen Ast des Mevrannon.\n - Bei den Halblingen werden in der Regel die Frauen aktiv. Am Tag des Festes schm�cken sie",0,15,0);
            base.books.AddGermanBookText("den Kopf ihres Geliebten mit einem Blumenkranz. Wenn der Mann den Blumenkranz auf seinem Kopf beh�lt, gilt das Angebot als angenommen.\n - Die menschliche Tradition ist hier relativ vage und",0,15,0);
            base.books.AddGermanBookText("unbestimmt. Dies mag auch daran liegen, dass die Menschen mit dieser Thematik sehr offen und auch ungezwungen umgehen. In dem Sinne sind diese Traditionen zumeist keine bindenden Eheversprechen",0,15,0);
            base.books.AddGermanBookText("sondern eher ein Ausdruck der offenen Zuneigung. Doch gibt es auch hier sehr gro�e lokale Unterschiede. Und was in dem einen Dorf als angemessen und sittsam erscheint, mag anderswo als t�dliche",0,15,0);
            base.books.AddGermanBookText("Beleidigung oder Entehrung aufgenommen werden. Am weitesten verbreitet ist aber das Vorgehen, auf der zentralen Feier den oder die Angebetete zum Tanz aufzufordern. Sollte es sich mehr als um ein",0,15,0);
            base.books.AddGermanBookText("reines Tanzvergn�gen handelt, �bergibt die Frau dem Mann ein buntes Band, welches zu diesem Zweck in das Haar der Frau geflochten war. Diese Band gilt traditionell als Zeichen der Jungfr�ulichkeit.",0,15,0);
            base.books.AddGermanBookText("Wenn sich der Mann das Band um den rechten Arm bindet, gilt die Zuneigung als erwidert.\n - Die Orks haben in der Sicht der anderen V�lker eine recht r�de Methode ihre Zuneigung auszudr�cken. In ihrer",0,15,0);
            base.books.AddGermanBookText("Tradition begibt sich der Freier zusammen mit Freunden heimlich zum Haus der Geliebten und unternimmt eine Art Brautraub. Dieser Raubzug ist in gewisser Weise ritualisiert, da es in der Regel dabei",0,15,0);
            base.books.AddGermanBookText("nicht zu Verletzungen kommt, doch ist es manchmal auch hier sogar zu Todesf�llen gekommen, insbesondere dann, wenn im Vorfeld ablehnende Signale der Frau missachtet wurden. Generell wird die Frau",0,15,0);
            base.books.AddGermanBookText("umgehend in das Haus des Mannes gef�hrt. Die Familie der Frau unternimmt eine Befreiungsaktion. Man versammelt sich dazu vor dem Haus des Mannes. Wenn vor der Erst�rmung die Entf�hrte die T�r des",0,15,0);
            base.books.AddGermanBookText("Hauses �ffnet und ihre Familienangeh�rige hereinbittet, gilt das Angebot als angenommen.\n - Echsenmenschen bilden dahingehend eine Ausnahme, dass Ehen in fast ausschlie�lich allen F�llen von den",0,15,0);
            base.books.AddGermanBookText("Eltern arrangiert werden und den Kindern kein Mitspracherecht einger�umt wird. So ist es auch nicht un�blich, dass sich das Paar zum ersten Mal am Fest der Bindung kennen lernt. Im Vorfeld der Feier",0,15,0);
            base.books.AddGermanBookText("werden von den Eltern die entsprechenden Arrangements getroffen. Man trifft sich dann im Haus des angehenden Br�utigams und begibt sich zusammen in den Tempel. Dort wird vor dem Priester das",0,15,0);
            base.books.AddGermanBookText("Eheversprechen ausgesprochen.\n - Bei den Zwergen kommt dem Dorfschmied eine zentrale Bedeutung in der Anbahnung und Schlie�ung von Ehen zu. Schmied zu sein bedeutet nicht nur ein Handwerk auszu�ben,",0,15,0);
            base.books.AddGermanBookText("sondern ihre T�tigkeit ist in hohem Ma�e spirituell und religi�s. Schmiede sind in der Lage haltbare Verbindung von unterschiedlichen Materialien herzustellen und auch magische Waffen zu erschaffen.",0,15,0);
            base.books.AddGermanBookText("Ein Paar, welches ihren Willen auch f�reinander zu leben erkl�rte, verband der Schmied symbolisch mit zwei ineinander geschmiedeten Eisenringen; jeder Ring f�r sich existent und doch eng umschlungen.",0,15,0);
            base.books.AddGermanBookText("So soll es den Charakter und die Dauerhaftigkeit der Verbindung repr�sentieren und wurde daher �ber dem gemeinsamen Bett aufgeh�ngt.\n \n~Das Erdh�hlenfest~\n Gedenktag der Hablinge in der letzten",0,15,0);
            base.books.AddGermanBookText("Woche des Monats Eldas. Erinnerung an die Entbehrungen im Widerstand zur Zeit des Falls von Firnism�hle (-1777).\n Viele Halblinge gerade auf dem Land ehren diese Tage immer noch sehr traditionell,",0,15,0);
            base.books.AddGermanBookText("indem sie sich f�r eine Woche in die W�lder der Umgebung zur�ckziehen und dort in selbst gebauten Erdh�hlen �bernachten. In dieser Woche ern�hren sie sich ausschlie�lich von den Fr�chten der W�lder.",0,15,0);
            base.books.AddGermanBookText("Es darf kein Feuer entz�ndet werden. Nach Abschluss der Woche ziehen sie in einer Art Prozession wieder ins Dorf ein. Dabei wird viel Geschrei und L�rm gemacht und die Teilnehmer der Prozession sind",0,15,0);
            base.books.AddGermanBookText("bewaffnet. Hierdurch wird die R�ckeroberung der von den Orks besetzten Gebiete symbolisiert. In den St�dten und auch bei den h�her gestellten Halblingen hat es sich mit der Zeit eingeb�rgert, diese",0,15,0);
            base.books.AddGermanBookText("Woche meist im Garten oder Innenhof des Hauses in Jurten�hnlichen Zelten zu verbringen. Hier werden zum Teil auch Fleischspeisen zu sich genommen, die aber in Form von Fr�chten und Pilzen dekoriert",0,15,0);
            base.books.AddGermanBookText("werden.\n \n~Erntedankfest~\n Ein weit verbreiteter Feiertag, welcher von allen V�lkern mit gro�em Ernst und religi�ser Hingabe begangen wird. Eine Ausnahme bilden hier nur die Echsenmenschen, deren",0,15,0);
            base.books.AddGermanBookText("Tradition im Anbau von Feldfr�chten nicht ausgepr�gt ist. So wird dieser Feiertag in ihren eigenen homogenen Ansiedlungen vollends ignoriert, jedoch mag es sein, dass einzelne Echsenmenschen fernab",0,15,0);
            base.books.AddGermanBookText("ihrer Heimat sich den Feierlichkeiten anschlie�en. Die Priester Oldras setzen den Tag im Monat Olos fest, welcher nach ihrer Meinung von der Gunst der G�ttin bedacht ist, doch man mag auch behaupten,",0,15,0);
            base.books.AddGermanBookText("dass in gleicher Weise die Witterungsverh�ltnisse und damit das Ende der Erntezeit einenausschlaggebenden Faktor tragen. Es gibt durchaus lokale Besonderheiten bei der Auspr�gung der",0,15,0);
            base.books.AddGermanBookText("Feierlichkeiten, doch werden sie immer begleitet von Umz�gen, religi�sen Andachten und Opfergaben, welche dann am Abend in ein meist ausgelassenes Fest m�nden. Gerade in �rmeren Ansiedlungen wird",0,15,0);
            base.books.AddGermanBookText("dieser Feiertag von vielen herbeigesehnt, da es einer der wenigen Tage im Jahr ist, an dem es Nahrung in ausreichenden Mengen gibt.\n \n~Radosh~\n Die Tage des Blutes erstrecken sich �ber den ganzen",0,15,0);
            base.books.AddGermanBookText("Monat Mas und diese werden fast ausschlie�lich nur von Orks bedacht. Die Gemeinschaft der Orks teilt sich dabei in zwei Gruppen, f�r die die Bluttage eine absolut gegens�tzliche Bedeutung haben.",0,15,0);
            base.books.AddGermanBookText("Jene, die Moshran verehren, begr��en den Monat Mas mit Freude und Ehrerbietung. Sie geben sich g�nzlich der Ekstase hin und feiern diese Tage wild und ungest�m. Nur wenig ist bekannt von diesen",0,15,0);
            base.books.AddGermanBookText("Feiern, doch wird erz�hlt, dass sich die Orks mit roter Farbe den K�rper bemalen und um gro�e Scheiterhaufen herum tanzen. Nach einiger Zeit verfallen sie in eine Art Raserei, bei der es h�ufig zu",0,15,0);
            base.books.AddGermanBookText("Verletzungen kommt. Tiere und in Ausnahmef�llen auch Personen werden geopfert. Dabei sind es weniger Gefangene anderer Volkszugeh�rigkeiten, die dem Opferdolch �berantwortet werden, sondern Mitglieder",0,15,0);
            base.books.AddGermanBookText("des eigenen Stammes, die sich freiwillig dem Opfertod hingeben. Die Orks glauben, dass dieser Tod die gr��te Ehre ist, die einem Krieger zuteil werden kann und dass ein so Verstorbener mit dem Segen",0,15,0);
            base.books.AddGermanBookText("und der Gunst Moshrans in einem starken K�rper wiedergeboren wird.\n F�r den anderen Teil der Orks, welche sich von Moshran losgesagt haben, sind es Tage der Trauer und Verzweiflung. Sie gedenken",0,15,0);
            base.books.AddGermanBookText("einem ihrer gro�en F�hrer Drokan Norotar, den sie als M�rtyrer in gro�en Ehren halten. Er hatte vor langer Zeit die friedlichen St�mme der Orks unter sich vereint und gab ihnen zum ersten Mal in der",0,15,0);
            base.books.AddGermanBookText("Geschichte eine bedeutende Stimme im Kreise der anderen V�lker. Doch die Nachbarn seines Staates misstrauten den Beteuerungen Drokan Norotars, dass er keine niederen Absichten ihnen gegen�ber hegen",0,15,0);
            base.books.AddGermanBookText("w�rde. Unter dem Deckmantel in Verhandlungen mit ihm zu treten, lockten sie ihn in eine Falle und ermordeten ihn. Der junge Staat zerbrach daraufhin und die Umst�nde brachten viel Leid �ber die Orks.",0,15,0);
            base.books.AddGermanBookText("In seinem Gedenken schmieren die Orks Asche in ihr Gesicht und verletzen sich selbst mit Schwertern und Dolchen auf der Kopfhaut und an den H�nden, eingedenk des Umstandes, dass Drokan Norotar von",0,15,0);
            base.books.AddGermanBookText("seinen Meuchelm�rdern gek�pft wurde und ihm die H�nde abgeschlagen wurden: als Zeichen, dass die Orks f�hrer- und machtlos seien. Mit ihren blut�berstr�mten Gesichtern stimmen sie Klagelieder an,",0,15,0);
            base.books.AddGermanBookText("welche sie �ber die ganzen 6 Tage aufrechterhalten.\n Bei manchen anderen V�lkern hat dieses Fest eher die symbolische Sitte, ohne gro�e Worte und Gedanken ein Tier zu opfern, um so allen Schaden von",0,15,0);
            base.books.AddGermanBookText("sich abzuwehren und Moshran zu bes�nftigen, damit ihnen kein Unheil geschehe. Gebetet wird hierbei nicht, es gleicht vielmehr einer stillen Geste. Nach dem Opfer bleiben die meisten Personen in ihren",0,15,0);
            base.books.AddGermanBookText("Wohnungen und hoffen darauf, dass die Mas-Tage bald wieder Vergangenheit sind, damit ein neues Jahr beginnt.",0,15,0);

            base.books.AddEnglishBookText("\n \n Celebrations",0,0,0);
            base.books.AddEnglishBookText("~Spring~\n Elos: Light Festival\n Zhas: Neirume (Day of the Cherry Blossom)\n \n~Summer~\n Siros: Festival of Unity\n Eldas: Earthcave Festival\n \n ~Autumn~\n Olos: Thanksgiving",0,15,0);
            base.books.AddEnglishBookText("~Winter~\n Mas: Radosh (Blood Days)",0,15,0);
            base.books.AddEnglishBookText("~Light Festival~\n Every race celebrates the lightfestival to the beginning of the new year. In every town and city there will be lit big campfires and the houses will be decorated with lamps and",0,15,0);
            base.books.AddEnglishBookText("lanterns. The festivities reach the peak level by burning a scarecrow which is named \"Shadowman\" or \"Darkman\". The lightfestival serves the banishment of mischief and bane which found the entrance",0,15,0);
            base.books.AddEnglishBookText("into the world during the month of Mas.\n The beginning of this festival lays in the script of Nokoraken Zyklus, the attempted summary of assortment of past century's prophecies. There one can read",0,15,0);
            base.books.AddEnglishBookText("the following:\n\"Flee the signs of the night. Beg on your knees for your immortal soul, when the light rejects itself for the new day. Because he will again rise from the swamps of torture and his",0,15,0);
            base.books.AddEnglishBookText("shadow will engulf the world in darkness.On the wings of death he rides and there where his steps tarry the mortals will pass. At that time only the means of fire will curb his arrival. And their",0,15,0);
            base.books.AddEnglishBookText("light will radiate like thousand suns to devy the darkness. In the glistering brightness which they ignite, he can burn, lest his trails will be estinguished by the earth.\"",0,15,0);
            base.books.AddEnglishBookText("~Neirume~\n A pure elvish commemoration day which depending on the beginning of the cherry blossom mostly is celebrated in the end of the month of Zhas or in the beginning of the month of Ushos. It",0,15,0);
            base.books.AddEnglishBookText("It will be remembered the day of the decomposation of the house Narmil, whos /which name is from that time on erased from the catenae of elves und which are called \"erume-lie\" since then. Due to the",0,15,0);
            base.books.AddEnglishBookText("similarity of names in the elven tongue and their symbol as epitomize for perishabieness, there will be cherry blossoms (Neirume) dispersed in creeks and river on this commemoration day, accompanied",0,15,0);
            base.books.AddEnglishBookText("by songs and chants. One of these song will be mentioned exemplarily:\n \nI went to the river alone,\nto acquire Water.\nAround me were falling soft as snow,\nthe leafs of the cherry blossom.",0,15,0);
            base.books.AddEnglishBookText("With graceful lightness they are gliding,\nin their deceasing beauty.\nThe water carried\naway the white glory,\nmy heart following them.\nShivery the empty branches shiver,\nI'm chilly in the wind.",0,15,0);
            base.books.AddEnglishBookText("~Festival of Unity~\n This festival is celebrated by every folk, but is it perpetrated differently from region to region and folk to folk. Mostly it is a jolly festival, which gives young couples the",0,15,0);
            base.books.AddEnglishBookText("choice for a official promise of marriage. There is no exact date for this festival but it is mosty celebrated on the 12th of Siros. Often neighboring villages agree to celebrate this festival on",0,15,0);
            base.books.AddEnglishBookText("different days in the particular village.\n - The men takes the initiave in the elven folk by mount a branch of the Mevraonnontree to the door of the beloved on the day of the festival. This tree",0,15,0);
            base.books.AddEnglishBookText("lives in symbosis with another plant which is named Levrenni. This blooming plant starts to grow aloft the tree in an early state of growth. One plant can survive without the other one only for",0,15,0);
            base.books.AddEnglishBookText("relative short time.The elven ladies answer the mens prayer by braiding a Levrennitwine in the presented branch of Mevrannon.\n - With the halfings mostly the woman become activ. On the day of the",0,15,0);
            base.books.AddEnglishBookText("festival they decorate the head of the loved one with a girdle of flowers. When the man keeps the girdle of flowers on his head the offer obtains as accepted.\n - The tradition of humans is",0,15,0);
            base.books.AddEnglishBookText("relativly vague and undefined. This may be bcause the humans handle the subject very unsettled and unforced. In this sense those traditions are mostly no binding promises of marriage but more an",0,15,0);
            base.books.AddEnglishBookText("expression of open affection. But there are as well huge, local differences. What is adequate in one village can be a deadly insult or defamation in another one. But the procedure that is very common",0,15,0);
            base.books.AddEnglishBookText("is to ask the adored one or ones for a dance on the cental festival. When it was more than a pure dance, the woman endowes a colorful band to the man which was braided into her hair for that reason.",0,15,0);
            base.books.AddEnglishBookText("This band is a traditional sign for virginity. Once the man ties the band to his right arm, the affection obtains as returned.\n - The orcs have a rather rude way to express their affection. In their",0,15,0);
            base.books.AddEnglishBookText("tradition goes the suitor together with some friends to the house of the beloved one and ventures a sort of theft of the bride. This raid is somehow ritualized because normally it does not come to",0,15,0);
            base.books.AddEnglishBookText("any injuries but somtimes it even came to death, especially when dismissiv signals of the woman were ignored. Generally the woman is brought straight into the house of the man. The family of the woman",0,15,0);
            base.books.AddEnglishBookText("ventures a liberation by joining in front of the house of the man. When their family member opens of the house before the family assaults it, the proposal obtains as accepted.\n - Lizardmen are an",0,15,0);
            base.books.AddEnglishBookText("exception to that effect that the marriage is completely arranged by the parents and the children do not have a right to a say in that matter. It is not unusual that the couple meets for the",0,15,0);
            base.books.AddEnglishBookText("first time on the festival of unity. The parents meet certain arrangements in the run-up . They meet in the house of the groom and together they go to the temple. Where the wedding vows are exchanged",0,15,0);
            base.books.AddEnglishBookText("infront of the priest.\n - The smiths is a important figure in the dwarven race and in the initiation and closure of weddings. To be a smiths not only means to have a profession but also to perform",0,15,0);
            base.books.AddEnglishBookText("the work with a great degree of spiritually and religiously. Smiths are able to establish a strong, long lasting connection of different matirials and to create magical weapons.A couple which declared",0,15,0);
            base.books.AddEnglishBookText("the will to life for each other compound the smith symbolically with two rings which were smithed into each other; each ring existing for itself but also twined tightly. It shall show the character",0,15,0);
            base.books.AddEnglishBookText("and the stability of this connection and was hung up above of the shared bed.\n \n~Earthcave Festival~\n A commemoration day of the halflings in the last week of the month Eldas. Rememberance of the",0,15,0);
            base.books.AddEnglishBookText("privations during the resistance in the time of the fall of Firnismill (-1777)\n Many halflings especially in the country honor this day still very traditional by retrenching for one week into the",0,15,0);
            base.books.AddEnglishBookText("the surrounding froests and living there in selfbuild earthcaves. During that week they only nourish on the fruits of the forest. No campfire shall the enlightend. After ending of the week the",0,15,0);
            base.books.AddEnglishBookText("halflings make a great procession back into the village with a lot of screaming and noise and the members of the procession are armed. The recapture of the terretories which were occupied by orcs is",0,15,0);
            base.books.AddEnglishBookText("symbolised through this. In the cities and also by the higher positioned halflings it bacame a custom to stay in yurtlike tents in the garden or patio of the house. Here they partly eat meat, which",0,15,0);
            base.books.AddEnglishBookText("is decorated in the form of fruits and mushrooms.\n \n~Thanksgiving~\n A popular commemoration day, which is celebrated from all races with great gravity and religious devotion. A exception are the",0,15,0);
            base.books.AddEnglishBookText("lizardmen, in whose tradition the cultivation of crop plants is not common. Therefor the day will be completely ignored in their own homogeneous settlement, but it is possible that some individuals",0,15,0);
            base.books.AddEnglishBookText("which are far away from their home join into the festivities. The priests of Oldra establish the day in the month of Olos, which is considered by the grace of the godess in their opinion, but one can",0,15,0);
            base.books.AddEnglishBookText("suggest that in the same way the waether conditions and therfor the end of the harvesttime has a crucial factor. There are as well some local particularties in the form of the festivities, but they",0,15,0);
            base.books.AddEnglishBookText("will always be accompanied by processions, religious prayer and oblations, which meet in a great festival at night. Especially in indigent settlements this day is wished upon because it is one of the",0,15,0);
            base.books.AddEnglishBookText("few days in the year where food is available in a sufficient amount.\n \n~Radosh~\n The days of blood stretch across the whole month of Mas and it will almost excusively",0,15,0);
            base.books.AddEnglishBookText("proceonceived by orcs. The community of orcs withal divides in two groups for which the blood days have an absolute oppositional meaning.\n Those who worship Moshran greet the month of Mas with joy",0,15,0);
            base.books.AddEnglishBookText("and deference. They addict themselves completely to the ecstasy and celebrate that day wild and tumultuous. Only little is known about these festivals, but it is told that the orcs paint their bodies",0,15,0);
            base.books.AddEnglishBookText("mostly members of the own tribe, which addict themselves voluntarily to death, are sacrified and less prisoners of other races. The orcs believe that death is the greatest honor that can be granted to",0,15,0);
            base.books.AddEnglishBookText("a warrior and that a decedent is reborn with a strong body with the blessing and the favor of Moshran.\n For the other part of orcs, which seceded from Moshran, are theses days, days of mourning",0,15,0);
            base.books.AddEnglishBookText("and desperation. They commemorate one of their great leaders Drokan Norotar, whom they hold in great glory as a martyr. A long time ago he united the peaceful tribes under him and gave them for the",0,15,0);
            base.books.AddEnglishBookText("the first time in history a grand voice in the circle of other peoples. But the neigbors of his state didn't trust the affirmations of Drokan Norotars, that he didn't have any base motives. Under the",0,15,0);
            base.books.AddEnglishBookText("disguise of stepping into proceedings with him, they lured him into a entrapment and killed him. Hereupon the young state broke into pieces and under those circumstances brought a lot of harm to",0,15,0);
            base.books.AddEnglishBookText("to the orcs.\n In his rememberance the orcs smear ash into their faces and injure themselveswith swords and daggers on their scalp and and their hands bearing the circumstances in mind that Drokan",0,15,0);
            base.books.AddEnglishBookText("Norotar was decollated and his hands were cut off: as a sign that the orcs are guide- and powerless. With their blood covered faces they intone threnodies which they maintain for the entire 6 days.",0,15,0);
            base.books.AddEnglishBookText("By some other peoples this festival is more of a symbolic fashion, without great words and thoughts to sacrifice an animal to avert damage and to appease Moshran, so that no harm will be done. It is",0,15,0);
            base.books.AddEnglishBookText("done without prayers because it is more of a silent gesture. After the sacrifice most people remain in their residence and hope that the Mas days are soon foretime, so that a new year begins.",0,15,0);

            -------
            
            base.books.AddLanguage("common language",1);
            base.books.AddEnglishBookText("\n \n Lizardmen History and Culture",0,0,1);
            base.books.AddEnglishBookText("Lizardmen are a very astonishing race. They are a little smaller than the average human, walk on two legs with the help of the strong tail that gives them extra balance.",0,0,1);
            base.books.AddEnglishBookText("They look like reptiles with tough green or brown skin, strong teeth and muscles, and a highly adaptive ability to live in different places.",0,0,1);
            base.books.AddEnglishBookText("They also have the ability to breathe underwater. Many say this is because of their Goddess, Tanora or 'Zelphia' in lizard tongue.",0,0,1);
            base.books.AddEnglishBookText("Most lizards are not interested in magic, since their society is based around their devote religious affliation to Tanora. Their cities are built around a center shrine.",0,0,1);
            base.books.AddEnglishBookText("From afar, these buildings may seem rudimentary, resembling big stones. Up close though, one could examine many intricate symbols carved into the stones.",0,0,1);
            base.books.AddEnglishBookText("Lizardmen were the second race to develop writing. Their first letters were signs from their claws pressed in soft materials that hardened with time, or simple scratch marks on rocks.",0,0,1);
            base.books.AddEnglishBookText("Later, they began to use parchment like material made from fishskin or plant parts, written with a color changing ink. The parchments have proven to be very durable.",0,0,1);
            base.books.AddEnglishBookText("At least underwater, because when they are moved from salt water they tend to rot away rather quickly.",0,0,1);
            base.books.AddEnglishBookText("A life of a lizard is extremely focused around religion and honor. The older the lizard gets the wiser her becomes. At the age of one hundred and fifty, a lizard will sleep a lot.",0,0,1);
            base.books.AddEnglishBookText("Lizards then can live for hundreds of years using this method. Some are said to wake up with a holy shine to their eyes and walk away, never to be seen again.",0,0,1);
            base.books.AddEnglishBookText("The priests call these ones 'the enlightened'. It is forbidden for lizards to follow and enlightened one.",0,0,1);
            base.books.AddEnglishBookText("Lizards do not know of noblility or kings. They live in family clans, or in a temple. Their high priests and family chiefs are their rulers. All family chiefs have high religious positions.",0,0,1);
            base.books.AddEnglishBookText("Legends state that there is a lizard king, or 'Ushnak-Sskhath'. He dwells in the deepest place of the oceans in a far away temple.",0,0,1);
            base.books.AddEnglishBookText("He is said to be an immortal, huge lizardman. He is rumored to have brought their religions to the other lizards and he leads the high priests with inspiration, wisdom, and power.",0,0,1);
            base.books.AddEnglishBookText("Legends also states that if a lizard priest is unrighteous, selfish, or evil, he will one day see the sign of the lizard king over his sleep place. If he does not change, he will vanish.",0,0,1);
            base.books.AddEnglishBookText("Lizards often tell their younglings that if they don't behave, the lizard king will come and hunt them in their dreams. No one has ever seen the lizard king, but many young lizards try to find him.",0,0,1);
            base.books.AddEnglishBookText("Lizard Warriors are either hunters or 'Temple Guards', a kind of lizard paladin. They guard the temple entrances and priests, uphold law and order, and destroy evil and corruption.",0,0,1);
            base.books.AddEnglishBookText("The guards are horrendous fighters with a zealous behavior towards purity and righteousness. They are trained in lizard combat techniques and powered by an incredible rage.",0,0,1);
            base.books.AddEnglishBookText("'Glory for the Goddess' is usually their war cry, to alert the evil-doer of his reason for death.",0,0,1);
            base.books.AddEnglishBookText("Lizards prefer fresh, raw fish, meat, bread and fruits. They do not enjoy much sweet foods like cakes and such.",0,0,1);

            base.books.AddGermanBookText("\n \n Die Gemeinschaft der Echsenmenschen",0,0,1);
            base.books.AddGermanBookText("Echsenmenschen sind eine erstaunliche Rasse. Sie sind etwas gr��er als ein durchnittlicher Mensch und laufen aufrecht auf zwei Beinen, wobei ihnen der kr�ftige Schwanz zus�tzliche Trittsicherheit gibt.",0,0,1);
            base.books.AddGermanBookText("Sie sehen aus wie Reptilien mit ihrer gr�nen oder auch braunen rauen Haut, dem kr�ftigen Gebiss und all den Muskeln, sowie mit der Anpassungsf�higkeit an verschiedenste Lebensr�ume.",0,0,1);
            base.books.AddGermanBookText("Sie haben auch die F�higkeit, unter Wasser zu atmen. Dies sei, so meinen Einige, auf ihre Gottheit zur�ckzuf�hren, auf Tanora oder 'Zelphia', wie die Echsenmenschen sie nennen.",0,0,1);
            base.books.AddGermanBookText("Die meisten Echsenmenschen interessieren sich nicht f�r Magie, zumal ihre Gemeinschaft auf ihrem unterw�rfigen Glauben an Tanora beruht. Ihre St�dte gruppieren sich jeweils um einen zentralgelegenen Altar.",0,0,1);
            base.books.AddGermanBookText("Aus der Ferne m�gen diese Geb�ude globig, wie gro�e grobe Steine wirken. Aus der N�he jedoch k�nnte man zahlreiche komplexe, in Stein gemeiselte Symbole feststellen.",0,0,1);
            base.books.AddGermanBookText("Die Echsenmenschen waren die zweite Rasse, die eine eigene Schrift entwickelte. Die ersten Schriftst�cke bestanden aus Abdr�cken ihrer Klauen, die sie in weiches Material pressten, das anschlie�end langsam aush�rtete, oder sie kratzten einfach Markierungen in die Felsen.",0,0,1);
            base.books.AddGermanBookText("Sp�ter begann man, Pergament zu verwenden, wie auch Material aus Fischhaut und Pflanzenteilen, die man mit unterschiedlich farbigen Tinten bemalte. Pergament hat sich dabei als sehr haltbar erwiesen.",0,0,1);
            base.books.AddGermanBookText("Zumindest unter Wasser, denn sobald man sie aus dem Salzwasser entfernt, neigen Pergamente dazu, schnell zu zerfallen.",0,0,1);
            base.books.AddGermanBookText("Das Leben eines Echsenmenschen ist sehr auf die Religion und auf seine Ehre ausgerichtet. Umso �lter ein Echsenmensch wird, desto weiser scheint er zu werden. Mit einem Alter von hundertf�nzig wird ein Echsenmann sehr viel schlafen.",0,0,1);
            base.books.AddGermanBookText("Auf diese Weise k�nnen Echsenmenschen Hunderte von Jahren �berdauern. Von einigen sagt man, sie seien mit einem Heiligenschein um die Augen aufgewacht und davongelaufen, ohne dass man sie je wiedergesehen habe.",0,0,1);
            base.books.AddGermanBookText("Die Priester nennen jene die \"Erleuchteten\". Echsenmenschen ist es verboten, einem \"Erleuchteten\" zu folgen.",0,0,1);
            base.books.AddGermanBookText("Echsenmenschen wissen nichts von Adelstiteln oder Regenten. Sie leben entweder in Familienverb�nden oder aber in einer Tempelgemeinschaft. Ihre Hohepriester und die Familienchefs sind die Herrscher. Alle Clanchefs halten hohe religi�se �mter inne.",0,0,1);
            base.books.AddGermanBookText("Laut einer Legende gibt es einen K�nig der Echsenmenschen, auch 'Ushnak-Sskhath' genannt. Er haust in einem entfernten Tempel im tiefsten Teil des Meeres.",0,0,1);
            base.books.AddGermanBookText("Er wird als unsterblicher, h�nenhafter Echsenmensch beschrieben. Ger�chteweise soll er die Religion unter das Volk gebracht haben und seither die Hohepriester mit Eingebungen, Weiheit und Macht unterst�tzen.",0,0,1);
            base.books.AddGermanBookText("Die Legende besagt auch, dass ein unredlicher, selbsts�chtiger oder b�sartiger Echsen-Priester eines sch�nen Tages ein Zeichen seines Echsenk�nigs �ber seiner Bettstatt vorfinden wird. �ndert er sein Leben danach nicht, wird er verschwinden.",0,0,1);
            base.books.AddGermanBookText("Echsenmenschen erz�hlen ihrem Nachwuchs, dass der Lizard-K�nig, wenn sie nicht artig sind, k�me, um sie in ihren Tr�umen heimzusuchen. Niemand hat je den Echsen-K�nig gesehen, aber viele junge Echsenmenschen machen sich auf, ihn zu finden.",0,0,1);
            base.books.AddGermanBookText("Echsen-Krieger sind meist \"J�ger der Tempelwache\", eine Art Paladin. Sie wachen �ber den Tempeleingang und die Priesterschaft, halten Recht und Gesetz aufrecht und bek�mpfen das B�se und die Bestechlichkeit.",0,0,1);
            base.books.AddGermanBookText("Diese Wachen sind unglaubliche K�mpfer mit einem hohen Pflichtbewusstsein hinsichtlich ihrer Lauterkeit und Rechtschaffenheit. Sie wurden in den Kampfstilen der Echsenmenschen ausgebildet und werden angespornt von einem unglaublichen Zorn.",0,0,1);
            base.books.AddGermanBookText("'Ruhm und Ehre der G�ttin' ist ihr Wahlspruch mit dem sie dem �belt�ter ans Leder gehen.",0,0,1);
            base.books.AddGermanBookText("Echsenmenschen bevorzugen frischen rohen Fisch, Fleisch, Brot und Obst. S��es, wie etwa Kuchen und dergleichen dagegen lassen sie meist unbeachtet stehen.",0,0,1);
            
            ----------
            
            base.books.AddLanguage("common language",2); 
            base.books.AddEnglishBookText("Greets! Tihgorac make book for oomie that not fight goods. I give tip to the clueless",2617,0,2); 
            base.books.AddEnglishBookText("Tihgorac start with basic. The most important thing for Warrior be what Warrior wears. If Warrior wears heavy armors, he be slow and not be much able to dodge enemy blade!",2617,0,2); 
            base.books.AddEnglishBookText("If Warrior wear leather armor, then they able much more flexibility, but weaky pig skin not protect you much from blade!",2617,0,2); 
            base.books.AddEnglishBookText("Also, good warrior need test armor for weak spots and strong points! Do lots of tests with weak beasties and figure what go best with what! This make you last longer.",2617,0,2); 
            base.books.AddEnglishBookText("For instances, Mercantile Elite armor very thick! It good at not dentings to Enemy Mace. Howevers, a sword can stab through flexing points in armor and so it no goods agaisnt sword!",2617,0,2); 
            base.books.AddEnglishBookText("What make a good warrior diffrent from dead oomie is not only from what wear, but how they fight! Charging on bunch of enemy not smartest thing in world!",2617,0,2); 
            base.books.AddEnglishBookText("First, it important to watch your backs. If beasty get behind your backs, then you going to find self at mercy of gods quicklys.",2617,0,2); 
            base.books.AddEnglishBookText("Taking this into head, you might find it easier to sneak up and strike enemy with his back turned. This becomes an important tactic in group fights.",2617,0,2); 
            base.books.AddEnglishBookText("However, some times getting few beasties surrounding you is unavoidable. You can protect self by making sure you can defend self from many angle!",2617,0,2); 
            base.books.AddEnglishBookText("A good way to do this is by challengings Beasty to duel. When he is swingings at you, simply faces away from the beastie and try to block blade. You get lumps doing this, but it worth its.",2617,0,2); 
            base.books.AddEnglishBookText("After your senses tuned to the sounds of blade, you may seek finest gems in land, explore new land, and be envy of weaker oomie.",2617,0,2); 
            base.books.AddEnglishBookText("Tihgorac wishes you luck, because Tihgorac no have any! Hur",2617,0,2); 
            
            base.books.AddGermanBookText("Tagchen! Tihgorac hat'n Buch jemacht f�r alle Nulpen, die nicht richt' k�mpfen k�nn'. Werd' euch Ahnungslosen mal 'n paar Tipps jeben.",2617,0,2); 
            base.books.AddGermanBookText("Fang'n wa mal kleen an. Dat Wichtiste f�r'n Kriejer iss watt'n Kriejer anhat. Weil wenn'n Kriejer 'n schwere R�stung tr�gt, dann wirder langsam und kann`n Schl�gen vonne Jegner nich' ausweichen, klar?",2617,0,2); 
            base.books.AddGermanBookText("Wenne Kriejer Lederpanzer tr�gt, dann isser viel beweglicher, abba Achtung: so'ne Sauhaut h�lt 'ner Klinge nicht lange Stand!",2617,0,2); 
            base.books.AddGermanBookText("Also, gute Krieger untersuchen ihre R�stung uff Schwachstellen und Vorz�ge! Macht viele Tests mit schwachen Ungeheuern und findet heraus, welche R�stung zu euch passt. Hilft, am Leben zu bleiben.",2617,0,2); 
            base.books.AddGermanBookText("Die \"Mercantile Elite\" ist ziemlich unhandlich! Iss nat�rlich gut, wenn der Feind mit'm Morgenstern auf Dir rumkloppt! Abba so'n simples Schwert kann durch die Zwischenr�ume dringen und aus dem K�mpfer 'n Fleischspie� machen.",2617,0,2); 
            base.books.AddGermanBookText("Was'n guten Kriejer vonner toten Nulpe unterscheidet, iss nich nur watta anhat, sondern vor allem wie er k�mpft. Sich mitta ganzen Horde von Gegnern anzulegen, das iss vielleicht nich' der beste Weg zu langem Leben. ",2617,0,2); 
            base.books.AddGermanBookText("Als Erstes: Passt auf Euern Arsch auf! Wenn der Verreckling dir erstmal im Nacken sitzt, dann isses schnell aus mit der Herrlichkeit und du h�rst die G�tter singen.",2617,0,2); 
            base.books.AddGermanBookText("Wennde dir das ins Hirn meiselst, wird es dir auch leichter fallen, dich an wen anzuschleichen und dem Gegner in den R�cken zu fallen. Wird �brigens auch gerne als Gruppentaktik angewandt.",2617,0,2); 
            base.books.AddGermanBookText("Wie auch immer, manchmal l�sst es sich nicht vermeiden, dass so'n Trupp von Mistfliegen dich umringt. Dann isses abba gut zu wissen, dass man sich quasi aus jedem Winkel heraus wehren kann!",2617,0,2); 
            base.books.AddGermanBookText("Eine gute Art, sich zu wehren, ist es dabei, so'n Kerl zum Duell aufzufordern. Wenn er sich dann mit dir besch�ftigt, wendest du dich von der Knallt�te ab und versuchst, nur noch seine Schl�ge abzublocken. Du wirst dir Beulen holen, aber das ist die Sache wert.",2617,0,2); 
            base.books.AddGermanBookText("Wenn du erstmal deine Sinne am Summen der Klingen gesch�rft hast, kannste dich auf die Suche nach den Sch�tzen dieses Landes machen, Neues entdecken und dich von all den Nulpen um dich f�r deine Kampfeskunst beneiden lassen.",2617,0,2); 
            base.books.AddGermanBookText("Tihgorac w�nscht dir Gl�ck, auch weil Tihgorac selbst nie welches hatte! Schluchz",2617,0,2); 
            
            ----------
            
            base.books.AddLanguage("dwarf language",3);
            base.books.AddEnglishBookText( " When the time was still young, the god Irmorom wandered amongst the hillsides of the mountain Borag - Urubur and found, which was greatly surprising him, a rocket that was lose. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " It was about to fall down. But Irmorom took it and when he rocked it around in his hands, he decided to make something special out of it. And so, Irmorom created Illarion ", 0, 0, 3 ); 
            base.books.AddEnglishBookText( " and put mountains and valleys to it. But even after spending much time on forming the rock, it still seemed to him, that it was ordinary. So he asked the other gods for help. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " He asked Ushara and she put earth on it in amply amounts. But still it seemed to be nothing more than a rock. So he asked the other gods to help, too. He asked Tanora and Finadri ", 0, 0, 3 );
            base.books.AddEnglishBookText( " and Tanora gave the rock water, which searched his way through the valleys, forming lakes, rivers and oceans even. Findari gave air to it and it formed the sky and the clouds and the winds. ", 0, 0, 3 ); 
            base.books.AddEnglishBookText( " But still it was dark and cold on Illarion, so Irmorom asked a last god to help him. It was Br�gon. Bragon giftet the rock, that had allready grown to a nice looking world with warmth and light.", 0, 0, 3 );
            base.books.AddEnglishBookText( " The gods realized, that they raised a wonderful piece of art, now, that they could see it. And so there was only one topic to be discussed on the great Mountain left. ", 0, 0, 3 );  
            base.books.AddEnglishBookText( " With childly enthusiasm, the gods started to create the different plants and creatures on Illarion.", 0, 0, 3 );
            base.books.AddEnglishBookText( " But Irmorom bethought and while the other gods worked on plants, Irmorom created the dwarves. ", 0, 0, 3 ); 
            base.books.AddEnglishBookText( " He formed them after his appearance, giving them the stony bones he had made, working hard but filigree. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " The dwarves were smart and dexterious and still stable, so that they were able to compete to the different animals and plants. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " The other gods got excited and asked Irmorom, to give them stone-bones, too, so that they could form their own stable beeings. ", 0, 0, 3 ); 
            base.books.AddEnglishBookText( " But not every god was interrested in the stone-bones. Moshran formed creatures out of chitin, filling their bodies with Narg�n's nasal mucus, which he had stolen from him, when Narg�n had a cold. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " Those creatures were only made to disgust the dwarves and the other races, to scare them or even eat them. ", 0, 0, 3 );  
            base.books.AddEnglishBookText( " But Irmorom saw, that some of them had potential. And so he blessed them and made them to a feedy delicacy for the peoples. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " Thereupon, Moshran got so frustrated, that he asked Irmorom for stone-bones, too. ", 0, 0, 3 ); 
            base.books.AddEnglishBookText( " He also asked Br�gon to help him creating the orcs, but those creatures weren't like the other gods. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " They always managed to anger even the wisest and most patient dwarves. So it was done - Illarion was created. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " The peoples lived with each other almost peacefully and the rock, that Irmorom had blessed with life, grew and flourished. ", 0, 0, 3 ); 
            base.books.AddEnglishBookText( " But soon Irmorom saw, that his creation wasn't everlasting and so he decided to share the great mountain Borag - Urubur with those on Illarion, who had lived their life honorful and righteous. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " But even the unhonorful and injustly beeings had to leave the world after some time, so that they couldn't stay there and spread chaos under the living ones. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " He decided, to make it their punishment, to let them work for the good people on the fields for ever, hardly. They were forced to life the life of a farmer for ever. ", 0, 0, 3 );
            base.books.AddEnglishBookText( " By itself, that wasn't as cruel, as the other gods were to their creations. But they were never allowed to enter the mountain and had to spend their lives living next to the longears and pigfaces.", 0, 0, 3 ); 
            base.books.AddEnglishBookText( " So it shall be the task of every dwarf, to live his life honorful and fair, so that Cherga may take him to the right place, when he leaves this world.", 0, 0, 3 );
            base.books.AddEnglishBookText( " Otherwise, he'll never be able to meet his forefathers again, who rest in the great halls of Borag - Urubur as Irmorom's guests.", 0, 0, 3 );
            base.books.AddGermanBookText( " Als die Zeit noch jung war, wanderte der Gott Irmorom �ber die H�nge des Berges Borag - Urubur und fand zu seinem gro�en Erstaunen einen Fels der sich gel�st hatte vom Berg ", 0, 0, 3 );   
            base.books.AddGermanBookText( " und im Begriff war herab zu st�rzen. Doch Irmorom nahm ihn auf und als er ihn in seinen H�nden wog, entschied er dass der Fels etwas besonderes werden sollte und so ", 0, 0, 3 );
            base.books.AddGermanBookText( " schuf Irmorom Illarion und versah es mit Bergen und T�lern, mit weiten flachen Ebenen aus Fels und tiefen Kratern. ", 0, 0, 3 );   
            base.books.AddGermanBookText( " Doch selbst nahdem er so viel Zeit mit der Gestaltung des Felsens verbracht hatte, schien es ihm immernoch wie ein Fels und er beschlo� die anderen G�tter um ihre Mithilfe zu bitten.  ", 0, 0, 3 );   
            base.books.AddGermanBookText( " So bat er Ushara um Hilfe und sie bedeckte die oberfl�che Gro�z�gig mit Erde, doch immernoch schien es ihm nicht sch�n genug. So bat er auch Tanora und Findari um Hilfe. ", 0, 0, 3 );
            base.books.AddGermanBookText( " Tanora gab Wasser hinzu und das Wasser flo� in die Krater und Schluchten, bildete Seen, Fl��e und sogar Ozeane. ", 0, 0, 3 );   
            base.books.AddGermanBookText( " Findari gab Luft hinzu und so entstand der Himmel mit all seinen Wolken und Winden.  ", 0, 0, 3 );   
            base.books.AddGermanBookText( " Doch immernoch war es dunkel und kalt auf Illarion so bat Irmorom noch einen letzten Gott um Hilfe, Br�gon. ", 0, 0, 3 );
            base.books.AddGermanBookText( " Br�gon schenkte dem Fels der bereits eine ansehnliche Welt geworden war W�rme und Licht. ", 0, 0, 3 );  
            base.books.AddGermanBookText( " Da wurde den G�ttern bewusst was f�r ein Kunstwerk sie geschaffen hatten, nun da sie es sehen konnten, und auf einmal gab es nur noch ein Gespr�chsthema auf dem Berg des Ursprungs.  ", 0, 0, 3 );   
            base.books.AddGermanBookText( " Wild durcheinander und mit kindlicher Begeisterung schufen die verschiedensten G�tter die verschiedensten Pflanzen und Lebewesen auf Illarion.", 0, 0, 3 );
            base.books.AddGermanBookText( " Doch Irmorom besann sich und statt wie die anderen sich an Pflanzen zu probieren schuf er nach seinem Ebenbild die Zwerge und schenkte ihnen die steinernen Knochen, ", 0, 0, 3 );   
            base.books.AddGermanBookText( " die er mit viel harter und dennoch filigraner Arbeit geschafen hatte. Die Zwerge waren klug und geschickt mit ihren H�nden zu gleich und dennoch waren sie stabil und den  ", 0, 0, 3 );   
            base.books.AddGermanBookText( " verschiedensten Tieren und Pflanzen gewachsen. Da wurden die anderen G�tter neugierig und baten Irmorom ebenfalls um steinerne Knochen, auf das auch sie stabile Lebewesen schaffen k�nnten. ", 0, 0, 3 );
            base.books.AddGermanBookText( " Doch nicht alle G�tter waren an den steinernen Knochen interessiert, Moshran schuf Wesen aus Chitin und f�llte sie mit Narg�n's Nasenschleim, welchen er ihm ", 0, 0, 3 );   
            base.books.AddGermanBookText( " gestohlen hatte als dieser Schnupfen hatte. Diese Wesen hatte er nur geschaffen um die Zwerge und andere Rassen zu ekeln, sie zu erschrecken oder gar um sie aufzufressen.  ", 0, 0, 3 );   
            base.books.AddGermanBookText( " Irmorom erkannte jedoch Potential in einigen von ihnen, und so segnete er einige dieser Arten, auf da� sie zu nahrhaften Delikatessen wurden. ", 0, 0, 3 );
            base.books.AddGermanBookText( " Daraufhin war Moshran allerdings so frustriert, da� er Irmorom ebenfalls um Steinknochen und Br�gon um Hilfe bei der Erschaffung der Orks bat, doch diese ", 0, 0, 3 );  
            base.books.AddGermanBookText( " Wesen waren nicht wie all die anderen stets brachten sie es fertig selbst geduldige und weise Zwerge zu erz�rnen. ", 0, 0, 3 );   
            base.books.AddGermanBookText( " So war es also vollbracht, die V�lker Illarions lebten nahezu im Einklang mit einander und der Fels den Irmorom zum Leben erweckt hatte gedeite, doch schon bald fiel Irmorom ", 0, 0, 3 );
            base.books.AddGermanBookText( " auf das seine Sch�pfungen nicht wie er von Ewigkeit waren und so beschlo� er den Berg Borag - Urubur mit jenen zu teilen die sich ehrenhaft und gerecht auf Illarion verhielten. ", 0, 0, 3 );   
            base.books.AddGermanBookText( " Doch auch die Ungerechten und Ehrlosen mussten die Welt verlassen, da sie ansonsten immer mehr f�r Unruhe sorgten also war es ihre B�rde auf ewig f�r all die Ehrbaren,  ", 0, 0, 3 );   
            base.books.AddGermanBookText( " in den Hallen des Berges, Arbeiten zu verrichten und so verbannte Irmorom jene auf die weiten Felder vor dem Berg, auf das sie dort auf ewig das Dasein eines Bauern fristen sollten.", 0, 0, 3 );
            base.books.AddGermanBookText( " An sich war dies noch nicht einmal so grausam wie es andere Rassen unter ihren G�ttern ereilte, doch war es jenen untersagt unter der Erde zu leben und sie fristeten ihr dasein ", 0, 0, 3 );   
            base.books.AddGermanBookText( " in direkter Nachbarschaft mit den Spitzohren und den Schweinsnasen. So soll es stets das Bestreben aller Zwerge sein ehrenhaft und gerecht zu leben auf das sie von ", 0, 0, 3 );   
            base.books.AddGermanBookText( " Cherga an den richtigen Ort geleitet werden wenn das Ende naht, denn ansonsten w�rden sie auch nie wieder ihre Ahnen treffen die in den gro�en Hallen des Borag - Urubur Irmoroms G�ste sind.", 0, 0, 3 );

            --------------------------------

			base.books.AddLanguage("common language",4);

			base.books.AddEnglishBookText("In avowal to Oldra, the earthmother, who makes the plants grow pretty, and Adron, the man with the big tummy and the funny red nose, the halflings of Briar take upon their responsibility, to preserve",0,0, 4);
			base.books.AddEnglishBookText("the legacy of the Evergreen Halflings, the island Briar and the Hamlet of Greenbriar, to change it oncemore into a place, the little people may laugh, play and live in self-determination.",0,0, 4);
			base.books.AddEnglishBookText("1. Article - The Clan",0,0, 4);
			base.books.AddEnglishBookText("-- To strenghten the bonds among the halflings, pursuing the traditions of old, and to advance the folksiness and community, all halflings that feel at ease with being in Briar, and wish to live,",0,0, 4);
			base.books.AddEnglishBookText("laugh and play here, shall avow formally to the clan of halflings.",0,0, 4);
			base.books.AddEnglishBookText("-- The name shall be decided by vote, among all halflings that acknowledge these articles of association. After the vote, the name is to be added to these articles and will be",0,0, 4);
			base.books.AddEnglishBookText("henceforth unchangeable. \nThe halflings have decided upon the name \"Littlethorn\" and thus is the name the clan shall be called henceforth.",0,0, 4);
			base.books.AddEnglishBookText("-- The clanname is to be added after existing family names.",0,0, 4);
			base.books.AddEnglishBookText("2. Article - The Head of the Family",0,0, 4);
			base.books.AddEnglishBookText("-- Decisions about the course of action of the Hamlet are to be made by the head of the family. The safeguard and stocking of the pantry, the arrangement of festivities, and other tasks may be",0,0, 4);
			base.books.AddEnglishBookText("fulfilled by the head of the family himself or by other halflings who are assigned to the tasks by the head of family.\nThe decisions of the head of family are irrevocable, as it is rumored he is",0,0, 4);
			base.books.AddEnglishBookText("the only one who was allowed to nibble at Oldras apple of wisdom.",0,0, 4);
			base.books.AddEnglishBookText("- The head of the family is to be elected among the members of the clan once these articles take effect. In the interest of unity among the halflings, the result should be unanimous.",0,0, 4);
			base.books.AddEnglishBookText("In case a unanimous decision can not be achieved - Oldra protect us! - the agreement of more than half of the clanmembers is sufficient.",0,0, 4);
			base.books.AddEnglishBookText("-- The head of the family keeps this title until his death or resignment. \nHe may designate a sucessor for both cases.",0,0, 4);
			base.books.AddEnglishBookText("3. Article - Rights",0,0, 4);
			base.books.AddEnglishBookText("-- Everyone regardless of descent, is allowed to stay in Briar, sleep under the shadowy trees, or pick apples, as he pleases, as long as he behaves nicely.",0,0, 4);
			base.books.AddEnglishBookText("-- Property rights upon soil and buildings are granted to the clan of halflings as a whole.",0,0, 4);
			base.books.AddEnglishBookText("-- Building use rights may be granted towards clan members and honorary citizens alike.\nThe head of the family decides who receives rights of use. ",0,0, 4);
			base.books.AddEnglishBookText("-- The possibilities of how to ruin your standing with the halflings and make a face as if you have just drunk sour milk, are to be listed in an separate catalogue of offenses.",0,0, 4);
			base.books.AddEnglishBookText("-- Worthy halflings, who have made an effort towards the Hamlet, may be granted the title \"Honorable Halfling\".\nWorthy non-halflings may be granted the title \"Friend of the Halflings\", should",0,0, 4);
			base.books.AddEnglishBookText("exceptional effort justify this honor.\nEvery clanmember may suggest someobody for either title. Should the clan unanimously accept the suggestion, the title is to be granted.",0,0, 4);
			base.books.AddEnglishBookText("Furthermore the head of the family may honor halflings and non-halflings.",0,0, 4);
			base.books.AddEnglishBookText("4. Article - Transitional provisions",0,0, 4);
			base.books.AddEnglishBookText("-- The old articles and laws of the Hamlet of Greenbriar become void upon annoucement of these new articles.\n\n-- The current borders of the Hamlet of Greenbriar remain.",0,0, 4);
			base.books.AddEnglishBookText("-- Diplomatic relationships have to be renewed in order to continue.\n\n- We want to thank all current non-halfling citizens of the Hamlet of Greenbriar for their efforts to preserve and maintain ",0,0, 4);
			base.books.AddEnglishBookText("the Hamlet in its current state, even after the numbers of small people upon Gobaith became dwindlingly small. Due to this, every non-halfling citizen is granted honorary citizenship.",0,0, 4);
			base.books.AddEnglishBookText("They are freed of all political duties and may enjoy the tranquility and peace of the Hamlet without being disturbed, as long as they behave nicely.",0,0, 4);

			base.books.AddGermanBookText("Im Bekenntnis zu Oldra, der Erdenmutter die die Pflanzen h�bsch wachsen l�sst, und Adron, dem Mann mit dem gro�en Bauch und der lustig roten Nase, nehmen die Halblinge Briars ihre Pflicht wahr, das",0,0, 4);
			base.books.AddGermanBookText("Verm�chtnis der Evergreen Halblinge, die Insel Briar und den Weiler Greenbriar selbst, wieder zu einem Ort zu machen, an dem die kleinen Leute lachen, spielen und �ber sich selbst bestimmen d�rfen.",0,0, 4);
			base.books.AddGermanBookText("Artikel 1 - Die Sippe",0,0, 4);
			base.books.AddGermanBookText("-- Um, den Traditionen folgend, den Zusammenhalt unter den Halblingen zu bekr�ftigen, und die Geselligkeit und Gemeinschaft zu f�rdern, sollen alle Halblinge, die sich in Briar wohlf�hlen und hier",0,0, 4);
			base.books.AddGermanBookText("leben, lachen und spielen wollen, formal zur Sippe der Halblinge bekennen.",0,0, 4);
			base.books.AddGermanBookText("-- Der Name wird von allen Halblingen gemeinsam entschieden, die ihr Interesse zur Befolgung dieser Satzung bekannt haben. Nach dieser Abstimmung wird er in diese Satzung aufgenommen und kann danach",0,0, 4);
			base.books.AddGermanBookText("nichtmehr ge�ndert werden.\nDie Halblinge haben sich auf den Namen \"Littlethorn\" geeinigt. Unter diesem Namen soll die Sippe von nun an bekannt sein.",0,0, 4);
			base.books.AddGermanBookText("-- Der Sippenname wird als Beiname zu bestehenden Familiennamen hintangeh�ngt.",0,0, 4);
			base.books.AddGermanBookText("Artikel 2 - Das Familienoberhaupt",0,0, 4);
			base.books.AddGermanBookText("-- Die Entscheidungen f�r die Geschicke des Weilers trifft das Familienoberhaupt der Halblinge. Die Bewachung und Bef�llung der Vorratskammern sowie das ausrichten allf�lliger Festivit�ten, sowie",0,0, 4);
			base.books.AddGermanBookText("andere Aufgaben k�nnen von diesem selbst versehen, oder durch diesen an andere Halblinge �bertragen werden.\nDie Entscheidungen des Familienoberhauptes, der als einziger von Oldra's Weisheitsapfel",0,0, 4);
			base.books.AddGermanBookText("naschen durfte, so sagt man, sind endg�ltig.",0,0, 4);
			base.books.AddGermanBookText("-- Das Familienoberhaupt wird bei Inkrafttreten dieser Satzung von den Sippenmitgliedern (siehe Artikel 2) gew�hlt. Im Interesse von Einigkeit unter den Halblingen soll dies m�glichst einstimmig",0,0, 4);
			base.books.AddGermanBookText("entschieden werden, sollte sich keine Einigkeit abzeichnen, - Oldra beh�te! - so ist die Zustimmung von mehr als der H�lfte der Sippenmitglieder ausreichend.",0,0, 4);
			base.books.AddGermanBookText("-- Das Familienoberhaupt beh�lt diesen Titel bis zu seinem Tode oder R�cktritt.\nF�r beide F�lle kann das Familienoberhaupt seinen Nachfolger selbst bestimmen.",0,0, 4);
			base.books.AddGermanBookText("Artikel 3 - Rechte",0,0, 4);
			base.books.AddGermanBookText("-- Jedem, egal welcher Abstammung, ist es gestattet sich in Briar aufzuhalten, im Schatten zu schlafen, oder �pfel zu pfl�cken, wie er mag, solange er sich nett benimmt.",0,0, 4);
			base.books.AddGermanBookText("-- Eigentum an Grund und Boden / Geb�uden, erh�lt die Sippe der Halblinge als Gesamtheit.",0,0, 4);
			base.books.AddGermanBookText("- Nutzungsrechte an Geb�uden k�nnen sowohl von Sippenmitgliedern als auch Ehrenb�rgern gemietet, gepachtet oder ihnen verliehen werden.\n�ber die Verleihung entscheidet das Familienoberhaupt.",0,0, 4);
			base.books.AddGermanBookText("-- Die M�glichkeiten, wie man sich's mit den Halblingen verscherzen kann, sodass man guckt als h�tte man saure Milch getrunken, werden in einem eigenen Verbotskatalog aufgelistet.",0,0, 4);
			base.books.AddGermanBookText("- Verdiente Halblinge, die sich um den Weiler bem�ht haben, k�nnen mit dem Titel \"Ehrenwerter Halbling\" bedacht werden.\nVerdienten Nicht-Halblingen kann der Titel \"Freund der Halblinge\" verliehen",0,0, 4);
			base.books.AddGermanBookText("werden, sollte besonderer Einsatz dies rechtfertigen.\nJedem Familienmitglied steht es frei, jemanden f�r diese Titel vorzuschlagen. Sollte die Familie einstimmig den Vorschlag akzeptieren,",0,0, 4);
			base.books.AddGermanBookText("wird der Titel verliehen.\nEs steht auch dem Familienoberhaupt zu, Halblinge und Nicht-Halblinge zu ehren.",0,0, 4);
			base.books.AddGermanBookText("Artikel 4 - �bergangsbestimmungen",0,0, 4);
			base.books.AddGermanBookText("-- Die alte Verfassung des Weilers Greenbriar verliert mit Verlautbarung dieser Satzung ihre G�ltigkeit.\n\n-- Die Grenzen des Weilers Greenbriar bleiben bestehen.",0,0, 4);
			base.books.AddGermanBookText("-- Etwaige Diplomatische Beziehungen m�ssen erneuert werden.\n\n- F�r die sch�ne gemeinsame Zeit, und die Mithilfe Greenbriar in seinem Zustand zu erhalten und zu bewahren, auch nachdem die Zahl der",0,0, 4);
			base.books.AddGermanBookText("kleinen Leute auf der Insel verschwindend klein wurde, m�chten wir allen jetzigen Nicht-Halblingsb�rgern herzlichst danken. Aus diesem Grund wird ihnen eine Ehrenb�rgerschaft zugesprochen. ",0,0, 4);
			base.books.AddGermanBookText("Sie sind mit dieser Ehrenb�rgerschaft aller politischen Verpflichtungen entbunden, und d�rfen weiterhin die Ruhe und den Frieden des Weilers ungest�rt genie�en, wenn sie sich nett benehmen.",0,0, 4);
			
            -------------------

			base.books.AddLanguage("common language",5);

			base.books.AddEnglishBookText("\n\n~Codex of the Grey Rose~",0,0,5);
			base.books.AddEnglishBookText("~Codex of Mind~\nThese are the three Circles of Mind.\nFollow them!",0,0,5);
			base.books.AddEnglishBookText("1. KNOWLEDGE IS POWER\nGather all information you can get, and hand them to the guild. It will be collected, and the most important data will be put into a library.",0,0,5);
			base.books.AddEnglishBookText("2. SKILL IS \nSpecialize in one profession and become a master of it. But always remember that life is more than that.",0,0,5);
			base.books.AddEnglishBookText("3. SILENCE IS NECESSARY\nNever talk about the secrets of the guild. Even when recruiting new members, give them only the information available for the public. ",0,0,5);
			base.books.AddEnglishBookText("~Codex of Guilt~\nThese are the three Circles of Guilt. \n Avoid them !",0,0,5);
			base.books.AddEnglishBookText("1. YOU SHALL NOT PROVOKE\nIt is not necessary. If you are provoked, answer wise. If you have aggressions, use them on monsters.",0,0,5);
			base.books.AddEnglishBookText("2. YOU SHALL NOT INSULT\nIf you are insulted yourself, then respond wise and friendly using your brain. Remember, your language represents your origin, and your wisdom, and the guild itself!",0,0,5);
			base.books.AddEnglishBookText("3. YOU SHALL NOT ATTACK\nNot without a very good reason. If attacked by others, respond quickly and deadly. ",0,0,5);
			base.books.AddEnglishBookText("~Codex of Honour~\nThese are the thirteen Circles of Honour.\nRespect them!",0,0,5);
			base.books.AddEnglishBookText("1. INSULT\nPeople that repeatedly insult and attack guild members, must be calmed down. If necessary by use of violence but don't forget to contact the circle before. That is honour.",0,0,5);
			base.books.AddEnglishBookText("2. WEAKNESS\nTo react in violence only shows the weakness of your mind. Control your emotions. Especially the negative ones, and the strong feelings.",0,0,5);
			base.books.AddEnglishBookText("Don't give in! But laugh as much as you want !\n\nThat is honour.",0,0,5);
			base.books.AddEnglishBookText("3. STRENGTH\nIf you cannot kill a strong enemy, admit it. This shows true strength. That is honour.",0,0,5);
			base.books.AddEnglishBookText("4. LIARS\nSpeak the truth. Say nothing if necessary. Lying is a disgrace. Truth is honour.",0,0,5);
			base.books.AddEnglishBookText("5. KEEP WORD\nDon't give anyone your word if you can't keep it and keep what you have said. Only if it contradicts your or the guild's honour, ask to take back your word. That is honour.",0,0,5);
			base.books.AddEnglishBookText("6. STAND TO THE ORDER\nAnd to those you call your friends. And help all those that obviously need help. That is honour.",0,0,5);
			base.books.AddEnglishBookText("7. PAY BACK\nRepay good deeds with good deeds but don't repay evil with evil. Be fair and thankful. That is honour.",0,0,5);
			base.books.AddEnglishBookText("8. RESPECT\nRespect the other members, and respect friends of the guild. Also respect a strong enemy, or monster. That is honour.",0,0,5);
			base.books.AddEnglishBookText("9. VIGILENCE\nWatch your surroundings and don't run into traps but destroy them with or without violence. Find the weak points of the enemies. That is honour.",0,0,5);
			base.books.AddEnglishBookText("10. PROTECTION\nProtect the weak and help them in their development . If you see a criminal killing or stealing, then help. That is honour.",0,0,5);
			base.books.AddEnglishBookText("11. ORDER\nThe commands coming from the circle or high circle should be followed. You can ask for the reason, if it is not obvious. That is honour.",0,0,5);
			base.books.AddEnglishBookText("12. THINK\nYou have a mind, and you have individual thoughts. Use both combined with wisdom. That is honour.",0,0,5);

			base.books.AddGermanBookText("\n\n~Der Verhaltenskodex der Grauen Rose~",0,0,5);
			base.books.AddGermanBookText("~Kodex des Geistes~\nDies sind die drei Kreise des GEISTES.\nBefolgt sie!",0,0,5);
			base.books.AddGermanBookText("1. WISSEN IST MACHT\nSammelt Informationen und meldet sie den Rittern. F�r die Allgemeinheit wichtige Informationen werden sp�ter in einer Bibliothek untergebracht.",0,0,5);
			base.books.AddGermanBookText("2. K�NNEN IST WERTVOLL\nSpezialisiert euch auf eine Arbeit und werdet Meister eures Faches. Doch bedenkt, dass das Leben nicht nur in Arbeiten besteht.",0,0,5);
			base.books.AddGermanBookText("3. SCHWEIGEN IST NOTWENDIG\nSprecht niemals �ber Geheimnisse der Gilde. Auch wenn ihr neue Mitglieder anwerbt, gebt ihnen nur die �ffentlich erh�ltlichen Informationen.",0,0,5);
			base.books.AddGermanBookText("~Kodes der Schuld~\nDies sind die drei Kreise der Schuld.\nVermeidet sie!",0,0,5);
			base.books.AddGermanBookText("1. IHR SOLLT NICHT PROVIZIEREN\nEs ist nicht notwendig. Wenn ihr provoziert werdet, antwortet weise. Wenn ihr Aggressionen habt, wendet sie gegen Monster.",0,0,5);
			base.books.AddGermanBookText("2. IHR SOLLT NICHT BELEIDIGEN\nWenn ihr selbst beleidigt werdet, so antwortet weise, h�flich und benutzt euren Verstand. Denket daran, eure Sprache repr�sentiert eure Herkunft,",0,0,5);
			base.books.AddGermanBookText("eure Weisheit, und die Gilde!",0,0,5);
			base.books.AddGermanBookText("3. IHR SOLLT NICHT ANGREIFEN\nNicht ohne einen sehr guten Grund.Wenn ihr angegriffen werdet, so antwortet schnell und t�dlich.",0,0,5);
			base.books.AddGermanBookText("~Kodex der Ehre~\nDies sind die zw�lf Kreise der Ehre.\nHandelt nach ihnen!",0,0,5);
			base.books.AddGermanBookText("1. BELEIDIGUNG\nB�rger, die wiederholt Ordensmitglieder beleidigen und angreifen, m�ssen ruhiggestellt werden mit Frieden oder Gewalt. In letzterem Fall muss der hohe Zirkel vor einer Aktion kontaktiert",0,0,5);
			base.books.AddGermanBookText("2. SCHW�CHE\nWenn ihr gewaltt�tig werdet, zeigt ihr nur die Schw�che eures Geistes. Kontrolliert eure Emotionen, besonders die negativen und starken Gef�hle. Lasst euch nicht hinrei�en.",0,0,5);
			base.books.AddGermanBookText("Doch lacht soviel ihr m�gt!\n\nDies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("3. ST�RKE\nWenn ihr einen starken Gegner nicht besiegen k�nnt, dann gebt es zu. Das zeigt wahre St�rke. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("4. L�GNER\nSprechet die Wahrheit. Schweigt wenn n�tig. L�gen ist Schande. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("5. HALTET WORT\nGebt kein Wort, das ihr nicht halten k�nnt und haltet, was ihr sagt. Nur im Konfliktfall um eurer oder der Gilde Ehre, bittet darum, euer Wort zur�cknehmen zu d�rfen. Dies sei Ehre",0,0,5);
			base.books.AddGermanBookText("6. STEHT ZUM ZIRKEL\nUnd zu euren Freunden und helft ihnen, wo immer eure Hilfe ben�tigt wird. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("7. ZAHLET ZUR�CK\nVergeltet Gutes mit Gutem, aber nicht B�ses mit B�sem, seid gerecht und dankbar. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("8. RESPEKT\nRespektiert die Zirkelmitglieder und Freunde der Gilde. Respektiert auch einen starken Feind oder Monster. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("9. WACHSAMKEIT\nSeid wachsam und lauft in keine Falle, sondern beseitigt sie mit oder ohne Gewalt! Findet die schwachen Stellen eurer Feinde. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("10. SCHUTZ\nSch�tzet die Schwachen und helft ihrer Entwicklung. Wenn ihr einen Verbrecher beobachtet, der t�tet oder stiehlt, dann eilet zur Hilfe. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("11. ORDNUNG\nDie Befehle, die vom Zirkel (oder hohen Zirkel) kommen, befolgt ihr. Ihr m�gt nach einem Grund fragen, wenn dieser nicht erkennbar ist. Dies sei Ehre.",0,0,5);
			base.books.AddGermanBookText("12. DENKT\nIhr habt einen Geist und individuelle Gedanken. Verwendet beide ruhig, gepaart mit Weisheit. Dies sei Ehre.",0,0,5);
			
			--------------------------
			
			base.books.AddLanguage("common language",6);

			base.books.AddEnglishBookText("Glorification to\n\nIrmorom",0,15,6);
			base.books.AddEnglishBookText("written by\nThorgrimm, Hohepriester Irmoroms\ntranslate by Ashayen Cromwell",0,15,6);
			base.books.AddEnglishBookText("1.\nClosing time is falling in,\nFriendly above land and hills.\nweaveing the ton of celebration songs,\nthrough the heart of every darf.",0,15,6);
			base.books.AddEnglishBookText("2.\nSoon the smithing fire will go out,\nHey, open the beer barrel very fast,\nwe�ll guzzle, sing songs,\nso is the dwarven rite.\nHail YOU! Hail you Irmorom,\nso is the dwarven rite.",0,15,6);
			base.books.AddEnglishBookText("3.\nOur burden, our worries\nIrmorom knows them all so well.\nBut he�ll make sure to bring joy\nDash the beer open, bring in the sow!",0,15,6);
			base.books.AddEnglishBookText("\n\nHail YOU! Hail you Irmorom,\nDash the beer open, bring in the sow!",0,15,6);
			base.books.AddEnglishBookText("4.\nTherfore let us celebrate, let us sing.\nLift the mugs, eat the meat.\nLoud and long our songs shall sound,\nfar across the dwarvenland.",0,15,6);
			base.books.AddEnglishBookText("\n\nHail YOU! Hail you Irmorom!\nFar across the dwarvenland.",0,15,6);
			
			base.books.AddGermanBookText("Glorification to\n\nIrmorom",0,15,6);
			base.books.AddGermanBookText("geschrieben von\nThorgrimm, Hohepriester Irmoroms\n�bersetzt von\nAshayen Cromwell",0,15,6);
			base.books.AddGermanBookText("1.\nFeierabend senkt sie nieder,\nfreundlich �ber Land und Berg,\nwebt den Ton der Feierlieder\ndurch das Herz von jedem Zwerg.",0,15,6);
			base.books.AddGermanBookText("2.\nBald erstirbt dass Schmiedefeuer,\nHey, macht schnell das Bierfass auf,\nSaufen werden wir, singen Lieder,\nSo isses des Zwergen Brauch.\nHail DIR! Hail Dir Irmorom,\nSo isses des Zwergen Brauch!",0,15,6);
			base.books.AddGermanBookText("3.\nUnsre Lasten, unsre Sorgen\nIrmorom kennt sie ganz genau.\nDoch er wird f�r Freude sorgen,\nSchlagt auf das Bier holt rein die Sau!",0,15,6);
			base.books.AddGermanBookText("\n\nHail DIR! Hail Dir Irmorom,\nSchlagt auf das Bier holt rein die Sau!",0,15,6);
			base.books.AddGermanBookText("4.\nDrum lasst uns feiern, lasst uns singen,\nHoch die Kr�ge, rein das Fleisch.\nLaut und weit sollen unsre Lieder klingen,\nWeit �ber das Zwergenreich.",0,15,6);
			base.books.AddGermanBookText("\n\nHail DIR! Hail Dir Irmorom,\nWeit �ber das Zwergenreich!",0,15,6);
        end
    end
    base.books.SendBookPage(User,SourceItem.data,Counter);
end

function LookAtItem(User,Item)
    if base.books.InitTitle() then
        base.books.AddEnglishBookTitle("Book with the title \"Celebrations\"",0);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Die Feiertage des Jahres\"",0);
        
        base.books.AddEnglishBookTitle("Book with the title \"Lizard Culture and History\"",1);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Die Gemeinschaft der Echsenmenschen\"",1);
        
        base.books.AddEnglishBookTitle("Book with the title \"Tihgorac's Book of Combat\"",2);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Tihgorac's Buch der Kampfeskunst\"",2);
        
        base.books.AddEnglishBookTitle( "Book with the title \" The Story of Urubur \"", 3 );
        base.books.AddGermanBookTitle( "Buch mit dem Titel \" Die Geschichte Urubur  \"", 3 );
        
        base.books.AddEnglishBookTitle("Book with the title \"The Articles of Greenbriar\"",4);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Die Satzung Greenbriars\"",4);
        
        base.books.AddEnglishBookTitle("Book with the title \"Codex of the Grey Rose\"",5);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Kodex der Grauen Rose\"",5);
        
        base.books.AddEnglishBookTitle("Book with the title \"Glorification to Irmorom\"",6);
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Lobpreis an Irmorom\"",6);
    end
    base.books.GetBookItemInform(User,Item);
end
