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
{name = "fireMagic", element = "Fire"},
{name = "earthMagic", element = "Earth"},
{name = "waterMagic", element = "Water"},
{name = "windMagic", element = "Air"},
{name = "spiritMagic", element = "Spirit"}
}

local function getWand(user)
local left = user:getItemAt(5)
local right = user:getItemAt(6)
    for _, wand in pairs(wandList) do
        if left.id == wand.id then
            return left
        elseif right.id == wand.id then
            return right
        end
    end
return false
end
local function checkElementBonus(user, element) --Return a number between 0 and 1
local wandItem
    if getWand(user) then
        wandItem = getWand(user)
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
local function getGemsInWand(user) --Return a number between 0 and 1
local wand
    if getWand(user) then
        wand = getWand(user)
    else
        return 0
    end
return gems.getGemBonus(wand)/120
end
local function getSkillLevel(user, element)--Return a number between 0 and 1
    for _, skill in pairs(magicSkillList) do
        if element == skill.element then
            local skillNumber = Character[skill.name]
            local skillValue = user:getSkill(skillNumber)
            return skillValue/100
        end
    end
end
local function checkSpellForMagicPenetrationRunes(user, element, spell) --Return a number between 0 and 1
    return 0
end

function M.getMagicPenetration(user, element, spell)
local elementBonus = checkElementBonus(user, element)
local gemBonus = getGemsInWand(user)
local skillBonus = getSkillLevel(user, element)
local runeBonus = checkSpellForMagicPenetrationRunes(user, element, spell)
local magicPenetration = (((elementBonus+gemBonus)/2)+runeBonus+skillBonus)/3

return magicPenetration
end

return M
