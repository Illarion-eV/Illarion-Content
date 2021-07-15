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

local plantRoot = require("magic.arcane.plantRoot")
local lookat = require("base.lookat")

local M = {}

function M.CharacterOnField(user)
    local sourceItem = world:getItemOnField( user.pos )
    if sourceItem:getData("spell") then
        plantRoot.applyPlantRootForEntanglingPlant(sourceItem, user)
    end
end

function M.lookAt(sourceItem)
    if sourceItem:getData("spell") then
        lookat.SetSpecialName(sourceItem,"","Entangling Plant")
        lookat.SetSpecialDescription(sourceItem,"","Upon closer inspection, you may notice the leaves of the plant having a magical looking glow to them.")
    end
end
return M
