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

-- This times an inform after you've had a glyphed item equipped long enough to let you know it is ready, effect id 403

local handlingOfGlyphEquipment = require("magic.arcane.enchanting.core.handling_of_glyph_equipment")


local M = {}

local slots = handlingOfGlyphEquipment.slots

local function atleastOnePieceOfJewelleryOnCooldown(user, effect)

    local retVal = false
    local retVal2 = false

    if not effect then
        return retVal
    end

    for _, slot in pairs(slots) do

        local slotValueFound, slotValue = effect:findValue(tostring(slot))

        if slotValueFound and slotValue == 1 then
            if not handlingOfGlyphEquipment.checkIfLongEnoughTimePassedSinceEquip(user, slot) then
                retVal2 = true
            end
            retVal = true
        end
    end

    return retVal, retVal2

end

function M.addEffect(effect, user)

end

function M.callEffect(effect, user)

    local informsRequested = atleastOnePieceOfJewelleryOnCooldown(user, effect)

    if not informsRequested then
        return false
    end

    local count = 0

    local amulet = false

    local english = "ring"
    local german = "Ring"

    for _, slot in pairs(slots) do

        local slotValueFound, slotValue = effect:findValue(tostring(slot))

        if slotValueFound and slotValue == 1 and handlingOfGlyphEquipment.checkIfLongEnoughTimePassedSinceEquip(user, slot) then

            amulet = slot == Character.neck

            effect:addValue(tostring(slot), 0)

            count = count + 1
        end

    end

    if amulet then
        english = "amulet"
        german = "Amulett"
    end

    local _, cooldownsRemaining = atleastOnePieceOfJewelleryOnCooldown(user, effect)

    --all german translations below are chatGPT and need proofreading

    if count == 1 then -- To prevent the spam of 2/3 informs if multiple glyphs are charged at once, we do this check
        user:inform("Du spürst, dass die Glyphe im "..german.." das Aufladen abgeschlossen hat und nun, mit etwas Glück und unter den richtigen Umständen, Wirkung zeigen kann." ,"You feel the glyph in the "..english.." has finished charging and can now, with some luck and under the right circumstances, take effect.")
    elseif count > 1 and not cooldownsRemaining then
        user:inform("Die Glyphen in deinem Schmuck sind alle vollständig aufgeladen und werden unter den richtigen Umständen und mit etwas Glück Wirkung zeigen.", "The glyphs in your jewellery have all finished charging and will, under the right circumstances and with some luck, take effect.")
    elseif count > 1 and cooldownsRemaining then
        if amulet then
            user:inform("Einer deiner mit Glyphen versehenen Ringe und dein Amulett sind vollständig aufgeladen und werden unter den richtigen Umständen und mit etwas Glück Wirkung zeigen." ,"One of your glyphed rings and your glyphed amulet have finished charging and will, under the right circumstances and with some luck, take effect.")
        else
            user:inform("Beide Glyphen in deinen Ringen sind vollständig aufgeladen und werden unter den richtigen Umständen und mit etwas Glück Wirkung zeigen.", "Both of the glyphs in your rings have finished charging and will, under the right circumstances and with some luck, take effect.")
        end
    end

    effect.nextCalled = 100

    return true

end

function M.removeEffect(effect, user)

end

function M.loadEffect(effect, user)

end

return M
