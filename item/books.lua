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
local cookingRecipeCreation = require("craft.cookingRecipeCreation")
local recipe_creation = require("alchemy.base.recipe_creation")

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

local selectedBookSheet = {}

local function selectSheetToPlay(user, book, sheetAmount, actionState)


    local callback = function(dialog)

        if not dialog:getSuccess() then
            return
        end

        local selected = dialog:getSelectedIndex() + 1

        for i = 1, tonumber(sheetAmount) do
            if selected == i then

                local name = book:getData("sheet"..i.."sheetName")
                local theNotes = book:getData("sheet"..i.."notes")
                local instrument = book:getData("sheet"..i.."instrument")

                selectedBookSheet[user.id] = {name = name, notes = theNotes, instrument = instrument}

                for segment = 2, 20 do
                    local addNotes = book:getData("sheet"..i.."notes"..segment)
                    selectedBookSheet[user.id]["notes"..segment] = addNotes
                end
                music.noteListView(user, actionState, selectedBookSheet[user.id])
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

    local isCookBook = not common.IsNilOrEmpty(sourceItem:getData("cookBook"))

    if isCookBook then
        cookingRecipeCreation.viewCookBook(user, sourceItem)
        return
    end

    local isAlchemyBook = not common.IsNilOrEmpty(sourceItem:getData("alchemyBook"))

    if isAlchemyBook then
        recipe_creation.viewRecipeBook(user, sourceItem, false, actionState)
        return
    end

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

            if not _G.playtogether then
                _G.playtogether = {}
            end

            if _G.playtogether[user.id] and not _G.playtogether[user.id].signalGiven and _G.playtogether[user.id].waiting then
                user:startAction( 1, 0, 0, 0, 0)
                return
            end

            music.playTheInstrument(user, actionState, selectedBookSheet[user.id])
        end

    end

end

local function convertOldBook(oldBook)

    local sheets = oldBook:getData("sheetAmount")

    for sheetNumber = 1, tonumber(sheets) do

        local amount = oldBook:getData("sheet"..sheetNumber.."noteAmount")

        local newNotes = ""

        for i = 1, tonumber(amount) do
            local duration = oldBook:getData("sheet"..sheetNumber.."noteDuration"..i)
            local note = oldBook:getData("sheet"..sheetNumber.."note"..i)

            oldBook:setData("sheet"..sheetNumber.."note"..i, "")
            oldBook:setData("sheet"..sheetNumber.."noteDuration"..i, "")

            if newNotes ~= "" then
                newNotes = newNotes..","
            end

            newNotes = newNotes..note..","..duration

        end

        oldBook:setData("sheet"..sheetNumber.."noteAmount", "")
        oldBook:setData("sheet"..sheetNumber.."notes", string.sub(newNotes, 1, 250))

        for i = 2, 20 do
            oldBook:setData("sheet"..sheetNumber.."notes"..i, string.sub(newNotes, 1+(250*i-1), 250*i))
        end

        if oldBook:getData("sheet"..sheetNumber.."instrument") ~= "drum" then
            oldBook:setData("sheet"..sheetNumber.."instrument", "notes")
        end

        world:changeItem(oldBook)
    end
end

function M.LookAtItem(user, theBook)

    if not common.IsNilOrEmpty(theBook:getData("sheet1note1")) then
        convertOldBook(theBook)
    end

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

    local isCookBook = not common.IsNilOrEmpty(theBook:getData("cookBook"))

    if isCookBook then
        lookat.SetSpecialName(theBook, "Kulinarisches Rezeptbuch", "Culinary Recipe Book")
    end

    local isAlchemyBook = not common.IsNilOrEmpty(theBook:getData("alchemyBook"))

    if isAlchemyBook then
        lookat.SetSpecialName(theBook, "Alchemierezeptbuch", "Alchemy Recipe Book")
    end

    return lookat.GenerateLookAt(user, theBook, 0)
end

return M
