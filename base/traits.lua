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

local M = {}

-- Base functions
function M.hasTrait(character, traitTable)
    return bit32.extract(character:getQuestProgress(traitTable.questId), traitTable.bitPostion) > 0
end

function M.setTrait(character, traitTable)
    character:setQuestProgress(traitTable.questId, bit32.replace(character:getQuestProgress(traitTable.questId), 1, traitTable.bitPostion))
end

function M.removeTrait(character)
    character:setQuestProgress(traitTable.questId, bit32.replace(character:getQuestProgress(traitTable.questId), 0, traitTable.bitPostion))
end

-- This table contains all traits
M.allTraits = {}

-- Trait categoris --
local GENERAL = 1

--Passive income--
-- Beginning of each month, the character is granted some money by their secret sources.
M.PASSIVE_INCOME = {questId = 720, bitPostion = 1, nameDe = "Passives Einkommen", nameEn = "Passive income", descriptionDe = "Jeden Monat erhälst du einen kleinen Geldbetrag aus deinen Quellen.", descriptionEn = "Every month, your sources grant you a small amount of money.", category = GENERAL}
table.insert(allTraits, M.PASSIVE_INCOME)

return M