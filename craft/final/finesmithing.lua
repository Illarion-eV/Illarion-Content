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

local finesmithing = crafts.Craft:new{
                      craftEN = "Finesmithing",
                      craftDE = "Feinschmieden",
                      handTool = 122,
                      leadSkill = Character.finesmithing,
                      sfx = 17,
                      sfxDuration = 15,
                    }

finesmithing:addTool(172) -- anvil

local product
local catId

catId = finesmithing:addCategory("Amulets", "Amulette")

-- iron amulet
product = finesmithing:addProduct(catId, 222, 1)
product:addIngredient(2535, 2) -- iron ingot

-- golden amulet
product = finesmithing:addProduct(catId, 3535, 1)
product:addIngredient(236, 1) -- gold ingot

-- silver amulet
product = finesmithing:addProduct(catId, 3554, 1)
product:addIngredient(104, 1) -- silver ingot

-- copper amulet
product = finesmithing:addProduct(catId, 3558, 1)
product:addIngredient(2550, 1) -- copper ingot

-- copper amethyst amulet
product = finesmithing:addProduct(catId, 3526, 1)
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(197, 1) -- amethyst

-- silver amethyst amulet
product = finesmithing:addProduct(catId, 3528, 1)
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- golden amethyst amulet
product = finesmithing:addProduct(catId, 79, 1)
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(197, 1) -- amethyst

-- copper ruby amulet
product = finesmithing:addProduct(catId, 3539, 1)
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(46, 1) -- ruby

-- silver ruby amulet
product = finesmithing:addProduct(catId, 3541, 1)
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- golden ruby amulet
product = finesmithing:addProduct(catId, 67, 1)
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(46, 1) -- ruby

-- copper obsidian amulet
product = finesmithing:addProduct(catId, 3536, 1)
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(283, 1) -- obsidian

-- silver obsidian amulet
product = finesmithing:addProduct(catId, 3538, 1)
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(283, 1) -- obsidian

-- golden obsidian amulet
product = finesmithing:addProduct(catId, 82, 1)
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(283, 1) -- obsidian

-- copper sapphire amulet
product = finesmithing:addProduct(catId, 3559, 1)
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(284, 2) -- sapphire

-- silver sapphire amulet
product = finesmithing:addProduct(catId, 3543, 1)
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(284, 2) -- sapphire
product:addIngredient(450, 1) -- amethyst powder

-- golden sapphire amulet
product = finesmithing:addProduct(catId, 71, 1)
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(284, 2) -- sapphire
product:addIngredient(447, 1) -- ruby powder

-- copper emerald amulet
product = finesmithing:addProduct(catId, 3546, 1)
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(45, 2) -- emerald
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(449, 1) -- obsidian powder

-- silver emerald amulet
product = finesmithing:addProduct(catId, 3548, 1)
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(45, 2) -- emerald
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(446, 1) -- sapphire powder

-- golden emerald amulet
product = finesmithing:addProduct(catId, 62, 1)
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(45, 2) -- emerald
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(448, 1) -- emerald powder

-- copper topaz amulet
product = finesmithing:addProduct(catId, 3549, 1)
product:addIngredient(2550, 3) -- copper ingot
product:addIngredient(198, 2) -- topaz
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(451, 1) -- topaz powder

-- silver topaz amulet
product = finesmithing:addProduct(catId, 3551, 1)
product:addIngredient(104, 3) -- silver ingot
product:addIngredient(198, 2) -- topaz
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(452, 1) -- diamond powder

-- golden topaz amulet
product = finesmithing:addProduct(catId, 83, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(198, 2) -- topaz
product:addIngredient(2571, 2) -- merinium ingot

-- copper diamond amulet
product = finesmithing:addProduct(catId, 3530, 1)
product:addIngredient(2550, 3) -- copper ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 2) -- merinium ingot

-- silver diamond amulet
product = finesmithing:addProduct(catId, 3532, 1)
product:addIngredient(104, 3) -- silver ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 2) -- merinium ingot

