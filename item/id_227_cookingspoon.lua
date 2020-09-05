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
-- UPDATE items SET itm_script='item.id_227_cookingspoon' WHERE itm_id IN (227);

local common = require("base.common")
local cooking = require("craft.final.cooking")
local brewing = require("craft.final.brewing")
local wood = require("item.general.wood")

local M = {}

M.LookAtItem = wood.LookAtItem

local function getBarrel(User)

    local BARRELS = {339, 1410, 1411}
    local foundItem
    local frontItem = common.GetFrontItem(User)
    
    for i, barrel in pairs(BARRELS) do
        if (frontItem ~= nil and frontItem.id == barrel) then
            foundItem = frontItem
            break
        end
    end

    if not foundItem then
        for i, barrel in pairs(BARRELS) do
            foundItem = common.GetItemInArea(User.pos, barrel)
            if foundItem then
                break
            end
        end
    end
    
    return foundItem
    
end

local function getKettle(User)

    local KETTLE = 3581
    local item = common.GetFrontItem(User)
    if (item ~= nil and item.id == KETTLE) then
        return item
    end
    item = common.GetItemInArea(User.pos, KETTLE)
    return item
end

function M.UseItem(User, SourceItem, ltstate)

    local target
    
    -- check for barrel
    target = getBarrel(User)
    if (target ~= nil) then
        brewing.brewing:showDialog(User, SourceItem)
        return
    end

    -- check for kettle
    target = getKettle(User)
    if (target ~= nil) then
        cooking.cooking:showDialog(User, SourceItem)
        return
    end

    -- there is nothing to work with
    common.HighInformNLS( User,
    "Du stehst nicht neben dem benötigten Werkzeug: Weinfass oder Kessel",
    "There is no wine barrel or kettle close by to work with." )
    
 end

return M

