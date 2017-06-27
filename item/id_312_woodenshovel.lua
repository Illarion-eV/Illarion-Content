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

local sieving = require("craft.intermediate.sieving")
local wood = require("item.general.wood")
local common = require("base.common")
local skillTransfer = require("base.skillTransfer")

local M = {}

M.LookAtItem = wood.LookAtItem

function M.UseItem(User, SourceItem, ltstate)
    if common.GetItemInArea(User.pos, 727, 1, false) == true and common.GetItemInArea(User.pos, 313, 1, false) == false and common.GetItemInArea(User.pos, 250, 1, false) == false then
        if skillTransfer.skillTransferInformMining(User) then
            return
        end
    end
    if common.GetItemInArea(User.pos, 727, 1, false) == false and common.GetItemInArea(User.pos, 313, 1, false) == false and common.GetItemInArea(User.pos, 250, 1, false) == true then
        if skillTransfer.skillTransferInformCookingHerbloreFarming(User) then
            return
        end
    end
    sieving.sieving:showDialog(User, SourceItem)
end

return M
