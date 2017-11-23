--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- UPDATE items SET itm_script='item.id_266_bookshelf' WHERE itm_id IN (266, 267);

local common = require("base.common")
local lookat = require("base.lookat")
local learnMagic = require("magic.learnMagic")
local elesil_dalewon_223 = require("quest.elesil_daelwon_223_runewick")

local M = {}

local maximumBooksPerShelf = 10

local bookBlackHeavy = 2620
local bookBlackLong = 110
local bookBlackOrdinary = 2621
local bookBlackRedRune = 2619
local bookBlackRedRuneHeavy = 130
local bookBlackSilverLong = 2605
local bookBlackSilverSquare = 2604
local bookBlackSmallHeavy = 117
local bookBlackSmallLong = 128
local bookBlackValuable = 109
local bookBlueOrnament = 105
local bookBlueRedLandscape = 2608
local bookBlueRedLong = 2606
local bookBlueSilverLandscape = 2609
local bookBlueSilverLong = 2610
local bookBrown = 107
local bookBrownSmall = 127
local bookCyanBooklet = 2598
local bookCyanBottle = 106
local bookGreenLight = 114
local bookGreenLong = 115
local bookGreyLandscape = 2617
local bookGreyLargeHeavy = 116
local bookletBlue = 129
local bookletBlueRed = 2607
local bookletPink = 112
local bookletYellow = 2616
local bookRedBooklet = 2602
local bookRedHeavy = 111
local bookRedHigh = 108
local bookRedLight = 113
local bookTreasureMap = 505
local bookWhiteRune = 2622
local bookYellow = 2615
local bookYellowVeryHeavy = 131
local pell = 3110
local pellOpen = 3109

