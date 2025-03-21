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

local M = {}

local equipmentNames = {
    {english = "Backpack", german = "Tasche", slot = 0},
    {english = "Head", german = "Kopf", slot = 1},
    {english = "Neck", german = "Hals", slot = 2},
    {english = "Torso", german = "Torso", slot = 3},
    {english = "Hands", german = "Hände", slot = 4},
    {english = "In Left Hand", german = "In der linken Hand", slot = 5},
    {english = "In Right Hand", german = "In der rechten Hand", slot = 6},
    {english = "Left ring finger", german = "Linker Ringfinger", slot = 7},
    {english = "Right ring finger", german = "Rechter Ringfinger", slot = 8},
    {english = "Legs", german = "Beine", slot = 9},
    {english = "Feet", german = "Füße", slot = 10},
    {english = "Back", german = "Rücken", slot = 11}
}

-- For some reason the below was unused and I cant remember what it was for, keeping it as a comment for now until I implement SAV at a later date
--[[ local equipmentPrefix = {
    quality = {english = "Equipment quality: ", german = "Qualität der Ausrüstung: "},
    durability = {english = "Equipment state: ", german = "Zustand der Ausrüstung: "}
} ]]

function M.getEquipmentText(information, spell)

    local ANTH = runes.checkSpellForRuneByName("ANTH", spell)
    local SAV = runes.checkSpellForRuneByName("SAV", spell)

    if not SAV then
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
            if ANTH then
                target.equipment.items = {}
                for _, slot in pairs(equipmentNames) do
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
