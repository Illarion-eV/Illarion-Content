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

--Returns the total magic bonus and a list containing the items which add to the magic bonus
function M.getMagicBonus(character)
    local bodyPositions = {Character.head, Character.neck, Character.breast, Character.hands, Character.finger_left_hand, Character.finger_right_hand, Character.legs, Character.feet, Character.coat}
    
    local itemsWithMagicBonus = {}
    local magicBonus = 0
    local quality = 0
    for _, bodyPosition in pairs(bodyPositions) do
        local checkItem = character:getItemAt(bodyPosition)
        if checkItem ~= nil and checkItem.id > 0 then
            local isArmor, armorStruct =  world:getArmorStruct(checkItem.id)
            local itemBonus = armorStruct.MagicDisturbance
            if itemBonus > 0 then
                magicBonus = magicBonus + itemBonus
                quality = quality + math.floor(checkItem.quality/100)
                table.insert(itemsWithMagicBonus, checkItem)
            end    
        end
    end
    
    local qualityBonus = 1
    if #itemsWithMagicBonus >= 1 then
        qualityBonus = qualityBonus+(quality/#itemsWithMagicBonus - 5)*2.5/100 -- quality 5 has no influence; above 5, each point grants 2.5%. under 5, each point takes 2.5%
    end
    
    return magicBonus*qualityBonus, itemsWithMagicBonus

end

return M