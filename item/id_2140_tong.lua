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
-- UPDATE items SET itm_script='item.id_2140_tong' WHERE itm_id=2140;

local gemcutting = require("craft.final.gemcutting")
local metal = require("item.general.metal")
local common = require("base.common")

local M = {}

M.LookAtItem = metal.LookAtItem

function M.UseItem(user, sourceItem, actionstate)


    local staticTool = common.GetFrontItemID(user)
    local kilns = {1240, 1241, 1242, 1243}
    local germanKiln = world:getItemName(1240, Player.german)
    local englishKiln = world:getItemName(1240, Player.english)
    local grinder = 270
    local germanGrinder = world:getItemName(grinder, Player.german)
    local englishGrinder = world:getItemName(grinder, Player.english)
    local staticToolExists = false
    local germanText = "Du stehst nicht neben dem benötigten Werkzeug: " .. germanGrinder .." oder " .. germanKiln
    local englishText = "There is no " .. englishKiln .. " or " .. englishGrinder .. " close by to work with."

    if staticTool == grinder then
        staticToolExists = true
    else
        for _, kiln in pairs(kilns) do
            if staticTool == kiln then
                staticToolExists = true
            end
        end
    end

    if staticToolExists then
        gemcutting.gemcutting:showDialog(user, sourceItem)
    else
        common.HighInformNLS(user, germanText, englishText)
    end

end

return M

