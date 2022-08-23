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

function M.donate(Item, User, FactionName, LeaderName, Treasury)

    -- This function donates 10% of the worth of an item to the faction

    local donated
    local ItemStats = world:getItemStats(Item)

    if ItemStats.Worth == 0 then -- worthless item -> inform

        common.InformNLS(User, "[Spende] Dieser Gegenstand ist wertlos.", "[Donation] This item is worthless.") -- Feedback!
        donated = false -- no donation

    elseif Item.id == 97 or Item.id == 799 then --Bags and baskets cannot be donated as the content of containers cannot be evaluated.

        common.InformNLS(User, "[Spende] Taschen und K�rbe k�nnen nicht gespendet werden.", "[Donation] Bags and baskets cannot be donated.") -- Feedback!
        donated = false -- no donation

    elseif gems.itemIsMagicGem (Item) == true then --magic gems cannot be donated as the content of containers cannot be evaluated.

        common.InformNLS(User, "[Spende] magische Edelsteine k�nnen nicht gespendet werden.", "[Donation] magic gems cannot be donated.") -- Feedback!
        donated = false -- no donation

    else -- item with worth

        local payToFaction

        if Item.id == 61 or Item.id == 3076 or Item.id == 3077 then -- coins

            payToFaction = Item.number * ItemStats.Worth -- 100% of the worth are added for coins

        else

            payToFaction = Item.number * ItemStats.Worth * 0.1 -- 10% of the worth are added for items

        end

        townTreasure.ChangeTownTreasure(FactionName, payToFaction)

        local gstring, estring = money.MoneyToString(payToFaction) --converting money to a string

        common.InformNLS(User,
            "[Spende] Du spendest Gegenst�nde im Gegenwert von"..gstring.." in die Schatzkammer von "..FactionName..".",
            "[Donation] You donate items valued at"..estring.." to the treasury of "..FactionName..".") -- Feedback!
        world:gfx(46, Item.pos) -- nice GFX
        world:erase(Item, Item.number) -- delete the item
        donated = true -- donation worked

    end

    return donated -- returning whether the donation worked or not

end

return M
