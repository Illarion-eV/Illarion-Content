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
        {  -- TODO more items or something special
            id_set = common.setFromList({ -- set of item IDs
                466, -- Handcuffs?
                2760, -- Rope?
                63, -- Entrails
                -- raw meat?
                307, -- Pork
                1151, -- Chicken meat
                553, -- Rabbit meat
                2934, -- Lamb meat
                552, -- Deer meat
                2940, -- Raw steak
            }),
            minimal_quality = 0, -- int in 1..9 - if present, item quality has to be greater or equal
            minimal_durability = 0, -- int in 0..99 - if present, item durability has to be greater or equal
            value_multiplier = 1, -- float -- the monetary value gets multiplied by this
        },
    }
end

function M.Moshran:informBecomeDevoted(User)
    common.InformNLS(User,
        "FIXGERMAN Ihr empfangt den Segen " .. self.nameDe .. "s und weiht euer Leben dem Glaube an die Gottheit.",
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