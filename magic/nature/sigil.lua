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


M.limit = 100 -- You can not store more than 100 charges of a sigil in a pouch at a time.

M.charges = 20 -- Each sigil provides 20 charges

local function checkForWeaverspouch(user)


    local weaversPouch = common.getItemInHand(user, Item.weaversPouch)

    if not weaversPouch then
        return false
    end

    return weaversPouch

end

function M.UseItem(user, sourceItem, actionState)


    local sigilName = sourceItem:getData("nameEn")

    if common.IsNilOrEmpty(sigilName) then
        --This item must've been spawned in via GM, all crafted ones have a custom name
        return
    end

    local dataKey = sigilName:gsub("%s+", "")

    local weaversPouch = checkForWeaverspouch(user)

    if user:getMagicType() ~= 3 then
        user:inform("Du musst ein Druide sein, um dies nutzen zu können.", "You must be a druid to make use of this.")
        return
    end

    if not weaversPouch then
        user:inform("Um die Kraft im Siegel in nutzbare Gewebe zu verwandeln, musst du einen Weberbeutel in der Hand halten, um sie darin zu speichern.", "To turn the power within the sigil into weaves you can use, you need to hold a weaver's pouch in your hand to store them in.")
        return
    end

    local existingCharges = tonumber(weaversPouch:getData(dataKey))

    if existingCharges and existingCharges >= M.limit then
        user:inform("Dieser Weberbeutel kann keine weiteren Gewebe dieser Art aufnehmen.", "This weaver's pouch can not hold any more weaves of this kind.")
        return
    end

    if actionState == Action.none then
        user:startAction(50, 21, 10, 0, 0)
    elseif actionState == Action.abort then
        user:inform("Du brichst deine Aktion ab, die Kraft des Siegels in den Weberbeutel zu lenken.", "You abort your action of harnessing the power of the sigil into the weavers pouch.")
    elseif actionState == Action.success then

        local newTotal = 0

        if existingCharges then
            newTotal = existingCharges
        end

        newTotal = math.max(M.limit, newTotal + M.charges)

        world:erase(sourceItem, 1)

        weaversPouch:setData(dataKey, tostring(newTotal))

        world:changeItem(weaversPouch)
    end

end

return M
