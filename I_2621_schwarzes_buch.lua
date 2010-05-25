-- BIG HEAVY BLACK BOOK

-- UPDATE common SET com_script='I_2621_schwarzes_buch.lua' WHERE com_itemid=2621;
-- UPDATE itemname SET itn_german='schwarzes Buch', itn_english='black book' WHERE itn_itemid=2621;
require("base.books")

function UseItem(User, SourceItem, TargetItem, Counter, Param)
    if ( TargetItem.id == 266 ) or ( TargetItem.id == 267 ) then
        world:erase(SourceItem,1);
    else
        if base.books.InitBook() then
            base.books.AddLanguage("common language",0);
            
base.books.AddGermanBookText("Handbuch der Alchemie",0,0,0);
base.books.AddGermanBookText("niedergelegt von den Mönchen des Klosters Eldan",0,0,0);
base.books.AddGermanBookText("Geheimnisse der Alchemie beschäftigen uns schon seit Generationen.",0,0,0);
base.books.AddGermanBookText("Dieses Buch soll dem geneigten Leser dabei helfen, Tränke zu brauen.",0,0,0);
base.books.AddGermanBookText("Die Geheimnisse dieses Buches sind vertraulich zu behandeln.",0,0,0);
base.books.AddGermanBookText("Tränke im Sinne dieses Buches sind Pflanzenauszüge und andere Elixiere.",0,0,0);
base.books.AddGermanBookText("Pflanzenauszüge und Elixiere dienen nicht der Ernährung.",0,0,0);
base.books.AddGermanBookText("Zur Herstellung einfacher Tränke bedarf es keiner Magie.",0,0,0);
base.books.AddGermanBookText("Jede leere Flasche ist als Behälter für Tränke geeignet.",0,0,0);
base.books.AddGermanBookText("Am Anfang der Alchemie stehen umfassende Kenntnisse der Pflanzenkunde.",0,0,0);
base.books.AddGermanBookText("Viele Pflanzen haben Inhaltsstoffe, die man für Tränke verwenden kann.",0,0,0);
base.books.AddGermanBookText("Bier ist ein Getränk, aber kein alchemistisches Gebräu",0,0,0);
base.books.AddGermanBookText("Heilpflanzen haben jeweils zwei einander ausgleichende Eigenschaften.",0,0,0);
base.books.AddGermanBookText("Die Eigenschaften in Pflanzen nennen wir ihre Wirkstoffe.",0,0,0);
base.books.AddGermanBookText("Jede Pflanze besitzt also zwei Wirkstoffe.",0,0,0);
base.books.AddGermanBookText("Jeder Trank ist von sich aus zunächst neutral, also ohne Wirkstoffe",0,0,0);
base.books.AddGermanBookText("Wirkstoffneutralität stellt man sich vor als die Mitte eines Flusses.",0,0,0);
base.books.AddGermanBookText("Zu den Ufern hin verändert sich der Wirkstoffgehalt ins Extreme",0,0,0);
base.books.AddGermanBookText("Zu einer der beiden Seiten des Flusses steigt der Gehalt ins Extreme.",0,0,0);
base.books.AddGermanBookText("Zur anderen Uferseite des Flusses sinkt der Gehalt ins Extreme.",0,0,0);
base.books.AddGermanBookText("Es gibt genau acht Wirkstoffe, jede Pflanze besitzt zwei davon.",0,0,0);
base.books.AddGermanBookText("Jede Pflanze wirkt einerseits erhöhend, andererseits senkend.",0,0,0);
base.books.AddGermanBookText("Alchemie ist eine Grundlage zum Erwerb druidischer Fähigkeiten.",0,0,0);
base.books.AddGermanBookText("Mit Erhalt der ersten Rune kann der Druide Pflanzeninhalte bestimmen.",0,0,0);
base.books.AddGermanBookText("Die zweite Rune hilft dem Druiden bei der Analyse eines Trankes.",0,0,0);
base.books.AddGermanBookText("Beim Abfüllen des Saftes in eine Flasche, Pflanze in der Hand halten.",0,0,0);
base.books.AddGermanBookText("Pflanzensaft fängt man in einer Flasche auf, die man in der Hand hält.",0,0,0);
base.books.AddGermanBookText("Durch Zusatz weiterer Extrakte lässt sich die Wirkung gezielt ändern.",0,0,0);
base.books.AddGermanBookText("Hydrazin ist ein Wirkstoffname.",0,0,0);
base.books.AddGermanBookText("In der Reihe der Wirkstoffe folgt Illidrium auf Orcanol.",0,0,0);
base.books.AddGermanBookText("Der letzte der acht Wirkstoffe heißt Dracolin.",0,0,0);
base.books.AddGermanBookText("Caprazin und Dracolin stehen nacheinander in der Wirkstoffliste.",0,0,0);
base.books.AddGermanBookText("Hyperborelium ist der erste Wirkstoff der zweiten Gruppe.",0,0,0);
base.books.AddGermanBookText("Die acht Wirkstoffe werden in zwei Vierergruppen gegliedert.",0,0,0);
base.books.AddGermanBookText("Eine pflanze kann nur einenn Wirkstoff jeder Gruppe ansprechen.",0,0,0);
base.books.AddGermanBookText("Echolon gehört wie Illidrium zur ersten Gruppe der Wirkstoffe.",0,0,0);
base.books.AddGermanBookText("Der zweite Wirkstoff der ersten Gruppe ist Echolon.",0,0,0);
base.books.AddGermanBookText("Tränke mit Wirkungen haben Nebenwirkungen.",0,0,0);
base.books.AddGermanBookText("Tränke können auch Speisen und Getränken beigemischt werden.",0,0,0);
base.books.AddGermanBookText("Es gibt Tränke, die sich zum Vergiften von Waffen und Pfeilen eignen.",0,0,0);
base.books.AddGermanBookText("Mit Tränken lassen sich Krankheitserreger erzeugen.",0,0,0);
base.books.AddGermanBookText("Ork-Fieber lautet eine häufige Diagnose.",0,0,0);
base.books.AddGermanBookText("Eine gefürchtete Seuche ist die sogenannte Wolfspest.",0,0,0);
base.books.AddGermanBookText("Der Sumpfkrampf wirkt nicht ansteckend, sagt man.",0,0,0);
base.books.AddGermanBookText("Skorpionseuche soll vor allem in Wüstengegenden verbreitet sein.",0,0,0);
base.books.AddGermanBookText("Eine noch weitgehend unerforschte Krankheit ist die Trollsucht.",0,0,0);
base.books.AddGermanBookText("Es sollen schon Menschen durch Gnom-Wahn ums Leben gekommen sein.",0,0,0);
base.books.AddGermanBookText( "Drachenpocken klingen gefährlich, tatsächlich sind sie eher lästig.",0,0,0);
base.books.AddGermanBookText("Das Vein'sche Syndrom ist eine sehr seltene Krankheit.",0,0,0);
base.books.AddGermanBookText("Hydrazin wirkt unmittelbar auf das allgemeine Gesundheitssystem.",0,0,0);
base.books.AddGermanBookText("Magier vertrauen bei Manaschwund auf Echolon.",0,0,0);
base.books.AddGermanBookText("Deinen Hunger bekämpfst du wirksam mit ein paar Tropfen Orcanol.",0,0,0);
base.books.AddGermanBookText("Illidrium wirkt in hohen Konzentrationen giftig.",0,0,0);
base.books.AddGermanBookText("Richtig dosiert ist Illidrium ein wirksames Gegengift.",0,0,0);
base.books.AddGermanBookText("Hyperborelium soll helfen, die Manieren zu verbessern.",0,0,0);
base.books.AddGermanBookText("Kenner sprechen von Fenolin als der Glücksdroge.",0,0,0);
base.books.AddGermanBookText("Prüflinge schwören auf Dracolin, wenn es um die Lernfähigkeit geht.",0,0,0);
base.books.AddGermanBookText("Eine hohe Antidosis Dracolin hilft, schlechte Erinnerungen zu tilgen.",0,0,0);
base.books.AddGermanBookText("Orcanol wurde in den Orkkriegen benutzt, um Gegner hungern zu lassen.",0,0,0);
base.books.AddGermanBookText("Starker Entzug von Fenolin kann zu vegetativen Störungen führen.",0,0,0);
base.books.AddGermanBookText("Echolonentzug wirkt fatal auf die Fähigkeiten eines Zauberers.",0,0,0);
base.books.AddGermanBookText("Alchimisten behaupten, mit Hydrazin Körperkraft beeinflussen zu können.",0,0,0);
base.books.AddGermanBookText("Der mit Echolon zu erzielende Effekt ist nicht anhaltend.",0,0,0);
base.books.AddGermanBookText("Illidrium soll aus einem dummen Schwein einen Gelehrten machen.",0,0,0);
base.books.AddGermanBookText("Ein Mangel von Fenolin soll hilflos vor magischen Einflüssen machen.",0,0,0);
base.books.AddGermanBookText("Die schnellsten Läufer Gobiaths vertrauen auf Dracolin.",0,0,0);
base.books.AddGermanBookText("Eine falsche Dosierung von Dracolin führt zu Lähmungserscheinungen",0,0,0);
base.books.AddGermanBookText("3x täglich Caprazin macht Zwerge unempfindlich gegen jedes Wetter.",0,0,0);

        end
        base.books.SendBookPage(User,SourceItem.data,Counter);
    end
end  -- function

function LookAtItem(User,Item)
    if base.books.InitTitle() then
        base.books.AddGermanBookTitle("Buch mit dem Titel \"Handbuch der Alchemie\"",0);
        
        base.books.AddEnglishBookTitle("Book with the title \"Handbook of alchemy\"",0);
    end
    base.books.GetBookItemInform(User,Item);
end
