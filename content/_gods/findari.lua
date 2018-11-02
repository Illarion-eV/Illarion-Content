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
local baseelder = require("content._gods.baseelder")
local common = require('base.common')

local M = {}

M.Findari = class(
    baseelder.BaseElder,
    function(self, ...)
        self:_init(...)
    end
)

function M.Findari:_init(ordinal, elderOrdinal)
    baseelder.BaseElder._init(self, ordinal, elderOrdinal) -- call the base class constructor
    self.nameDe = "Findari"
    self.nameEn = "Findari"
    self.descriptionDe = "die Göttin der Luft"
    self.descriptionEn = "Goddess of air"
    self.devotionItems = {
        {id = 2551, number = 1}, -- pure air
        {id = 2718, number = 1}, -- elven composite longbow
        {id = 2421, number = 1}, -- white priest robe
    }
    self.sacrificeItems = {  -- array of tables defining groups of items for sacrificing
        {  -- FIXME
            id_set = common.setFromList({ -- set of item IDs
                2551, -- pure air
                2785, -- wand of air
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }

end



return M