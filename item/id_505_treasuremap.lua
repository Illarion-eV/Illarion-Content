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
local common = require("base.common")
local treasureBase = require("item.base.treasure")
local treasureContent = require("content.treasure")
local lookat = require("base.lookat")
local id_266_bookshelf = require("item.id_266_bookshelf")

-- UPDATE items SET itm_script='item.id_505_treasuremap' WHERE itm_id IN (505);

local M = {}

local function isValidMap(item)
    local x = tonumber(item:getData("MapPosX"))
    local y = tonumber(item:getData("MapPosY"))
    local z = tonumber(item:getData("MapPosZ"))

    return x ~= nil and y ~= nil and z ~= nil
end

local function getText(user, item)
    if not isValidMap(item) then --no valid treasure map
        return "Eine St�ck Pergament mit ein paar Strichen. Es sieht eher nach einer Kinderzeichnung " ..
                "statt einer Schatzkarte aus.",
                "A piece of parchment with some lines on it. It rather looks like a childrens drawing " ..
                "instead of a treasure map."
    else
        local targetData = treasureBase.getTargetInformation(user, item)
        local treasureNameDe, treasureNameEn
        if not targetData then
            treasureNameDe, treasureNameEn = treasureContent.getTreasureName(treasureBase.getTreasureLevel(item))
        else
            treasureNameDe, treasureNameEn = treasureContent.getTreasureShortName(treasureBase.getTreasureLevel(item))
        end

        if not targetData then
            return "Eine Karte mit einer Markierung auf einer Position irgendwo in deiner unmittelbaren N�he. " ..
                   "Du vermutest, dass es sich um " .. treasureNameDe .. " handelt.",
                   "A map that shows a position somewhere really close to your current position. You think it " ..
                   "could be " .. treasureNameEn .. "."
        elseif not targetData.direction.de and not targetData.direction.en then
            return "Du scheinst dich nicht im richtigen Gebiet aufzuhalten.",
                   "You don't seem to be in the correct area."
        else
            return "Eine Karte mit einer Markierung, die sich wahrscheinlich von dir aus gesehen " ..
                   targetData.distance.de .. " im " .. targetData.direction.de .. " befindet. " ..
                   "Du vermutest, dass es sich um " .. treasureNameDe .. " handelt.",
                   "A map that shows a mark that is probably located somewhere " ..
                   targetData.distance.en.." in the "..targetData.direction.en.." of your current position. " ..
                   "You believe the map leads to " .. treasureNameEn .. "."
        end
    end
end

function M.LookAtItem(User, Item)

    treasureBase.checkMap(Item)

    local book = Item:getData("book")
    if book ~= "" then
        if book ~= nil then
            if id_266_bookshelf.bookList[book] ~= nil then
            lookat.SetSpecialName(Item,id_266_bookshelf.bookList[book].german,id_266_bookshelf.bookList[book].english)
            end
        end
        return lookat.GenerateLookAt(User, Item, lookat.NONE)
    end

    local textDe, textEn = getText(User, Item)
    local itemLookat = lookat.GenerateLookAt(User, Item, lookat.NONE)
    itemLookat.description = common.GetNLS(User, textDe, textEn)
    return itemLookat
end

function M.UseItem(User, SourceItem)
    local book = SourceItem:getData("book")
    if book ~= "" then
        if id_266_bookshelf.bookList[book] ~= nil then
            User:sendBook(id_266_bookshelf.bookList[book].bookId)
        end

    elseif book == nil then
        local textDe, textEn = getText(User, SourceItem)
        User:inform(textDe, textEn)
    end
end

return M

