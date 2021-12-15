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
local alchemy = require("alchemy.base.alchemy")

local M = {}

M.potionList = {59,165,166,167,327,328,329,330,331,1063,1164,1165,1166,1167,1168,1169}

function M.drinkInform(user, SourceItem)
local textEN = SourceItem:getData("customPotion")
local textDE = SourceItem:getData("customPotionDE")
    if textEN == "" then
        textEN = "You don't have the feeling that something happens."
        textDE = "Du hast nicht das Gef�hl, dass etwas passiert."
    end
    if textDE == "" then
        textDE = textEN
    end
    user:inform(common.GetNLS(user,textDE,textEN))
    user:talk(Character.say, "#me trinkt eine Fl�ssigkeit.", "#me drinks a liquid.")
    alchemy.EmptyBottle(user, SourceItem)
    SourceItem:setData("customPotion","")
    SourceItem:setData("customPotionDE","")
    world:changeItem(SourceItem)
end

function M.UseItem(user, SourceItem, ltstate)
    M.drinkInform(user, SourceItem)
end

return M