M.bookList = {}
M.bookList["cadomyr_on_cadomyr"] = {english = "Cadomyr, Most Faithful",german =  "Cadomyr, unsere treueste", bookId = 1, bookGraphic = bookBrown}
M.bookList["cadomyr_on_galmair"] = {english = "Galmair, the Others from the North",german =  "Galmair, die Anderen vom Norden", bookId = 2, bookGraphic = bookBrown}
M.bookList["cadomyr_on_runewick"] = {english = "Runewick, the Others from the East",german =  "Runewick, die Anderen vom Osten", bookId = 3, bookGraphic = bookBrown}
M.bookList["galmair_on_cadomyr"] = {english = "Cadomyr, by Torbus Nonak",german =  "Cadomyr, von Torbus Nonak", bookId = 4, bookGraphic = bookBlackLong}
M.bookList["galmair_on_galmair"] = {english = "Galmair, by Torbus Nonak",german =  "Galmair, von Torbus Nonak", bookId = 5, bookGraphic = bookBlackLong}
M.bookList["galmair_on_runewick"] = {english = "Runewick, by Torbus Nonak",german =  "Runewick, von Torbus Nonak", bookId = 6, bookGraphic = bookBlackLong}
M.bookList["runewick_on_cadomyr"] = {english = "Cadomyr, Cottages of Blood and Honour",german =  "Cadomyr, Hütten des Blutes und der Ehre", bookId = 7, bookGraphic = bookBlueSilverLong}
M.bookList["runewick_on_galmair"] = {english = "Galmair, Burrow of Lies and Coins",german =  "Galmair, Erdhöhle der Lügen und Münzen", bookId = 8, bookGraphic = bookBlueSilverLong}
M.bookList["runewick_on_runewick"] = {english = "Runewick, Towers of Wisdom and Power",german =  "Runewick, Türme der Weisheit und Macht", bookId = 9, bookGraphic = bookBlueSilverLong}
M.bookList["gods1"] = {english = "The Big Lore of Illarion's Gods",german =  "Almanach der Götter Illarions", bookId = 10, bookGraphic = bookRedHeavy}
M.bookList["gods2"] = {english = "Gods of Illarion",german =  "Illarions Götterwelt", bookId = 11, bookGraphic = bookRedLight}
M.bookList["gods3"] = {english = "My First Lore of the Gods",german =  "Meine erste Götterkunde", bookId = 12, bookGraphic = bookletBlue}
M.bookList["statute_book_of_runewick"] = {english = "Statute Book of Runewick (outdated)",german =  "Gesetzesbuch von Runewick (veraltet)", bookId = 13, bookGraphic = bookBlueOrnament}
M.bookList["chronicles_of_galmair"] = {english = "The Chronicles of Galmair",german =  "Die Chroniken von Galmair", bookId = 14, bookGraphic = bookBlackSmallHeavy}
M.bookList["history_of_runewick"] = {english = "History of Runewick",german =  "Geschichte von Runewick", bookId = 15, bookGraphic = bookBlueSilverLong}
M.bookList["calendar"] = {english = "Something About the Calendar",german =  "Einiges über den Kalender", bookId = 16, bookGraphic = bookGreyLargeHeavy}
M.bookList["cultures_of_the_humans"] = {english = "Cultures of the Humans",german =  "Kulturgeschichte des Menschen", bookId = 17, bookGraphic = bookBlackOrdinary}
M.bookList["elven_history_and_culture"] = {english = "Elven History and Culture",german =  "Elfische Geschichte und Kultur", bookId = 18, bookGraphic = bookCyanBottle}
M.bookList["halfling_culture_and_history"] = {english = "Halfling Culture and History",german =  "Kultur und Geschichte der Halblinge", bookId = 19, bookGraphic = bookBlueRedLong}
M.bookList["dwarven_history_and_culture"] = {english = "Dwarven History and Culture",german =  "Die Geschichte und Kultur der Zwerge", bookId = 20, bookGraphic = bookletBlueRed}
M.bookList["lizardmen_history_and_culture"] = {english = "Lizardmen History and Culture",german =  "Die Echsenmenschen", bookId = 21, bookGraphic = bookRedBooklet}
M.bookList["orcish_history_and_culture"] = {english = "Orcish History and Culture",german =  "Orkische Geschichte und Kultur", bookId = 22, bookGraphic = bookBlackValuable}
M.bookList["god_malachin"] = {english = "Malachín - God of Battle and Hunting",german =  "Malachín - Gott der Jagd", bookId = 23, bookGraphic = bookBlackSmallLong}
M.bookList["god_sirani"] = {english = "Sirani - Goddess of Love and Pleasure",german =  "Sirani - Göttin der Liebe", bookId = 24, bookGraphic = bookBlackSmallLong}
M.bookList["god_zhambra"] = {english = "Zhambra - God of Friendship",german =  "Zhambra - Gott der Freundschaft", bookId = 25, bookGraphic = bookBlackSmallLong}
M.bookList["zodiac_sign"] = {english = "The Zodiac Sign of Illarion",german =  "Die Tierkreiszeichen", bookId = 26, bookGraphic = bookYellowVeryHeavy}
M.bookList["alchemy"] = {english = "Book of Alchemy",german =  "Buch der Alchemie", bookId = 101, bookGraphic = bookWhiteRune}
M.bookList["journal_of_abbot_elzechiel"] = {english = "Journal of Abbot Elzechiel",german =  "Tagebuch des Abtes Elzechiel", bookId = 201, bookGraphic = pell}
M.bookList["a_hermit_on_the_lookout_for_eldan"] = {english = "A Hermit on the Lookout for Eldan",german =  "Einsiedler auf der Suche nach Eldan", bookId = 301, bookGraphic = bookletPink}
M.bookList["a_question_of_honour"] = {english = "A Question of Honour",german =  "Eine Frage der Ehre", bookId = 302, bookGraphic = bookBlackSmallHeavy}
M.bookList["a_tale_of_brothers"] = {english = "A Tale of Brothers",german =  "Die Geschichte zweier Brüder", bookId = 303, bookGraphic = bookCyanBooklet}
M.bookList["about_the_humans_by_thomas_berryard"] = {english = "About the Humans",german =  "Über die Menschen", bookId = 304, bookGraphic = bookGreenLong}
M.bookList["baros_bigfoot_and_the_pride"] = {english = "Baros Bigfoot and the Pride",german =  "Baros Großfuß und der Hochmut", bookId = 305, bookGraphic = bookBlueRedLandscape}
M.bookList["brewyn_the_liar"] = {english = "Brewyn the Liar",german =  "Brewyn der Lügner", bookId = 306, bookGraphic = bookBlackSilverLong}
M.bookList["chronicle_recording_of_the_blumfussens_family_tree"] = {english = "The Blumfussens Family Tree",german =  "Der Stamm der Blumfußens", bookId = 307, bookGraphic = bookGreenLight}
M.bookList["diary_of_noira_liv"] = {english = "The Diary of Noira Liv",german =  "Das Tagebuch von Noira Liv", bookId = 308, bookGraphic = bookletBlue}
M.bookList["findaril_daughter_of_the_wind"] = {english = "Findaril, Daughter of the Wind",german =  "Findaril, Tochter des Windes", bookId = 309, bookGraphic = bookBlueSilverLandscape}
M.bookList["petition_in_the_name_of_findari"] = {english = "Petition in the Name of Findari",german =  "Gebet im Namen Findari", bookId = 310, bookGraphic = pell}
M.bookList["story_of_urubur"] = {english = "The Story of Urubur",german =  "Die Geschichte Urubur", bookId = 311, bookGraphic = bookWhiteRune}
M.bookList["parchment_of_the_priests_of_eldan"] = {english = "Parchment of the Priests of Eldan",german =  "Das Pergament der Priester Eldans", bookId = 312, bookGraphic = pell}
M.bookList["making_candles"] = {english = "Making Candles",german =  "Kerzenherstellung", bookId = 313, bookGraphic = pell}
M.bookList["blud_an_fiar_ork_magik"] = {english = "Blud an Fiar, Ork Magik",german =  "Blut und Feuer, orkische Magie", bookId = 314, bookGraphic = bookBlackRedRuneHeavy}
M.bookList["book_of_jokes"] = {english = "The Book of Jokes",german =  "Das Buch der Witze", bookId = 315, bookGraphic = bookletYellow}
M.bookList["fragment_of_the_manrok_chronicles"] = {english = "Fragment of the Manrok Chronicles",german =  "Fragment der Manrok-Chroniken", bookId = 316, bookGraphic = bookBlackSmallLong}
M.bookList["the_one"] = {english = "The One!",german =  "Der Eine!", bookId = 317, bookGraphic = pell}
M.bookList["art_of_trade"] = {english = "The Art of Trade",german =  "Die Kunst des Handels", bookId = 318, bookGraphic = bookBlackSilverSquare}
M.bookList["articles_greenbriar"] = {english = "The Articles of Greenbriar",german =  "Die Satzung Greenbriars", bookId = 319, bookGraphic = bookYellow}
M.bookList["craftman_story"] = {english = "A Craftman Story",german =  "Eine Handwerker Geschichte", bookId = 320, bookGraphic = bookRedHigh}
M.bookList["demonologist"] = {english = "The Demonologist",german =  "Der Dämonologe", bookId = 321, bookGraphic = bookBlackLong}
M.bookList["dwarven_poems"] = {english = "Dwarven Poems",german =  "Zwergisches Liedgut", bookId = 322, bookGraphic = bookBlackSilverSquare}
M.bookList["fairy"] = {english = "Fairies",german =  "Feen", bookId = 323, bookGraphic = bookRedBooklet}
M.bookList["glorification_to_irmorom"] = {english = "Glorification to Irmorom",german =  "Lobpreis an Irmorom", bookId = 324, bookGraphic = pellOpen}
M.bookList["lor_angur"] = {english = "Lor-Angur",german =  "Lor-Angur", bookId = 325, bookGraphic = bookBrownSmall}
M.bookList["petition_for_zelphia"] = {english = "Petition for Zelphia",german =  "Gebet für Zelphia", bookId = 326, bookGraphic = pell}
M.bookList["tales_of_a_traveller"] = {english = "Tales of a Traveller",german =  "Geschichten eines Reisenden", bookId = 327, bookGraphic = bookBlueSilverLong}
M.bookList["tihgoracs_book_of_combat"] = {english = "Book of Combat",german =  "Buch der Kampfeskunst", bookId = 328, bookGraphic = bookBlackLong}
M.bookList["epos_ignis"] = {english = "Epos Ignis",german =  "Epos Ignis", bookId = 329, bookGraphic = bookBlackSilverLong}
M.bookList["h_evergreen"] = {english = "History of the Evergreen Halflings",german =  "Geschichte der Evergreen Halflings", bookId = 330, bookGraphic = bookBlueRedLandscape}
M.bookList["the_reign_of_akaltut"] = {english = "Diary of a Naive Apprentice",german =  "Tagebuch eines Ahnungslosen", bookId = 331, bookGraphic = bookBlackSilverSquare}
M.bookList["slimes"] = {english = "Slimes: A Brief History",german =  "Schleim: Ein kurzer Abriss", bookId = 332, bookGraphic = bookGreenLong}
M.bookList["a_friend_in_need"] = {english = "A Friend in Need",german =  "Ein Freund in Not", bookId = 333, bookGraphic = pell}
M.bookList["abomination_runs_and_hides"] = {english = "An Abomination Runs and Hides",german =  "Eine Abscheulichkeit versteckt sich", bookId = 334, bookGraphic = pell}
M.bookList["akaltut_entry_riddle"] = {english = "Akaltut Entry Riddle",german =  "Akaltuts erstes Rätsel", bookId = 335, bookGraphic = pell}
M.bookList["the_read_wolf_and_the_bear"] = {english = "The Red Wolve and the Bear",german =  "Der rote Wolf und der Bär", bookId = 336, bookGraphic = bookBlackSilverLong}
M.bookList["ritual_waterelemental_wascher"] = {english = "Summoning of Pran Xixuan",german =  "Die Beschwörung von Pran Xixuan", bookId = 337, bookGraphic = bookletPink}
M.bookList["resists_the_stake"] = {english = "Resist the Stake!",german =  "Wider dem Scheiterhaufen", bookId = 338, bookGraphic = bookBlackRedRuneHeavy}
M.bookList["lecture_runewick_history"] = {english = "Lecture Runewicks History",german =  "Vortrag zur Geschichte Runewicks", bookId = 339, bookGraphic = bookRedLight}
M.bookList["in_the_name_of_nargun_or_not"] = {english = "In the Name of Nargun!.. or not?",german =  "Im Namen von Nargun! .. oder nicht?", bookId = 340, bookGraphic = bookYellow}
M.bookList["dragon_dreams"] = {english = "Dragon Dreams",german =  "Drachenträume", bookId = 341, bookGraphic = bookBlackValuable}
M.bookList["about_flame_orks"] = {english = "About Flame Orcs",german =  "Über die Flammenorks", bookId = 342, bookGraphic = bookBlueSilverLong}
M.bookList["a_nargun_mass"] = {english = "A Nargún Mass by Ishan",german =  "Eine Nargún Messe, von Ishan", bookId = 343, bookGraphic = bookletYellow}
M.bookList["a_travelers_diary"] = {english = "Megildor's Journal",german =  "Reistagebuch des Megildor", bookId = 344, bookGraphic = bookGreyLandscape}
M.bookList["letastos_diary"] = {english = "Letastos Diary",german =  "Letastos Tagebuch", bookId = 345, bookGraphic = bookBlackOrdinary}
M.bookList["alberto_dicker"] = {english = "The Pictures of Alberto Dicker",german =  "Der Bilder Alberto Dickers", bookId = 346, bookGraphic = bookRedLight}
M.bookList["book_of_jokes2"] = {english = "The Second Book of Jokes",german =  "Das zweite Buch der Witze", bookId = 347, bookGraphic = bookletYellow}
M.bookList["book_of_jokes3"] = {english = "The New Book of Jokes",german =  "Das neue Buch der Witze", bookId = 348, bookGraphic = bookletYellow}
M.bookList["constitution_runewick_44"] = {english = "Constitution of Runewick (44)",german =  "Verfassung von Runewick (44)", bookId = 349, bookGraphic = bookRedHeavy}
M.bookList["see_of_life"] = {english = "Letters Regarding the Lake of Life",german =  "Briefe bezüglich des Sees des Lebens", bookId = 350, bookGraphic = bookRedLight}
M.bookList["clansmen"] = {english = "The Clansmen",german =  "Die Sippen", bookId = 351, bookGraphic = bookBlueSilverLong}
M.bookList["barhead_kings"] = {english = "Letters from Rufus the Longfinger",german =  "Briefe von Rufus Langfinger", bookId = 352, bookGraphic = bookCyanBooklet}
M.bookList["druid_parchment"] = {english = "The Fall of the Eldan Monastery",german =  "Die Zerstörung des Kloster Eldan", bookId = 353, bookGraphic = pellOpen}
M.bookList["festival_relationships"] = {english = "The Festival of Relationship",german =  "Das Fest der Bindung", bookId = 354, bookGraphic = bookBlackOrdinary}
M.bookList["chronicles_of_galmair_2"] = {english = "The Chronicles of Galmair (38-42)",german =  "Die Chroniken von Galmair (38-42)", bookId = 355, bookGraphic = bookBlackSmallHeavy}
M.bookList["magic_gems"] = {english = "Ranks and Magical Gems",german =  "Ränge und magische Edelsteine", bookId = 356, bookGraphic = bookBlackValuable}
M.bookList["poems_marina"] = {english = "Poems from Marina",german =  "Marinas Gedichtbuch", bookId = 357, bookGraphic = bookGreenLong}
M.bookList["celegails_songbook"] = {english = "Celegails Songbook",german =  "Celagails Liederbuch", bookId = 358, bookGraphic = bookBlueRedLong}
M.bookList["marriage_broker"] = {english = "Marriage Broking of the Races",german =  "Brautwerbung im Spiegel der Völker", bookId = 359, bookGraphic = bookBlackSilverSquare}
M.bookList["onionball"] = {english = "Onionball - The Best Game in Gobaith",german =  "Zwiebelball - Das Spiel auf Gobaith", bookId = 360, bookGraphic = bookGreenLight}
M.bookList["zzarnkska"] = {english = "The Zzarn'K'Ska of Zelphia",german =  "Die Zzarn'K'Ska von Zelphia", bookId = 361, bookGraphic = bookletBlue}
M.bookList["dictionary_orc"] = {english = "A Simple Orcish Dictionary",german =  "Orkisch einfach und kompakt", bookId = 362, bookGraphic = bookBlackSilverLong}
M.bookList["dragon_bone_lord"] = {english = "The Dragons of the Bone Lord",german =  "Die Drachen des Knochenfürsten", bookId = 363, bookGraphic = bookBlackSmallHeavy}
M.bookList["revelations_of_tialdin"] = {english = "The Revelations of Tialdin",german =  "Tialdins Offenbarungen", bookId = 364, bookGraphic = bookBlueOrnament}
M.bookList["origin_halflings_race"] = {english = "The Origin of the Halfling Race",german =  "Die Entstehung der Halblinge", bookId = 365, bookGraphic = bookGreenLight}
M.bookList["cadoson_letnason"] = {english = "Cadoson and Letmason",german =  "Cadoson und Letmason", bookId = 366, bookGraphic = bookBlackLong}
M.bookList["the_pointy_end"] = {english = "The Pointy End - Manual for a Recruit",german =  "Spitzes Ende - Handbuch des Rekruten", bookId = 367, bookGraphic = bookBrownSmall}
M.bookList["broken_wreath"] = {english = "The Broken Wreath",german =  "Der zerbrochene Kranz", bookId = 368, bookGraphic = bookBlackLong}
M.bookList["statute_hamlet_greenbriar"] = {english = "Laws of the Hamlet Greenbriar (23)",german =  "Gesetze des Hamlets Greenbriar (23)", bookId = 369, bookGraphic = bookRedHeavy}
M.bookList["law_fairyland"] = {english = "Law of Fairyland",german =  "Gesetze des Feenreiches", bookId = 370, bookGraphic = bookletPink}
M.bookList["rules_galmair"] = {english = "The Rules of Galmair",german =  "Die Regeln Galmairs", bookId = 371, bookGraphic = bookRedBooklet}
M.bookList["ways_to_cherga"] = {english = "Ways to Visit Cherga",german =  "Reisen auf Chergas Pfaden", bookId = 372, bookGraphic = bookRedHigh}
M.bookList["snakehead"] = {english = "The Stone Gaze",german =  "Der steinerne Blick", bookId = 373, bookGraphic = bookYellow}
M.bookList["cumunculus"] = {english = "Cumunculus",german =  "Cumunculus", bookId = 374, bookGraphic = bookBrown}
M.bookList["vuzembi_sacred_tree"] = {english = "Sacred Tree of the Vuzembi",german =  "Der heilige Baum der Vuzembi", bookId = 375, bookGraphic = bookBlackSilverLong}
M.bookList["banana_receipes"] = {english = "Cooking with Bananas",german =  "Kochen mit Bananen", bookId = 376, bookGraphic = bookGreenLight}
M.bookList["longbeard"] = {english = "The Brothers Longbeard",german =  "Die Brüder Longbeard", bookId = 377, bookGraphic = bookBlueSilverLandscape}
M.bookList["daemons"] = {english = "Demons and their Kind",german =  "Dämonen und ihresgleichen", bookId = 378, bookGraphic = bookBlackHeavy}
M.bookList["artifacts"] = {english = "Basics of Artifact Magic",german =  "Grundwerk der Artefaktmagie", bookId = 379, bookGraphic = bookBlackRedRune}
M.bookList["tanoras_secret"] = {english = "Tanora's Secret - The Great Ocean",german =  "Tanoras Geheimnis - Der Große Ozean", bookId = 380, bookGraphic = bookBlueSilverLong}
M.bookList["good_evil"] = {english = "Good or Evil",german =  "Gut oder Böse", bookId = 381, bookGraphic = bookGreyLandscape}
M.bookList["mana_streams"] = {english = "Mana Streams",german =  "Manaströme", bookId = 382, bookGraphic = bookBlackRedRune}
M.bookList["elstree_battle"] = {english = "The Battle for the Elstree Forest",german =  "Die Schlacht um den Elsbaumwald", bookId = 383, bookGraphic = bookletBlueRed}
M.bookList["weightsandmeasures"] = {english = "Weights and Measures in Gynk",german =  "Maßeinheiten in Gynk", bookId = 384, bookGraphic = bookGreenLong}
M.bookList["guardian_dragon"] = {english = "The Guardian of the Dragons",german =  "Die Hüter der Drachen", bookId = 385, bookGraphic = bookBlackHeavy}
M.bookList["god_adron"] = {english = "Adron - God of Festivities and Wine",german =  "Adron - Gott der Feste", bookId = 386, bookGraphic = bookBlackSmallLong}
M.bookList["god_bragon"] = {english = "Brágon - God of Fire",german =  "Brágon - Gott des Feuers", bookId = 387, bookGraphic = bookBlackSmallLong}
M.bookList["god_cherga"] = {english = "Cherga - Goddess of the Underworld",german =  "Cherga - Göttin der Unterwelt", bookId = 388, bookGraphic = bookBlackSmallLong}
M.bookList["god_elara"] = {english = "Elara - Goddess of Wisdom",german =  "Elara - Göttin der Weisheit", bookId = 389, bookGraphic = bookBlackSmallLong}
M.bookList["god_eldan"] = {english = "Eldan - God of Spirit",german =  "Eldan - Gott des Geistes", bookId = 390, bookGraphic = bookBlackSmallLong}
M.bookList["god_findari"] = {english = "Findari - Goddess of Air",german =  "Findari - Göttin der Luft", bookId = 391, bookGraphic = bookBlackSmallLong}
M.bookList["god_irmorom"] = {english = "Irmorom - God of Craftsmanship",german =  "Irmorom - Gott des Handwerks", bookId = 392, bookGraphic = bookBlackSmallLong}
M.bookList["god_nargun"] = {english = "Nargùn - God of Chaos",german =  "Nargùn - Gott des Chaos", bookId = 393, bookGraphic = bookBlackSmallLong}
M.bookList["god_oldra"] = {english = "Oldra - Goddess of Life and Fertility",german =  "Oldra - Göttin der Fruchtbarkeit", bookId = 394, bookGraphic = bookBlackSmallLong}
M.bookList["god_ronagan"] = {english = "Ronagan - God of Shadows",german =  "Ronagan - Gott der Schatten", bookId = 395, bookGraphic = bookBlackSmallLong}
M.bookList["god_tanora"] = {english = "Tanora - Goddess of Water",german =  "Tanora - Göttin des Wassers", bookId = 396, bookGraphic = bookBlackSmallLong}
M.bookList["god_ushara"] = {english = "Ushara - Goddess of Earth",german =  "Ushara - Göttin der Erde", bookId = 397, bookGraphic = bookBlackSmallLong}
M.bookList["arcania_basics"] = {english = "Basics of Arcane Theory",german =  "Grundlagen arkaner Theorie", bookId = 398, bookGraphic = bookGreyLargeHeavy}
M.bookList["god_moshran"] = {english = "Moshran - God of Blood and Bones",german =  "Moshran - Gott des Blutes", bookId = 399, bookGraphic = bookBlackSmallLong}
M.bookList["zaras_defeated"] = {english = "Zaras is Defeated",german =  "Zaras ist besiegt", bookId = 400, bookGraphic = bookBlueRedLong}
M.bookList["arcane_planes"] = {english = "About the Planes",german =  "Von den Ebenen", bookId = 401, bookGraphic = bookGreyLandscape}
M.bookList["dubbels"] = {english = "Handbook of Thaumathology",german =  "Taschenbuch der Thaumatologie", bookId = 402, bookGraphic = bookletBlueRed}
M.bookList["eating_right"] = {english = "A Hafling's Guide to Eating Right",german =  "Speisen wie Halblinge", bookId = 403, bookGraphic = bookYellowVeryHeavy}
M.bookList["arcania_lizzard"] = {english = "The Magic Water, Lizards and Magic",german =  "Magisches Wasser, Echsen und Magie", bookId = 404, bookGraphic = bookWhiteRune}
M.bookList["compositionworld"] = {english = "Helmynr's Composition of the World",german =  "Der Aufbau der Welt nach Helmynr", bookId = 405, bookGraphic = bookBlueSilverLandscape}
M.bookList["letmasecret"] = {english = "Letma's Secret",german =  "Letma's Geheimnis", bookId = 406, bookGraphic = bookRedHigh}
M.bookList["singingwell"] = {english = "The Singing Well",german =  "Der singende Brunnen", bookId = 407, bookGraphic = bookBlueRedLandscape}
M.bookList["sky"] = {english = "The Sky Above Our Heads",german =  "Der Himmel über uns", bookId = 408, bookGraphic = bookBlackHeavy}
M.bookList["usharas_garden"] = {english = "Ushara's Garden",german =  "Ushara's Garten", bookId = 409, bookGraphic = bookCyanBooklet}
M.bookList["saint_cornelius"] = {english = "Letter of Saint Cornelius",german =  "Saint Cornelius's Briefe", bookId = 410, bookGraphic = bookBrownSmall}
M.bookList["magie_gift"] = {english = "The Old Path of Magic",german =  "Der alte Pfad der Magie", bookId = 411, bookGraphic = bookBlackRedRune}
M.bookList["firstaid"] = {english = "First Aid",german =  "Erste Hilfe", bookId = 412, bookGraphic = bookRedBooklet}
M.bookList["origionofmagic"] = {english = "About the Origins of Magic",german =  "Von der Herkunft der Magie", bookId = 413, bookGraphic = bookYellowVeryHeavy}
M.bookList["historysilverbrand"] = {english = "The History of Silverbrand",german =  "Die Geschichte Silberbrands", bookId = 414, bookGraphic = bookGreyLargeHeavy}
M.bookList["landillarion"] = {english = "The Land Illarion",german =  "Das Land Illarion", bookId = 415, bookGraphic = bookBlueOrnament}
M.bookList["grugmutz"] = {english = "The Legend of Grugmutz",german =  "Die Legende von Grugmutz", bookId = 416, bookGraphic = bookBrownSmall}
M.bookList["goodregent"] = {english = "The Good Regent",german =  "Der gute Regent", bookId = 417, bookGraphic = bookRedHeavy}
M.bookList["cadomyr_order1"] = {english = "Order 04. Findos 38 AW",german =  "Befehl 04. Findos 38 n.VdH", bookId = 501, bookGraphic = pell}
M.bookList["speech_rosaline_32_11_05"] = {english = "Speech 04. Findos 38 AW",german =  "Rede 05. Findos 38 n.VdH", bookId = 502, bookGraphic = pell}
M.bookList["galmair_adjutant"] = {english = "Wanted! Adjutant",german =  "Gesucht! Adjutant", bookId = 506, bookGraphic = pell}
M.bookList["galmair_charge"] = {english = "Wanted! Person in Charge",german =  "Gesucht! Ansprechpartner", bookId = 507, bookGraphic = pell}
M.bookList["galmair_cia"] = {english = "Wanted! Spies",german =  "Gesucht! Spione", bookId = 508, bookGraphic = pell}
M.bookList["galmair_diplomants"] = {english = "Wanted! Diplomats",german =  "Gesucht! Diplomaten", bookId = 509, bookGraphic = pell}
M.bookList["galmair_entertainment"] = {english = "Wanted! Entertainment",german =  "Gesucht! Unterhaltung", bookId = 510, bookGraphic = pell}
M.bookList["galmair_forces"] = {english = "Wanted! Armed Forces",german =  "Gesucht! Streitmacht", bookId = 511, bookGraphic = pell}
M.bookList["galmair_hangman"] = {english = "Wanted! Hangmans",german =  "Gesucht! Henker", bookId = 512, bookGraphic = pell}
M.bookList["galmair_headhunter"] = {english = "Wanted! Headhunters",german =  "Gesucht! Kopfgeldjäger", bookId = 513, bookGraphic = pell}
M.bookList["galmair_merchants"] = {english = "Wanted! Merchants",german =  "Gesucht! Kaufleute", bookId = 514, bookGraphic = pell}
M.bookList["galmair_priester"] = {english = "Wanted! Priests",german =  "Gesucht! Priester", bookId = 515, bookGraphic = pell}
M.bookList["galmair_translator"] = {english = "Wanted! Interpreter",german =  "Gesucht! Dolmetscher", bookId = 516, bookGraphic = pell}
M.bookList["galmair_quartermaster"] = {english = "Wanted! Quatermaster",german =  "Gesucht! Quartiermeister", bookId = 517, bookGraphic = pell}


