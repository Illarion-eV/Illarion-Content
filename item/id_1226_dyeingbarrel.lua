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

local dyeing = require("craft.intermediate.dyeing")
local dyemaking = require("craft.intermediate.dyemaking")
local common = require("base.common")

local M = {}

function M.UseItem(User, SourceItem, ltstate)

    if dyeing.dyeing:isHandToolEquipped(User) then
        dyeing.dyeing:showDialog(User, SourceItem);
    elseif dyemaking.dyemaking:isHandToolEquipped(User) then
        dyemaking.dyemaking:showDialog(User, SourceItem);
    else
        common.HighInformNLS(User,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: Färberstab oder Mörser.",
            "To work here you have to hold a tool in your hand: Dyeing rod or mortar.")
    end

end

return M
