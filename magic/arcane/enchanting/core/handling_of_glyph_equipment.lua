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

local quests = {}
quests[Character.neck] = 564
quests[Character.finger_left_hand] = 565
quests[Character.finger_right_hand] = 566

function M.saveTimeOfJewelleryEquipment(user, jewellery)

    local hasGlyph = not common.IsNilOrEmpty(jewellery:getData("glyphCharges"))

    if not hasGlyph then
        return
    end

    user:setQuestProgress(quests[jewellery.itempos], common.GetCurrentTimestamp())

end

function M.checkIfLongEnoughTimePassedSinceEquip(user, itempos)

    local time = common.GetCurrentTimestamp()

    local savedTime = user:getQuestProgress(quests[itempos])

    local difference = time - savedTime

    if difference >= 120 then
        return true
    end

    return false
end

return M
