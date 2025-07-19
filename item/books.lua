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

-- UPDATE items SET itm_script='item.books' WHERE itm_id = 2622;

local lookat = require("base.lookat")
local id_266_bookshelf = require("item.id_266_bookshelf")
local granorsHut = require("content.granorsHut")
local magicBook = require("magic.arcane.magicBook")
local common = require("base.common")
local music = require("item.base.music")
local drum = require("item.id_533_drum")

local readBook

local M = {}

-- 2622 is the alchemy book. dont use it otherwise.

local function getPageTextFromBook(book, pageNumber)

    local writtenText = ""

    for i = 1, 4 do
        writtenText = writtenText..book:getData("page"..pageNumber.."part"..i)
    end

    local signature = book:getData("page"..pageNumber.."signature")

    if not common.IsNilOrEmpty(signature) then
        writtenText = writtenText .. "\n~" .. signature
    end

    return writtenText
end

local function getPageInput(user, book, oldPage, maxPage)

    local callback = function (dialog)

        if (not dialog:getSuccess()) then
            return
        end

        local input = tonumber(dialog:getInput())

        if type(input) ~= "number" then
            user:inform("Die anzuzeigende Seite muss eine Zahl sein.", "The page to view must be a number.")
            readBook(user, book, oldPage)
            return
        end

        if input > maxPage then
            readBook(user, book, maxPage)
        elseif input <= 0 then
            readBook(user, book, 1)
        else
            readBook(user, book, input)
        end
    end

    user:requestInputDialog(
        InputDialog(
            common.GetNLS(user, "Seitenauswahl", "Page Select"),
            common.GetNLS(user, "Gib die Nummer der Seite ein, die du lesen möchtest, zwischen 1 und "..maxPage..".", "Enter the number of the page you want to read, between 1 and "..maxPage.."."),
            false, 255, callback))
end

function readBook(user, book, atPage)

    local bookStats = world:getItemStats(book)

    local defaultTitle = common.GetNLS(user, bookStats.German, bookStats.English)

    local title = book:getData("bookTitle")

    local maxPage = tonumber(book:getData("pageCount"))

    if common.IsNilOrEmpty(title) then
        title = defaultTitle
    end

    local author = book:getData("bookAuthor")

    local page = tonumber(atPage)

    if not page then
        page = 1
    end

    local text = getPageTextFromBook(book, page)

    text = text.."\n\n"..common.GetNLS(user, "Seite "..tostring(page).." von "..tostring(maxPage), "Page "..tostring(page).." out of "..tostring(maxPage))

    if not common.IsNilOrEmpty(author) and page == 1 then
        text = common.GetNLS(user, "Verfasst von: "..author, "Authored by: "..author).."\n\n"..text
    end

    local callback = function(dialog)

        local success = dialog:getSuccess()
        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if page > 1 and index == 1 then
            readBook(user, book, page-1)
        elseif page == 1 and maxPage > 1 and index == 1 then
            readBook(user, book, page+1)
        elseif index == 2 and maxPage > page and page ~= 1 then
            readBook(user, book, page+1)
        elseif index == 2 or index == 3 then
            getPageInput(user, book, page, maxPage)
        end
    end

    local callback2 = function(dialog)
    end

    local dialog = SelectionDialog(title, text, callback)
    local dialog2 = MessageDialog(title, text, callback2)

    --This artifical widener of 50x2 spaces is a hack to widen the dialog menu to prevent really long heights on books
    local artificalWidener = "                                                  "

    if page > 1 then
        dialog:addOption(0, artificalWidener..common.GetNLS(user, "Vorherige Seite"..artificalWidener, "Previous page"..artificalWidener))
    end

    if maxPage > page then
        dialog:addOption(0, artificalWidener..common.GetNLS(user, "Nächste Seite"..artificalWidener, "Next page"..artificalWidener))
    end

    dialog:addOption(0, artificalWidener..common.GetNLS(user, "Seitenauswahl"..artificalWidener, "Select page"..artificalWidener))

    if page == 1 and maxPage == page then
        user:requestMessageDialog(dialog2)
    else
        user:requestSelectionDialog(dialog)
    end
end

local selectedBookIndex = {}

local function viewListOfNotes(user, book, index)

    local amount = book:getData("sheet"..index.."noteAmount")

    if common.IsNilOrEmpty(amount) then
        return
    end

    local list = ""

    for i = 1, tonumber(amount) do
        local note = book:getData("sheet"..index.."note"..i)
        local duration = book:getData("sheet"..index.."noteDuration"..i)

        if book:getData("sheet"..index.."instrument") == "drum" then
            for _, sound in pairs(music.drumSounds) do
                if sound.id == tonumber(note) then
                    note = common.GetNLS(user, sound.name.german, sound.name.english)
                    break
                end
            end
        end

        list = list.."\n"..note..", "..duration..common.GetNLS(user, " Dezisekunden.", " deciseconds.")
    end

    local title = common.GetNLS(user, "Unbenanntes Notenblatt", "Unnamed sheet")
    local name = book:getData("sheet"..index.."sheetName")

    if not common.IsNilOrEmpty(name) then
        title = name
    end

    local callback = function(dialog) end

    local dialog = MessageDialog( title, list, callback)
    user:requestMessageDialog(dialog)
end

