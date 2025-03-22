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
local arcaneMagicDamage = require("magic.arcane.dealMagicDamage")
local magicResistance = require("magic.arcane.magicResistance")
local magicPenetration = require("magic.arcane.magicPenetration")
local magicDamage = require("magic.arcane.magicDamage")
local magic = require("base.magic")
local dwyfol = require("magic.arcane.enchanting.effects.dwyfol")

local M = {}

function M.dealMagicDamage(target, damage, usedMovepoints, level, monster)

    local penetration = 0

    if monster and isValidChar(monster) then
        penetration = magicPenetration.getMagicPenetration(monster)
    end

    local resistance = magicResistance.getMagicResistance(target)

    damage = magicDamage.resistanceAndPenetrationImpact(resistance, penetration, damage)

    damage = magicDamage.constitutionImpact(target, damage)

    damage = damage * (1 - magic.getGemBonusCloak(target)/100) -- tier 5 set is 30%, tier 10 60%

    if damage < 100 then
        damage = 100 --At least deal some symbolic damage even if the player fully resists the attack
    end


    if dwyfol.deflectAttackAsLightning(target, monster) then -- This glyph if activated deflects the attack, dealing the same amount they would have taken as magic damage to the attacker instead in the form of a lightning strike
        target = monster --The monster becomes the new target as the spell damage is deflected
        damage = math.min(damage, 1000) -- It shouldn't be possible to luck into killing off a max skill chara with a no skill character!
    elseif character.IsPlayer(target) then
        arcaneMagicDamage.learnMagicResistance(target, usedMovepoints, level+20) -- Since monster magic uses movepoints instead of cast time, we scale the learning based on that similar to how fighting does it by dividing it by three
    end


    -- Check for damage + 1 to avoid the case that a regular hit lowers the hitpoints down to 1 and directly sends a
    -- character to the brink of death.
    if character.IsPlayer(target) and character.WouldDie(target, damage + 1) then
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
        target:increaseAttrib("hitpoints", -damage)
    end
end

function M.isValidTarget(char)
    local noAttackQuestProgress = char:getQuestProgress(36) or char:getQuestProgress(236) or char:getQuestProgress(254)
    if noAttackQuestProgress ~= 0 then
        return false
    end

    local hitPoints = char:increaseAttrib("hitpoints", 0)
    return hitPoints > 0
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
