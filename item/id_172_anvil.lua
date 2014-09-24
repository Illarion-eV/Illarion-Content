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
local smithing = require("content.craft.smithing")
local goldsmithing = require("content.craft.goldsmithing")

local M = {}

function M.UseItem(User, SourceItem, ltstate)
	if smithing.smithing:isHandToolEquipped(User) then
		smithing.smithing:showDialog(User, SourceItem);
	elseif goldsmithing.goldsmithing:isHandToolEquipped(User) then
		goldsmithing.goldsmithing:showDialog(User, SourceItem);
	else
		base.common.HighInformNLS(User,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: Hammer oder Feinschmiedehammer",
            "To work here you have to hold a tool in your hand: Hammer or finesmithing hammer")
	end
end

return M
