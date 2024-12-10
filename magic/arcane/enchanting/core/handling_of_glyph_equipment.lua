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

local common = require("base.common")

local M = {}

M.slots = {Character.neck, Character.finger_left_hand, Character.finger_right_hand}

local effectId = 403

function M.unequipJewellery(user, jewellery)

    for _, slot in pairs(M.slots) do

        if user:getItemAt(slot).id == 0 then --This slot is empty and might have been emptied out

            local foundEffect, myEffect = user.effects:find(effectId)

            local commonItem = world:getItemStatsFromId(jewellery.id)

            if foundEffect then

                local time = common.GetCurrentTimestamp()

                local foundValue, value = myEffect:findValue(tostring(slot))

                if foundValue and (time - value) < 120 and value ~= 0 then --less than the required 2 min have passed
                    user:inform("Du hast das "..commonItem.German.." abgelegt, bevor die Glyphe darin Zeit hatte, sich vollständig aufzuladen.", "You unequipped the "..commonItem.English.." before the glyph in it had time to finish charging up.")
                    break
                end
            end
        end
    end

end

function M.saveTimeOfJewelleryEquipment(user, jewellery)

    local time = common.GetCurrentTimestamp()

    local hasGlyph = not common.IsNilOrEmpty(jewellery:getData("glyphCharges"))

    if not hasGlyph then
        return
    end

    local commonItem = world:getItemStatsFromId(jewellery.id)

    local foundEffect, myEffect = user.effects:find(effectId)

    if foundEffect then

        myEffect:addValue(tostring(jewellery.itempos), time)

        myEffect:addValue(tostring(jewellery.itempos).."id", jewellery.id)

    elseif not foundEffect then

        myEffect = LongTimeEffect(effectId, 100)

        myEffect:addValue(tostring(jewellery.itempos), time)

        myEffect:addValue(tostring(jewellery.itempos).."id", jewellery.id)

        user.effects:addEffect(myEffect)
    end

    user:inform("Als du das "..commonItem.German.." dass die Glyphe darin sich auflädt und einen Moment benötigt, bevor sie Wirkung zeigen kann.", "As you equip the "..commonItem.English.." you perceive that the glyph in it is charging up, requiring a moment before it can begin to take effect.") --chatGPT german translation that needs a proofread for accuracy

end

function M.checkIfLongEnoughTimePassedSinceEquip(user, itempos)

    local foundEffect, myEffect = user.effects:find(effectId)

    if not foundEffect then -- No effect means no ongoing timer means enough time has passed by default
        return true
    end

    local time = common.GetCurrentTimestamp()

    local foundtime, savedTime = myEffect:findValue(tostring(itempos))

    if not foundtime then
        return true
    end

    local difference = time - savedTime

    if difference >= 120 or savedTime == 0 then -- Checks if 2 minutes has passed since equipping it
        return true
    end

    return false
end

return M
