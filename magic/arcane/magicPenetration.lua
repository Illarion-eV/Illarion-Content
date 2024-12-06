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



local function getBonus(user, spell)

    local willpower = user:increaseAttrib("willpower", 0) -- Magic penetration and magic resistance, a fight of whose willpower is the greatest!

    local statBonus =  common.GetAttributeBonusHigh(willpower) -- 22 willpower would give about 0.6, while 15 willpower about 0.23/0.24

    local equipmentBonus = magic.getMagicBonus(user) -- about 0.22 if you wear full clothing and archmage stuff

    local totalBonus = statBonus + equipmentBonus

    return math.min(totalBonus, 1)

end

function M.getMagicPenetration(user, element, spell)

    local skill = skilling.getMagicSkillSpellBelongsTo(spell)

    local level = user:getSkill(Character[skill])

    local bonus = getBonus(user, spell)

    local magicPenetration = level*bonus

    return magicPenetration

end

return M
