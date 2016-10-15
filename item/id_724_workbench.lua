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

-- UPDATE items SET itm_script='item.id_724_workbench' WHERE itm_id IN (724,725);

local planing = require("craft.final.planing")
local carving = require("craft.final.carving")
local crafts = require("craft.base.crafts")
local common = require("base.common")

local M = {}

function M.UseItem(User, SourceItem, ltstate)

    if carving.carving:isHandToolEquipped(User) then
        carving.carving:showDialog(User, SourceItem);
    elseif planing.planing:isHandToolEquipped(User) then
        planing.planing:showDialog(User, SourceItem);
    else
        common.HighInformNLS(User,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: Hobel oder Schnitzmesser.",
            "To work here you have to hold a tool in your hand: Plane or carving tools.")
    end
    
end

return M