local function noteListView(user, actionState, book, instrument, index)

    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        if selected == 1 and music.instrumentIsInHandOrInFrontOfUser(user, book:getData("sheet"..index.."instrument")) then

            if instrument == "drum" then
                drum.playTheDrum(user, actionState, false, false, book, index)
            else
                music.playTheInstrument(user, actionState, false, false, instrument, book, index)
            end

        elseif selected == 2 then
            viewListOfNotes(user, book, index)
        elseif selected == 3 then
            music.playMusicTogether(user, actionState)
        end
    end

    local instruments = {"drum", "harp", "lute", "panpipe", "flute"}
    local instrumentsGerman = {"Trommel", "Harfe", "Laute", "Panflöte", "Flöte"}

    local germanName = instrument

    for i, inst in pairs(instruments) do
        if instrument == inst then
            germanName = instrumentsGerman[i]
        end
    end

    local text = common.GetNLS(user, "Das Notenblatt enthält Noten für das "..germanName..".", "The sheet contains notes for the "..instrument..".")

    local dialog = SelectionDialog(common.GetNLS(user, "Notenblatt", "Music sheet"), text, callback)

    dialog:addOption(0, common.GetNLS(user, "Lied abspielen", "Play song"))
    dialog:addOption(0, common.GetNLS(user, "Noten anzeigen", "View notes"))
    dialog:addOption(0, common.GetNLS(user, "Mit anderen Musik machen", "Play Music With Others"))

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)

end

local function selectSheetToPlay(user, book, sheetAmount, actionState)


    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for index = 1, tonumber(sheetAmount) do
            if selected == index then
                local instrument = book:getData("sheet"..index.."instrument")
                selectedBookIndex = index
                noteListView(user, actionState, book, instrument, selectedBookIndex)
            end
        end
    end

    local text = common.GetNLS(user, "Wähle ein Notenblatt zum Abspielen oder Anzeigen aus.", "Select a sheet to play or view.")

    local dialog = SelectionDialog(common.GetNLS(user, "Musikbuch", "Music book"), text, callback)

    for i = 1, tonumber(sheetAmount) do
        local name = book:getData("sheet"..i.."sheetName")
        if common.IsNilOrEmpty(name) then
            name = common.GetNLS(user, "Unbenanntes Notenblatt", "Unnamed Sheet")
        end
        dialog:addOption(0, name)
    end

    dialog:setCloseOnMove()

    user:requestSelectionDialog(dialog)
end

function M.UseItem(user, sourceItem, actionState)

    -- alchemy book; DO NOT CHANGE! STARTER PACK RELEVANT!
    if sourceItem.id == 2622 then
        user:sendBook(101)
        return
    end
    -- alchemy end
    -- magic book for casting
    if sourceItem:getData("magicBook") == "true" then
        magicBook.mainSelectionDialog(user, sourceItem)
        return
    end
    -- magic book end
    if sourceItem:getData("granorsHut") ~= "" then
        granorsHut.readingBook(user)
        return
    end

    local book = sourceItem:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            user:sendBook(id_266_bookshelf.bookList[book].bookId)
        end
    end

    local isWritten = sourceItem:getData("pageCount")

    if not common.IsNilOrEmpty(isWritten) and tonumber(isWritten) >= 1 then
        readBook(user, sourceItem)
    end

    local sheetAmount = sourceItem:getData("sheetAmount")

    if not common.IsNilOrEmpty(sheetAmount) and tonumber(sheetAmount) > 0 then
        if actionState == Action.none then
            selectSheetToPlay(user, sourceItem, sheetAmount, actionState)
        elseif actionState == Action.success then

            if _G.playtogether[user.id] and not _G.playtogether[user.id].signalGiven and _G.playtogether[user.id].waiting then
                user:startAction( 1, 0, 0, 0, 0)
                return
            end

            local instrument = sourceItem:getData("sheet"..selectedBookIndex.."instrument")

            if instrument == "drum" then
                drum.playTheDrum(user, actionState, false, false, sourceItem, selectedBookIndex)
            else
                music.playTheInstrument(user, actionState, false, false, instrument, sourceItem, selectedBookIndex)
            end
        end

    end

end

function M.LookAtItem(user, theBook)

    if not common.IsNilOrEmpty(theBook:getData("magicBook")) then
        lookat.SetSpecialName(theBook, "Grimoire", "Grimoire")
        if common.IsNilOrEmpty(theBook:getData("descriptionEn")) then -- Do not overwrite custom labels
            lookat.SetSpecialDescription(theBook, "Ein Grimoire das Magier verwenden.", "A grimoire used by mages.")
        end
    elseif not common.IsNilOrEmpty(theBook:getData("sheetAmount")) then
        lookat.SetSpecialName(theBook, "Musikbuch", "Music Book")
        lookat.SetSpecialDescription(theBook, "Ein Musikbuch, das Notenblätter speichert, die für das Spielen verschiedener Instrumente verwendet werden.", "A music book that stores music sheets used for playing different instruments.")
    else

        local book = theBook:getData("book")

        if not common.IsNilOrEmpty(book) then
            if id_266_bookshelf.bookList[book] ~= nil then
                lookat.SetSpecialName(theBook, id_266_bookshelf.bookList[book].german, id_266_bookshelf.bookList[book].english)
            end
        end
    end

    return lookat.GenerateLookAt(user, theBook, 0)
end

return M
