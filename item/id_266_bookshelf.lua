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

local M = {}
M.books = {}

CODOMYR_ON_C = 1
CODOMYR_ON_G = 2
CODOMYR_ON_R = 3
GALMAIR_ON_C = 4
GALMAIR_ON_G = 5
GALMAIR_ON_R = 6
RUNEWICK_C = 7
RUNEWICK_G = 8
RUNEWICK_R = 9
GODS1 = 10
GODS2 = 11
GODS3 = 12
STATUTE_RUNEWICK = 13
CHRONICLES_GALMAIR = 14
HISTORY_RUNEWICK = 15
CALENDAR = 16
C_HUMAN = 17
C_ELVES = 18
C_HALFLING = 19
C_DWARF = 20
C_LIZARDMEN = 21
C_ORC = 22
GOD_MALACHIN = 23
GOD_SIRANI = 24
GOD_ZHAMBRA = 25
ZODIC_SIGN = 26
ALCHEMY = 101
JOURNAL_ELZECHIEL = 201
ELDAN_HERMIT = 301
QUESTION_HONOUR = 302
TALE_OF_BROTHERS = 303
HUMANS_BERRYARD = 304
BARON_BIGFOOT = 305
BREWYN = 306
BLUMFUSSENS = 307
NOIRA_LIV = 308
FINDARIL_DAUGHTER = 309
PETITION_FINDARI = 310
URUBUR = 311
ELDAN_PARCHMENT = 312
CANDLES = 313
ORCMAGES = 314
JOKES = 315
MONROK_CHRONIC = 316
ONE = 317
ART_TRADE = 318
BRIAR = 319
CRAFTMAN_STORY = 320
DEMONOLOGIST = 321
DWARVEN_POEMS = 322
FAIRY = 323
GLORI_IRMOROM = 324
LOR_ANGUR = 325
PETITION_ZELPHIA = 326
TALES_TRAVELLER = 327
TIHGARACS_COMBAT = 328
EPOS_IGNIS = 329
H_EVERGREEN = 330
REIGN_AKALTUT = 331
SLIMES = 332
FRIEND_NEED = 333
ABOMINATION_RUNS_HIDES = 334
AKALTUT_ENTRY = 335
TRAVELS_DIARY = 336
C_ORDER_1 = 501
C_SPEECH_321105 = 502
PARCH_LONGO = 503
TRAVEL_TANORAKIND = 504
WALLERY_BANK = 505
GAL_ADJUTANT = 506
GAL_CHARGE = 507
GAL_CIA = 508
GAL_DIPLO = 509
GAL_ENTERT = 510
GAL_FORCES = 511
GAL_HANGMAN = 512
GAL_HEADHUNTER = 513
GAL_MERCHANT = 514
GAL_PRIEST = 515
GAL_TRANSL = 516
GAL_QUATER = 517


function addBook(id, germanTitle, englishTitle, bookGraphic)
    M.books[id] = {german = germanTitle, english = englishTitle, graphic = bookGraphic}
end

function addBookshelf(pos, containedBooks)
    bookshelves = bookshelves or {}
    bookshelves[pos.x] = bookshelves[pos.x] or {}
    bookshelves[pos.x][pos.y] = bookshelves[pos.x][pos.y] or {}
    bookshelves[pos.x][pos.y][pos.z] = {}
    local bookshelf = bookshelves[pos.x][pos.y][pos.z]

    for i=1, #containedBooks do
        table.insert(bookshelf, containedBooks[i])
    end
end

