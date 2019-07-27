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
-- UPDATE items SET itm_script='item.id_399_candlestick' WHERE itm_id=399;

local common = require("base.common")
local lights = require("item.lights")
local globalvar = require("base.globalvar")
local glypheffects = require("magic.glypheffects")

local M = {}

M.UseItem = lights.UseItem

function M.LookAtItem(user, item)
    local thisLookat = lights.LookAtItem(user, item)
    if item:getData("belongsTo") == "ritual" then
        thisLookat.description = common.GetNLS(user, "Das gehörte zu einem Ritual und ist nicht mehr zu gebrauchen.", "It belonged to a ritual and can't be used anymore.")
    end
    return thisLookat
end

function M.MoveItemAfterMove(user, sourceItem, targetItem)
    if sourceItem:getData("belongsTo") == "ritual" and sourceItem.itempos == 0 then
        world:gfx(globalvar.gfxSPLASH,sourceItem.pos)
        common.InformNLS(user, "Der Kerzenhalter zerbröselt in deinen Fingern.",
                               "The small candlestick crumbles in your fingers.")
        world:erase(targetItem,targetItem.number)
        return false
    end
    return lights.MoveItemAfterMove(user, sourceItem, targetItem)
end

return M

