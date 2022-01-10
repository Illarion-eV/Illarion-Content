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
local runes = require("magic.arcane.runes")
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


local function getMagicStatValue(target) -- Return a number between 0 and 1
local max_stats = 51 -- 20 in each stats + food buff + potions
local intelligence = target:increaseAttrib("intelligence", 0)
local essence = target:increaseAttrib("essence", 0)
local willpower = target:increaseAttrib("willpower", 0)
    return (math.floor(2*(willpower) + 0.5*(intelligence) + 0.5*(essence)))/max_stats
end

local function getEquipmentValue(target) -- Return a number between 0 and 1.
local skill = Character["magicResistance"]
local skillLevel = target:getSkill(skill)
local equipmentValue = 0
local jewelleryValue = 0
    for _, equipment in ipairs(equipmentList) do
        local targetItem = target:getItemAt(equipment.position)
        local armorfound, armorItem = world:getArmorStruct(targetItem.id)
        local clothing = false
            if armorfound then
                if armorItem.Type == ArmorStruct.clothing then
                    clothing = true
                end
            end
        local level = world:getItemStatsFromId(targetItem.id).Level
        if level then
            local addedValue = level/100
            if tonumber(level) > skillLevel then
                addedValue = addedValue/10 --90% decreased value if magic resistance level is not higher or the same as the equipments level
            end
            if not clothing then
                addedValue = addedValue/2
            end
            equipmentValue = equipmentValue + addedValue
        end
    end
    for _, jewellery in pairs(jewelleryList) do
        local targetItem = target:getItemAt(jewellery.position)
        local level = world:getItemStatsFromId(targetItem.id).Level
        if level then
            local addedValue = level/100
            if tonumber(level) > skillLevel then
                addedValue = addedValue/10 --90% decreased value if magic resistance level is not higher or the same as the equipments level
            end
            jewelleryValue = jewelleryValue + addedValue
        end
    end
local finalEquipmentValue = math.floor(((equipmentValue/5)/4)+((jewelleryValue/4)/(4/3)))
return finalEquipmentValue
end

local function getGemValue(target) --Return a value between 0 and 1
local gemValue = 0
    for _, equipment in pairs(equipmentList) do
        local targetItem = target:getItemAt(equipment.position)
        local armorfound, armorItem = world:getArmorStruct(targetItem.id)
        local clothing = false
            if armorfound then
                if armorItem.Type == ArmorStruct.clothing then
                    clothing = true
                end
            end
        local addedValue = math.floor(gems.getGemBonus(targetItem)/120)
            if not clothing then
                addedValue = addedValue/2
            end
        gemValue = gemValue + addedValue
    end
gemValue = gemValue/5
    local targetItem = target:getItemAt(11)
    local addedValue = math.floor(gems.getGemBonus(targetItem)/120)
    gemValue = (gemValue + addedValue)/2
return gemValue
end

local function getSkillValue(target) --Return a value between 0 and 1, EG level 9 magic resistance is 0.09
    local skill = Character["magicResistance"]
    local skillValue = target:getSkill(skill)
    return skillValue/100
end

function M.getMagicResistance(target, spell) --Returns a value between 0 and 1(max magic resistance percentage of 100%, which is nigh impossible to get (requires a max level set of gems for 9 items), and is lowered by magic penetration thereafter)

    local magicResistance

    local playerOrMonster = target:getType()
    local skill = getSkillValue(target)

    if playerOrMonster == Character.player then
        local stats = getMagicStatValue(target)
        local equipment = getEquipmentValue(target)
        local magicGems = getGemValue(target)
        magicResistance = (((equipment+magicGems)/2)+stats+skill)/3
    elseif playerOrMonster == Character.monster then
        if skill == 1 then
            magicResistance = skill
        else
            magicResistance = skill/1.5
        end
    end

    if runes.checkSpellForRuneByName("Sav", spell) and not runes.checkSpellForRuneByName("JUS", spell) and not runes.checkSpellForRuneByName("PEN", spell) then
        magicResistance = magicResistance/1.3
    end

    return magicResistance

end

return M
