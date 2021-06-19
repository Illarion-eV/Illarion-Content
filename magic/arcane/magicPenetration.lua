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

local wandList = {
{id = 323, element = "Neutral"},
{id = 2782, element = "Earth"},
{id = 2783, element = "Fire"},
{id = 2784, element = "Water"},
{id = 2785, element = "Air"},
{id = 3608, element = "Spirit"}
}
local magicSkillList = {
{name = "fireMagic", element = "Fire"}
{name = "earthMagic", element = "Earth"}
{name = "waterMagic", element = "Water"}
{name = "windMagic", element = "Air"}
{name = "spiritMagic", element = "Spirit"}
}

local function getWand(User)
local left = User.left_tool
local right = User.right_tool
    for _, wand in pairs(wandList) do
        if left.id == wand.id or right.id == wand.id then
            return wand
        end
    end
return false
end
local function checkElementBonus(User, element) --Return a number between 0 and 1
local wandItem
    if getWand(User) then
        wandItem = getWand(User)
    else
        return 0
    end 
    for _, wand in pairs(wandList) do
        if wand.id == wandItem.id then
            if wand.element == element then
                return 1
            elseif wand.element == "Neutral" then
                return 0.5
            else
                return 0.25
            end
        end
    end
end
local function getGemsInWand(User) --Return a number between 0 and 1
local wand
    if getWand(User) then
        wand = getWand(User)
    else
        return 0
    end
return gems.getGemBonus(wand)/120
end
local function getSkillLevel(User, element)--Return a number between 0 and 1
    for _, skill in pairs(magicSkillList) do
        if element == skill.element then
            local skillId = User:getSkill(skill)
            return User:getSkillValue(skillId)/100
        end
    end
end
local function checkSpellForMagicPenetrationRunes(User, element, spell) --Return a number between 0 and 1
    return 0
end

function M.getMagicPenetration(User, element, spell)
local elementBonus = checkElementBonus(User, element)
local gemBonus = checkGemsInWand(User)
local skillBonus = getSkillLevel(User, element)
local runeBonus = checkSpellForMagicPenetrationRunes(User, element, spell)
local magicPenetration = (((elementBonus+gemBonus)/2)+runeBonus+skillBonus)/3

return magicPenetration
end

return M