addBook(CODOMYR_ON_C, "Cadomyr, unsere treueste", "Cadomyr, most faithful", 107)
addBook(CODOMYR_ON_G, "Galmair, die Anderen vom Norden", "Galmair, the Others from the North", 107)
addBook(CODOMYR_ON_R, "Runewick, die Anderen vom Osten", "Runewick, the Others from the East", 107)
addBook(GALMAIR_ON_C, "Cadomyr, von Torbus Nonak", "Cadomyr, by Torbus Nonak", 110)
addBook(GALMAIR_ON_G, "Galmair, von Torbus Nonak", "Galmair, by Torbus Nonak", 110)
addBook(GALMAIR_ON_R, "Runewick, von Torbus Nonak", "Runewick, by Torbus Nonak", 110)
addBook(RUNEWICK_C, "Cadomyr, Hütten des Blutes und der Ehre", "Cadomyr, Cottages of Blood and Honour", 2610)
addBook(RUNEWICK_G, "Galmair, Erdhöhle der Lügen und Münzen", "Galmair, Burrow of Lies and Coins", 2610)
addBook(RUNEWICK_R, "Runewick, Türme der Weisheit und Macht", "Runewick, Towers of Wisdom and Power", 2610)
addBook(GODS1, "Götterkunde", "Lore of the Gods", 111)
addBook(GODS2, "Illarions Götterwelt", "Gods of Illarion", 113)
addBook(GODS3, "Götterkunde", "Lore of the Gods", 3114)
addBook(STATUTE_RUNEWICK, "Gesetzesbuch von Runewick", "Statute Book of Runewick", 105)
addBook(CHRONICLES_GALMAIR, "Die Chroniken von Galmair", "The Chronicles of Galmair", 117)
addBook(HISTORY_RUNEWICK, "Geschichte von Runewick", "History of Runewick", 2610)
addBook(CALENDAR, "Einiges Wissenswertes über den Kalender", "Something about the Calendar", 116)
addBook(C_HUMAN, "Kulturgeschichte des Menschen", "Cultures of the Humans", 2621)
addBook(C_ELVES, "Elfische Geschichte und Kultur", "Elven History and Culture", 106)
addBook(C_HALFLING, "Kultur und Geschichte der Halblinge", "Halfling Culture and History", 2606)
addBook(C_DWARF, "Die Geschichte und Kultur der Zwerge", "Dwarven History and Culture", 2607)
addBook(C_LIZARDMEN, "Die Gemeinschaft der Echsenmenschen", "Lizardmen History and Culture", 2602)
addBook(C_ORC, "Orkische Geschichte und Kultur", "Orcish History and Culture", 109)
addBook(GOD_MALACHIN, "Malachín", "Malachín", 3114)
addBook(GOD_SIRANI, "Sirani", "Sirani", 3113)
addBook(GOD_ZHAMBRA, "Zhambia", "Zhambia", 3112)
addBook(ZODIC_SIGN, "Die Tierkreiszeichen", "The zodiac sign of Illarion", 131)
addBook(ALCHEMY, "Buch der Alchemie", "Book of Alchemy", 2622)
addBook(JOURNAL_ELZECHIEL, "Tagebuch des Abtes Elzechiel", "Journal of Abbot Elzechiel", 3114)
addBook(ELDAN_HERMIT, "Einsiedler auf der Suche nach Eldan", "A hermit on the lookout for Eldan", 112)
addBook(QUESTION_HONOUR, "Eine Frage der Ehre", "A Question of Honour", 117)
addBook(TALE_OF_BROTHERS, "Die Geschichte zweier Brüder", "A tale of brothers", 2598)
addBook(HUMANS_BERRYARD, "Über die Menschen", "About the Humans", 115)
addBook(BARON_BIGFOOT, "Baros Großfuß und der Hochmut", "Baros Bigfoot and the pride", 2608)
addBook(BREWYN, "Brewyn der Lügner", "Brewyn the Liar", 2605)
addBook(BLUMFUSSENS, "Die Stammbaumaufzeichnung der Blumfußens", "Chronicle recording of the Blumfußens family tree", 114)
addBook(NOIRA_LIV, "Das Tagebuch von Noira Liv", "The diary of Noira Liv", 129)
addBook(FINDARIL_DAUGHTER, "Findaril, Tochter des Windes", "Findaril, Daughter of the wind", 2609)
addBook(PETITION_FINDARI, "Gebet im Namen Findari", "Petition in the name of Findari", 3113)
addBook(URUBUR, "Die Geschichte Urubur", "The Story of Urubur", 2622)
addBook(ELDAN_PARCHMENT, "Das Pergament der Priester Eldans", "Parchment of the priests of Eldan", 3115)
addBook(CANDLES, "Kerzenherstellung", "Making Candles", 3112)
addBook(ORCMAGES, "Blut und Feuer, orkische Magie", "Blud an Fiar, Ork Magik", 130)
addBook(JOKES, "Das Buch der Witze", "The book of jokes", 2616)
addBook(MONROK_CHRONIC, "Fragment der Manrok-Chroniken", "Fragment of the Manrok Chronicles", 128)
addBook(ONE, "Der Eine!", "The One!", 3110)
addBook(ART_TRADE, "Die Kunst des Handels", "The art of trade", 2604)
addBook(BRIAR, "Die Satzung Greenbriars", "The Articles of Greenbriar", 2615)
addBook(CRAFTMAN_STORY, "Eine Handwerker Geschichte", "A craftman story", 108)
addBook(DEMONOLOGIST, "Der Dämonologe", "The Demonologist", 110)
addBook(DWARVEN_POEMS, "Zwergisches Liedgut", "Dwarven Poems", 2604)
addBook(FAIRY, "Feen", "Fairies", 2602)
addBook(GLORI_IRMOROM, "Lobpreis an Irmorom", "Glorification to Irmorom", 3115)
addBook(LOR_ANGUR, "Lor-Angur", "Lor-Angur", 127)
addBook(PETITION_ZELPHIA, "Gebet für Zelphia", "Petition for Zelphia", 3115)
addBook(TALES_TRAVELLER, "Geschichten eines Reisenden", "Tales of a traveller", 2610)
addBook(TIHGARACS_COMBAT, "Buch der Kampfeskunst", "Book of Combat", 110)
addBook(EPOS_IGNIS, "Epos Ignis", "Epos Ignis", 2605)
addBook(H_EVERGREEN, "Geschichte der Evergreen Halflings", "History of the Evergreen Halflings", 2608)
addBook(REIGN_AKALTUT, "Die Herrschaft Akaltuts: Tagebuch eines ahnungslosen Lehrlings", "The Reign of Akaltut: Diary of a Naive Apprentice", 2604)
addBook(SLIMES, "Schleim: Ein kurzer Abriss", "Slimes: A brief history", 115)
addBook(FRIEND_NEED, "Ein Freund in Not", "A Friend in Need", 3110)
addBook(ABOMINATION_RUNS_HIDES, "Eine Scheußlichkeit rennt und versteckt sich", "An Abomination Runs and Hides", 3110)
addBook(AKALTUT_ENTRY, "Akultuts erstes Rätzel", "Akaltut Entry Riddle", 3110)
addBook(TRAVELS_DIARY, "Ein Reisetagebuch", "A Traveler's Journal", 2598)
addBook(C_ORDER_1, "Befehl 04. Findos 38 n.VdH", "Order 04. Findos 38 AW", 3114)
addBook(C_SPEECH_321105, "Rede 05. Findos 38 n.VdH", "Speech 04. Findos 38 AW", 3114)
addBook(PARCH_LONGO, "Eine Nachricht", "A note", 3115)
addBook(TRAVEL_TANORAKIND, "Reisegefährten gesucht!", "Looking for travel companions!", 3113)
addBook(WALLERY_BANK, "Vincent Wallery Bank", "Vincent Wallery Bank", 3116)
addBook(GAL_CHARGE, "Gesucht! Ansprechpartner", "Wanted! Person in Charge", 3116)
addBook(GAL_CIA, "Gesucht! Spione", "Wanted! Spies", 3115)
addBook(GAL_DIPLO, "Gesucht! Diplomaten", "Wanted! Diplomats", 3112)
addBook(GAL_ENTERT, "Gesucht! Unterhaltung", "Wanted! Entertainment", 3113)
addBook(GAL_FORCES, "Gesucht! Streitmacht", "Wanted! Armed Forces", 3114)
addBook(GAL_HANGMAN, "Gesucht! Henker", "Wanted! Hangmans", 3110)
addBook(GAL_HEADHUNTER, "Gesucht! Kopfgeldjäger", "Wanted! Headhunters", 3110)
addBook(GAL_MERCHANT, "Gesucht! Kaufleute", "Wanted! Merchants", 3111)
addBook(GAL_PRIEST, "Gesucht! Priester", "Wanted! Priests", 3115)
addBook(GAL_TRANSL, "Gesucht! Dolmetscher", "Wanted! Interpreter", 3116)
addBook(GAL_ADJUTANT, "Gesucht! Adjutant", "Wanted! Adjutant", 3110)
addBook(GAL_QUATER, "Gesucht! Quartiermeister", "Wanted! Quatermaster", 3110)

