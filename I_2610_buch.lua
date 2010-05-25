function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if (checkFirst==nil) then
        BookGerman={};
        BookEnglish={};

        --Zum hinzufügen anderer Kapitel nur BookGerman bzw BookEnglish ergänzen

        --Deutsche Bucheinträge hinzu fügen
        BookGerman[1] = "Die Fünf schenkten uns einst die Ewigkeit eines langen Lebens und so mehr Möglichkeiten als den anderen Völkern Ruhe und Weisheit zu sammeln."
        BookGerman[2] = "Jede Erfahrung muss gemacht werden, so hatten die meisten unserer Weisheiten und Traditionen einen hohen Preis, doch die Fehler, die geschahen, sollen uns auf alle Zeit eine Lehre sein. Von einigen will ich heute schreiben:"
        BookGerman[3] = "Schira'thel - Tochter des Blutes"
        BookGerman[4] = "Alles begann, damals vor ungezählten Jahren, als die Elfen gerade begannen das Wirken der Magie zu verstehen."
        BookGerman[5] = "Besser gesagt begannen sie es zu interpretieren, aber das allgemeine Selbstbewußtsein damals ließ uns glauben, wir würden verstehen was wir noch nicht einmal erahnten."
        BookGerman[6] = "Es geschah so, daß man im Laufe der Jahre zu vermuten begann, die Fähigkeiten mit Magie umzugehen seien hauptsächlich eine Sache des elterlichen Blutes."
        BookGerman[7] = "Einige sehr fanatische Magier und Magierinnen kamen so auf die Idee, durch die Vermählung des größten Magiers und der größten Magierin einen noch mächtigeren Spross zu erhalten."
        BookGerman[8] = "Selber besessen von dieser Idee ließen sich die von nun an Vermählten auf die Verbindung ein."
        BookGerman[9] = "Doch das Kind, das geboren werden sollte, weckte nicht nur Neugierde und Hoffnung, auch Angst und Neid sollte sollte sie verbreiten, noch ehe sie geboren ward."
        BookGerman[10] = "Es wurde ein Mädchen, Schira'thel mit Namen, doch wie sie geboren war begann ihr Weg des Leidens."
        BookGerman[11] = "Da das Kind nun da war, beanspruchten beide Eltern es einzig für sich, ihr Bund zerbrach und Lorethie, die Mutter nahm das Kind in eiliger Flucht mit sich."
        BookGerman[12] = "Zonah war der Vater genannt, der sich betrogen fühlend Mutter und Tochter zornig verfolgte."
        BookGerman[13] = "Beide an Fähigkeit und Einfluss groß dauerte diese Jagd über zwei Jahrhunderte."
        BookGerman[14] = "Auf der ständigen Flucht erzog Lorethie ihre Tochter nicht nur zu einer fleißigen Schülerin sondern auch zu einem Mädchen das ihren Vater als die Verkörperung des Bösen sah."
        BookGerman[15] = "Als dann Zonah eines Tages seine ehemalige Frau einholte wurde aus dem Streit schneller ein Kampf als ein Wort gesprochen wurde."
        BookGerman[16] = "Feuer und Eis regneten vom Himmel herab und wo einst Zonah und Lorethie einander bezauberten soll bis heute nur tote Erde liegen."
        BookGerman[17] = "Letztendlich gewann Zonah, doch im Augenblick des Triumphes tauchte seine Tochter auf, einzig im Blick den gehaßten Vater vor der toten Mutter."
        BookGerman[18] = "Ohne Zögern lies Schira'thel all ihren Zorn auf den Vater nieder, der geschwächt schon vom Kampfe dem nichts mehr entgegensetzen konnte."
        BookGerman[19] = "Doch das Schicksal verlangte der jungen Elfin noch mehr ab. Jene die sie fürchteten und beneideten waren schnell darin sie anzuklagen, beide Eltern getötet zu haben."
        BookGerman[20] = "Aus Anklage wurde Urteil. Verbannt und voller Hass und Zorn zog Schira'thel hinaus in die Welt."
        BookGerman[21] = "Was sie dort erlebte ist eine andere Geschichte, was jedoch uns auf ewig behalten bleiben sollte ist dies:"
        BookGerman[22] = "Daß Liebe stärker ist als Blut und Kinder deshalb immer nur aus und mit Liebe wachsen sollten."
        --Ende Deutsche Bucheinträge

        --Englische Bucheinträge hinzu fügen
        BookEnglish[1] = "The Five once gifted us with the eternity of a long life and thus more opportunity for our kin to gather wisdom and peace, more than other races may have. "
        BookEnglish[2] = "Every experience has to be experienced, therefore most of our traditions and wisdoms were achieved through paying a high price, yet the mistakes being made shall teach us for all eternity. I want to write about some of them this day..."
        BookEnglish[3] = "Schira'thel - Daughter of Blood "
        BookEnglish[4] = "Everything began, at that time, countless years before, when the elves began to comprehend the ways of magic. "
        BookEnglish[5] = "Or to put it differently, they started to interpret it, but the self-confidence of that time made us believe that we would understand the things we couldn't even fathom at that time."
        BookEnglish[6] = "Therefore after years had passed, it was common belief that the ability to use magic was based mainly on one's parents' own blood."
        BookEnglish[7] = "Some very ambitious sorcerers therefore discovered the idea, to create an even more powerful mage by wedding the greatest and best magicians with each other."
        BookEnglish[8] = "They themselves were obsessed by this idea, and agreed to this relationship."
        BookEnglish[9] = "But the child which was about to be born did not only raise curiosity and hope, but at the same time it would spread fear and envy, even before its birth."
        BookEnglish[10] = "It was a girl, Shira'thel she was named, but as soon as she was born, her path of suffering commenced."
        BookEnglish[11] = "Both of her parents claimed her solely for themselves, their relationship shattered and Lorethie, her mother, fled with her."
        BookEnglish[12] = "Zonah, as her father was named, who now felt deceived, pursued both mother and daughter."
        BookEnglish[13] = "Both of them, rich of influence and abilities - caused this chase to last for more than two centuries."
        BookEnglish[14] = "During their constant flight, Lorethie not only raised her daughter to be a hard-working student, but furthermore taught her to see her father as the embodiment of evil itself."
        BookEnglish[15] = "So it came to be one day, when Zonah finally caught up with his former wife, that the quarrel transformed into an open combat, quicker than words could have possibly been uttered."
        BookEnglish[16] = "Fire and ice rained down from the very skies, and scorched earth still marks the place where Zonah and Lorethie cast their spells upon each other - till this day, it is said."
        BookEnglish[17] = "In the end of the battle, Zonah was victorious, but in the moment of his success, his daughter appeared, focusing on her hated father before her dead mother."
        BookEnglish[18] = "Without any hesitation, Shira'thel cast all her anger upon her father who couldn't defend himself anymore, exhausted from the preceding fight."
        BookEnglish[19] = "But fate was not just yet finished with the young elfess. Those that were frightened, and those who envied her, immediately accused her to have slain both of her parents."
        BookEnglish[20] = "And soon, accusation became verdict. Banned and infused with hatred and anger, Shira'thel stepped out forth into the world."
        BookEnglish[21] = "The things she experienced there are told in another story, however the thing we should remember for all eternety is this:"
        BookEnglish[22] = "Love is stronger than the bond of blood and as such, children should always be born because of love, and love should be the force they are raised with."
        --Ende Englische Bucheinträge


    end

    --Ab hier braucht nichts mehr geändert werden um verschiedene Bücher zu erstellen.

    --Spieler ist Deutsch sprechend
    if ( User:getPlayerLanguage()==0 ) then
        --Prüfen ob eine BookGerman größer als die eigentlichen BuchBookGermann angeschaut werden soll
        if ( Counter > table.getn(BookGerman) ) then
            User:inform("Das Buch hat nicht soviele Seiten!");
        else
            x = BookGerman[Counter]
            User:inform( ""..x);
        end
        --Spieler ist Englisch sprechend
    elseif ( User:getPlayerLanguage()==1 ) then
        --Prüfen ob eine BookGerman größer als die eigentlichen BuchBookGermann angeschaut werden soll
        if ( Counter > table.getn(BookEnglish) ) then
            User:inform("The book hasn't so many pages!");
        else
            x = BookEnglish[Counter]
            User:inform( ""..x);
        end
    end

    -- Buch in Regal stellen
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then

        world:erase(SourceItem,1)

    end

    User:learn(4,"library research",2,100)
end