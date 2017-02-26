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

local M = {}

function M.UseItem(user, sourceItem)

    -- A special and unique item. Do not create a second version of this goblet. Contact Jupiter if you want to do something with it or somethign similiar, please.
    if sourceItem:getData("coinDepot") then
        local coins = {copperCoins = 3076, silverCoins = 3077, goldCoins = 61}
        for coinData, coinId in pairs(coins) do
            local amount = tonumber(sourceItem:getData(coinData)) or 0
            if amount > 0 then
                user:inform("Münzen fallen aus dem Kelch heraus.", "Coins fall out from the goblet.")
                common.CreateItem(user, coinId, amount, 333, nil)
                sourceItem:setData(coinData, 0)
                world:changeItem(sourceItem)
            end
        end
    end

end

-- This function is called from the coin scripts. It stores the coins in teh goblet.
function M.putCoinsInGoblet(user, sourceItem)
    if common.isSpecialItem(sourceItem) then
        return false
    end

    if not (sourceItem.itempos == 5 or sourceItem.itempos == 6) then
        return false
    end

    local goblet = user:getItemAt(Character.left_tool)
    if not (goblet and goblet.id == 224 and goblet:getData("coinDepot") == "true") then
        goblet = user:getItemAt(Character.right_tool)
        if not (goblet and goblet.id == 224 and goblet:getData("coinDepot") == "true") then
            return false
        end
    end

    local coins = {[3076] = "copperCoins", [3077] = "silverCoins", [61] = "goldCoins"}
    goblet:setData(coins[sourceItem.id], (tonumber(goblet:getData(coins[sourceItem.id])) or 0) + sourceItem.number)
    world:changeItem(goblet)

    world:erase(sourceItem, sourceItem.number)
    user:inform("Du tust die Münzen in den Kelch und sie verschwinden.", "You put the coins in the goblet and the disappear.")
    return true
end

return M
