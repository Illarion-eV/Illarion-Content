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

local class = require('base.class')
local baseyounger = require("content._gods.baseyounger")
local common = require('base.common')

local M = {}

M.Ronagan = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Ronagan:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Ronagan"
    self.nameEn = "Ronagan"
    self.descriptionDe = "der Gott der Diebe und der Schatten"
    self.descriptionEn = "God of thieves and shadows"
    self.devotionItems = {
        {id = 2760, number = 1}, -- rope
        {id = 27, number = 1}, -- simple dagger
        {id = 384, number = 1}, -- thief's gloves
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            id_set = common.setFromList({ -- set of item IDs
                -- ## From craft\final\blacksmithing.lua ##
                -- category: Daggers
                27, -- simple dagger
                189, -- dagger
                1524, -- sharp dagger
                398, -- coppered dagger
                190, -- ornate dagger
                2740, -- red dagger
                389, -- silvered dagger
                297, -- gilded dagger
                2672, -- ritual dagger
                2675, -- rapier
--                91, -- Malachín dagger
                444, -- merinium-plated dagger
                2671, -- magical dagger
                2742, -- red fire dagger
                -- category: One handed axes
                -- category: One handed swords
                -- category: Other
--                2738, -- pins
--                2537, -- iron plate
                739, -- lockpicks
--                466, -- handcuffs
                -- category: Throwing weapons
                -- category: Tools
                -- category: Two handed axes
                -- category: Two handed swords
                -- category: repair only
                -- ## From craft\final\tailoring.lua ##
                -- category: Boots
                -- category: Cloth gloves
--                1447, -- grey cloth gloves
--                2295, -- white cloth gloves
--                1448, -- green cloth gloves
                1449, -- black cloth gloves
--                1450, -- red cloth gloves
--                1451, -- yellow cloth gloves
--                1452, -- blue cloth gloves
                -- category: Doublets
                -- category: Dresses
                -- category: Greaves
                -- category: Hats
                -- category: Helmets
                -- category: Leather gloves
--                1453, -- simple leather gloves
                384, -- thief's gloves
--                48, -- leather gloves
--                1454, -- reinforced leather gloves
--                526, -- studded leather gloves
--                1455, -- copper studded leather gloves
--                1456, -- silver studded leather gloves
--                1457, -- gold studded leather gloves
--                527, -- serinjah leather gloves
--                1458, -- reinforced serinjah leather gloves
--                1459, -- ranger's gloves
                -- category: Other
                -- category: Robes
                -- category: Shirts
--                457, -- green shirt
                182, -- black shirt
--                180, -- red shirt
--                458, -- yellow shirt
--                181, -- blue shirt
                -- category: Skirts
                -- category: Torso armour
--                1433, -- padded armour
--                363, -- leather scale armour
                1434, -- simple rogue armour
                2407, -- light rogue armour
--                365, -- half leather armour
--                1435, -- simple hunting armour
--                1436, -- hunting armour
--                2399, -- light elven armour
                2357, -- assassin's armour
--                364, -- reinforced hunting armour
--                362, -- full leather armour
                1437, -- assassin's armour of darkness
                -- category: Trousers
--                823, -- grey trousers
--                827, -- white trousers
--                183, -- short green trousers
--                824, -- green trousers
                34, -- short black trousers
                826, -- black trousers
--                459, -- short red trousers
--                825, -- red trousers
--                460, -- short yellow trousers
--                822, -- yellow trousers
--                461, -- short blue trousers
--                821, -- blue trousers
                -- category: Tunics
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }

end


return M