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
    -- Check for damage + 1 to avoid the case that a regular hit lowers the hitpoints down to 1 and directly sends a
    -- character to the brink of death.
    if character.IsPlayer(target) and character.WouldDie(target, damange + 1) then
        if character.AtBrinkOfDeath(target) then
            if target:isAdmin() then
                chr_reg.stallRegeneration(target, 0)
            end
            character.Kill(target)
        else
            -- Character would die.
            character.ToBrinkOfDeath(target)
            common.TalkNLS(target, Character.say, "#me geht zu Boden.", "#me falls to the ground.")

            if not target:isAdmin() then --Admins don't want to get paralysed!
                common.ParalyseCharacter(target, 2, false, true)
            end

            local timeFactor = 1 -- See lte.chr_reg
            chr_reg.stallRegeneration(target, 60 / timeFactor)
        end
    else
        target:increaseAttrib("hitpoints", -damange)
    end
end

function M.isValidTarget(char)
    local noAttackQuestProgress = char:getQuestProgress(36)
    if noAttackQuestProgress ~= 0 then
        return false
    end

    local hitPoints = char:increaseAttrib("hitpoints", 0)
    return hitPoints > 0
end

function M.getSpellResistence(char)
    local willpower = char:increaseAttrib("willpower", 0);

    local minResistence = willpower;
    local maxResistence = willpower * 2;

    return common.Limit(Random.uniform(minResistence, maxResistence) / 80.0, 0, 1);
end

-- Check if the line of sight is free from large objects that obstruct the view
function M.isLineOfSightFree(startPos, targetPos)
    local blockList = world:LoS(startPos, targetPos)
    for _, obstruction in pairs(blockList) do
        if obstruction.TYPE == "ITEM" then
            return false
        end
    end
    return true
end

return M