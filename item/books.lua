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
local common = require("base.common")

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
        elseif index == 2 and maxPage > page then
            readBook(user, book, page+1)
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

    if page == 1 and maxPage == page then
        user:requestMessageDialog(dialog2)
    else
        user:requestSelectionDialog(dialog)
    end
end

function M.UseItem(User, SourceItem)

    -- alchemy book; DO NOT CHANGE! STARTER PACK RELEVANT!
    if SourceItem.id == 2622 then
        User:sendBook(101)
        return
    end
    -- alchemy end

    if SourceItem:getData("granorsHut") ~= "" then
        granorsHut.readingBook(User)
        return
    end

    local book = SourceItem:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            User:sendBook(id_266_bookshelf.bookList[book].bookId)
        end
    end

    local isWritten = SourceItem:getData("pageCount")

    if not common.IsNilOrEmpty(isWritten) then
        readBook(User, SourceItem)
    end

end

function M.LookAtItem(User,Item)
    local book = Item:getData("book")
    if book ~= "" then
        if book ~= nil then
            if id_266_bookshelf.bookList[book] ~= nil then
                lookat.SetSpecialName(Item,id_266_bookshelf.bookList[book].german,id_266_bookshelf.bookList[book].english)
            end
        end
    end
    return lookat.GenerateLookAt(User, Item, 0)
end

return M
