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

local common = require('base.common')
local globalvar = require("base.globalvar")
local class = require('base.class')
local baseyounger = require("content._gods.baseyounger")

local M = {}

M.Moshran = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Moshran:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Moshran"
    self.nameEn = "Moshran"
    self.descriptionDe = "der Gott des Blutes und der Gebeine"
    self.descriptionEn = "God of blood and bones"
    self.devotionItems = {
        {id = 16, number = 1}, -- orc helmet
        {id = 283, number = 1}, -- obsidian
        {id = 2776, number = 1}, -- machete
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            -- triple value for orc and drow equipment
            id_set = common.setFromList({ -- set of item IDs
                2642, -- orc axe
                16, -- orc helmet
                2777, -- drow blade
                3035, -- drow sword
                2303, -- drow helmet
                2402, -- drow armour
                2739, -- drow bow
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 3, -- float -- the monetary value gets multiplied by this
        },
        {
            -- Big bonus for dragon eggs
            id_set = common.setFromList({ -- set of item IDs
                738 --Dragon egg
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 5, -- float -- the monetary value gets multiplied by this
        },
        {id_set = common.setFromList({ -- set of item IDs
            -- Miscellaneous
                466, -- Handcuffs?
                2760, -- Rope?
                63, -- Entrails
                374, -- trap set
                283, -- Cut Obsidian
                449, -- Obsidian powder
                136, --Anger berry
                141, --Black thistle
                391, -- torch
                333, --horn (warhorn)
                2681, --Bucket of red dye, symbolizing blood
                3078, --Poison coins
            -- Poisonous substances from food.lua
                158, --bulbsponge
                159, --toadstool
                162, --birth mushroom
            -- raw meat?
                307, -- Pork
                1151, -- Chicken meat
                553, -- Rabbit meat
                2934, -- Lamb meat
                552, -- Deer meat
                2940, -- Raw steak
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
                --91, -- Malachín dagger
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
                --2642, -- orc axe
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
                -- category: Throwing weapons
                2645, -- throwing axe
                294, -- throwing star
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
            -- ## From craft\final\carving.lua ##
            -- category: Arrows and bolts
                64, -- arrow
                237, -- crossbow bolt
                322, -- wind arrows
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
            -- category: Spears
                1046, -- simple spear
                1038, -- snake spear
                1047, -- glaive
                1049, -- viper spear
                1040, -- ranseur
                1048, -- voulge
                77, -- halberd
                1042, -- partisan
                -- 1053, -- divine voulge
                1039, -- twinblade ranseur
                1050, -- shadow ranseur
                -- 1051, -- partisan of light
            -- category: Staffs
                -- 1090, -- walking stick
                39, -- skull staff
                -- 40, -- cleric's staff
                -- 1528, -- novice's staff
                -- 57, -- simple mage's staff
                -- 1529, -- adepts's staff
                -- 76, -- mage's staff
                -- 209, -- elven mage's staff
                207, -- battle staff
                -- 208, -- ornate mage's staff
                1530, -- master's staff
            -- category: Throwing weapons
                293, -- javelin
            -- ## From craft\final\finesmithing.lua ##
            -- category: Crowns
                3557, -- kings's crown
                225, -- crown
            -- category: Amulets
                3536, -- copper obsidian amulet
                3538, -- silver obsidian amulet
                82, -- golden obsidian amulet
            -- category: Rings
                3537, -- copper obsidian ring
                3561, -- silver obsidian ring
                278, -- golden obsidian ring
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
            -- category: Shields
                2445, -- small wooden shield
                17, -- wooden shield
                18, -- light shield
                917, -- red warden's shield
                19, -- metal shield
                20, -- knight shield
                186, -- round metal shield
                2388, -- red steel shield
                2448, -- legionnaire's tower shield
                95, -- heraldic shield
                96, -- steel tower shield
                916, -- ornate tower shield
                2284, -- shield of the sky
                2447, -- mosaic shield
                2439, -- cloud shield
            -- ## From craft\final\tailoring.lua ##
            -- category: Boots
                1500, -- simple leather shoes
                369, -- leather shoes
                1501, -- robust leather shoes
                1502, -- simple leather boots
                53, -- leather boots
                1503, -- robust leather boots
                1504, -- simple fur boots
                697, -- fur boots
                1505, -- robust fur boots
                698, -- serinjah leather boots
                1506, -- leather boots of the winds
            -- category: Cloth gloves
                1449, -- black cloth gloves
                1450, -- red cloth gloves
            -- category: Doublets
                812, -- black doublet
                811, -- red doublet
            -- category: Greaves
                1478, -- simple short leather leggings
                367, -- short leather leggings
                1479, -- reinforced short leather leggings
                1480, -- simple leather leggings
                366, -- leather leggings
                1481, -- reinforced leather leggings
                1482, -- simple short fur trousers
                2114, -- short fur trousers
                1483, -- reinforced short fur trousers
                2113, -- fur trousers
                1484, -- fur trousers of dawn
            -- category: Hats
                3708, -- witch hat
            -- category: Helmets
                1416, -- simple horned helmet
                7, -- horned helmet
                1417, -- coppered horned helmet
                1418, -- silvered horned helmet
                1419, -- gilded horned helmet
                1420, -- bull horned helmet
                1421, -- Norodaj horned helmet
                1422, -- demonic horned helmet
                1423, -- merinium plated horned helmet
                1424, -- dragon horned helmet
            -- category: Leather gloves
                1453, -- simple leather gloves
                384, -- thief's gloves
                48, -- leather gloves
                1454, -- reinforced leather gloves
                526, -- studded leather gloves
                1455, -- copper studded leather gloves
                1456, -- silver studded leather gloves
                1457, -- gold studded leather gloves
                527, -- serinjah leather gloves
                1458, -- reinforced serinjah leather gloves
                1459, -- ranger's gloves
            -- category: Robes
                194, -- black robe
                2378, -- black cult robe
                2384, -- black coat
                2420, -- black priest robe
            -- category: Shirts
                182, -- black shirt
                180, -- red shirt
            -- category: Torso armour
                1433, -- padded armour
                363, -- leather scale armour
                1434, -- simple rogue armour
                2407, -- light rogue armour
                365, -- half leather armour
                1435, -- simple hunting armour
                1436, -- hunting armour
                2399, -- light elven armour
                2357, -- assassin's armour
                364, -- reinforced hunting armour
                362, -- full leather armour
                1437, -- assassin's armour of darkness
            -- category: Trousers
                34, -- short black trousers
                826, -- black trousers
                459, -- short red trousers
                825, -- red trousers
            -- category: Tunics
                819, -- black tunic
                818, -- red tunic
        }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }
end

function M.Moshran:informBecomeDevoted(User)
    common.InformNLS(User,
        self.nameDe .. " akzeptiert das Angebot, dein Leben in seine Dienste zu stellen.",
        self.nameEn .. " accepts your offer to devote your life to serving him."
    )
    world:gfx(globalvar.gfxDEMFIRE, User.pos)
    world:makeSound(globalvar.sfxEVIL_LAUGH, User.pos)
end

function M.Moshran:informBecomePriest(User)
    common.InformNLS(User,
        "FIXGERMAN " .. self.nameDe .. "",
        "FIXME " .. self.nameEn .. " consumes your soul and gives demonic powers to the empty shell that remains."
    )
    world:gfx(globalvar.gfxDEMFIRE, User.pos)
    world:makeSound(globalvar.sfxEVIL_LAUGH, User.pos)
end

return M