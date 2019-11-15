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
local common = require("base.common")
local id_266_bookshelf = require("item.id_266_bookshelf")
local granorsHut = require("content.granorsHut")
local petBuying = require("petsystem.petBuying")

local M = {}

-- 2622 is the alchemy book. dont use it otherwise.

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
    
    if SourceItem:getData("petBuyingBook") ~= "" then
        petBuying.buyPet(User)
    end

    local book = SourceItem:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            User:sendBook(id_266_bookshelf.bookList[book].bookId)
        end
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
