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
-- UPDATE items SET itm_script='item.id_400_candle' WHERE itm_id=400;

local common = require("base.common")
local lights = require("item.lights")
local globalvar = require("base.globalvar")
local glypheffects = require("magic.glypheffects")

local M = {}

M.UseItem = lights.UseItem

function M.LookAtItem(user, item)
    local thisLookat = lights.LookAtItem(user, item)
    if item:getData("belongsTo") == "ritual" then
        thisLookat.description = common.GetNLS(user, "Das gehört zu einem Ritual. Du lässt es besser stehen.", "It belongs to a ritual. It might be not the best idea to take it away.")
    end
    return thisLookat
end

function M.MoveItemBeforeMove(user, sourceItem, targetItem)
    if sourceItem:getData("belongsTo") == "ritual" and sourceItem.itempos == 0 then
        world:gfx(globalvar.gfxFLAMESTRIKE,sourceItem.pos)
        common.InformNLS(user, "Diese Kerze scheint mit Magie aufgeladen zu sein. Du verbrennst dir die Finger.",
                               "This candle seems to be full of magic. You burn your finger.")
        return false
    end
    return lights.MoveItemAfterMove(user, sourceItem, targetItem)
end


return M

