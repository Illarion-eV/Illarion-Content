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
local math = require("math")
local bit32 = require("bit32")

local M = {}


M.Nargun = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Nargun:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Nargún"
    self.nameEn = "Nargún"
    self.descriptionDe = "der Gott des Chaos"
    self.descriptionEn = "God of chaos"
    self.devotionItems = nil
    self._devotionItemsOptionsJunk = {  -- worth == 20
        15,  -- apple
        64,  -- arrow
        80,  -- banana
        199, -- tangerine
        302, -- cherries
        1207,-- orange
        1266,-- stone
    }
    self._devotionItemsOptionsMiddle = {  -- worth in 800 .. 1000
        1508,  -- jackboots
        2502,  -- bottle of milk
        2183,  -- clay mug
        2528,  -- small handle
        197,   -- amethyst
        1415,  -- white hat with feather
        254,   -- raw diamond
    }
    self._devotionItemsOptionsHigh = {  -- worth in 2400 .. 2600
        449,    -- obsidian powder
        789,    -- bottle of stawberry juice
        2278,   -- cabbage stew
        2534,   -- merinium ore
        3609,   -- banana bread
        1058,   -- silversteel boots
        230,    -- mace
    }
    self._devotionItemsHashMultiplierJunk = 11  -- should be relatively prime with corresponding devotionItemsOptions array length
    self._devotionItemsHashMultiplierMiddle = 13  -- should be relatively prime with corresponding devotionItemsOptions array length
    self._devotionItemsHashMultiplierHigh = 17 -- should be relatively prime with corresponding devotionItemsOptions array length
    self.sacrificeBannedItemIds = common.setFromList({
        3076,  -- copper coin
        3077,  -- silver coin
        61,    -- gold coin
    })
    -- Probability of an item id to be sacrificeable today is numerator/denominator.
    -- Denominator should be prime (or at least not power of 2)
    self.sacrificeProbNumerator = 2
    self.sacrificeProbDenomenator = 19
    self.sacrificeIdShift = math.ceil(math.log(self.sacrificeProbDenomenator, 2))  -- to avoid to direct impact of id on result of fmod
    M.RandomizeSacrificeableItems()  -- sets M._randPerDay
end



function M.Nargun:getDevotionItems(charObj)
    return {
        {id = self._devotionItemsOptionsJunk[math.fmod(charObj.id * self._devotionItemsHashMultiplierJunk, #self._devotionItemsOptionsJunk) + 1], number = 1},
        {id = self._devotionItemsOptionsMiddle[math.fmod(charObj.id * self._devotionItemsHashMultiplierMiddle, #self._devotionItemsOptionsMiddle) + 1], number = 1},
        {id = self._devotionItemsOptionsHigh[math.fmod(charObj.id * self._devotionItemsHashMultiplierHigh, #self._devotionItemsOptionsHigh) + 1], number = 1},
    }
end

function M.Nargun:_isIdSacrificeable(id)
    local randomizedId = bit32.bxor(M._randPerDay, bit32.lshift(id, self.sacrificeIdShift))
    local idSacrificeableToday = (math.fmod(randomizedId, self.sacrificeProbDenomenator) < self.sacrificeProbNumerator)
    return (idSacrificeableToday and not self.sacrificeBannedItemIds[id])
end

function M.Nargun:_getSingleRawSacrificeValue(item)
    local itemStats = world:getItemStats(item)
    local item_monetary_worth = itemStats.Worth

    if item_monetary_worth <= 0 then
        return 0
    end

    if self:_isIdSacrificeable(item.id) then
        return item_monetary_worth
    else
        return 0
    end
end

-- Random value that is rolled every IG day, and used to determine which items are sacrificeable
-- these should have been instance method and variable, but in lua it is hard to pass a bound method as callback
M._randPerDay = 0
function M.RandomizeSacrificeableItems()
    debug("Nargun is rolling the dice")
    M._randPerDay = math.random(0, 4294967296 - 1)  -- random int in range 0 to 2^32-1
end

return M