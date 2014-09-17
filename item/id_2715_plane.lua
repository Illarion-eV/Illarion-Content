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
-- UPDATE items SET itm_script='item.id_2715_plane' WHERE itm_id IN (2715);

local carpentry = require("content.craft.carpentry")
local licence = require("base.licence")
local wood = require("item.general.wood")

module("item.id_2715_plane", package.seeall)

LookAtItem = wood.LookAtItem

function UseItem(User, SourceItem, ltstate)
	if licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end

    carpentry.carpentry:showDialog(User, SourceItem)
end