addBookshelf(position(390, 185, -6), {CALENDAR, C_ORC, ORCMAGES, MONROK_CHRONIC, ONE})
addBookshelf(position(548, 547, -6), {ORCMAGES, ONE, DEMONOLOGIST})
addBookshelf(position(423, 296, -3), {C_HALFLING})
addBookshelf(position(131, 549, 0), {C_HUMAN})
addBookshelf(position(131, 551, 0), {C_ELVES})
addBookshelf(position(131, 553, 0), {C_LIZARDMEN, PETITION_ZELPHIA})
addBookshelf(position(131, 555, 0), {TIHGARACS_COMBAT})
addBookshelf(position(136, 548, 0), {C_ORDER_1, C_SPEECH_321105})
addBookshelf(position(138, 548, 0), {CODOMYR_ON_C, CODOMYR_ON_G, CODOMYR_ON_R})
addBookshelf(position(140, 548, 0), {CALENDAR, ZODIC_SIGN, CANDLES})
addBookshelf(position(140, 623, 0), {TIHGARACS_COMBAT, CALENDAR, PETITION_ZELPHIA})
addBookshelf(position(141, 550, 0), {GODS3, GOD_MALACHIN, GOD_SIRANI, GOD_ZHAMBRA,})
addBookshelf(position(141, 552, 0), {TALE_OF_BROTHERS, TALES_TRAVELLER})
addBookshelf(position(357, 224, 0), {QUESTION_HONOUR})
addBookshelf(position(359, 221, 0), {GODS2, GLORI_IRMOROM})
addBookshelf(position(360, 217, 0), {TIHGARACS_COMBAT})
addBookshelf(position(361, 221, 0), {DWARVEN_POEMS})
addBookshelf(position(362, 217, 0), {C_ORC, C_HUMAN})
addBookshelf(position(363, 221, 0), {CRAFTMAN_STORY, ART_TRADE})
addBookshelf(position(364, 217, 0), {C_DWARF, URUBUR})
addBookshelf(position(365, 222, 0), {GALMAIR_ON_C, GALMAIR_ON_G, GALMAIR_ON_R, CHRONICLES_GALMAIR})
addBookshelf(position(365, 224, 0), {ZODIC_SIGN, CALENDAR})
addBookshelf(position(375, 215, 0), {GAL_ADJUTANT, GAL_DIPLO, GAL_FORCES, GAL_CIA, GAL_CHARGE, GAL_ENTERT, GAL_HANGMAN, GAL_MERCHANT, GAL_PRIEST, GAL_TRANSL, GAL_QUATER})
addBookshelf(position(375, 217, 0), {GALMAIR_ON_C, GALMAIR_ON_G})
addBookshelf(position(375, 219, 0), {GALMAIR_ON_R, CHRONICLES_GALMAIR})
addBookshelf(position(388, 235, 0), {GALMAIR_ON_C})
addBookshelf(position(390, 238, 0), {GALMAIR_ON_G})
addBookshelf(position(390, 236, 0), {GALMAIR_ON_R})
addBookshelf(position(403, 259, 0), {GODS2, CHRONICLES_GALMAIR})
addBookshelf(position(405, 259, 0), {ALCHEMY, GLORI_IRMOROM})
addBookshelf(position(407, 259, 0), {GALMAIR_ON_C, GALMAIR_ON_G, GALMAIR_ON_R, C_DWARF,SLIMES})
addBookshelf(position(412, 289, 0), {GALMAIR_ON_G, GALMAIR_ON_C})
addBookshelf(position(698, 311, 0), {CALENDAR, BLUMFUSSENS})
addBookshelf(position(698, 319, 0), {JOKES, ALCHEMY, WALLERY_BANK})
addBookshelf(position(698, 323, 0), {PARCH_LONGO})
addBookshelf(position(901, 831, 0), {CANDLES, CRAFTMAN_STORY})
addBookshelf(position(949, 752, 0), {BLUMFUSSENS, HUMANS_BERRYARD, H_EVERGREEN, BRIAR})
addBookshelf(position(952, 756, 0), {ALCHEMY, C_HALFLING})
addBookshelf(position(86, 584, 1), {FAIRY, GOD_SIRANI})
addBookshelf(position(88, 584, 1), {CODOMYR_ON_C, CRAFTMAN_STORY})
addBookshelf(position(406, 258, 1), {GALMAIR_ON_G})
addBookshelf(position(406, 260, 1), {CHRONICLES_GALMAIR})
addBookshelf(position(402, 260, 1), {GALMAIR_ON_G})
addBookshelf(position(402, 258, 1), {GALMAIR_ON_C})
addBookshelf(position(404, 258, 1), {GALMAIR_ON_R})
addBookshelf(position(889, 835, 1), {NOIRA_LIV, CALENDAR})
addBookshelf(position(889, 754, 1), {DEMONOLOGIST})
addBookshelf(position(889, 838, 1), {ELDAN_PARCHMENT, ELDAN_HERMIT})
addBookshelf(position(890, 758, 1), {EPOS_IGNIS})
addBookshelf(position(890, 835, 1), {TALES_TRAVELLER, FAIRY})
addBookshelf(position(891, 762, 1), {ELDAN_PARCHMENT, GODS1})
addBookshelf(position(892, 754, 1), {LOR_ANGUR})
addBookshelf(position(892, 828, 1), {PETITION_ZELPHIA, GLORI_IRMOROM})
addBookshelf(position(892, 841, 1), {FINDARIL_DAUGHTER, PETITION_FINDARI})
addBookshelf(position(892, 844, 1), {GODS3, GOD_MALACHIN})
addBookshelf(position(893, 847, 1), {GODS2, GOD_SIRANI})
addBookshelf(position(894, 765, 1), {C_HALFLING, C_ELVES, STATUTE_RUNEWICK})
addBookshelf(position(895, 756, 1), {C_ORC, C_LIZARDMEN})
addBookshelf(position(896, 828, 1), {STATUTE_RUNEWICK})
addBookshelf(position(896, 847, 1), {GODS1, GOD_ZHAMBRA})
addBookshelf(position(897, 774, 1), {CANDLES})
addBookshelf(position(897, 829, 1), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(897, 833, 1), {C_HALFLING, C_ELVES})
addBookshelf(position(898, 756, 1), {C_DWARF, C_HUMAN})
addBookshelf(position(900, 828, 1), {HISTORY_RUNEWICK})
addBookshelf(position(901, 784, 1), {STATUTE_RUNEWICK, ZODIC_SIGN, TRAVEL_TANORAKIND})
addBookshelf(position(902, 761, 1), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(902, 767, 1), {STATUTE_RUNEWICK, HISTORY_RUNEWICK})
addBookshelf(position(903, 828, 1), {STATUTE_RUNEWICK})
addBookshelf(position(906, 824, 1), {TRAVEL_TANORAKIND})
addBookshelf(position(952, 756, 1), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(955, 761, 1), {CALENDAR, C_ELVES, STATUTE_RUNEWICK})
addBookshelf(position(955, 763, 1), {C_HALFLING, BLUMFUSSENS})
addBookshelf(position(897, 766, 2), {TALE_OF_BROTHERS, LOR_ANGUR})
addBookshelf(position(899, 766, 2), {HISTORY_RUNEWICK, STATUTE_RUNEWICK})
addBookshelf(position(906, 763, 2), {CALENDAR})
addBookshelf(position(955, 764, 2), {GODS1})
addBookshelf(position(943, 759, 3), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(943, 762, 3), {STATUTE_RUNEWICK})
addBookshelf(position(892, 831, 4), {BARON_BIGFOOT})
addBookshelf(position(901, 773, 4), {MONROK_CHRONIC})
addBookshelf(position(949, 757, 4), {BREWYN})
addBookshelf(position(243, 113, 0), {CODOMYR_ON_C, CODOMYR_ON_G, CODOMYR_ON_R, GALMAIR_ON_C, GALMAIR_ON_G, GALMAIR_ON_R, RUNEWICK_C, RUNEWICK_G, RUNEWICK_R, GODS1, GODS2, GODS3, STATUTE_RUNEWICK, CHRONICLES_GALMAIR, HISTORY_RUNEWICK, CALENDAR, C_HUMAN, C_ELVES, C_HALFLING, C_DWARF, C_LIZARDMEN, C_ORC, GOD_SIRANI, GOD_ZHAMBRA, ZODIC_SIGN})
addBookshelf(position(143, 111, 0), {ALCHEMY})
addBookshelf(position(241, 109, 0), {JOURNAL_ELZECHIEL})
addBookshelf(position(239, 109, 0), {ELDAN_HERMIT, QUESTION_HONOUR, TALE_OF_BROTHERS, HUMANS_BERRYARD, BARON_BIGFOOT, BREWYN, BLUMFUSSENS, NOIRA_LIV, FINDARIL_DAUGHTER, PETITION_FINDARI, URUBUR, ELDAN_PARCHMENT, CANDLES, ORCMAGES, JOKES, MONROK_CHRONIC, ONE, ART_TRADE, BRIAR, CRAFTMAN_STORY, DEMONOLOGIST, DWARVEN_POEMS, FAIRY, GLORI_IRMOROM, LOR_ANGUR, PETITION_ZELPHIA, TALES_TRAVELLER, TIHGARACS_COMBAT, EPOS_IGNIS, H_EVERGREEN})
addBookshelf(position(237, 109, 0), {C_ORDER_1, C_SPEECH_321105, PARCH_LONGO, TRAVEL_TANORAKIND, WALLERY_BANK, GAL_ADJUTANT, GAL_CHARGE, GAL_CIA, GAL_DIPLO, GAL_ENTERT, GAL_FORCES, GAL_HANGMAN, GAL_MERCHANT, GAL_PRIEST, GAL_TRANSL, GAL_QUATER})
addBookshelf(position(472, 839, -9),{REIGN_AKALTUT})




