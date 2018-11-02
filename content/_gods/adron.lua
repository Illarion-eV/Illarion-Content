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

M.Adron = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Adron:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Adron"
    self.nameEn = "Adron"
    self.descriptionDe = "der Gott des Weines und der Feste"
    self.descriptionEn = "God of festivities and wine"
    self.devotionItems = {
        {id = 1858, number = 1}, -- silver goblet
        {id = 2500, number = 1}, -- bottle of wine
        {id = 227, number = 1}, -- cooking spoon
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            id_set = common.setFromList({ -- set of item IDs
                -- ## From craft\final\brewing.lua ##
                -- category: Soft Liquors
                2499, -- bottle of cider
                2500, -- bottle of wine
                2497, -- bottle of mead
                2501, -- bottle of beer
--                -- category: Juices
--                785, -- bottle of banana juice
--                791, -- bottle of grape juice
--                786, -- bottle of cabbage juice
--                788, -- bottle of carrot juice
--                783, -- bottle of blackberry juice
--                784, -- bottle of tangerine juice
--                789, -- bottle of strawberry juice
--                3611, -- bottle of orange juice
--                -- category: Teas
--                3720, -- bottle of fir needle tea
--                787, -- bottle of virgins weed tea
--                3721, -- bottle of green tea
--                3722, -- bottle of druids tea
                -- category: Hard Liquors
                517, -- bottle of rum
                1316, -- bottle of bear slayer
                1315, -- bottle of berry booze
                1320, -- bottle of stone face
                1321, -- bottle of absinthe
                1322, -- bottle of orange schnapps
                1319, -- bottle of cherry schnapps
                1323, -- bottle of mulled wine
                1318, -- bottle of elven wine
                -- ## manual
                -- category: smoking
                155, -- sibanac leaves
                772, -- sibanac leaves
                2744, -- pipe
                -- category: some alcohol ingredients
                154, -- hop
                388, -- grapes
                -- category: goblets
                1840, -- copper goblet
                1858, -- silver goblet
                224, -- golden goblet
                2055, -- glass
                2457, -- wine glass
                1908, -- glass mug
                2185, -- wooden cup
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }
end


return M