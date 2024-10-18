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
local crafts = require("craft.base.crafts")
local spatial = require("magic.arcane.spatial")
local texts = require("magic.base.texts")
local myTexts = texts.portalBookTexts

local M = {}

function M.portalBookCreation(user, sourceItem)

    local spatialMagicLevel = user:getSkill(Character.spatialMagic)

    local portalBooks = crafts.Craft:new{
        craftEN = myTexts.craft.english,
        craftDE = myTexts.craft.german,
        handTool = 463,
        leadSkill = Character.spatialMagic,
        sfx = 0,
        sfxDuration = 80,
        }

    -- magic desks to work at
    portalBooks:addTool(3502)
    portalBooks:addTool(3503)


    local catId = portalBooks:addCategory(myTexts.category.english, myTexts.category.german)

    -- Portal locations
    for i = 1, #texts.portalSpots do
        local spot = texts.portalSpots[i]
        local levelReq = spot.level

        if levelReq <= spatialMagicLevel then
            if spatial.spotAttuned(user, i) then
                local product = portalBooks:addProduct(catId, 1061, 1, {
                    destinationCoordsZ = spot.location.z,
                    destinationCoordsY = spot.location.y,
                    destinationCoordsX = spot.location.x,
                    nameEn = myTexts.book.english,
                    nameDe = myTexts.book.german,
                    destinationEn = spot.nameEn,
                    destinationDe = spot.nameDe
                    }
                )
                product:addIngredient(4815) -- the empty book, obtained from tailors
                product:addIngredient(1118) -- bottle of ink, obtained from dyemakers
                product:addRemnant(1117) -- empty bottle of ink
            end
        end
    end
    portalBooks:showDialog(user, sourceItem)
end

return M
