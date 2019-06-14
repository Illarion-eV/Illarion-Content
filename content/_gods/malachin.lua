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

M.Malachin = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Malachin:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Malachín"
    self.nameEn = "Malachín"
    self.descriptionDe = "der Gott der Jagd und der Schlachten"
    self.descriptionEn = "God of battle and hunting"
    self.devotionItems = {
        {id = 363, number = 1}, -- leather scale armour
        {id = 65, number = 1}, -- short bow
        {id = 2586, number = 1}, -- fur
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        { -- double value for Malachin dagger
            id_set = common.setFromList({ -- set of item IDs
                91, -- Malachín dagger
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 2, -- float -- the monetary value gets multiplied by this
        },
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
                2629, -- light battle axe
                2711, -- halfling axe
                2946, -- battle axe
                192, -- coppered battle axe
                229, -- silvered battle axe
                124, -- gilded battle axe
                2642, -- orc axe
                2660, -- dwarven axe
                296, -- merinium-plated battle axe
                2662, -- magical dwarven axe
                -- category: One handed swords
                2776, -- machete
                25, -- sabre
                78, -- short sword
                1, -- serinjah sword
                2757, -- scimitar
                2701, -- longsword
                85, -- coppered longsword
                98, -- silvered longsword
                2658, -- broadsword
                2778, -- elven sword
                84, -- gilded longsword
                2775, -- elven rainbowsword
                2788, -- snake sword
                123, -- merinium-plated longsword
                206, -- fire longsword
                2693, -- magical serinjah-sword
                2704, -- magical longsword
                2654, -- magical broadsword
                2656, -- fire broadsword
                -- category: Other
                -- category: Throwing weapons
                2645, -- throwing axe
                294, -- throwing star
                -- category: Tools
                -- category: Two handed axes
                2723, -- executioner's axe
                88, -- longaxe
                383, -- waraxe
                188, -- large waraxe
                1527, -- cleaver axe
                205, -- double axe
                2627, -- fire waraxe
                2640, -- large fire-waraxe
                2626, -- magical waraxe
                -- category: Two handed swords
                1525, -- flamberge
                204, -- greatsword
                1526, -- claymore
                2731, -- two-handed sword
                -- category: repair only
                2777, -- drow blade
                3035, -- drow sword
                -- ## From craft\final\carving.lua ##
                -- category: Arrows and bolts
                -- category: Blunt weapons
                2664, -- club
                230, -- mace
                1521, -- nail club
                231, -- battle flail
                1522, -- maul
                2737, -- war flail
                1044, -- battle hammer
                226, -- warhammer
                1523, -- heavy hammer
                1041, -- spiked mace
                1043, -- dwarven hammer
                1052, -- dwarven stormhammer
                -- category: Handles
                -- category: Other
                -- category: Spears
                1046, -- simple spear
                1038, -- snake spear
                1047, -- glaive
                1049, -- viper spear
                1040, -- ranseur
                1048, -- voulge
                77, -- halberd
                1042, -- partisan
                1053, -- divine voulge
                1039, -- twinblade ranseur
                1050, -- shadow ranseur
                1051, -- partisan of light
                -- category: Staffs
                1090, -- walking stick
                39, -- skull staff
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
                293, -- javelin
                -- category: Tools
                -- category: Wands
                -- ## From craft\final\planing.lua ##
                -- category: Bows
                65, -- short bow
                1531, -- rider's bow
                2646, -- serinjah-rider's bow
                2714, -- hunting bow
                2708, -- long bow
                70, -- crossbow
                2685, -- elven shortbow
                2780, -- ebony wood bow
                2718, -- elven composite longbow
                2727, -- fire hunter's bow
                -- category: Music instruments
                -- category: Shields
                -- category: Tableware
                -- category: Training weapons
                -- category: repair only
                2739, -- drow bow
                -- ## From craft\final\tailoring.lua ##
                -- category: Boots
                -- category: Cloth gloves
                -- category: Doublets
                -- category: Dresses
                -- category: Greaves
                -- category: Hats
                -- category: Helmets
                -- category: Leather gloves
                -- category: Other
                89, -- sling
--                97, -- leather bag
--                2760, -- rope
                -- category: Robes
                -- category: Shirts
                -- category: Skirts
                -- category: Torso armour
--                1433, -- padded armour
--                363, -- leather scale armour
--                1434, -- simple rogue armour
--                2407, -- light rogue armour
--                365, -- half leather armour
                1435, -- simple hunting armour
                1436, -- hunting armour
--                2399, -- light elven armour
--                2357, -- assassin's armour
                364, -- reinforced hunting armour
--                362, -- full leather armour
--                1437, -- assassin's armour of darkness
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