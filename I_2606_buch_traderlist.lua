--Händlerverzeichnis
function UseItem(User,SourceItem,TargetItem,Counter,Param)


if (checkFirst==nil) then
   BookGerman={};
   BookEnglish={};

--Zum hinzufügen anderer Kapitel nur BookGerman bzw BookEnglish ergänzen

-- Deutsche Bucheinträge hinzu fügen
BookGerman[1] = "Öffentliches Haendlerverzeichnis von Gobiath"
BookGerman[2] = "Zathroth - Troll's Bane"
BookGerman[3] = "Zaruk - Harbour"
BookGerman[4] = "Tony Baggins - Troll's Bane"
BookGerman[5] = "Todd Baggins - Greenbriar"
BookGerman[6] = "Sorgan Stonemate - Troll's Bane"
BookGerman[7] = "Sam - Grey Rose Castle"
BookGerman[8] = "Ramond - Graveyard"
BookGerman[9] = "Floro Baggins - Greenbriar"
BookGerman[10] = "Elinas - Vanima"
--Ende deutsche Bucheinträge

--Englische Bucheinträge hinzu fügen
BookEnglish[1] = "Public Trader Index Of Gobiath"
BookEnglish[2] = "Zathroth - Troll's Bane"
BookEnglish[3] = "Zaruk - Harbour"
BookEnglish[4] = "Tony Baggins - Troll's Bane"
BookEnglish[5] = "Todd Baggins - Greenbriar"
BookEnglish[6] = "Sorgan Stonemate - Troll's Bane"
BookEnglish[7] = "Sam - Grey Rose Castle"
BookEnglish[8] = "Ramond - Graveyard"
BookEnglish[9] = "Floro Baggins - Greenbriar"
BookEnglish[10] = "Elinas - Vanima"
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

end  -- function