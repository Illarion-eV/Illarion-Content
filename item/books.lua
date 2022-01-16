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
local texts = require("magic.arcane.base.texts")

local M = {}

-- 2622 is the alchemy book. dont use it otherwise.

function M.UseItem(User, SourceItem)

    -- alchemy book; DO NOT CHANGE! STARTER PACK RELEVANT!
    if SourceItem.id == 2622 then
        User:sendBook(101)
        return
    end
    -- alchemy end
    -- magic book for casting
    if SourceItem:getData("magicBook") == "true" then
        magicBook.mainSelectionDialog(User, SourceItem)
        return
    end
    -- magic book end
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

end

function M.LookAtItem(User,Item)
    if Item:getData("magicBook") ~= "" then
        lookat.SetSpecialName(Item, texts.grimoire.name.german, texts.grimoire.name.english)
        if Item:getData("descriptionEn") == "" then
            lookat.SetSpecialDescription(Item, texts.grimoire.description.german, texts.grimoire.description.english)
        end
    end
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
