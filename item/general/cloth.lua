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
local common = require("base.common")
local checks = require("item.general.checks")

local M = {}

-- Normal Items:
-- UPDATE common SET com_script='item.general.cloth' WHERE com_itemid IN (34,48,53,55,180,181,182,183,193,195,196,326,356,357,358,362,363,364,365,366,367,368,369,370,371,385,457,458,459,460,461,526,527,547,548,558,697,698,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,2295,2377,2378,2380,2384,2416,2418,2419,2420,2421);

-- Priest Items:
-- UPDATE common SET com_script='item.general.cloth' WHERE com_itemid IN ();

-- Weapons:
-- UPDATE common SET com_script='item.general.cloth' WHERE com_itemid IN (89);

function M.LookAtItem(user, item)
    return lookat.GenerateLookAt(user, item, lookat.CLOTH)
end

function M.MoveItemBeforeMove(user, sourceItem, targetItem)


    if targetItem:getType() == scriptItem.inventory then
        checks.HaveABreak(user)
        return checks.checkLevel(user, sourceItem, targetItem)
    end

    return true
end

local function coatHidesItemsInform(user, sourceItem, targetItem)
    if targetItem:getType() == scriptItem.inventory then
        if targetItem.itempos == Character.coat then
            local belt4 = user:getItemAt(Character.belt_pos_4).id
            local belt5 = user:getItemAt(Character.belt_pos_5).id
            local belt6 = user:getItemAt(Character.belt_pos_6).id
            local itemsEn = ""
            local itemsDe = ""
            local cloakEn = world:getItemStatsFromId(targetItem.id).English
            local cloakDe = world:getItemStatsFromId(targetItem.id).German

            if belt4 ~= 0 then
                local nameEn = world:getItemStatsFromId(belt4).English
                local nameDe = world:getItemStatsFromId(belt4).German
                itemsEn = itemsEn..nameEn
                itemsDe = itemsDe..nameDe
            end
            if belt5 ~= 0 then
                if belt4 ~= 0 then
                    itemsEn = itemsEn..", "
                    itemsDe = itemsDe..", "
                end
                local nameEn = world:getItemStatsFromId(belt5).English
                local nameDe = world:getItemStatsFromId(belt5).German
                itemsEn = itemsEn..nameEn
                itemsDe = itemsDe..nameDe
            end
            if belt6 ~= 0 then
                if belt4 ~= 0 or belt5 ~= 0 then
                    itemsEn = itemsEn..", "
                    itemsDe = itemsDe..", "
                end
                local nameEn = world:getItemStatsFromId(belt6).English
                local nameDe = world:getItemStatsFromId(belt6).German
                itemsEn = itemsEn..nameEn
                itemsDe = itemsDe..nameDe
            end
            itemsEn = itemsEn.."."
            itemsDe = itemsDe.."."
            if itemsEn ~= "" then
                user:inform(common.GetNLS(user, cloakDe.." auszurüsten verbirgt folgende Items an deinem Gürtel: "..itemsDe, "Equipping the "..cloakEn.." hides some of the items on your belt from view: "..itemsEn))
            end
        end
    end
end

function M.MoveItemAfterMove(user, sourceItem, targetItem)
    coatHidesItemsInform(user, sourceItem, targetItem)
end

return M
