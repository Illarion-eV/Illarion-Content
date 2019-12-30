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

local base = require("petsystem.base")
local common = require("base.common")

local M = {}

function M.bringBackPet(character, altar)
    if base.isPetOwner(character) and base.getPetHitpoints(character) == 0 and base.isPetProtectedFromDeath(character) then
        base.savePetHitpoints(character, 10000)
        local spawnPosition = common.getFreePos(character.pos, 1)
        base.savePetPosition(character, spawnPosition)
        world:gfx(31, spawnPosition)            
        world:gfx(53, altar.pos)
        base.loadPet(character)
        base.removeIsPetProtectedFromDeath(character)
        return true
    end
end  


return M