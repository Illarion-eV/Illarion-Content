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
local transformation_dog = require("alchemy.teaching.transformation_dog")
local id_266_bookshelf = require("item.id_266_bookshelf")
local lookat = require("base.lookat")
local magicSphere = require("item.magicSphere")
local M = {}

-- UPDATE items SET itm_script = 'item.id_3110_scroll' WHERE itm_id = 3110;

function M.LookAtItem(User,Item)
    local book = Item:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            lookat.SetSpecialName(Item,id_266_bookshelf.bookList[book].german,id_266_bookshelf.bookList[book].english)
        end
    end
    return lookat.GenerateLookAt(User, Item, 0)
end

function M.UseItem(User, SourceItem)

    if SourceItem.pos == position(794, 128, 0) then
        magicSphere.penInfo(User)
        return
    end

    if SourceItem.pos == position(844, 216, -3) then
        magicSphere.anthInfo(User)
        return
    end

    if SourceItem:getData("teachDogTransformationPotion") == "true" then
        transformation_dog.UseSealedScroll(User, SourceItem)
        return
    end

    local book = SourceItem:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            User:sendBook(id_266_bookshelf.bookList[book].bookId)
        end
    end

    -- teleport character on use
    local destCoordX = tonumber(SourceItem:getData("destinationCoordsX"))
    local destCoordY = tonumber(SourceItem:getData("destinationCoordsY"))
    local destCoordZ = tonumber(SourceItem:getData("destinationCoordsZ"))
    if destCoordX and destCoordY and destCoordZ then
        User:talk(Character.say,
            "#me �ffnet eine Schriftrolle und verschwindet in einem hellen Leuchten.",
            "#me opens a scroll and disappears in a bright light.")
        world:gfx(31, User.pos)
        world:gfx(41, User.pos)
        User:warp(position(destCoordX, destCoordY, destCoordZ))
        world:gfx(41, User.pos)
        world:erase(SourceItem,1)
        return
    end
end

return M

