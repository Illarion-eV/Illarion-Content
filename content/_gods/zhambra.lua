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

M.Zhambra = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Zhambra:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Zhambra"
    self.nameEn = "Zhambra"
    self.descriptionDe = "der Gott der Freundschaft und Treue"
    self.descriptionEn = "God of friendship and loyalty"
    self.devotionItems = {
        {id = 2185, number = 1}, -- wooden cup
        {id = 17, number = 1}, -- wooden shield
        {id = 1441, number = 1}, -- reinforced plate armour
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {
            id_set = common.setFromList({ -- array of item IDs
                -- ## From craft\final\armourer.lua ##
                -- category: Chain boots
                1507, -- simple jackboots
                1508, -- jackboots
                1057, -- robust jackboots
                1056, -- guardian's boots
                1058, -- silversteel boots
                1509, -- coppered guardian's boots
                1054, -- ornate jackboots
                1510, -- silvered guardian's boots
                1511, -- gilded guardian's boots
                699, -- salkamaerian steel shoes
                1512, -- master's steel shoes
                -- category: Chain gloves
                1460, -- simple chain gloves
                1461, -- chain gloves
                1462, -- reinforced chain gloves
                1463, -- coppered chain gloves
                1464, -- silvered chain gloves
                528, -- salkamaerian chain gloves
                1465, -- gilded chain gloves
                1466, -- guard's chain gloves
                1467, -- gladiator's chain gloves
                1468, -- merinium plated chain gloves
                1469, -- templar's chain gloves
                -- category: Chain greaves
                1485, -- simple short scale greaves
                2194, -- short scale greaves
                1486, -- reinforced short scale greaves
                1487, -- simple scale greaves
                2193, -- scale greaves
                1488, -- reinforced scale greaves
                1489, -- simple chain trousers
                2112, -- short chain trousers
                1490, -- reinforced chain trousers
                2111, -- chain pants
                1491, -- holy chain pants
                -- category: Chain helmets
                324, -- chain helmet
                16, -- orc helmet
                1425, -- coppered chain helmet
                2444, -- serinjah helmet
                1426, -- silvered chain helmet
                2441, -- storm cap
                1427, -- gilded chain helmet
                2302, -- gynkese mercenary's helmet
                1428, -- chain helmet of darkness
                2291, -- salkamaerian paladin's helmet
                2286, -- flame helmet
                -- category: Chain mails
                101, -- chain mail
                2359, -- mercenary armour
                2360, -- guardian's armour
                1095, -- scale armour
                2403, -- silversteel armour
                1438, -- coppered scale armour
                696, -- lizard armour
                1439, -- silvered scale armour
                2389, -- salkamaerian armour
                1440, -- gilded scale armour
                2365, -- salkamaerian officer's armour
                2400, -- state armour
                -- category: Plate boots
                1520, -- iron boots
                1513, -- simple steel boots
                326, -- steel boots
                1514, -- reinforced steel boots
                1515, -- coppered steel boots
                1055, -- dwarven boots
                1516, -- silvered steel boots
                771, -- albarian steel boots
                1517, -- gilded steel boots
                1518, -- paladin's steel boots
                770, -- knight boots
                1519, -- knight boots of swiftness
                -- category: Plate gloves
                1470, -- simple steel gloves
                325, -- steel gloves
                1471, -- reinforced steel gloves
                1472, -- coppered steel gloves
                1473, -- silvered steel gloves
                529, -- dwarven metal gloves
                1474, -- gilded steel gloves
                1475, -- squire's gloves
                530, -- albarian steel gloves
                531, -- knight gloves
                1476, -- merinium plated steel gloves
                1477, -- grand master's gloves
                -- category: Plate greaves
                1492, -- simple short iron greaves
                2117, -- short iron greaves
                1493, -- reinforced short iron greaves
                1494, -- simple iron greaves
                2116, -- iron greaves
                1495, -- reinforced iron greaves
                1496, -- simple steel greaves
                2172, -- steel greaves
                1497, -- reinforced steel greaves
                1498, -- knight's steel greaves
                1499, -- steel greaves of eternal night
                -- category: Plate helmets
                202, -- steel cap
                1429, -- reinforced steel cap
                187, -- steel hat
                1430, -- reinforced steel hat
                2290, -- round steel hat
                94, -- pot helmet
                1431, -- reinforced pot helmet
                1432, -- albarian mercenary's helmet
                2287, -- albarian soldier's helmet
                184, -- visored helmet
                185, -- visored helmet of darkness
                -- category: Plate armour
                4, -- plate armour
                1441, -- reinforced plate armour
                2364, -- steel plate
                1443, -- coppered plate armour
                1442, -- reinforced steel plate
                1444, -- silvered plate armour
                2395, -- dwarven plate
                1445, -- gilded plate armour
                2369, -- albarian steel plate
                2390, -- dwarven state armour
                1446, -- albarian knight's armour
                2367, -- albarian noble's armour
                2393, -- heavy plate armour
                2363, -- nightplate
                -- ## From craft\final\planing.lua ##
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
                -- category: Training weapons
                445, -- wooden sword
                1045, -- wooden dagger
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }
end


return M