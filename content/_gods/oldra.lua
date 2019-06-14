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
local common = require("base.common")

local M = {}

M.Oldra = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Oldra:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Oldra"
    self.nameEn = "Oldra"
    self.descriptionDe = "die Göttin der Fruchtbarkeit und des Lebens"
    self.descriptionEn = "Goddess of life and fertility"
    self.devotionItems = {
        {id = 258, number = 1}, -- flail
        {id = 3609, number = 1}, -- banana bread
        {id = 1149, number = 1}, -- brown egg
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            id_set = common.setFromList({ -- array of item IDs
                -- ## From craft\final\baking.lua ##
                -- category: Baked goods
                191, -- bread roll
                453, -- cookies
                3568, -- baked potato
                49, -- potato bread
                3631, -- sausage on bread
                3609, -- banana bread
                454, -- blackberry muffin
                353, -- apple pie
                303, -- cherry cake
                3571, -- egg salad sandwich
                354, -- strawberry cake
                3723, -- nut bread
                1153, -- custard pie
                3610, -- elderberry pie
                -- ## From craft\final\cooking.lua ##
                -- category: Plate recipes
                3051, -- sausage
                3573, -- cheese
                3715, -- cabbage roll
                3716, -- veggie hash
                2459, -- trout fillet dish
                556, -- salmon dish
                1154, -- egg dish
                2277, -- meat dish
                2922, -- sausages dish
                557, -- steak dish
                555, -- rabbit dish
                559, -- lamb dish
                554, -- venison dish
                1155, -- chicken dish
                -- category: Bowl recipes
                2456, -- mushroom soup
                2923, -- onion soup
                2278, -- cabbage stew
                2276, -- mulligan
                3569, -- potato soup
                3570, -- egg salad
                3572, -- fish soup
                3712, -- beer soup
                3711, -- goulash
                1152, -- chicken soup

                -- ## From craft\gathering\farming and craft\gathering\graingathering
                249, -- bundle of grain
                290, -- cabbage -> cabbage
                201, -- onion
                200, -- tomato
                -- 154, -- hop - Not for Oldra
                -- 728, -- hop seeds - not relevant
                2493, -- carrots
                778, -- sugarcane
                -- 772, -- tabacco - Not for Oldra
                3567, -- Potatoes
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }

end


return M