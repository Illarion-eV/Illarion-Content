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

local gemcutting = require("content.craft.gemcutting")
local metal = require("item.general.metal")

module("item.id_2140_tong", package.seeall)

LookAtItem = metal.LookAtItem

function UseItem(User, SourceItem, ltstate)
    gemcutting.gemcutting:showDialog(User, SourceItem)
end
