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

local petsBase = require("petsystem.pets.base")
local petSystemBase = require("petsystem.base")

local M = {}

M.petProperties = {

    monsterId = 1055,
    nameDe = "Firnismillhühnchen", 
    nameEn = "Firnismill Chicken",
    descriptionDe = "Ein Huhn mit großer Zuneigung zu seinem Besitzer. Es legt von Zeit zu Zeit auch ein Ei.",
    descriptionEn = "A chicken with a great affection for its owner. From time to time, it lays an egg.",
    downEmotes = {english = "#me setzt sich auf den Boden.", german = "#me setzt sich auf den Boden."},
    tooFarAwayCry = "Squaaaaawk!",
    validCommands = {[petSystemBase.follow] = true, [petSystemBase.heel] = true, [petSystemBase.down] = true, [petSystemBase.nearBy] = true, [petSystemBase.stray] = true},
    colour = colour(255, 255, 255),
    priceInGold = 5

}

-- Called by npc.petMaster.nextCycle()
function M.dropEgg(pet)
    if Random.uniform(1, 18000) == 1 then --statistically, 2 eggs per hour
        pet:talk(Character.say, "#me legt ein Ei.", "#me lays an egg.")
        world:createItemFromId(Item.whiteEgg, 1, pet.pos, true, 333, nil)
    end
end

M = petsBase.generatePetEntryPoints(M) 

return M