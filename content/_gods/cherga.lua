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

M.Cherga = class(
    baseyounger.BaseYounger,
    function(self, ...)
        self:_init(...)
    end
)

function M.Cherga:_init(ordinal, youngerOrdinal)
    baseyounger.BaseYounger._init(self, ordinal, youngerOrdinal) -- call the base class constructor
    self.nameDe = "Cherga"
    self.nameEn = "Cherga"
    self.descriptionDe = "die Göttin der Geister und der Unterwelt"
    self.descriptionEn = "Goddess of spirits and the underworld"
    self.devotionItems = {
        {id = 24, number = 1}, -- shovel
        {id = 43, number = 1}, -- candle
        {id = 182, number = 1}, -- black shirt
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {  -- TODO more items
            id_set = common.setFromList({ -- set of item IDs
                -- light sources
                -- all light sources have price==0 when lit, so we currently use only unlit ones and their fuel
                391, -- torch
                43, -- candle
                399, -- candle stick
                393, -- lantern
                469, -- lamp oil
                92, -- oil lamp
                -- burial
                24, -- shovel
                733, -- stone block (symbolizing gravestone)
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }

end


return M