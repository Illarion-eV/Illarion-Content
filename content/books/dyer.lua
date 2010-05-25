require("base.books")

module("content.books.dyer", package.seeall())

-- This file contains the book data for the book "Tanner and Dyer"

function loadBook(toData)
    base.books.AddLanguage("common language",toData);
    
    base.books.AddGermanBookText("Das Trocknen von Häuten schafft eine beinahe unriechbare und scharfe Luft. Die Straßen, die den Gerberbezirk umgeben, werden von den ärmsten der Stadtbewohnern bewohnt.",0,0,toData);
    base.books.AddGermanBookText("Meister und Lehrlinge können draußen gesehen werden, wie sie das Haar und das Fleisch von den über Baumstämmen gelegten Häuten wegkratzen.",0,0,toData);
    base.books.AddGermanBookText("Die Häute werden durch Einweichen in gegärter Kleie weich gemacht.",0,0,toData);
    base.books.AddGermanBookText("Als nächstes werden die Häute nacheinander in flüssige Bäder getaucht, die aus Eichenrinde, Galläpfeln und Akazienhülsen gewonnen werden.",0,0,toData);
    base.books.AddGermanBookText("Einige Gruppen der Gesellschaft betrachten das Gerben von Tierhaut als barbarisch.",0,0,toData);
    base.books.AddGermanBookText("Mitglieder von Gilden oder religiösen Orden tragen oft Kleidung in spezifischen Farben, damit sie leichter erkannt werden können.",0,0,toData);
    base.books.AddGermanBookText("Nachdem die Schurwolle gewaschen, getrocknet und gekämmt wurde, spinnt sie der Weber an einem Spinnrad.",0,0,toData);
    base.books.AddGermanBookText("Einen Färber kann man an den Farbresten unter seinen Fingernägeln erkennen.",0,0,toData);
    base.books.AddGermanBookText("Ein Färber erhitzt einen Zuber mit Wasser über einem Feuer und fügt ungefärbten Stoff, Holzasche und verschiedene pflanzliche Farbstoffe dazu.",0,0,toData);

    base.books.AddEnglishBookText("Curing hides creates a nearly unbareable and pungent atmosphere. The streets surrounding the tanning district are inhabited by the poorest of city dwellers.",0,0,toData);
    base.books.AddEnglishBookText("Masters and apprentices alike may be seen outdoors, scraping away the hair and flesh from the skins over tree trunks.",0,0,toData);
    base.books.AddEnglishBookText("The hides are softened by soaking them in fermented bran.",0,0,toData);
    base.books.AddEnglishBookText("NeCountert, the hides go into a succession of liquid baths filled with oak bark, oak galls and acacia pods.",0,0,toData);
    base.books.AddEnglishBookText("Some sects of society view the donning of animal skins as barbaric.",0,0,toData);
    base.books.AddEnglishBookText("Members of guilds or religious orders often dress in specific colors so that they are easily recognized.",0,0,toData);
    base.books.AddEnglishBookText("After the shearings have been washed, dried, and combed, the weaver will spin the wool on a spinning wheel.",0,0,toData);
    base.books.AddEnglishBookText("A dyer is identified by the color under his nails.",0,0,toData);
    base.books.AddEnglishBookText("A dyer heats a tub of water over a fire and adds the unfinished cloth, wood ash and various plant dyes.",0,0,toData);
end;

function loadTitle(toData)
    base.books.AddGermanBookTitle("Buch mit dem Titel \"Gerber und Färber\"",toData);
    base.books.AddEnglishBookTitle("Book with the title \"Tanner and Dyer\"",toData);
end;