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
local runes = require("magic.arcane.runes")
local traps = require("magic.arcane.traps")
local common = require("base.common")

local M = {}

function M.CharacterOnField(user)
    local sourceItem
    local Items = common.GetItemsOnField(user.pos)
    for _, item in pairs(Items) do
        if(item.id == 3644) then
            sourceItem = item
            break
        end
    end
    local spell = sourceItem:getData("spell")
    if spell ~= "" then
        if runes.checkSpellForRuneByName("Orl", spell) then
            traps.triggerEarthTrap(sourceItem, user)
        else
            plantRoot.applyPlantRootForEntanglingPlant(sourceItem, user)
        end
    end
end

function M.lookAt(user, sourceItem)
end
return M
