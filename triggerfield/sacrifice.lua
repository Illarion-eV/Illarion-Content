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

local gods = require("content.gods")

--TODO use list to set function
local _IS_ALTAR_ID = {
    -- The list was obtained by SQL command:
    -- SELECT itm_id FROM items WHERE itm_script = 'item.altars' ORDER BY itm_id
    [361 ] = true,
    [1162] = true,
    [1163] = true,
    [1879] = true,
    [1880] = true,
    [2801] = true,
    [2857] = true,
    [2872] = true,
    [3891] = true,

    -- Elara's statue
    [464] = true,
}

local _MAX_DISTANCE = 1

local M = {}

function M.PutItemOnField(Item, User)
    -- Find the relevant altar, it sould be close to the item
    local z = Item.pos.z
    for x = (Item.pos.x - _MAX_DISTANCE), (Item.pos.x + _MAX_DISTANCE) do
        for y = (Item.pos.y - _MAX_DISTANCE), (Item.pos.y + _MAX_DISTANCE) do
            local field = world:getField(position(x,y,z))
            for alt_item_idx = 0,(field:countItems()-1) do
                local alt_item = field:getStackItem(alt_item_idx)
                if _IS_ALTAR_ID[alt_item.id] then
                    local god = tonumber(alt_item:getData("god"))
                    god = god or gods.GOD_NONE
                    if gods.GODS[god] then
                        gods.sacrifice(User, god, Item)
                        return
                    end
                end
            end
        end
    end
    -- Valid altar not found!
    User:inform("[ERROR] Sacrificing near invalid altar. Please inform a developer.")
end

return M