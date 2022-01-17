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

function M.LookAtItem(user, item)
    local book = item:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            lookat.SetSpecialName(item,id_266_bookshelf.bookList[book].german,id_266_bookshelf.bookList[book].english)
        end
    end
    return lookat.GenerateLookAt(user, item, 0)
end

local function magicInfo(user, sourceItem)
    if sourceItem.pos == position(794, 128, 0) then
        magicSphere.penInfo(user)
        return true
    end

    if sourceItem.pos == position(844, 216, -3) then
        magicSphere.anthInfo(user)
        return true
    end

    if sourceItem.pos == position(355, 454, 0) then
        magicSphere.dunInfo(user)
        return true
    end

    if sourceItem.pos == position(601, 316, 3) then
        magicSphere.fhanInfo(user)
        return true
    end

    if sourceItem.pos == position(736, 318, 0) then
        magicSphere.fhenInfo(user)
        return true
    end

    if sourceItem.pos == position(272, 378, 1) then
        magicSphere.heptInfo(user)
        return true
    end

    if sourceItem.pos == position(469, 744, -3) then
        magicSphere.iraInfo(user)
        return true
    end

    if sourceItem.pos == position(794, 805, 0) then
        magicSphere.kahInfo(user)
        return true
    end

    if sourceItem.pos == position(709, 617, -6) then
        magicSphere.kelInfo(user)
        return true
    end

    if sourceItem.pos == position(537, 613, 1) then
        magicSphere.mesInfo(user)
        return true
    end

    return false
end

function M.UseItem(user, sourceItem)

    if magicInfo(user, sourceItem) then
        return
    end

    if sourceItem:getData("teachDogTransformationPotion") == "true" then
        transformation_dog.UseSealedScroll(user, sourceItem)
        return
    end

    local book = sourceItem:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            user:sendBook(id_266_bookshelf.bookList[book].bookId)
        end
    end

    -- teleport character on use
    local destCoordX = tonumber(sourceItem:getData("destinationCoordsX"))
    local destCoordY = tonumber(sourceItem:getData("destinationCoordsY"))
    local destCoordZ = tonumber(sourceItem:getData("destinationCoordsZ"))
    if destCoordX and destCoordY and destCoordZ then
        user:talk(Character.say,
            "#me öffnet eine Schriftrolle und verschwindet in einem hellen Leuchten.",
            "#me opens a scroll and disappears in a bright light.")
        world:gfx(31, user.pos)
        world:gfx(41, user.pos)
        user:warp(position(destCoordX, destCoordY, destCoordZ))
        world:gfx(41, user.pos)
        world:erase(sourceItem,1)
        return
    end
end

return M

