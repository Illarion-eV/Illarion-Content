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

local petsBase = require("petsystem.pets.base")
local petSystemBase = require("petsystem.base")

local M = {}

M.petProperties = {

    monsterId = 1057,
    nameDe = "Runewicker Milchkuh",
    nameEn = "Runewickian Milk Cow",
    descriptionDe = "Eine gutherzige Kuh. Halblinge schwören auf ihre feine Milch führs Kuchenbacken.",
    descriptionEn = "A kindhearted cow. Halflings swear on its fine milk for their pies and cakes.",
    downEmotes = {english = "#me setzt sich auf den Boden.", german = "#me setzt sich auf den Boden."},
    tooFarAwayCry = "Muuuuuuuuuuh!",
    validCommands = {[petSystemBase.follow] = true, [petSystemBase.heel] = true, [petSystemBase.down] = true, [petSystemBase.nearBy] = true, [petSystemBase.stray] = true},
    colour = colour(255, 255, 255),
    priceInGold = 15

}

M = petsBase.generatePetEntryPoints(M)

return M