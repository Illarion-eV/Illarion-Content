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

M.Sirani = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Sirani:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Sirani"
    self.nameEn = "Sirani"
    self.descriptionDe = "die Göttin der Liebe und der Freude"
    self.descriptionEn = "Goddess of love and pleasure"
    self.devotionItems = {
        {id = 148, number = 1}, -- firnis blossom
        {id = 68, number = 1}, -- golden ruby ring
        {id = 806, number = 1}, -- white dress
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            id_set = common.setFromList({ -- set of item IDs
                -- ## manual
                -- category: flowers
                148, -- firnis blossom
                -- ## From craft\final\finesmithing.lua ##
                -- category: Amulets
                222, -- iron amulet
                3535, -- golden amulet
                3554, -- silver amulet
                3558, -- copper amulet
                3526, -- copper amethyst amulet
                3528, -- silver amethyst amulet
                79, -- golden amethyst amulet
                3539, -- copper ruby amulet
                3541, -- silver ruby amulet
                67, -- golden ruby amulet
                3536, -- copper obsidian amulet
                3538, -- silver obsidian amulet
                82, -- golden obsidian amulet
                3559, -- copper sapphire amulet
                3543, -- silver sapphire amulet
                71, -- golden sapphire amulet
                3546, -- copper emerald amulet
                3548, -- silver emerald amulet
                62, -- golden emerald amulet
                3549, -- copper topaz amulet
                3551, -- silver topaz amulet
                83, -- golden topaz amulet
                3530, -- copper diamond amulet
                3532, -- silver diamond amulet
                334, -- charm of the icebird
                3534, -- golden diamond amulet
                -- category: Crowns
                465, -- diadem
                225, -- crown
                3556, -- queen's crown
                3557, -- kings's crown
                -- category: Other
--                399, -- small candlestick
--                92, -- oil lamp
--                393, -- lantern
                336, -- mirror
                -- category: Rings
                235, -- golden ring
                3553, -- copper ring
                3555, -- silver ring
                3527, -- copper amethyst ring
                3529, -- silver amethyst ring
                277, -- golden amethyst ring
                3540, -- copper ruby ring
                3560, -- silver ruby ring
                68, -- golden ruby ring
                3537, -- copper obsidian ring
                3561, -- silver obsidian ring
                278, -- golden obsidian ring
                3542, -- copper sapphire ring
                3544, -- silver sapphire ring
                279, -- golden sapphire ring
                3547, -- copper emerald ring
                3545, -- silver emerald ring
                281, -- golden emerald ring
                3550, -- copper topaz ring
                3552, -- silver topaz ring
                282, -- golden topaz ring
                3531, -- copper diamond ring
                3533, -- silver diamond ring
                280, -- golden diamond ring
                2559, -- archmage ring
                -- category: Tableware
                -- category: Tools
                -- ## From craft\final\tailoring.lua ##
                -- category: Boots
                -- category: Cloth gloves
                1447, -- grey cloth gloves
                2295, -- white cloth gloves
                1448, -- green cloth gloves
                1449, -- black cloth gloves
                1450, -- red cloth gloves
                1451, -- yellow cloth gloves
                1452, -- blue cloth gloves
                -- category: Doublets
                809, -- grey doublet
                813, -- white doublet
                810, -- green doublet
                812, -- black doublet
                811, -- red doublet
                808, -- yellow doublet
                807, -- blue doublet
                -- category: Dresses
                802, -- grey dress
                806, -- white dress
                803, -- green dress
                385, -- light blue dress
                800, -- blue dress
                801, -- yellow dress
                804, -- red dress
                805, -- black dress
                833, -- black blue dress
                834, -- black yellow dress
                835, -- black grey dress
                836, -- black green dress
                837, -- black red dress
                838, -- black white dress
                845, -- blue green heraldic dress
                846, -- blue red heraldic dress
                847, -- yellow blue heraldic dress
                848, -- yellow green heraldic dress
                849, -- red yellow heraldic dress
                850, -- grey heraldic dress
                851, -- black red heraldic dress
                852, -- white heraldic dress
                -- category: Greaves
                -- category: Hats
                -- category: Helmets
                -- category: Leather gloves
                -- category: Other
                -- category: Robes
                -- category: Shirts
                457, -- green shirt
                182, -- black shirt
                180, -- red shirt
                458, -- yellow shirt
                181, -- blue shirt
                -- category: Skirts
                841, -- grey white skirt
                842, -- green white skirt
                844, -- black white skirt
                843, -- red white skirt
                840, -- yellow white skirt
                839, -- blue white skirt
                -- category: Torso armour
                -- category: Trousers
                823, -- grey trousers
                827, -- white trousers
                183, -- short green trousers
                824, -- green trousers
                34, -- short black trousers
                826, -- black trousers
                459, -- short red trousers
                825, -- red trousers
                460, -- short yellow trousers
                822, -- yellow trousers
                461, -- short blue trousers
                821, -- blue trousers
                -- category: Tunics
                816, -- grey tunic
                820, -- white tunic
                817, -- green tunic
                819, -- black tunic
                818, -- red tunic
                815, -- yellow tunic
                814, -- blue tunic
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }

end


return M