local function questcheckFairyTale(bookNoInQuest, bookBitmap, bookName, book, user)
    if book == bookName and bit32.band (user:getQuestProgress(678),tonumber(bookBitmap)) == 0 then
        user:setQuestProgress(678, user:getQuestProgress(678) + bookBitmap) -- Book Bitmap
        user:setQuestProgress(683, user:getQuestProgress(683) + 1) -- Book found yet
        user:setQuestProgress(684, bookNoInQuest) -- Book number
        user:setQuestProgress(677, 2)
        user:inform("[Quest: Die Märchensammlung] Du hast das Märchen '" .. M.bookList[book].german .. "' gefunden. Lies sorgfältig und beantworte dann John Smith eine Frage zum Inhalt.","[Quest: The Fairy Tales Collection] You found the fairy tale '" .. M.bookList[book].english .. "'. Read carefully and answer John Smith a content related question.")
    end

end

function M.UseItem(user, item)
    local bookIds = {}

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if success then
            local selected = dialog:getSelectedIndex() + 1
            user:sendBook(bookIds[selected])
            learnMagic.readMagicBooks(user, bookIds[selected])
            elesil_dalewon_223.readBook(user, bookIds[selected])
        end
    end

    local title = common.GetNLS(user, "Bücherregal", "Bookshelf")
    local description = common.GetNLS(user, "Welches Buch möchtest du lesen?", "Which book do you want to read?")
    local dialog = SelectionDialog(title, description, callback)
    dialog:setCloseOnMove()

    for i = 1, maximumBooksPerShelf do
        local book = item:getData("book" .. i)
        if book ~= "" then
            if M.bookList[book] ~= nil then
                dialog:addOption(M.bookList[book].bookGraphic, common.GetNLS(user, M.bookList[book].german, M.bookList[book].english))
                table.insert(bookIds, M.bookList[book].bookId)
            else
                log("Illegal book '" .. book .. "' at position " .. tostring(item.pos) .. " detected.")
            end
        end
    end

    if #bookIds > 0 then
        user:requestSelectionDialog(dialog)
    end
    
    -- Akaltut Quest
    if item.pos == position(472, 839, -9) and user:getQuestProgress(526) == 15 then
        user:setQuestProgress(526, 16)
        user:inform("[Aufgabe gelöst] Kehre zu Defensor Confirmo zurück um deine Belohnung zu erhalten.","[Task solved] Return to Defensor Confirmo for your reward.")
    end
