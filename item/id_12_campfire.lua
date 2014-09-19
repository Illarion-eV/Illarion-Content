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

-- UPDATE items SET itm_script='item.id_12_campfire' where itm_id=12;

local common = require("base.common")
local potashproducing = require("content.gatheringcraft.potashproducing")

local M = {}

function M.UseItem(User, SourceItem, ltstate)

	potashproducing.StartGathering(User, SourceItem, ltstate);

end

function M.CharacterOnField(User)
    common.InformNLS( User,
      "Du fühlst die aufsteigende Hitze des Feuers.",
      "You feel the heat of the fire." );
	--Damage from campfires is annoying and abuseable; deactivated.
    --[[if not (User:getQuestProgress(2) > 0) and not (User:increaseAttrib("hitpoints",0) < 2000) then
		User:increaseAttrib("hitpoints",-math.random(200,400));
	end]]
end

return M

