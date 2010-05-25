function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if (checkFirst==nil) then
        BookGerman={};
        BookEnglish={};

        --Zum hinzufügen anderer Kapitel nur BookGerman bzw BookEnglish ergänzen

        --Deutsche Bucheinträge hinzu fügen
        BookGerman[1] = "Das Buch der Priester Eldans"
        BookGerman[2] = "Der Novize:"
        BookGerman[3] = "Was du suchst sind Weisheit und Wissen. Doch vielleicht führt dein Weg zu sehr zu Hochmut und nicht zu Eldan."
        BookGerman[4] = "Sei stark im Glauben. Eldan führt dich und er bringt dich deinem Ziel näher, die Spur zu finden - zur Weisheit."
        BookGerman[5] = "Sei stark in Taten. Zeige Eifer. Wie dir und mir Eldan den Zweifel nahm, den Hochmut, zeigt er den Weg."
        BookGerman[6] = "Sei stark im Mute. Ich sehe den Weg. Und werde er steinig oder steil, ihm sind wir bestimmt zu folgen."
        --Ende Deutsche Bucheinträge

        --Englische Bucheinträge hinzu fügen
        BookEnglish[1] = "The Book of the priests of Eldan"
        BookEnglish[2] = "The Novice:"
        BookEnglish[3] = "-- not written yet --"
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
