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
local common = require("base.common")
local character = require("base.character")
local chr_reg = require("lte.chr_reg")
local magicDamage = require("magic.arcane.magicDamage")

function M.dealMagicDamage(user, target, spell, damage)
local RA = runes.checkSpellForRuneByName("RA", spell)
local CUN = runes.checkSpellForRuneByName("CUN", spell)
local Sih = runes.checkSpellForRuneByName("Sih", spell)
    if user then
        if target.pos == user.pos then
            return
        end
    end
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
        character.ChangeHP(target, -damage)
    end
    if user then
        if Sih and (RA or CUN) then
            character.ChangeHP(user, damage/20) -- 5% lifesteal
        end
    end
end

function M.applyMagicDamage(user, targets, spell, element, Orl, earthTrap)
    for _, target in pairs(targets.targets) do
        if user then
            if target.pos == user.pos then -- no self harm
                return
            end
        end
        local targetType = target:getType()
        local damage
        if earthTrap then
            damage = earthTrap:getData("damage")
        else
            damage = magicDamage.getMagicDamage(user, spell, element, target, false, targetType, Orl)
        end
        M.dealMagicDamage(user, target, spell, damage)
        target:learn(Character.magicResistance, damage/100, 100) -- Will need balancing for how fast magic resistance is learned.
    end
end

return M
