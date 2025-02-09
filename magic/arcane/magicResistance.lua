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

local common = require("base.common")
local magic = require("base.magic")

local function getSkillValue(target)
    local skill = Character["magicResistance"]
    local skillValue = target:getSkill(skill)

    if common.IsNilOrEmpty(skillValue) then
        skillValue = 0
    end

    return skillValue
end

local function willImpact(user)

    local willpower = user:increaseAttrib("willpower", 0) -- Magic penetration and magic resistance, a fight of whose willpower is the greatest!

    return common.GetAttributeBonusHigh(willpower)

end

function M.getMagicResistance(target, spell) --Returns a percentage of how much magic damage to reduce


    local magicResistance

    local playerOrMonster = target:getType()

    local skillImpact = 0.01*getSkillValue(target)

    local statBonus = willImpact(target)

    local equipmentBonus = magic.getMagicBonus(target) -- caps out at 0.2. Best possible jewellery and clothing caps out at 0.2596, so this gives some leeway in terms of fashion by capping it at 0.2

    if playerOrMonster == Character.monster then

        skillImpact = skillImpact*2 --Monsters can artificially have 200 levels of magic resistance to create tougher foes if we want to

    end

    magicResistance = statBonus+equipmentBonus+skillImpact

    return tonumber(magicResistance)

end

return M
