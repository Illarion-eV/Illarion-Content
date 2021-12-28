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

local runes = require("magic.arcane.runes")
local playerlookat = require("server.playerlookat")
local items = require("magic.arcane.spirit.items")
local texts = require("magic.arcane.base.texts")

local M = {}

M.equipmentNames = texts.equipmentNames

M.equipmentPrefix = texts.equipmentPrefix

function M.getEquipmentText(information, spell)
    local Anth = runes.checkSpellForRuneByName("Anth", spell)
    local Sav = runes.checkSpellForRuneByName("Sav", spell)

    if not Sav then
        return information
    end
    for _, target in pairs(information) do
        if target.type == "creature" or  target.type == "player" then
            local qual,dura= playerlookat.getClothesFactor(target.target)
            local gender = target.gender
            local germanText = playerlookat.getClothesText(qual, dura, Player.german, gender)
            local englishText = playerlookat.getClothesText(qual, dura, Player.english, gender)
            target.equipment = {}
            target.equipment.english = englishText
            target.equipment.german = germanText
            if Anth then
                target.equipment.items = {}
                for _, slot in pairs(M.equipmentNames) do
                    local targetItem = target.target:getItemAt(slot.slot)
                    if targetItem.id ~= 0 and targetItem.id ~= 228 then
                        local itemEnglishText, itemGermanText = items.individualItemText(targetItem)
                        target.equipment.items[#target.equipment.items+1] = {target = targetItem, type = "item", text = {english = itemEnglishText, german = itemGermanText}, name = {english = slot.english, german = slot.german}}
                    end
                end
            end
        end
    end
    return information
end

return M
