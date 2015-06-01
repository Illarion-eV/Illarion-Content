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

-- UPDATE items SET itm_script='item.walldecoration' WHERE itm_id IN (1066,1067,1074,1075,1082,1083);

local common = require("base.common")
local money = require("base.money")

local M = {}


function M.UseItem(User, SourceItem)


    local itemData
    local isRonaganTrap = (SourceItem:getData("ronaganTrap") == "true")
    if (isRonaganTrap == true) then
        User:inform("Ein Dieb hat dich in eine Falle gelockt. Er springt aus einem der Schatten und stielt dir ein paar Münzen.", "A thief has lured you into a trap, jumping out from a shadow, he steals some coins from you.")

        -- steal 1% - 5% of characters money in inventroy
        local wealth = money.CharCoinsToMoney(User)
        money.TakeMoneyFromChar(User, math.random(math.floor(wealth / 100), math.floor(wealth / 20)))
        return
   end
end


return M
