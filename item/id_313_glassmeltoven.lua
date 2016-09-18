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

-- UPDATE items SET itm_script='item.id_313_glassmeltoven' WHERE itm_id IN (313);

local glassblowing = require("craft.final.glassblowing")
local glassmelting = require("craft.intermediate.glassmelting")
local potashmaking = require("craft.intermediate.potashmaking")
local common = require("base.common")

local M = {}

function M.UseItem(User, SourceItem, ltstate)

    if glassblowing.glassblowing:isHandToolEquipped(User) then
        glassblowing.glassblowing:showDialog(User, SourceItem);
    elseif glassmelting.glassmelting:isHandToolEquipped(User) then
        glassmelting.glassmelting:showDialog(User, SourceItem);
    elseif potashmaking.potashmaking:isHandToolEquipped(User) then
        potashmaking.potashmaking:showDialog(User, SourceItem);
    else
        common.HighInformNLS(User,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: Glasblasrohr, Gussform oder Holzkelle.",
            "To work here you have to hold a tool in your hand: Glass blow pipe, mould or wooden shovel.")
    end

end

return M

