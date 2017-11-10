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

function M.getMagicBonus(character)
    local bodyPositions = {Character.head, Character.neck, Character.breast, Character.hands, Character.finger_left_hand, Character.finger_right_hand, Character.legs, Character.feet, Character.coat}
    
    local itemsCounted = 0
    local magicBonus = 0
    local quality = 0
    for _, bodyPosition in pairs(bodyPositions) do
        local checkItem = character:getItemAt(bodyPosition)
        if checkItem ~= nil and checkItem.id > 0 then
            local isArmor, armorStruct =  world:getArmorStruct(checkItem.id)
            magicBonus = magicBonus + armorStruct.MagicDisturbance
            quality = quality + math.floor(checkItem.quality/100)
            itemsCounted = itemsCounted + 1
        end
    end
    
    local qualityBonus = 1
    if itemsCounted > 1 then
        local qualityBonus = qualityBonus+(quality/itemsCounted - 5)*2.5/100 -- quality 5 has no influence; above 5, each point grants 2.5%. under 5, each point takes 2.5%
    end
    return magicBonus*qualityBonus

end

return M