-- charm of the icebird
product = finesmithing:addProduct(catId, 334, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(2554, 1) -- pure water

-- golden diamond amulet
product = finesmithing:addProduct(catId, 3534, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(3607, 1) -- pure spirit

catId = finesmithing:addCategory("Crowns", "Kronen")

-- diadem
product = finesmithing:addProduct(catId, 465, 1)
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(284, 1) -- sapphire

-- crown
product = finesmithing:addProduct(catId, 225, 1)
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(45, 1) -- emerald

-- queen's crown
product = finesmithing:addProduct(catId, 3556, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(198, 1) -- topaz

-- kings's crown
product = finesmithing:addProduct(catId, 3557, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(285, 1) -- diamond

catId = finesmithing:addCategory("Other", "Sonstiges")

-- small candlestick
product = finesmithing:addProduct(catId, 399, 1)
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(197, 1) -- amethyst

-- oil lamp
product = finesmithing:addProduct(catId, 92, 1)
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(46, 1) -- ruby

-- lantern
product = finesmithing:addProduct(catId, 393, 1)
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(283, 1) -- obsidian

-- mirror
product = finesmithing:addProduct(catId, 336, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(284, 1) -- sapphire
product:addIngredient(2571, 2) -- merinium ingot

catId = finesmithing:addCategory("Rings", "Ringe")

-- golden ring
product = finesmithing:addProduct(catId, 235, 1)
product:addIngredient(236, 1) -- gold ingot

-- copper ring
product = finesmithing:addProduct(catId, 3553, 1)
product:addIngredient(2550, 1) -- copper ingot

-- silver ring
product = finesmithing:addProduct(catId, 3555, 1)
product:addIngredient(104, 1) -- silver ingot

-- copper amethyst ring
product = finesmithing:addProduct(catId, 3527, 1)
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(197, 1) -- amethyst

-- silver amethyst ring
product = finesmithing:addProduct(catId, 3529, 1)
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(197, 1) -- amethyst

-- golden amethyst ring
product = finesmithing:addProduct(catId, 277, 1)
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(197, 1) -- amethyst

-- copper ruby ring
product = finesmithing:addProduct(catId, 3540, 1)
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(46, 1) -- ruby

-- silver ruby ring
product = finesmithing:addProduct(catId, 3560, 1)
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(46, 1) -- ruby

-- golden ruby ring
product = finesmithing:addProduct(catId, 68, 1)
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(46, 1) -- ruby

-- copper obsidian ring
product = finesmithing:addProduct(catId, 3537, 1)
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(283, 1) -- obsidian

-- silver obsidian ring
product = finesmithing:addProduct(catId, 3561, 1)
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(283, 1) -- obsidian

-- golden obsidian ring
product = finesmithing:addProduct(catId, 278, 1)
product:addIngredient(236, 1) -- gold ingot
product:addIngredient(283, 1) -- obsidian

-- copper sapphire ring
product = finesmithing:addProduct(catId, 3542, 1)
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(284, 2) -- sapphire

-- silver sapphire ring
product = finesmithing:addProduct(catId, 3544, 1)
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(284, 2) -- sapphire
product:addIngredient(450, 1) -- amethyst powder

-- golden sapphire ring
product = finesmithing:addProduct(catId, 279, 1)
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(284, 2) -- sapphire
product:addIngredient(447, 1) -- ruby powder

-- copper emerald ring
product = finesmithing:addProduct(catId, 3547, 1)
product:addIngredient(2550, 2) -- copper ingot
product:addIngredient(45, 2) -- emerald
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(449, 1) -- obsidian powder

-- silver emerald ring
product = finesmithing:addProduct(catId, 3545, 1)
product:addIngredient(104, 2) -- silver ingot
product:addIngredient(45, 2) -- emerald
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(446, 1) -- sapphire powder

-- golden emerald ring
product = finesmithing:addProduct(catId, 281, 1)
product:addIngredient(236, 2) -- gold ingot
product:addIngredient(45, 2) -- emerald
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(448, 1) -- emerald powder

-- copper topaz ring
product = finesmithing:addProduct(catId, 3550, 1)
product:addIngredient(2550, 3) -- copper ingot
product:addIngredient(198, 2) -- topaz
product:addIngredient(104, 1) -- silver ingot
product:addIngredient(451, 1) -- topaz powder

-- silver topaz ring
product = finesmithing:addProduct(catId, 3552, 1)
product:addIngredient(104, 3) -- silver ingot
product:addIngredient(198, 2) -- topaz
product:addIngredient(2550, 1) -- copper ingot
product:addIngredient(452, 1) -- diamond powder

-- golden topaz ring
product = finesmithing:addProduct(catId, 282, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(198, 2) -- topaz
product:addIngredient(2571, 2) -- merinium ingot

-- copper diamond ring
product = finesmithing:addProduct(catId, 3531, 1)
product:addIngredient(2550, 3) -- copper ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 2) -- merinium ingot

-- silver diamond ring
product = finesmithing:addProduct(catId, 3533, 1)
product:addIngredient(104, 3) -- silver ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 2) -- merinium ingot

-- golden diamond ring
product = finesmithing:addProduct(catId, 280, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(3607, 1) -- pure spirit

-- archmage ring
product = finesmithing:addProduct(catId, 2559, 1)
product:addIngredient(236, 3) -- gold ingot
product:addIngredient(285, 2) -- diamond
product:addIngredient(2571, 1) -- merinium ingot
product:addIngredient(3607, 1) -- pure spirit

catId = finesmithing:addCategory("Tableware", "Geschirr")

-- iron goblet
product = finesmithing:addProduct(catId, 223, 1)
product:addIngredient(2535, 1) -- iron ingot

-- copper goblet
product = finesmithing:addProduct(catId, 1840, 1)
product:addIngredient(2550, 1) -- copper ingot

-- green plate
product = finesmithing:addProduct(catId, 1001, 1)
product:addIngredient(2550, 1) -- copper ingot

-- silver goblet
product = finesmithing:addProduct(catId, 1858, 1)
product:addIngredient(104, 1) -- silver ingot

-- golden goblet
product = finesmithing:addProduct(catId, 224, 1)
product:addIngredient(236, 1) -- gold ingot

-- cutlery
product = finesmithing:addProduct(catId, 2647, 1)
product:addIngredient(2550, 3) -- copper ingot

catId = finesmithing:addCategory("Tools", "Werkzeuge")

-- glass blow pipe
product = finesmithing:addProduct(catId, 311, 1)
product:addIngredient(2550, 3) -- copper ingot

M.finesmithing = finesmithing
return M
