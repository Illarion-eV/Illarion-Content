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
local crafts = require("craft.base.crafts")

local M = {}

local blacksmithing = crafts.Craft:new{
                      craftEN = "Blacksmithing",
                      craftDE = "Schmieden",
                      handTool = 23,
                      leadSkill = Character.blacksmithing,
                      sfx = 8,
                      sfxDuration = 27,
                    }

blacksmithing:addTool(172) -- anvil

local product
local catId

catId = blacksmithing:addCategory("Daggers", "Dolche")

-- simple dagger
product = blacksmithing:addProduct(catId, 27, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle

-- dagger
product = blacksmithing:addProduct(catId, 189, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle

-- sharp dagger
product = blacksmithing:addProduct(catId, 1524, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(450, 1) -- amethyst powder

-- coppered dagger
product = blacksmithing:addProduct(catId, 398, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(447, 1) -- ruby powder

-- ornate dagger
product = blacksmithing:addProduct(catId, 190, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(449, 1) -- obsidian powder

-- red dagger
product = blacksmithing:addProduct(catId, 2740, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(104, 3) -- silver ingot
product:addIngredient(446, 1) -- sapphire powder

-- silvered dagger
product = blacksmithing:addProduct(catId, 389, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(104, 4) -- silver ingot
product:addIngredient(448, 1) -- emerald powder
product:addIngredient(236, 2) -- gold ingot

-- gilded dagger
product = blacksmithing:addProduct(catId, 297, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(236, 2) -- gold ingot

-- ritual dagger
product = blacksmithing:addProduct(catId, 2672, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(236, 2) -- gold ingot

-- rapier
product = blacksmithing:addProduct(catId, 2675, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- Malachín dagger
product = blacksmithing:addProduct(catId, 91, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2571, 3) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- merinium-plated dagger
product = blacksmithing:addProduct(catId, 444, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2551, 1) -- pure air
product:addIngredient(236, 2) -- gold ingot

-- magical dagger
product = blacksmithing:addProduct(catId, 2671, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2554, 1) -- pure water
product:addIngredient(236, 2) -- gold ingot

-- red fire dagger
product = blacksmithing:addProduct(catId, 2742, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2530, 1) -- dagger handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2553, 1) -- pure fire
product:addIngredient(236, 2) -- gold ingot

catId = blacksmithing:addCategory("One handed axes", "Einhändige Äxte")

-- light battle axe
product = blacksmithing:addProduct(catId, 2629, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2525, 1) -- axe handle

-- halfling axe
product = blacksmithing:addProduct(catId, 2711, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2525, 1) -- axe handle

-- battle axe
product = blacksmithing:addProduct(catId, 2946, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(447, 1) -- ruby powder

-- coppered battle axe
product = blacksmithing:addProduct(catId, 192, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(449, 1) -- obsidian powder

-- silvered battle axe
product = blacksmithing:addProduct(catId, 229, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(446, 1) -- sapphire powder

-- gilded battle axe
product = blacksmithing:addProduct(catId, 124, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(236, 4) -- gold ingot
product:addIngredient(448, 1) -- emerald powder

-- orc axe
product = blacksmithing:addProduct(catId, 2642, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(236, 2) -- gold ingot

-- dwarven axe
product = blacksmithing:addProduct(catId, 2660, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- merinium-plated battle axe
product = blacksmithing:addProduct(catId, 296, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2551, 1) -- pure air
product:addIngredient(236, 2) -- gold ingot

-- magical dwarven axe
product = blacksmithing:addProduct(catId, 2662, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2554, 1) -- pure water
product:addIngredient(236, 2) -- gold ingot

catId = blacksmithing:addCategory("One handed swords", "Einhändige Schwerter")

-- machete
product = blacksmithing:addProduct(catId, 2776, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2584, 1) -- sword handle

-- sabre
product = blacksmithing:addProduct(catId, 25, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2584, 1) -- sword handle

-- short sword
product = blacksmithing:addProduct(catId, 78, 1)
product:addIngredient(2535, 3) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(450, 1) -- amethyst powder

-- serinjah sword
product = blacksmithing:addProduct(catId, 1, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(447, 1) -- ruby powder

-- scimitar
product = blacksmithing:addProduct(catId, 2757, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(449, 1) -- obsidian powder

-- longsword
product = blacksmithing:addProduct(catId, 2701, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2550, 4) -- copper ingot
product:addIngredient(446, 1) -- sapphire powder
product:addIngredient(236, 2) -- gold ingot

-- coppered longsword
product = blacksmithing:addProduct(catId, 85, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2550, 4) -- copper ingot
product:addIngredient(448, 1) -- emerald powder
product:addIngredient(236, 2) -- gold ingot

-- silvered longsword
product = blacksmithing:addProduct(catId, 98, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(236, 2) -- gold ingot

-- broadsword
product = blacksmithing:addProduct(catId, 2658, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(236, 2) -- gold ingot

-- elven sword
product = blacksmithing:addProduct(catId, 2778, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(236, 2) -- gold ingot

-- gilded longsword
product = blacksmithing:addProduct(catId, 84, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- elven rainbowsword
product = blacksmithing:addProduct(catId, 2775, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- snake sword
product = blacksmithing:addProduct(catId, 2788, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- merinium-plated longsword
product = blacksmithing:addProduct(catId, 123, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2551, 1) -- pure air
product:addIngredient(236, 2) -- gold ingot

-- fire longsword
product = blacksmithing:addProduct(catId, 206, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2553, 1) -- pure fire
product:addIngredient(236, 2) -- gold ingot

-- magical serinjah-sword
product = blacksmithing:addProduct(catId, 2693, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2554, 1) -- pure water
product:addIngredient(236, 2) -- gold ingot

-- magical longsword
product = blacksmithing:addProduct(catId, 2704, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2554, 1) -- pure water
product:addIngredient(236, 2) -- gold ingot

-- magical broadsword
product = blacksmithing:addProduct(catId, 2654, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2554, 1) -- pure water
product:addIngredient(236, 2) -- gold ingot

-- fire broadsword
product = blacksmithing:addProduct(catId, 2656, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2553, 1) -- pure fire
product:addIngredient(236, 2) -- gold ingot

catId = blacksmithing:addCategory("Other", "Sonstiges")

-- pins
product = blacksmithing:addProduct(catId, 2738, 1)
product:addIngredient(2535, 1) -- iron ingot

-- iron plate
product = blacksmithing:addProduct(catId, 2537, 1)
product:addIngredient(2535, 2) -- iron ingot

-- lockpicks
product = blacksmithing:addProduct(catId, 739, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- handcuffs
product = blacksmithing:addProduct(catId, 466, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2537, 2) -- iron plate

local catId = blacksmithing:addCategory("Throwing weapons", "Wurfwaffen")

-- throwing axe
product = blacksmithing:addProduct(catId, 2645, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2525, 1) -- axe handle

-- throwing star
product = blacksmithing:addProduct(catId, 294, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

catId = blacksmithing:addCategory("Tools", "Werkzeuge")

-- scissors
product = blacksmithing:addProduct(catId, 6, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- saw
product = blacksmithing:addProduct(catId, 9, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2561, 1) -- saw handle

-- hammer
product = blacksmithing:addProduct(catId, 23, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2541, 1) -- hammer handle

-- shovel
product = blacksmithing:addProduct(catId, 24, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2567, 1) -- shovel handle

-- needle
product = blacksmithing:addProduct(catId, 47, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2537, 1) -- iron plate

-- hatchet
product = blacksmithing:addProduct(catId, 74, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2525, 1) -- axe handle

-- finesmithing hammer
product = blacksmithing:addProduct(catId, 122, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2541, 1) -- hammer handle

-- sickle
product = blacksmithing:addProduct(catId, 126, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2570, 1) -- sickle handle

-- scythe
product = blacksmithing:addProduct(catId, 271, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2566, 1) -- scythe handle

-- chisel
product = blacksmithing:addProduct(catId, 737, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- tongs
product = blacksmithing:addProduct(catId, 2140, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- pan
product = blacksmithing:addProduct(catId, 2495, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- rasp
product = blacksmithing:addProduct(catId, 2697, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- armourer's hammer
product = blacksmithing:addProduct(catId, 2709, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2541, 1) -- hammer handle

-- mould
product = blacksmithing:addProduct(catId, 2710, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- plane
product = blacksmithing:addProduct(catId, 2715, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- razor blade
product = blacksmithing:addProduct(catId, 2746, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- crucible-pincers
product = blacksmithing:addProduct(catId, 2751, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- carving tools
product = blacksmithing:addProduct(catId, 2752, 1)
product:addIngredient(2535, 1) -- iron ingot
product:addIngredient(2528, 1) -- small handle

-- pick-axe
product = blacksmithing:addProduct(catId, 2763, 1)
product:addIngredient(2535, 2) -- iron ingot
product:addIngredient(2525, 1) -- axe handle

catId = blacksmithing:addCategory("Two handed axes", "Zweihändige Äxte")

-- executioner's axe
product = blacksmithing:addProduct(catId, 2723, 1)
product:addIngredient(2535, 4) -- iron ingot
product:addIngredient(2525, 1) -- axe handle

-- longaxe
product = blacksmithing:addProduct(catId, 88, 1)
product:addIngredient(2535, 5) -- iron ingot
product:addIngredient(2525, 1) -- axe handle

-- waraxe
product = blacksmithing:addProduct(catId, 383, 1)
product:addIngredient(2535, 8) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(236, 4) -- gold ingot
product:addIngredient(446, 1) -- sapphire powder

-- large waraxe
product = blacksmithing:addProduct(catId, 188, 1)
product:addIngredient(2535, 9) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(448, 1) -- emerald powder
product:addIngredient(236, 2) -- gold ingot

-- cleaver axe
product = blacksmithing:addProduct(catId, 1527, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(451, 1) -- topaz powder
product:addIngredient(236, 2) -- gold ingot

-- double axe
product = blacksmithing:addProduct(catId, 205, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 3) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- fire waraxe
product = blacksmithing:addProduct(catId, 2627, 1)
product:addIngredient(2535, 11) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(2553, 1) -- pure fire
product:addIngredient(236, 2) -- gold ingot

-- large fire-waraxe
product = blacksmithing:addProduct(catId, 2640, 1)
product:addIngredient(2535, 12) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 3) -- merinium ingot
product:addIngredient(2553, 1) -- pure fire
product:addIngredient(236, 2) -- gold ingot

-- magical waraxe
product = blacksmithing:addProduct(catId, 2626, 1)
product:addIngredient(2535, 12) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 4) -- merinium ingot
product:addIngredient(2554, 1) -- pure water
product:addIngredient(236, 2) -- gold ingot

catId = blacksmithing:addCategory("Two handed swords", "Zweihändige Schwerter")

-- flamberge
product = blacksmithing:addProduct(catId, 1525, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2585, 1) -- big sword handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(450, 1) -- amethyst powder

-- greatsword
product = blacksmithing:addProduct(catId, 204, 1)
product:addIngredient(2535, 6) -- iron ingot
product:addIngredient(2585, 1) -- big sword handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(447, 1) -- ruby powder

-- claymore
product = blacksmithing:addProduct(catId, 1526, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2585, 1) -- big sword handle
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(449, 1) -- obsidian powder

-- two-handed sword
product = blacksmithing:addProduct(catId, 2731, 1)
product:addIngredient(2535, 10) -- iron ingot
product:addIngredient(2585, 1) -- big sword handle
product:addIngredient(2571, 3) -- merinium ingot
product:addIngredient(452, 1) -- diamond powder
product:addIngredient(236, 2) -- gold ingot

-- Dummy group for items that cannot be crafted but repaired
catId = blacksmithing:addCategory("repair only", "nur reparieren")

-- drow blade
product = blacksmithing:addProduct(catId, 2777, 1)
product:addIngredient(2535, 7) -- iron ingot
product:addIngredient(2584, 1) -- sword handle
product:addIngredient(2571, 2) -- merinium ingot
product:addIngredient(3607, 1) -- pure spirit
product:addIngredient(236, 2) -- gold ingot

-- drow sword
product = blacksmithing:addProduct(catId, 3035, 1)
product:addIngredient(2535, 12) -- iron ingot
product:addIngredient(2525, 1) -- axe handle
product:addIngredient(2571, 4) -- merinium ingot
product:addIngredient(3607, 1) -- pure spirit
product:addIngredient(236, 2) -- gold ingot

M.blacksmithing = blacksmithing
return M