function M.LookAtItem(user, item)
    local lookAt = lookat.GenerateLookAt(user, item)

    if item:getType() == scriptItem.field then
        local pos = item.pos
        local bookshelf = getBookshelf(pos)

        if bookshelf then
            local bookCount = #bookshelf

            if bookCount == 0 then
                lookAt.description = common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
            elseif bookCount == 1 then
                lookAt.description = common.GetNLS(user, "Hier steht ein einzelnes Buch:", "There is one single book:")
                lookAt.description = lookAt.description .. "\n" .. common.GetNLS(user, M.books[bookshelf[1]].german, M.books[bookshelf[1]].english)
            else
                lookAt.description = common.GetNLS(user, "Hier stehen " .. bookCount .. " Bücher:", "There are " .. bookCount .. " books here:")

                for i=1, bookCount do
                    lookAt.description = lookAt.description .. "\n" .. common.GetNLS(user, M.books[bookshelf[i]].german, M.books[bookshelf[i]].english)
                end
            end
        else
            lookAt.description = common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
        end
    end

    return lookAt
end

function M.UseItem(user, item, target, counter, param, ltstate)
    if item:getType() ~= scriptItem.field then
        return
    end

    local pos = item.pos
    local bookshelf = getBookshelf(pos)

    if bookshelf then
        local bookCount = #bookshelf

        if bookCount == 1 then
            user:sendBook(bookshelf[1])
        elseif bookCount > 1 then
            local callback = function(dialog)
                local success = dialog:getSuccess()

                if success and isUserNextTo(user, pos) then
                    local selected = dialog:getSelectedIndex() + 1
                    user:sendBook(bookshelf[selected])
                end
            end

            local title = common.GetNLS(user, "Bücherregal", "Bookshelf")
            local description = common.GetNLS(user, "Welches Buch möchtest du lesen?", "Which book do you want to read?")
            local dialog = SelectionDialog(title, description, callback)

            for i=1, bookCount do
                dialog:addOption(M.books[bookshelf[i]].graphic, common.GetNLS(user, M.books[bookshelf[i]].german, M.books[bookshelf[i]].english))
            end

            user:requestSelectionDialog(dialog)
        end

		-- Akaltut Quest
		if item.pos == position(472, 839, -9) and user:getQuestProgress(526) == 15 then
			user:setQuestProgress(526, 16);
			user:inform("[Aufgabe gelöst] Kehre zu Defensor Confirmo zurück um deine Belohnung zu erhalten.",
						"[Task solved] Return to Defensor Confirmo for your reward.");
		end
    end
end

function getBookshelf(pos)
    return bookshelves and bookshelves[pos.x] and bookshelves[pos.x][pos.y] and bookshelves[pos.x][pos.y][pos.z]
end

function isUserNextTo(user, pos)
    return user.pos.z == pos.z and math.max(math.abs(user.pos.x - pos.x), math.abs(user.pos.y - pos.y)) <= 1
end

return M

