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

M.Elara = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Elara:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Elara"
    self.nameEn = "Elara"
    self.descriptionDe = "die Göttin des Wissens und der Weisheit"
    self.descriptionEn = "Goddess of wisdom and knowledge"
    self.devotionItems = {
        {id = 2745, number = 1}, -- parchment
        {id = 1118, number = 1}, -- bottle of ink
        {id = 463, number = 1}, -- quill
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            id_set = common.setFromList({ -- set of item IDs
                -- light sources
                391, -- torch
                43, -- candle
                399, -- candle stick
                393, -- lantern
                469, -- lamp oil
                92, -- oil lamp
                -- writing tools
                463, -- quill
                2745, -- parchment
                1118, -- bottle of ink
                -- ## From craft\final\carving.lua ##
                -- category: Arrows and bolts
                -- category: Blunt weapons
                -- category: Handles
                -- category: Other
                -- category: Spears
                -- category: Staffs
--                1090, -- walking stick
--                39, -- skull staff
                40, -- cleric's staff
                1528, -- novice's staff
                57, -- simple mage's staff
                1529, -- adepts's staff
                76, -- mage's staff
                209, -- elven mage's staff
                207, -- battle staff
                208, -- ornate mage's staff
                1530, -- master's staff
                -- category: Throwing weapons
                -- category: Tools
                -- category: Wands
                323, -- wand
                2782, -- wand of earth
                2783, -- wand of fire
                2784, -- wand of water
                2785, -- wand of air
                3608, -- wand of spirit
                -- ## From craft\final\tailoring.lua ##
                -- category: Boots
                -- category: Cloth gloves
                -- category: Doublets
                -- category: Dresses
                -- category: Greaves
                -- category: Hats
--                356, -- hat
--                830, -- grey hat with feather
--                1415, -- white hat with feather
--                831, -- green hat with feather
--                832, -- red hat with feather
--                829, -- yellow hat with feather
--                828, -- blue hat with feather
                358, -- red wizard hat
                357, -- blue wizard hat
                3868, -- yellow wizard hat
                370, -- colourful wizard hat
                3708, -- witch hat
                371, -- fine wizard hat
                -- category: Helmets
                -- category: Leather gloves
                -- category: Other
                -- category: Robes
--                196, -- grey coat
--                2418, -- grey priest robe
--                2421, -- white priest robe
--                55, -- green robe
--                194, -- black robe
--                2378, -- black cult robe
--                2384, -- black coat
--                2420, -- black priest robe
                547, -- novice robe
--                2419, -- red priest robe
                2377, -- red mage robe
--                195, -- yellow robe
--                368, -- yellow priest robe
--                2416, -- brown priest robe
--                193, -- blue robe
--                2380, -- blue coat
                548, -- mage robe
                558, -- archmage robe
                -- category: Shirts
                -- category: Skirts
                -- category: Torso armour
                -- category: Trousers
                -- category: Tunics
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }

end


return M