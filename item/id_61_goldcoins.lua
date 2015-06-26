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

-- UPDATE items SET itm_script='item.id_61_goldcoins' WHERE itm_id IN (61);

local common = require("base.common")
local lookat = require("base.lookat")
local money = require("base.money")

local M = {}

local TimeList = {}

function M.LookAtItem(User, Item)
    if Item.number == 1 then
        lookat.SetSpecialDescription(Item, "Eine einzelne Münze", "A single coin")
    else
        lookat.SetSpecialDescription(Item, "Eine Sammlung aus " .. Item.number .. " Münzen", "A collection of " .. Item.number .. " coins")
    end
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

function M.UseItem(User, SourceItem)

    if TimeList[User.id] ~= nil then
        if (math.abs(world:getTime("second") - TimeList[User.id])) <= 3 then  -- 1 Rl. second delay
            return
        end
    end

    local itemData
    local isRonaganTrap = (SourceItem:getData("ronaganTrap") == "true")
    if (isRonaganTrap == true) then
        User:inform("Ein Dieb hat dich in eine Falle gelockt. Er springt aus einem der Schatten und stielt dir ein paar Münzen.", "A thief has lured you into a trap, jumping out from a shadow, he steals some coins from you.")

        -- steal 1% - 5% of characters money in inventroy
        local wealth = money.CharCoinsToMoney(User)
        money.TakeMoneyFromChar(User, math.random(math.floor(wealth / 100), math.floor(wealth / 20)))
        return
   end

    if math.random(2) == 1 then
        User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt Kopf.", "#me throws a coin in the air and catches it again. It shows head.")
    else
        User:talk(Character.say, "#me wirft eine Münze in die Luft und fängt sie wieder auf. Sie zeigt Zahl.", "#me throws a coin in the air and catches it again. It shows tail.")
    end

    TimeList[User.id] = world:getTime("second")
end

return M
