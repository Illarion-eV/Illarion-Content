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
local learnMagic = require("magic.learnMagic")

local M = {}

-- Normal Items:
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN (17,39,40,57,65,70,76,207,208,209,212,213,214,215,216,217,218,219,263,312,522,524,550,551,2193,2194,2445,2448,2525,2527,2528,2530,2541,2544,2548,2549,2561,2566,2567,2570,2572,2573,2584,2585,2646,2659,2664,2685,2708,2714,2718,2727,2739,2780,2782,2783,2784,2785,2875,2876,2877,2878,2879,2880,2885,2913,2914,2915,2916);

-- Priest Items
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN ();

-- Weapons:
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN ();

local magicWands = {}
    magicWands[323] = true
    magicWands[2782] = true
    magicWands[2783] = true
    magicWands[2784] = true
    magicWands[2785] = true
    magicWands[3608] = true
    

function M.LookAtItem(user, item)
    return lookat.GenerateLookAt(user, item, lookat.WOOD)
end

function M.MoveItemBeforeMove(User, SourceItem, TargetItem)
    local questProgress = user:getQuestProgress(38)
    if TargetItem:getType() == 4 then --inventory, not belt
        if magicWands[SourceItem.id]then
            if User:getMagicType() == 3 then 
                User:inform("Alchemisten können die Stabmagie nicht erlernen.",
                "Alchemist are unable to use wand magic.")
            elseif User:increaseAttrib("willpower", 0) + User:increaseAttrib("essence", 0) + User:increaseAttrib("intelligence", 0) < 30 then
                User:inform("Um Stabmagie zu benutzen muss die Summe der Attribute Intelligenz, Essenz und Willensstärke 30 ergeben. Attribute können bei den Trainer NPC's geändert werden.",
                "To use wand magic, your combined attributes of intelligence, essence, and willpower must total at least 30. Attributes can be changed at the trainer NPC.")
            elseif bit32.extract(questProgress, 30) == 0 then
                User:inform("Um das Handwerk der Stabmagie zu erlernen, musst du drei Bücher über magische Theorie lesen. Sieh dir die Liste der Bücher in den Bibliotheken der Städte.",
                "To learn the craft of wand magic you must read three books of magical theory. Look for the list of books in your town's library.")
            elseif User:getMagicType() == 0 and (User:getQuestProgress(37) ~= 0 or User:getMagicFlags(0) > 0) then 
                return
            end
        else
            return checks.checkLevel(User, SourceItem)
        end
    end

    return true
end

function M.UseItem(user, sourceItem)

    if magicWands[sourceItem.id] then
        learnMagic.useMagicWand(user, sourceItem)
    end
end

return M
