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

local lookat = require("base.lookat")
local checks = require("item.general.checks")
local money = require("base.money")

local M = {}

-- Normal Items:
-- UPDATE common SET com_script='item.general.metal' WHERE com_itemid IN (4,7,9,16,18,19,20,94,95,96,101,184,185,186,187,202,324,325,528,529,530,531,696,699,770,771,916,2111,2112,2113,2114,2116,2117,2172,2284,2286,2287,2290,2291,2302,2303,2357,2359,2360,2363,2364,2365,2367,2369,2388,2389,2390,2393,2395,2399,2400,2402,2403,2407,2439,2441,2444,2495,2647,2709,2710,2711,2746,2751);

-- Priest Items:
-- UPDATE common SET com_script='item.general.metal' WHERE com_itemid IN ();

-- Weapons:
-- UPDATE common SET com_script='item.general.metal' WHERE com_itemid IN (1,25,27,77,78,84,85,88,91,98,123,188,189,190,204,205,206,226,230,231,297,383,389,2626,2627,2629,2635,2636,2642,2645,2654,2655,2656,2658,2660,2662,2668,2671,2672,2675,2689,2693,2694,2701,2704,2705,2723,2725,2731,2737,2740,2742,2757,2775,2777,2778,2788);

function M.LookAtItem(user, item)
    return lookat.GenerateLookAt(user, item, lookat.METAL)
end

function M.MoveItemBeforeMove(User, SourceItem, TargetItem)

    if TargetItem:getType() == 4 then --inventory, not belt
        return checks.checkLevel(User, SourceItem)
    end

    return true
end

function M.UseItem(User, SourceItem)
    if SourceItem.pos == position(897, 577, -9) then -- your trying to steal the dagger
        User:inform("Als du versuchst, den Dolch herauszuziehen, verwandeln sich die Schatzwächter und untote Skelette erscheinen.", "As you try and pull out the dagger, the guardians of the treasure transform and undead skeletons emerge.")
        world:createMonster(782, position(893,574,-9), -20)
        world:createMonster(782, position(896,574,-9), -20)
        world:createMonster(782, position(899,574,-9), -20)
        world:createMonster(782, position(902,574,-9), -20)
        world:gfx(41, position(893,574,-9)) -- swirly
        world:gfx(41, position(896,574,-9)) -- swirly
        world:gfx(41, position(899,574,-9)) -- swirly
        world:gfx(41, position(902,574,-9)) -- swirly
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
end
return M
