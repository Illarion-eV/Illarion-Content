-- UPDATE common SET com_script='item.id_266_bookshelf' WHERE com_itemid IN (266, 267);

require("base.common")

module("item.id_266_bookshelf", package.seeall)

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
CALENDAR = 16
C_HUMAN = 17
C_ELVES = 18
C_HALFLING = 19
C_DWARF = 20
C_LIZARDMEN = 21
C_ORC = 22
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

function addBook(id, germanTitle, englishTitle, bookItemId)
    books = books or {}
    books[id] = {["german"] = germanTitle, ["english"] = englishTitle, ["itemId"] = ((bookItemId~=nil) and bookItemId or 116) }
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
addBook(CALENDAR, "Einiges Wissenswertes über den Kalender", "Something about the Calendar", 116)
addBook(C_HUMAN, "Kulturgeschichte des Menschen", "Cultures of the Humans", 2621)
addBook(C_ELVES, "Elfische Geschichte und Kultur", "Elven History and Culture", 106)
addBook(C_HALFLING, "Kultur und Geschichte der Halblinge", "Halfling Culture and History", 2606)
addBook(C_DWARF, "Die Geschichte und Kultur der Zwerge", "Dwarven History and Culture", 2607)
addBook(C_LIZARDMEN, "Die Gemeinschaft der Echsenmenschen", "Lizardmen History and Culture", 2602)
addBook(C_ORC, "Orkische Geschichte und Kultur", "Orcish History and Culture", 109)
addBook(JOURNAL_ELZECHIEL, "Tagebuch des Abtes Elzechiel", "Journal of Abbot Elzechiel", 3114)
addBook(ELDAN_HERMIT, "Einsiedler auf der Suche nach Eldan", "A hermit on the lookout for Eldan", 112)
addBook(QUESTION_HONOUR, "Eine Frage der Ehre", "A Question of Honour", 117)
addBook(TALE_OF_BROTHERS, "Die Geschichte zweier Brüder", "A tale of brothers", 2598)
addBook(HUMANS_BERRYARD, "Über die Menschen", "About the Humans", 115)
addBook(BARON_BIGFOOT, "Baros Großfuß und der Hochmut", "Baros Bigfoot and the pride", 2608)
addBook(BREWYN, "Brewyn der Lügner", "Brewyn the Liar", 2605)
addBook(BLUMFUSSENS, "Die Stammbaumaufzeichnung der Blumfußens", "Chronicle recording of the Blumfußens family tree", 114)
addBook(NOIRA_LIV, "Das Tagebuch von Noira Liv", "The diary of Noira Liv", 129)
addBook(FINDARIL_DAUGHTER, "Findaril – Tochter des Windes", "Findaril – Daughter of the wind", 2609)
addBook(PETITION_FINDARI, "Gebet im Namen Findari", "Petition in the name of Findari", 3113)
addBook(URUBUR, "Die Geschichte Urubur", "The Story of Urubur", 2622)
addBook(ELDAN_PARCHMENT, "Das Pergament der Priester Eldans", "Parchment of the priests of Eldan", 3115)
addBook(CANDLES, "Kerzenherstellung", "Making Candles", 3112)
addBook(ORCMAGES, "Blut und Feuer, orkische Magie", "Blud an Fiar, Ork Magik", 130)
addBook(JOKES, "Das Buch der Witze", "The book of jokes", 2616)
addBook(MONROK_CHRONIC, "Fragment der Manrok-Chroniken", "Fragment of the Manrok Chronicles", 128)
addBook(ONE, "Der Eine!", "The One!", 3110)

