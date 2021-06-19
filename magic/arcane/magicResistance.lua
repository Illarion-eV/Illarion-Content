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
local gems = require("base.gems")

local equipmentList = {
{position = 1, name = "head"},
{position = 3, name = "breast"},
{position = 4, name = "hands"},
{position = 9, name = "legs"},
{position = 10, name = "feet"}
}
local jewelleryList = {
{position = 2, name = "neck"},
{position = 7, name = "finger_left_hand"},
{position = 8, name = "finger_right_hand"},
{position = 11, name = "coat"}
}


local function getMagicStatValue(Target) -- Return a number between 0 and 1
local max_stats = 51 -- 20 in each stats + food buff + potions
    return (math.floor(2*(Target.willpower) + 0.5*(Target.intelligence) + 0.5*(Target.essence)))/max_stats
end

local function getEquipmentValue(Target) -- Return a number between 0 and 1.
local equipmentValue = 0
local jewelleryValue = 0
    for _, equipment in pairs(equipmentList) do
        local targetItem = Target:getItemAt(equipment.position)
        local addedValue = targetItem.level/100
        equipmentValue = equipmentValue + addedValue
    end
    for _, jewellery in pairs(jewelleryList) do
        local targetItem = Target:getItemAt(jewellery.position)
        local addedValue = targetItem.level/100
        jewelleryValue = jewelleryValue + addedValue
    end
local finalEquipmentValue = math.floor(((equipmentValue/5)/4)+((jewelleryValue/4)/(4/3)))
return equipmentValue
end

local function getGemValue(Target) --Return a value between 0 and 1
local gemValue = 0
    for _, equipment in pairs(equipmentList) do
        local targetItem = Target:getItemAt(equipment.position)
        local addedValue = math.floor(gems.getGemBonus(targetItem)/120)
        gemValue = gemValue + addedValue
    end
gemValue = gemValue/5
    local targetItem = Target:getItemAt(11)
    local addedValue = math.floor(gems.getGemBonus(targetItem)/120)
    gemValue = (gemValue + addedValue)/2
return gemValue
end

local function getSkillValue(Target) --Return a value between 0 and 1, EG level 9 magic resistance is 0.09
    skill = Target.magicResistance
    return Target.getSkillValue(skill)/100
end

function M.getMagicResistance(Target) --Returns a value between 0 and 1(max magic resistance percentage of 100%, which is nigh impossible to get (requires a max level set of gems for 9 items), and is lowered by magic penetration thereafter)
local stats = getMagicStatValue(Target)
local equipment = getEquipmentValue(Target)
local gems = getGemValue(Target)
local skill = getSkillValue(Target)
    return math.floor((((equipment+gems)/2)+stats+skill)/3)
end

return M