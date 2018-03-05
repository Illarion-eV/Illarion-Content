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
    self.devotionItems = {{id = 2551, number = 1}, {id = 2552, number = 1}} --FIXME
end

function M.Moshran:informBecomeDevoted(User)
    common.InformNLS(User, "FIXME Ihr empfangt den Segen " .. self.nameDe .. "s und weiht euer Leben dem Glaube an die Gottheit.", "FIXME " .. self.nameEn .. " is your master now.")
    world:gfx(globalvar.gfxDEMFIRE, User.pos)
    world:makeSound(globalvar.sfxEVIL_LAUGH, User.pos)
end

function M.Moshran:informBecomePriest(User)
    common.InformNLS(User, "FIXME " .. self.nameDe .. "", "FIXME " .. self.nameEn .. " consumes your soul and gives demonic powers to the empty shell that remains.")
    world:gfx(globalvar.gfxDEMFIRE, User.pos)
    world:makeSound(globalvar.sfxEVIL_LAUGH, User.pos)
end

return M