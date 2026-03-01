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
local magic = require("base.magic")
local skilling = require("magic.arcane.skilling")

local M = {}



local function willImpact(user)

    local willpower = user:increaseAttrib("willpower", 0) -- Magic penetration and magic resistance, a fight of whose willpower is the greatest!

    return common.GetAttributeBonusHigh(willpower)

end

function M.getMagicPenetration(user, element, spell)

    local equipmentBonus = magic.getMagicBonus(user) -- caps out at 0.2. Best possible jewellery and clothing caps out at 0.2596, so this gives some leeway in terms of fashion by capping it at 0.2

    local level = 0

    if user:getType() == Character.player then
        local skill = skilling.getMagicSkillSpellBelongsTo(spell)

        level = user:getSkill(Character[skill])
    elseif user:getType() == Character.monster then
        level =  user:getSkill(Character.wrestling) -- a little hack to avoid having to add magic skills to monsters since they use the same level for everything anyways
    end

    local statBonus = willImpact(user)

    local skillImpact = 0.01*level

    local magicPenetration = statBonus+equipmentBonus+skillImpact

    return magicPenetration

end

return M
