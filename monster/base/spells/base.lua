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
local character = require("base.character")
local chr_reg = require("lte.chr_reg")

local M = {}

function M.dealMagicDamage(target, damange)
    if damange < 1 then return end
    if character.IsPlayer(target) and
            character.WouldDie(target, damange + 1) and
            not character.AtBrinkOfDeath(target) then
        -- Character would die.
        character.ToBrinkOfDeath(target)
        common.TalkNLS(target, Character.say, "#me geht zu Boden.", "#me falls to the ground.")

        if not target:isAdmin() then --Admins don't want to get paralysed!
            common.ParalyseCharacter(target, 2, false, true)
            local timeFactor = 1 -- See lte.chr_reg
            chr_reg.stallRegeneration(target, 60/timeFactor) -- Stall regeneration for one minute. Attention! If you change TimeFactor in lte.chr_reg to another value but 1, you have to divide this "60" by that factor
        end
    else
        target:increaseAttrib("hitpoints", -damange)
    end
end

function M.getSpellResistence(char)
    local willpower = char:increaseAttrib("willpower", 0);
    local essence   = char:increaseAttrib("essence", 0);

    local minResistence = willpower + essence;
    local maxResistence = willpower + essence * 3;

    return common.Limit(math.random(minResistence, maxResistence) / 100.0, 0, 1);
end

return M