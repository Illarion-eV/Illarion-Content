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
local blacksmithing = require("craft.final.blacksmithing")
local finesmithing = require("craft.final.finesmithing")
local armourer = require("craft.final.armourer")
local common = require("base.common")

local M = {}

function M.UseItem(User, SourceItem, ltstate)
    if blacksmithing.blacksmithing:isHandToolEquipped(User) then
        blacksmithing.blacksmithing:showDialog(User, SourceItem);
    elseif finesmithing.finesmithing:isHandToolEquipped(User) then
        finesmithing.finesmithing:showDialog(User, SourceItem);
    elseif armourer.armourer:isHandToolEquipped(User) then
        armourer.armourer:showDialog(User, SourceItem);
    else
        common.HighInformNLS(User,
            "Dir fehlt ein Werkzeug in deiner Hand um hier zu arbeiten: Hammer, Feinschmiedehammer oder Hammer des Rüstschmieds.",
            "To work here you have to hold a tool in your hand: Hammer, finesmithing hammer or armourer's hammer.")
    end
end

return M
