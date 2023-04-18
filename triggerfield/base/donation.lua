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
local money = require("base.money")
local townTreasure = require("base.townTreasure")
local gems = require("base.gems")

local M = {}

function M.donate(donatedItem, User, FactionName, LeaderName, Treasury)

    -- This function donates 10% of the worth of an item to the faction

    local donated
    local ItemStats = world:getItemStats(donatedItem)

    if ItemStats.Worth == 0 then -- worthless item -> inform

        common.InformNLS(User, "[Spende] Dieser Gegenstand ist wertlos.", "[Donation] This item is worthless.") -- Feedback!
        donated = false -- no donation

    elseif donatedItem.id == 97 or donatedItem.id == 799 then --Bags and baskets cannot be donated as the content of containers cannot be evaluated.

        common.InformNLS(User, "[Spende] Taschen und Körbe können nicht gespendet werden.", "[Donation] Bags and baskets cannot be donated.") -- Feedback!
        donated = false -- no donation

    elseif gems.itemIsMagicGem (donatedItem) == true then --magic gems cannot be donated as the content of containers cannot be evaluated.

        common.InformNLS(User, "[Spende] magische Edelsteine können nicht gespendet werden.", "[Donation] magic gems cannot be donated.") -- Feedback!
        donated = false -- no donation

    else -- item with worth

        local payToFaction

        if donatedItem.id == 61 or donatedItem.id == 3076 or donatedItem.id == 3077 then -- coins

            payToFaction = donatedItem.number * ItemStats.Worth -- 100% of the worth are added for coins

        else

            local repairKitValue = donatedItem:getData("remainingValue")

            local itemWorth = ItemStats.Worth

            if not common.IsNilOrEmpty(repairKitValue) then --It is a repair kit that has been used before, lowering its value
                itemWorth = tonumber(repairKitValue)
            end

            payToFaction = donatedItem.number * itemWorth * 0.1 -- 10% of the worth are added for items

        end

        townTreasure.ChangeTownTreasure(FactionName, payToFaction)

        local gstring, estring = money.MoneyToString(payToFaction) --converting money to a string

        common.InformNLS(User,
            "[Spende] Du spendest Gegenstände im Gegenwert von"..gstring.." in die Schatzkammer von "..FactionName..".",
            "[Donation] You donate items valued at"..estring.." to the treasury of "..FactionName..".") -- Feedback!
        world:gfx(46, donatedItem.pos) -- nice GFX
        world:erase(donatedItem, donatedItem.number) -- delete the item
        donated = true -- donation worked

    end

    return donated -- returning whether the donation worked or not

end

return M
