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

-- UPDATE common SET com_script='item.id_12_campfire' where com_itemid=12;

require("base.common")
require("content.gatheringcraft.potashproducing")

module("item.id_12_campfire", package.seeall)

function UseItem(User, SourceItem, ltstate)

	content.gatheringcraft.potashproducing.StartGathering(User, SourceItem, ltstate);

end

function CharacterOnField(User)
    base.common.InformNLS( User,
      "Du fühlst die aufsteigende Hitze des Feuers.",
      "You feel the heat of the fire." );
	--Damage from campfires is annoying and abuseable; deactivated.
    --[[if not (User:getQuestProgress(2) > 0) and not (User:increaseAttrib("hitpoints",0) < 2000) then
		User:increaseAttrib("hitpoints",-math.random(200,400));
	end]]
end
