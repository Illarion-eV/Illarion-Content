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

-- UPDATE items SET itm_script='item.id_258_flail' WHERE itm_id IN (258);

local common = require("base.common")
local flailing = require("content.gatheringcraft.flailing")
local wood = require("item.general.wood")

module("item.id_258_flail", package.seeall)

LookAtItem = wood.LookAtItem

function UseItem(User, SourceItem, ltstate)

    flailing.StartGathering(User, nil, ltstate);

end
