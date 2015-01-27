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

local granorsHut = require("content.granorsHut")
local lookat = require("base.lookat")

local M = {}

function M.UseItem(user, sourceItem, ltstate)
    
    if sourceItem:getData("granorsHut") ~= "" then
        granorsHut.searchInHedge(user)
    end

end

function M.LookAtItem(user, item)

    if item:getData("granorsHut") ~= "" then
        granorsHut.lookingAtHedge(user, item)
    end
    
    return lookat.GenerateLookAt(user, item, lookat.NONE)
end

return M