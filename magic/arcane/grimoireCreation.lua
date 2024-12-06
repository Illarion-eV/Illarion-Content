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

local magic = require("base.magic")

local M = {}

local books = {105,106,129,2609,2610,114,115,2608,2615,107,108,111,112,2605,2617,109,110,117,128,130,2604,131,2602,2620,116,2621,2607,127,2598,2606,2616,2619}

function M.enchantGrimoire(user)
    local leftItem = user:getItemAt(5)
    local rightItem = user:getItemAt(6)
    local theBook = false

    for _, id in pairs(books) do
        if id == rightItem.id then
            theBook = rightItem
        elseif id == leftItem.id then
            theBook = leftItem
        end
    end

    if theBook then
        if theBook:getData("magicBook") ~= "" or theBook:getData("book") ~= "" then --book is already a grimoire or already has content
            theBook = false
        end
    end

    if not theBook then
        user:inform("Du musst einen leeres Buch in deinen Händen halten, um es in ein Grimoire verzaubern zu können.", "You need to hold a blank book in your hand in order to enchant it into a Grimoire.")
        return
    end

    if magic.hasSufficientMana(user, 5000) then
        user:increaseAttrib("mana", -5000)
        world:gfx(41,user.pos)
        world:makeSound(13,user.pos)
        theBook:setData("magicBook", "true")
        world:changeItem(theBook)
        user:inform("Du hast erfolgreich ein Buch in ein Grimoire verzaubert.", "You have successfully enchanted the book into a Grimoire.")
    else
        user:inform("Nicht genug Mana." ,"Not enough mana.")
    end
end

return M
