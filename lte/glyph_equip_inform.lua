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

-- Used to check if a glyph is ready and provide informs for it to more clearly communicate to the player if the glyph is usable, effect id 403

local handlingOfGlyphEquipment = require("magic.arcane.enchanting.core.handling_of_glyph_equipment")
local common = require("base.common")

local M = {}

local slots = handlingOfGlyphEquipment.slots

function M.addEffect(effect, user)

end

local function checkIfCooldownsRemain(effect)

    for _, slot in pairs(slots) do

        local slotValueFound, slotValue = effect:findValue(tostring(slot))

        if slotValueFound and slotValue ~= 0 then
            return true
        end
    end

    return false
end

function M.callEffect(effect, user)

    effect.nextCalled = 100

    local count = 0

    local amulet = false

    local amuletGerman = "Amulett"
    local amuletEnglish = "amulet"
    local ringGerman = "Ring"
    local ringEnglish = "ring"

    for _, slot in pairs(slots) do

        local time = common.GetCurrentTimestamp()

        local slotValueFound, slotValue = effect:findValue(tostring(slot))

        if slotValueFound and (time - slotValue) >= 120 and slotValue > 0 then --Enough time has passed for the cooldown to be over and it has not already informed the user

            effect:addValue(tostring(slot), 0) -- Timer reset to 0 to indicate that no inform is to be given on next cycle

            if user:getItemAt(slot).id ~= 0 and not common.IsNilOrEmpty(user:getItemAt(slot):getData("glyphCharges")) then --Verify item still exists

                count = count + 1

                if not amulet then --Only check for amulet if it was not already found, to prevent it being overwritten
                    amulet = slot == Character.neck
                end

                local foundId, jewelleryId = effect:findValue(tostring(slot).."id")

                if foundId then

                    local commonItem = world:getItemStatsFromId(jewelleryId)

                    if slot == Character.neck then
                        amuletEnglish = commonItem.English
                        amuletGerman = commonItem.German
                    else
                        ringEnglish = commonItem.English
                        ringGerman = commonItem.German
                    end
                end
            end

        end

    end

    local english = ringEnglish
    local german = ringGerman

    local cooldownsRemain = checkIfCooldownsRemain(effect)

    if count == 0 then
        if cooldownsRemain then
            return true
        else
            return false
        end
    end

    if amulet then
        english = amuletEnglish
        german = amuletGerman
    end

    --all german translations below are chatGPT and need proofreading

    if count == 1 then -- To prevent the spam of 2/3 informs if multiple glyphs are charged at once, we do this check
        --One ring or one amulet finished charging
        user:inform("Du spürst, dass die Glyphe im "..german.." das Aufladen abgeschlossen hat und nun, mit etwas Glück und unter den richtigen Umständen, Wirkung zeigen kann." ,"You feel the glyph in the "..english.." has finished charging and can now, with some luck and under the right circumstances, take effect.")
    elseif count == 2 then
        -- Two rings or a ring and amulet finished charging
        if amulet then
            user:inform("Dein mit einer Glyphe versehener "..ringGerman.." und dein "..amuletGerman.." sind vollständig aufgeladen und werden unter den richtigen Umständen und mit etwas Glück Wirkung zeigen." ,"Your glyphed "..ringEnglish.." and your glyphed "..amuletEnglish.." have finished charging and will, under the right circumstances and with some luck, take effect.")
        else
            user:inform("Beide Glyphen in deinen Ringen sind vollständig aufgeladen und werden unter den richtigen Umständen und mit etwas Glück Wirkung zeigen.", "Both of the glyphs in your rings have finished charging and will, under the right circumstances and with some luck, take effect.")
        end
    elseif count == 3 then
        --All three finished charging at once
        user:inform("Die Glyphen in deinem Schmuck sind alle vollständig aufgeladen und werden unter den richtigen Umständen und mit etwas Glück Wirkung zeigen.", "The glyphs in your jewellery have all finished charging and will, under the right circumstances and with some luck, take effect.")
    end

    return true

end

function M.removeEffect(effect, user)

end

function M.loadEffect(effect, user)

end

return M
