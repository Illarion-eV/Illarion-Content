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

local lookat = require("base.lookat")
local runes = require("magic.arcane.runes")
local texts = require("magic.arcane.base.texts")



local M = {}

M.itemTexts = texts.itemTexts

function M.individualItemText(theItem, dIndex, qIndex, fakeWeight)
    local itemTexts = M.itemTexts
    local GenericQualDe = lookat.GenericQualDe
    local GenericDuraDe = lookat.GenericDuraDe
    local GenericQualEn = lookat.GenericQualEn
    local GenericDuraEn = lookat.GenericDuraEn
    local GenericDuraLm = lookat.GenericDuraLm
    local itemId = theItem.id
    local itemDura
    local itemQual
    local qualIndex
    local duraIndex

    if dIndex then
        duraIndex = dIndex
    else
        itemDura = math.fmod(theItem.quality, 100)
        for i, duraLimit in pairs(GenericDuraLm) do
            if itemDura >= duraLimit then
                duraIndex = i
                break
            end
        end
    end

    if qIndex then
        qualIndex = qIndex
    else
        itemQual = (theItem.quality - itemDura) / 100
        qualIndex = 10 - itemQual
    end

    if qualIndex < 1 then
        qualIndex = 1
    elseif qualIndex > 10 then
        qualIndex = 10
    end

    local itemName = {}
    local germanName = theItem:getData("nameDe")
    local englishName = theItem:getData("nameEn")

    if germanName ~= "" then
        itemName.german = germanName
    else
        itemName.german = world:getItemName(itemId, Player.german)
    end

    if englishName ~= "" then
        itemName.english = englishName
    else
        itemName.english = world:getItemName(itemId, Player.english)
    end

    local qualityText = {}
    local durabilityText = {}
    qualityText.german = GenericQualDe[qualIndex]
    durabilityText.german = GenericDuraDe[1][duraIndex]
    qualityText.english = GenericQualEn[qualIndex]
    durabilityText.english = GenericDuraEn[1][duraIndex]

    local itemCommon = world:getItemStatsFromId(theItem.id)
    local itemDescription = {german = theItem:getData("descriptionDe"), english = theItem:getData("descriptionEn")}
    local itemWeight = theItem.number * itemCommon.Weight
    local unitEn
    local unitDe
    if fakeWeight then
        itemWeight = fakeWeight*2 -- *2 because the query asks you how many _blackberries_ the weight should equal to, not weight number
    end

    if itemWeight == 2 then
        unitEn = itemTexts.unit.singular.english
        unitDe = itemTexts.unit.singular.german
    else
        unitEn = itemTexts.unit.plural.english
        unitDe = itemTexts.unit.plural.german
    end

    local englishTextName = itemTexts.name.english..itemName.english.."\n"
    local germanTextName = itemTexts.name.german..itemName.german.."\n"
    local englishTextQuality = itemTexts.quality.english..qualityText.english.."\n"
    local germanTextQuality = itemTexts.quality.german..qualityText.german.."\n"
    local englishTextDurability = itemTexts.durability.english..durabilityText.english.."\n"
    local germanTextDurability = itemTexts.durability.german..durabilityText.german.."\n"
    local englishTextWeight = itemTexts.weight.english..(itemWeight/2).." "..unitEn
    local germanTextWeight = itemTexts.weight.german..(itemWeight/2).." "..unitDe
    local englishTextDescription = ""
    local germanTextDescription = ""
        if itemDescription.german ~= "" and itemDescription.english ~= "" then
            englishTextDescription = "\n"..itemTexts.description.english..itemDescription.english
            germanTextDescription = "\n"..itemTexts.description.german..itemDescription.german
        end
    local englishText = englishTextName..englishTextQuality..englishTextDurability..englishTextWeight..englishTextDescription
    local germanText = germanTextName..germanTextQuality..germanTextDurability..germanTextWeight..germanTextDescription

    return englishText, germanText
end

function M.getItemText(information, spell)
local Anth = runes.checkSpellForRuneByName("Anth", spell)
    if not Anth then
        return information
    end
    for _, target in pairs(information) do
        if target.type == "item" then
            local theItem = target.target
            local englishText, germanText = M.individualItemText(theItem)
            target.item = {}
            target.item.english = englishText
            target.item.german = germanText
        end
    end
return information
end

return M
