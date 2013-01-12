-- Buch für das Druidensystem
-- Buch "Alchemie 2"
-- Falk
require("base.books")
require("base.common")

module("druid.item.id_128_book_plants", package.seeall)

-- UPDATE common SET com_script='druid.item.id_128_book_plants' WHERE com_itemid = 128;

function UseItem( User, SourceItem, TargetItem, ltstate )
--User:inform("debug 128-1")
    if base.books.InitBook() then
        base.books.AddLanguage("common language",0);
--      base.books.AddGermanBookText("<german site content>",<itemid>,<difficult>,<book data value>);

        base.books.AddGermanBookText("Druiden-Almanach\n\nBuch 2\n\nEinfï¿½hrung in die Pflanzenwelt",1008,0,0);
        base.books.AddGermanBookText("Einblï¿½ttrige Vierbeere\n\nStandort:\nWiese\n\nHaupterntezeit:\nFrï¿½hling, Sommer\n\nenthï¿½lt:\nDracolin,Adrazin",133,0,0);
        base.books.AddGermanBookText("Sonnenkraut\n\nStandort:\nWiese,Blume\n\nHaupterntezeit:\nFrï¿½hling, Sommer\n\nenthï¿½lt:\nAdrazin,Hyperborelium",133,0,0);
        base.books.AddGermanBookText("Vierblï¿½ttrige Einbeere\n\nStandort:\n Wiese,Schilf\n\nHaupterntezeit:\nWinter\n\nenthï¿½lt:\nAdrazin,Fenolin",134,0,0);
        base.books.AddGermanBookText("Gelbkraut\n\nStandort:\nWiese,Blume\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nAdrazin,Caprazin",135,0,0);
        base.books.AddGermanBookText("Wutbeere\n\nStandort:\nDreck,Hecken\n\nHaupterntezeit:\nHerbst, Winter\n\nenthï¿½lt:\nAdrazin,Dracolin",136,0,0);
        base.books.AddGermanBookText("Flammkelchblï¿½te\n\nStandort:\nSand,Blume\n\nHaupterntezeit:\nWinter\n\nenthï¿½lt:\nEcholon,Hyperborelium",137,0,0);
        base.books.AddGermanBookText("Nachtengelsblï¿½te\n\nStandort:\nDreck,Blume\n\nHaupterntezeit:\nSommer\n\nenthï¿½lt:\nEcholon,Fenolin",138,0,0);
        base.books.AddGermanBookText("Donfblatt\n\nStandort:\nWald,Farn\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nEcholon,Caprazin",140,0,0);
        base.books.AddGermanBookText("Schwarze Distel\n\nStandort:\nSand,Gras\n\nHaupterntezeit:\nSommer\n\nenthï¿½lt:\nEcholon,Dracolin",141,0,0);
        base.books.AddGermanBookText("Sandbeere\n\nStandort:\nSand,Hecken\n\nHaupterntezeit:\nHerbst\n\nenthï¿½lt:\nOrcanol,Hyperborelium",142,0,0);
        base.books.AddGermanBookText("Wiesen-Rhabarber\n\nStandort:\nWiese\n\nHaupterntezeit:\nSommer\n\nenthï¿½lt:\nOrcanol,Fenolin",153,0,0);
        base.books.AddGermanBookText("Jungfernkraut\n\nStandort:\nWald,Blume\n\nHaupterntezeit:\nWinter\n\nenthï¿½lt:\nOrcanol,Caprazin",144,0,0);
        base.books.AddGermanBookText("Heideblï¿½te\n\nStandort:\nWiese,Gras\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nOrcanol,Dracolin",145,0,0);
        base.books.AddGermanBookText("Wüstenhimmelskapsel\n\nStandort:\nSand\n\nHaupterntezeit:\nHerbst\n\nenthï¿½lt:\nIllidrium,Hyperborelium",146,0,0);
        base.books.AddGermanBookText("Trugblï¿½te\n\nStandort:\nWald\n\nHaupterntezeit:\nSommer, Herbst\n\nenthï¿½lt:\nIllidrium,Fenolin",148,0,0);
        base.books.AddGermanBookText("Firnisblï¿½te\n\nStandort:\nFels,Blume\n\nHaupterntezeit:\nSommer\n\nenthï¿½lt:\nIllidrium,Caprazin",148,0,0);
        base.books.AddGermanBookText("Frommbeere\n\nStandort:\nDreck\n\nHaupterntezeit:\nHerbst,Winter\n\nenthï¿½lt:\nIllidrium,Dracolin",136,0,0);
        base.books.AddGermanBookText("Lebenswurz\n\nStandort:\nverschieden\n\n\nHaupterntezeit:\nganzjï¿½hrig selten\n\nenthï¿½lt:\nHyperborelium,Adrazin",152,0,0);
        base.books.AddGermanBookText("Fussblatt\n\nStandort:\nWiese,Fels\nFarn\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nHyperborelium,Echolon",153,0,0);
        base.books.AddGermanBookText("Wasserblï¿½te\n\nStandort:\nWiese\n\n\nHaupterntezeit:\nWinter\n\nenthï¿½lt:\nHyperborelium,Orcanol",137,0,0);
        base.books.AddGermanBookText("Wolfsfarn\n\nStandort:\nWald\n\nHaupterntezeit:\nHerbst\n\nenthï¿½lt:\nHyperborelium,Illidrium",156,0,0);
        base.books.AddGermanBookText("Steppenfarn\n\nStandort:\nSand,Farn\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nFenolin,Adrazin",156,0,0);
        base.books.AddGermanBookText("Altweiberkraut\n\nStandort:\nWald\n\n\nHaupterntezeit:\nWinter\n\nenthï¿½lt:\nCaprazin,Illidrium",144,0,0);
        base.books.AddGermanBookText("Schwefelkraut\n\nStandort:\nFels\n\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nFenolin,Orcanol",135,0,0);
        base.books.AddGermanBookText("Tagteufel\n\nStandort:\nWald\n\n\nHaupterntezeit:\nHerbsr\n\nenthï¿½lt:\nFenolin,Illidrium",138,0,0);
        base.books.AddGermanBookText("Rauchblatt\n\nStandort:\nWald\n\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nCaprazin,Adrazin",140,0,0);
        base.books.AddGermanBookText("Blaue Vogelbeere\n\nStandort:\nWiese\n\n\nHaupterntezeit:\nWinter\n\nenthï¿½lt:\nCaprazin,Echolon",134,0,0);
        base.books.AddGermanBookText("Graue Distel\n\nStandort:\nSand\n\nHaupterntezeit:\nSommer\n\nenthï¿½lt:\nCaprazin,Orcanol",141,0,0);
        base.books.AddGermanBookText("Wï¿½stenbeere\n\nStandort:\nSand\n\n\nHaupterntezeit:\nHerbst\n\nenthï¿½lt:\nDracolin,Echolon",142,0,0);
        base.books.AddGermanBookText("Regenkraut\n\nStandort:\nWiese\n\n\nHaupterntezeit:\nFrï¿½hjahr\n\nenthï¿½lt:\nDracolin,Orcanol",145,0,0);
        base.books.AddGermanBookText("Gottesblume\n\nStandort:\nSand\n\nHaupterntezeit:\nSommer\n\nenthï¿½lt:\nDracolin,Illidrium",146,0,0);
        base.books.AddGermanBookText("Feuerwurz\n\nStandort:\nSand\n\nHaupterntezeit:\nganzjï¿½hrig\n\nenthï¿½lt:\nFenolin,Echolon",152,0,0);
        ---