end

function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)

    local bookTitles = {german = {}, english = {}}
    for i = 1, maximumBooksPerShelf do
        local book = item:getData("book" .. i)
        if book ~= "" then
            if M.bookList[book] ~= nil then
                table.insert(bookTitles.german, M.bookList[book].german)
                table.insert(bookTitles.english, M.bookList[book].english)
                -- Fairy Tales Quest
                if user:getQuestProgress(677) == 1 then
                    questcheckFairyTale(1,1,"cumunculus",book,user)
                    questcheckFairyTale(2,2,"cadoson_letnason",book,user)
                    questcheckFairyTale(3,4,"elstree_battle",book,user)
                    questcheckFairyTale(4,8,"snakehead",book,user)
                    questcheckFairyTale(5,16,"broken_wreath",book,user)
                    questcheckFairyTale(6,32,"singingwell",book,user)
                end
            else
                log("Illegal book '" .. book .. "' at position " .. tostring(item.pos) .. " detected.")
            end
        end
    end

    if #bookTitles.german == 0 then
        lookAt.description = common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
    elseif #bookTitles.german == 1 then
        lookAt.description = common.GetNLS(user, "Hier steht ein einzelnes Buch:", "There is one single book:")
        lookAt.description = lookAt.description .. "\n" .. common.GetNLS(user, bookTitles.german[1], bookTitles.english[1])
    else
        lookAt.description = common.GetNLS(user, "Hier stehen " .. #bookTitles.german .. " Bücher:", "There are " .. #bookTitles.german .. " books here:")

        for i=1, #bookTitles.german do
            lookAt.description = lookAt.description .. "\n" .. common.GetNLS(user, bookTitles.german[i], bookTitles.english[i])
        end
    end

    return lookAt
end

return M
