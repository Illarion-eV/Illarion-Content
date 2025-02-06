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
local runes = require("magic.arcane.runes")

local M = {}



local function willImpact(user)

    local willpower = user:increaseAttrib("willpower", 0) -- Magic penetration and magic resistance, a fight of whose willpower is the greatest!

    return common.GetAttributeBonusHigh(willpower)

end

function M.getMagicPenetration(user, element, spell)

    if user:getType() == Character.monster then --monster penetration is based on just the skill level
        return user:getSkill(Character.wandMagic) --wand magic already exists in the database for monsters so easier to just use that
    end

    local equipmentBonus = magic.getMagicBonus(user) -- caps out at 0.2. Best possible jewellery and clothing caps out at 0.2596, so this gives some leeway in terms of fashion by capping it at 0.2


    local skill = skilling.getMagicSkillSpellBelongsTo(spell)

    local level = user:getSkill(Character[skill])

    local statBonus = willImpact(user)

    local skillImpact = 0.01*level

    local magicPenetration = statBonus+equipmentBonus+skillImpact

    if spell and runes.checkSpellForRuneByName("Sav", spell) and not runes.checkSpellForRuneByName("JUS", spell) and not runes.checkSpellForRuneByName("PEN", spell) then --magic penetration
        magicPenetration = math.floor(magicPenetration*1.1) --up to 10% magic penetration when Sav is applied to fire, water or earth spells
    end

    return magicPenetration

end

return M