--      base.books.AddEnglishBookText("<English site content>",<itemid>,<difficult>,<book data value>);
        base.books.AddEnglishBookText("Druid-Almanac\n\nbook 2\n\nGuide Book Into The World Of Plants",1008,0,0);
        base.books.AddEnglishBookText("Oneleaved Fourberry\n\nhabitat:\nmeadows\n\nmajor harvest time:\nspring, summer\n\ncontains:\nDracolin,Adrazin",133,0,0);
        base.books.AddEnglishBookText("Sun Herb\n\nhabitat:\nmeadows,flowers\n\nmajor harvest time:\nspring, summer\n\ncontains:\nAdrazin,Hyperborelium",133,0,0);
        base.books.AddEnglishBookText("Four-Leaved Oneberry\n\nhabitat:\nmeadows,reed\n\nmajor harvest time:\nwinter\n\ncontains:\nAdrazin,Fenolin",134,0,0);
        base.books.AddEnglishBookText("Yellow Weed\n\nhabitat:\nmeadows,flowers\n\nmajor harvest time:\nspring\n\ncontains:\nAdrazin,Caprazin",135,0,0);
        base.books.AddEnglishBookText("Angerberry\n\nhabitat:\ndirt,hedges\n\nmajor harvest time:\nfall, winter\n\ncontains:\nAdrazin,Dracolin",136,0,0);
        base.books.AddEnglishBookText("Flamegoblet-Blossom\n\nhabitat:\nsand,flowers\n\nmajor harvest time:\nwinter\n\ncontains:\nEcholon,Hyperborelium",137,0,0);
        base.books.AddEnglishBookText("Darkangel-Blossom\n\nhabitat:\ndirt,flowers\n\nmajor harvest time:\nsummer\n\ncontains:\nEcholon,Fenolin",138,0,0);
        base.books.AddEnglishBookText("Donf Blade\n\nhabitat:\nforest,fern\n\nmajor harvest time:\nspring\n\ncontains:\nEcholon,Caprazin",140,0,0);
        base.books.AddEnglishBookText("Black Thirstel\n\nhabitat:\nsand,gras\n\nmajor harvest time:\nsummer\n\ncontains:\nEcholon,Dracolin",141,0,0);
        base.books.AddEnglishBookText("Sandberry\n\nhabitat:\nsand,hedges\n\nmajor harvest time:\nfall\n\ncontains:\nOrcanol,Hyperborelium",142,0,0);
        base.books.AddEnglishBookText("Red Elderberry\n\nhabitat:\nmeadows,hedges\n\nmajor harvest time:\nfall\n\ncontains:\nOrcanol,Fenolin",143,0,0);
        base.books.AddEnglishBookText("Virgins Weed\n\nhabitat:\nforest,flowers\n\nmajor harvest time:\nwinter\n\ncontains:\nOrcanol,Caprazin",144,0,0);
        base.books.AddEnglishBookText("Heath Flower\n\nhabitat:\nmeadows,gras\n\nmajor harvest time:\nspring\n\ncontains:\nOrcanol,Dracolin",145,0,0);
        base.books.AddEnglishBookText("Desert Sky Capsule\n\nhabitat:\nsand\n\n\nmajor harvest time:\nfall\n\ncontains:\nIllidrium,Hyperborelium",146,0,0);
        base.books.AddEnglishBookText("Con Blossom\n\nhabitat:\nforest\n\nmajor harvest time:\nsummer, fall\n\ncontains:\nIllidrium,Fenolin",148,0,0);
        base.books.AddEnglishBookText("Firnisblossom\n\nhabitat:\nrocks,meadow\n\nmajor harvest time:\nsummer\n\ncontains:\nIllidrium,Caprazin",148,0,0);
        base.books.AddEnglishBookText("Pious Berry\n\nhabitat:\ndirt\n\nmajor harvest time:\nfall, winter\n\ncontains:\nIllidrium,Dracolin",136,0,0);
        base.books.AddEnglishBookText("Liferoot\n\nhabitat:\nrocks\n\n\nmajor harvest time:\nall-season\n\ncontains:\nHyperborelium,Adrazin",152,0,0);
        base.books.AddEnglishBookText("Foot Leaf\n\nhabitat:\nmeadows,fern\n\nmajor harvest time:\nspring\n\ncontains:\nHyperborelium,Echolon",153,0,0);
        base.books.AddEnglishBookText("Water Blossom\n\nhabitat:\nmeadows\n\n\nmajor harvest time:\nwinter\n\ncontains:\nHyperborelium,Orcanol",137,0,0);
        base.books.AddEnglishBookText("Wolferine Fern\n\nhabitat:\nforest\n\nmajor harvest time:\nsummer\n\ncontains:\nHyperborelium,Illidrium",156,0,0);
        base.books.AddEnglishBookText("Steppe Fern\n\nhabitat:\nsand,fern\n\nmajor harvest time:\nspring\n\ncontains:\nFenolin,Adrazin",156,0,0);
        base.books.AddEnglishBookText("Gossamer Weed\n\nhabitat:\nforest\n\n\nmajor harvest time:\nwinter\n\ncontains:\nCaprazin,Illidrium",144,0,0);
        base.books.AddEnglishBookText("Sulfur Weed\n\nhabitat:\nrock\n\n\nmajor harvest time:\nspring\n\ncontains:\nFenolin,Orcanol",135,0,0);
        base.books.AddEnglishBookText("Daydevil\n\nhabitat:\nforest\n\n\nmajor harvest time:\nfall\n\ncontains:\nFenolin,Illidrium",138,0,0);
        base.books.AddEnglishBookText("Reek Leave\n\nhabitat:\nforest\n\n\nmajor harvest time:\nspring\n\ncontains:\nCaprazin,Adrazin",140,0,0);
        base.books.AddEnglishBookText("Blue Birdsberry\n\nhabitat:\nmeadows\n\n\nmajor harvest time:\nwinter\n\ncontains:\nCaprazin,Echolon",134,0,0);
        base.books.AddEnglishBookText("Grey Thirstle\n\nhabitat:\nsand,mushroom circles\n\nmajor harvest time:\nsummer\n\ncontains:\nCaprazin,Orcanol",141,0,0);
        base.books.AddEnglishBookText("Desert Berry\n\nhabitat:\nsand\n\n\nmajor harvest time:\nfall\n\ncontains:\nDracolin,Echolon",142,0,0);
        base.books.AddEnglishBookText("Rain Weed\n\nhabitat:\nmeadows\n\n\nmajor harvest time:\nwinter\n\ncontains:\nDracolin,Orcanol",145,0,0);
        base.books.AddEnglishBookText("Godsflower\n\nhabitat:\nsand\n\nmajor harvest time:\nsummer\n\ncontains:\nDracolin,Illidrium",146,0,0);
        base.books.AddEnglishBookText("Fire root\n\nhabitat:\nsand\n\nmajor harvest time:\nall-season\n\ncontains:\nFenolin,Echolon",152,0,0);
   end
   base.books.SendBookPage(User,SourceItem.data,Counter);
end

function UseItemWithField( User, SourceItem, TargetPos, ltstate )
--User:inform("debug 128-2")
  world:erase(SourceItem,1)
end

function UseItemWithCharacter( User, SourceItem, TargetCharacter, ltstate )
--User:inform("debug 128-3")
  world:erase(SourceItem,1)
end

function LookAtItem( User, Item )
--User:inform("debug 128-4")
   if base.books.InitTitle() then
      base.books.AddGermanBookTitle("Buch mit dem Titel \"Druiden-Almanach Band 2\"",128,0);
      base.books.AddEnglishBookTitle("Book with the title \"Alchemy 2\"",128,0);
   end
   base.books.GetBookItemInform(User,Item);
end