addBookshelf(position(390, 185, -6), {CALENDAR, C_ORC, ORCMAGES, MONROK_CHRONIC, ONE})
addBookshelf(position(548, 547, -6), {ORCMAGES, ONE})
addBookshelf(position(136, 548, 0), {CODOMYR_ON_C, CODOMYR_ON_G})
addBookshelf(position(138, 548, 0), {CODOMYR_ON_R})
addBookshelf(position(140, 548, 0), {CALENDAR})
addBookshelf(position(141, 522, 0), {GODS3, C_HUMAN, C_ELVES, C_LIZARDMEN, TALE_OF_BROTHERS})
addBookshelf(position(141, 550, 0), {CANDLES})
addBookshelf(position(357, 224, 0), {QUESTION_HONOUR})
addBookshelf(position(359, 221, 0), {GODS2})
addBookshelf(position(362, 217, 0), {C_ORC, C_HUMAN})
addBookshelf(position(364, 217, 0), {C_DWARF, URUBUR})
addBookshelf(position(365, 222, 0), {GALMAIR_ON_C, GALMAIR_ON_G, GALMAIR_ON_R})
addBookshelf(position(375, 215, 0), {GALMAIR_ON_C})
addBookshelf(position(375, 217, 0), {GALMAIR_ON_G})
addBookshelf(position(375, 219, 0), {GALMAIR_ON_R})
addBookshelf(position(403, 260, 0), {GODS2})
addBookshelf(position(404, 258, 0), {GALMAIR_ON_C, GALMAIR_ON_G, GALMAIR_ON_R, C_DWARF})
addBookshelf(position(698, 311, 0), {CALENDAR, BLUMFUSSENS})
addBookshelf(position(698, 319, 0), {JOKES})
addBookshelf(position(901, 831, 0), {CANDLES})
addBookshelf(position(949, 752, 0), {BLUMFUSSENS, HUMANS_BERRYARD})
addBookshelf(position(889, 835, 1), {NOIRA_LIV, CALENDAR})
addBookshelf(position(889, 838, 1), {ELDAN_PARCHMENT, ELDAN_HERMIT})
addBookshelf(position(890, 835, 1), {STATUTE_RUNEWICK})
addBookshelf(position(891, 762, 1), {ELDAN_PARCHMENT, GODS1})
addBookshelf(position(892, 841, 1), {FINDARIL_DAUGHTER, PETITION_FINDARI})
addBookshelf(position(892, 844, 1), {GODS3})
addBookshelf(position(893, 847, 1), {GODS2})
addBookshelf(position(894, 765, 1), {C_HALFLING, C_ELVES, STATUTE_RUNEWICK})
addBookshelf(position(895, 756, 1), {C_ORC, C_LIZARDMEN})
addBookshelf(position(896, 828, 1), {STATUTE_RUNEWICK})
addBookshelf(position(896, 847, 1), {GODS1})
addBookshelf(position(897, 774, 1), {CANDLES})
addBookshelf(position(897, 829, 1), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(897, 833, 1), {C_HALFLING, C_ELVES})
addBookshelf(position(898, 756, 1), {C_DWARF, C_HUMAN})
addBookshelf(position(902, 761, 1), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(902, 767, 1), {STATUTE_RUNEWICK})
addBookshelf(position(903, 828, 1), {STATUTE_RUNEWICK})
addBookshelf(position(952, 756, 1), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(955, 761, 1), {CALENDAR, C_ELVES})
addBookshelf(position(955, 763, 1), {C_HALFLING, BLUMFUSSENS})
addBookshelf(position(906, 768, 2), {CALENDAR})
addBookshelf(position(955, 764, 2), {GODS1})
addBookshelf(position(943, 759, 3), {RUNEWICK_C, RUNEWICK_G, RUNEWICK_R})
addBookshelf(position(943, 762, 3), {STATUTE_RUNEWICK})
addBookshelf(position(892, 831, 4), {BARON_BIGFOOT})
addBookshelf(position(902, 772, 4), {MONROK_CHRONIC})
addBookshelf(position(949, 757, 4), {BREWYN})


function LookAtItem(user, item)
    local lookAt = base.lookat.GenerateLookAt(user, item)
    
    if item:getType() == scriptItem.field then 
        local pos = item.pos
        local bookshelf = getBookshelf(pos)

        if bookshelf then
            local bookCount = #bookshelf

            if bookCount == 0 then
                lookAt.description = base.common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
            elseif bookCount == 1 then
                lookAt.description = base.common.GetNLS(user, "Hier steht ein einzelnes Buch:", "There is one single book:")
                lookAt.description = lookAt.description .. "\n" .. base.common.GetNLS(user, books[bookshelf[1]].german, books[bookshelf[1]].english) 
            else
                lookAt.description = base.common.GetNLS(user, "Hier stehen " .. bookCount .. " Bücher:", "There are " .. bookCount .. " books here:")
                
                for i=1, bookCount do
                    lookAt.description = lookAt.description .. "\n" .. base.common.GetNLS(user, books[bookshelf[i]].german, books[bookshelf[i]].english)
                end
            end
        else
            lookAt.description = base.common.GetNLS(user, "Dieses Regal ist leer.", "This bookshelf is empty.")
        end
    end

    world:itemInform(user, item, lookAt)
end

function UseItem(user, item, ltstate)
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
            
            local title = base.common.GetNLS(user, "Bücherregal", "Bookshelf")
            local description = base.common.GetNLS(user, "Welches Buch möchtest du lesen?", "Which book do you want to read?")
            local dialog = SelectionDialog(title, description, callback)
            
            for i=1, bookCount do
				local book = books[bookshelf[i]];
                dialog:addOption(book.itemId, base.common.GetNLS(user, book.german, book.english))
            end
            
            user:requestSelectionDialog(dialog)
        end
    end
end

function getBookshelf(pos)
    return bookshelves and bookshelves[pos.x] and bookshelves[pos.x][pos.y] and bookshelves[pos.x][pos.y][pos.z]
end

function isUserNextTo(user, pos)
    return user.pos.z == pos.z and math.max(math.abs(user.pos.x - pos.x), math.abs(user.pos.y - pos.y)) <= 1
end
