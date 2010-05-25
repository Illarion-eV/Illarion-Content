function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if (checkFirst==nil) then
        BookGerman={};
        BookEnglish={};

        --Zum hinzufügen anderer Kapitel nur BookGerman bzw BookEnglish ergänzen

        --Deutsche Bucheinträge hinzu fügen
        BookGerman[1] = "Das Tagebuch von Noira Liv"
        BookGerman[2] = "Dies sind die Aufzeichnungen von Noira Liv, hohe Priesterin Eldan's."
        BookGerman[3] = "Vorwort:"
        BookGerman[4] = "Das Zeitalter des Kampfes ist vorüber. Die alten Götter verlassen uns. Sie gehen über das Meer. Ich bin die letzte hohe Priesterin Eldan's. Dies ist meine Geschichte."
        BookGerman[5] = "Möge dieses Vermächtnis die Zeiten überdauern, mögen die versiegelten Altäre in Vergessenheit geraten: Eines Tages werden die Erben kommen."
        BookGerman[6] = "Die alten Bücher werden gefunden werden und alte Lehre wird sich mit neuer vermengen, denn das Wissen stirbt nicht solange wir leben, es schläft nur. Und der Schlaf mag lange andauern. Sehr lange."
        BookGerman[7] = "Kapitel I: Auf der Suche nach Eldan:"
        BookGerman[8] = "Heute begegnete ich einem Jünger Findaris. Er riet mir meine Wanderung nach Murinaa zu dokumentieren. Als Erinnerung."
        BookGerman[9] = "Murinaa: Noch liegt es wenige Tagesmärsche entfernt und doch ist die glanzvolle Stadt schon in der Ferne über dem glitzernden Sand zu erkennen."
        BookGerman[10] = "Wie viele Anwärter auf die Priesterschaft zieht es mich nach Murinaa, die nächste größere Stadt in der sich Heiligtümer aller Götter befinden."
        BookGerman[11] = "Je näher ich Murinaa komme desto mehr Anhänger Bragons, Usharas, Eldans, Tanoras und Findaris kreuzen meinen Weg. Es sind ihrer nicht hunderte aber dennoch einige Dutzend."
        BookGerman[12] = "Endlich in Murinaa: Die Bibliothek ist gigantisch. Ich habe das Buch der Priester Eldans gefunden und gelesen. Sehr rätselhaft."
        BookGerman[13] = "Es scheint als würde von mir erwartet werden das Gebet zur Weihe selber zu finden. Mein einziger Anhaltspunkt ist das Buch der Priester Eldans."
        BookGerman[14] = "Dieses Buch ist mir ein Rätsel. Und die Weihen rücken näher. Unaufhaltsam. Wie soll ich es nur deuten?!"
        BookGerman[15] = "Einer der Novizen bemerkte heute meine Mühen in der Bibliothek. Er hat gesagt dass es genau fünf Götter seien - Als ob ich das nicht wüsste."
        BookGerman[16] = "Außerdem sprach er von einem Zyklus des Erschaffens. Offensichtlich wollte er mir einen Hinweis zukommen lassen. Was er wohl meinte?"
        BookGerman[17] = "Ich habe eine interessante Beobachtung gemacht: Alle fünf Tage fällt das Licht durch einen Spalt in der Decke genau auf das Buch der Priester Eldans."
        BookGerman[18] = "Wie ich beobachten konnte gilt dies auch für die Bücher der anderen Priester der Fünf."
        BookGerman[19] = "Endlich konnte ich dem Text innerhalb des Buches das Gebet entreißen."
        BookGerman[20] = "Allerdings muss ich Eldan bei der Weihe ein Opfer darbringen. Der Ritualmeister wies mich darauf hin, dass ich Eldan etwas opfern muss was er mag."
        BookGerman[21] = "Das war der unglaublichste Tag in meinem Leben: Ich hielt die Flasche in der Hand und rief Eldan an das Opfer anzunehmen."
        BookGerman[22] = "Daraufhin erfasste mich ein gewaltigiger Sog und es zog mich weit in die Ferne. Ein unglaubliches Gefühl. Dort angekommen sah ich einen großen Altarraum vor mir."
        BookGerman[23] = "Ich vermute es war ein geheimer Altarraum Eldans in Nabranoo, der Stadt der Götter. Dieser Raum sah aus wie für die Ewigkeit geschaffen."
        BookGerman[24] = "Dort sprach ich, am Altar knieend, das Gebet und ich konnte Eldans Blick auf mir spüren als er mich zur Novizin berief."
        BookGerman[25] = "Kapitel II: Die Reise geht weiter:"
        BookGerman[26] = "Du verstehst diese Sprache nicht."
        --Ende Deutsche Bucheinträge

        --Englische Bucheinträge hinzu fügen
        BookEnglish[1] = "The Diary of Noira Liv"
        BookEnglish[2] = "No English version yet."
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

    User:learn(4,"library research",2,100)
end
