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

--  INSERT INTO npc (npc_type,npc_posx,npc_posy,npc_posz,npc_faceto,npc_is_healer,npc_name, npc_script,npc_sex,npc_hair,npc_beard,npc_hairred,npc_hairgreen,npc_hairblue,npc_skinred,npc_skingreen,npc_skinblue,npc_hairalpha,npc_skinalpha) VALUES(0,10,10,0,4,FALSE,'Pet Master','npc.petMaster',0,7,0,238,118,0,245,180,137,255,255);

--local petMovement = require("petsystem.petMovement")
--local base = require("petsystem.base")
--local firnisMillChicken = require("petsystem.pets.1055_firnisMillChicken")
--local gynkeseGuardDog = require("petsystem.pets.1056_gynkeseGuardDog")
--local runewickianMilkCow = require("petsystem.pets.1057_runewickianMilkCow")
--local meadowWoolSheep = require("petsystem.pets.1058_meadowWoolSheep")

local M = {}
--[[]
local propertiesOfPets = {
    [1055] = firnisMillChicken.petProperties,
    [1056] = gynkeseGuardDog.petProperties,
    [1057] = runewickianMilkCow.petProperties,
    [1058] = meadowWoolSheep.petProperties
}
]]
function M.nextCycle(petMaster)
   --[[ local allPets = base.getAllPets()

    for i = 1, #allPets do
        local pet = allPets[i]

        if isValidChar(pet) then
            local petId = pet:getMonsterType()

            petMovement.handleMovement(pet, propertiesOfPets[petId].tooFarAwayCry)

            if petId == 1055 then
                firnisMillChicken.dropEgg(pet)
            end
        end

    end
]]
end

return M