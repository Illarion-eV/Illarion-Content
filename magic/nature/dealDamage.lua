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

function M.dealDamage(target, damage, user, userId)

    if character.IsPlayer(target) and character.WouldDie(target, damage + 1) and not character.IsDead(target) then
        if character.AtBrinkOfDeath(target) then
            if target:isAdmin() then
                chr_reg.stallRegeneration(target, 0)
            end

            character.Kill(target)

            local killerName = "N/A(Indirect magic)"

            if user then
                killerName = user.name.."("..tostring(user.id)..")"
            end

            if userId and userId ~= 0 then
                killerName = "unknown("..tostring(userId)..")"
            end
            if user or userId then
                logPlayer("Player "..killerName.." killed Player "..target.name.."("..tostring(target.id)..")")
            end
        else
            -- Character would die.
            character.ToBrinkOfDeath(target)
            common.TalkNLS(target, Character.say, "#me geht zu Boden.", "#me falls to the ground.")

            if not target:isAdmin() then --Admins don't want to get paralysed!
                common.ParalyseCharacter(target, 20, false, true)
            end
            local timeFactor = 1 -- See lte.chr_reg
            chr_reg.stallRegeneration(target, 60 / timeFactor)

            if user then
                local noviceCorStaff = common.getItemInHand(user, Item.noviceCorStaff)

                if noviceCorStaff and target:getType() == Character.player then
                    --We cancel the users autocasting
                    if not _G.stopAutoCast then _G.stopAutoCast = {} end

                    _G.stopAutoCast[user.id] = true
                end
            end
        end
    else
        character.ChangeHP(target, -damage)
    end
end

return M
