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
require("content.craft.smithing")
require("content.craft.goldsmithing")
require("base.licence")

module("item.id_172_anvil", package.seeall)

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end

	if content.craft.smithing.smithing:isHandToolEquipped(User) then
		content.craft.smithing.smithing:showDialog(User, SourceItem);
	elseif content.craft.goldsmithing.goldsmithing:isHandToolEquipped(User) then
		content.craft.goldsmithing.goldsmithing:showDialog(User, SourceItem);
	else
		base.common.HighInformNLS(User,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: Hammer oder Feinschmiedehammer",
            "To work here you have to hold a tool in your hand: Hammer or finesmithing hammer")
	end
end
