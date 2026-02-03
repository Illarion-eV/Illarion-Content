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
local antiTroll = require("magic.base.antiTroll")

local M = {}

local myTexts = {
    craft = {english = "Portal  Book Creation", german = "Portalbuch Erstellung"},
    category = {english = "Portal Books", german = "Portalbücher"},
    book = {english = "Portal book", german = "Portalbuch"}
}

function M.portalBookCreation(user, sourceItem)

    local isMage = user:getMagicType() == 0 and user:getMagicFlags(0) > 0 or user:getMagicType() == 0 and user:getQuestProgress(37) ~= 0

    if not isMage then
        user:inform("Du besitzt nicht die nötige magische Affinität, um an diesem Tisch zu arbeiten.", "You do not have the magical affinity required to work at this desk.")
        return
    end

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

    local attunedSpots = 0
    -- Portal locations
    for i = 1, #antiTroll.portals do
        local spot = antiTroll.portals[i]
        local levelReq = spot.level

        if levelReq <= spatialMagicLevel then
            if spatial.spotAttuned(user, i) then
                attunedSpots = attunedSpots + 1
                local product = portalBooks:addProduct(catId, 1061, 1, {
                    destinationCoordsZ = spot.location.z,
                    destinationCoordsY = spot.location.y,
                    destinationCoordsX = spot.location.x,
                    nameEn = myTexts.book.english,
                    nameDe = myTexts.book.german,
                    destinationEn = spot.nameEn,
                    destinationDe = spot.nameDe
                    },
                    levelReq
                )
                product:addIngredient(4815) -- the empty book, obtained from tailors
                product:addIngredient(1118) -- bottle of ink, obtained from dyemakers
                if spot.extraIngredients then --for more advanced books
                    for _, extraIngredient in pairs(spot.extraIngredients) do
                        product:addIngredient(extraIngredient.id, extraIngredient.amount)
                    end
                end
            end
        end
    end

    if attunedSpots > 0 then
        portalBooks:showDialog(user, sourceItem)
    else
        user:inform("Um ein Portalbuch zu erstellen, musst du dich zuerst mit einem Raumknoten abstimmen. Wenn du mehr darüber erfahren möchtest, wie das geht, kannst du Terry Ogg in Troll's Haven aufsuchen, um Anleitungen zu erhalten.", "To create a portal book, you must first attune yourself to a spatial node. If you wish to learn more about how to do so, you can find Terry Ogg in Troll's Haven for guidance.")
    end
end

return M
