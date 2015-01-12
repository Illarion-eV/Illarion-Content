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
local base = require("monster.base.spells.base")
local common = require("base.common")
local standardfighting = require("server.standardfighting")

local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

return function(params)
    local self = {}
    local targets = 1
    local damageRange = {1000, 2000}
    local attackRange = 8
    local probability = 0.03
    local gfxId = 0
    local sfxId = 0
    local itemId = 0
    local itemQualityRange = {2, 5}
    local itemDurabilityRange = {11, 88}
    local usedMovepoints = 20

    if _isTable(params) then
        if params.probability ~= nil then
            if _isNumber(params.probability) then
                probability = tonumber(params.probability)
                if (probability <= 0) or (probability > 1) then
                    error("The probability for the spell is set to a illegal value.")
                end
            else
                error("The probability for the spell was set to something, but not to a number.")
            end
        end

        if params.damage ~= nil then
            if _isNumber(params.damage) then
                local damage = tonumber(params.damage)
                damageRange = {damage, damage}
            elseif _isTable(params.damage) then
                local fromValue = params.damage.from or params.damage[1]
                local toValue = params.damage.to or params.damage[2]
                if _isNumber(fromValue) and _isNumber(toValue) then
                    damageRange = {tonumber(fromValue), tonumber(toValue) }
                    if damageRange[1] > damageRange[2] then
                        error("Range for damaged hitpoint was set but the from value is greater than the to value.")
                    end
                else
                    error("The damaged hitpoints value was detected as table. How ever the from and to value for the " +
                          "range is missing.")
                end
            else
                error("The damage hitpoints was set to something. How ever it was not possible to detect what the " +
                      "input means.")
            end
        end

        if params.range ~= nil then
            if _isNumber(params.range) then
                attackRange = tonumber(params.range)
                if attackRange < 1 then
                    error("The attack range of the spell was set to a value less than 1.")
                end
            else
                error("The range of the spell was set to something, but not to a number.")
            end
        end

        if params.targetCount ~= nil then
            if _isNumber(params.targetCount) then
                targets = tonumber(params.targetCount)
                if targets < 1 then
                    error("The amount of targets for the projectile spell was set to less then 1")
                end
            else
                error("The amount of targets for the spell was set to something, but not to a number.")
            end
        end

        if params.gfxId ~= nil then
            if _isNumber(params.gfxId) then
                gfxId = tonumber(params.gfxId)
            else
                error("The gfx id for the spell was set to something, but not to a number.")
            end
        end

        if params.itemId ~= nil then
            if _isNumber(params.itemId) then
                itemId = tonumber(params.itemId)
                if itemId < 0 then
                    error("The item id was set to a value less then 0.")
                end
            else
                error("The item id for the target the spell was set to something, but not to a number.")
            end
        end

        if params.quality ~= nil then
            if _isNumber(params.quality) then
                local qualityValue = tonumber(params.quality)
                itemQualityRange = {qualityValue, qualityValue}
                if qualityValue < 0 or qualityValue > 9 then
                    error("The quality value is out of range: " + qualityValue)
                end
            elseif _isTable(params.quality) then
                local fromValue = params.quality.from or params.quality[1]
                local toValue = params.quality.to or params.quality[2]
                if _isNumber(fromValue) and _isNumber(toValue) then
                    itemQualityRange = {tonumber(fromValue), tonumber(toValue) }
                    if itemQualityRange[1] > itemQualityRange[2] then
                        error("Range for quality was set but the from value is greater than the to value.")
                    elseif itemQualityRange[1] < 0 or itemQualityRange[2] > 9 then
                        error("The range of the quality value exceeds the valid range.")
                    end
                else
                    error("The quality value was detected as table. How ever the from and to value for the range is missing.")
                end
            else
                error("The quality was set to something. How ever it was not possible to detect what the input means.")
            end
        end

        if params.durability ~= nil then
            if _isNumber(params.durability) then
                local durabilityValue = tonumber(params.durability)
                itemDurabilityRange = {durabilityValue, durabilityValue }
                if durabilityValue < 0 or durabilityValue > 99 then
                    error("The durability value is out of range: " + durabilityValue)
                end
            elseif _isTable(params.durability) then
                local fromValue = params.durability.from or params.durability[1]
                local toValue = params.durability.to or params.durability[2]
                if _isNumber(fromValue) and _isNumber(toValue) then
                    itemDurabilityRange = {tonumber(fromValue), tonumber(toValue) }
                    if itemDurabilityRange[1] > itemDurabilityRange[2] then
                        error("Range for durability was set but the from value is greater than the to value.")
                    elseif itemDurabilityRange[1] < 0 or itemDurabilityRange[2] > 99 then
                        error("The range of the durability value exceeds the valid range.")
                    end
                else
                    error("The durability value was detected as table. How ever the from and to value for the range is missing.")
                end
            else
                error("The durability was set to something. How ever it was not possible to detect what the input means.")
            end
        end

        if itemId == 0 and gfxId == 0 then
            error("The projectile spell needs at either a gfx or a item that is spawned at the target site.")
        end

        if params.sfxId ~= nil then
            if _isNumber(params.sfxId) then
                sfxId = tonumber(params.sfxId)
            else
                error("The sound effect id for the spell was set to something, but not to a number.")
            end
        end

        if params.movepoints ~= nil then
            if _isNumber(params.movepoints) then
                usedMovepoints = tonumber(params.movepoints)
            else
                error("The required move points for the spell was set to something, but not to a number.")
            end
        end
    else
        error("The project spells require parameters.")
    end

    -- Deal damage
    local function castSpellAt(enemy)
        local spellResistence = base.getSpellResistence(enemy)
        local damage = Random.uniform(damageRange[1], damageRange[2]) * (1.0 - spellResistence)

        base.dealMagicDamage(enemy, damage)
        if gfxId > 0 then world:gfx(gfxId, enemy.pos) end
        if sfxId > 0 then world:makeSound(sfxId, enemy.pos) end
        if itemId > 0 and not common.isItemIdInFieldStack(itemId, enemy.pos) then
            local qual = Random.uniform(itemQualityRange[1], itemQualityRange[2]) * 100 +
                    Random.uniform(itemDurabilityRange[1], itemDurabilityRange[2])
            local item = world:createItemFromId(itemId, 1, enemy.pos, true, qual, nil)
            item.wear = 2
            world:changeItem(item)
        end
    end

    local function isValidTarget(monster, target)
        if monster.id == target.id then
            return false
        end
        if monster:isInRange(target, attackRange) and base.isValidTarget(target) then
            local blockList = world:LoS(monster.pos, target.pos)
            local obstructionIndex, obstruction
            if blockList ~= nil then
                obstructionIndex, obstruction = next(blockList)
                while obstruction ~= nil and (obstruction.TYPE == "CHARACTER" or
                        (obstruction.TYPE == "ITEM" and not obstruction.OBJECT:isLarge())) do
                    obstructionIndex, obstruction = next(blockList, obstructionIndex)
                end
            end
            return obstruction == nil
        end
        return false
    end

    function self.getAttackRange()
        return attackRange
    end

    function self.cast(monster, enemy)
        if Random.uniform() <= probability then
            local castedAtLeastOnce = false
            local remainingAttacks = targets
            local firstAttackDone = false
            if isValidTarget(monster, enemy) then
                if not firstAttackDone then
                    common.TurnTo(monster, enemy.pos)
                    firstAttackDone = true
                end
                castSpellAt(enemy)
                remainingAttacks = remainingAttacks - 1
                castedAtLeastOnce = true
            end

            monster.movepoints = monster.movepoints - usedMovepoints

            if remainingAttacks > 0 then
                local targets = world:getPlayersInRangeOf(monster.pos, attackRange)
                local possibleTargets = {}
                for _, target in pairs(targets) do
                    if isValidTarget(monster, target) then
                        table.insert(possibleTargets, target)
                    end
                end

                while remainingAttacks > 0 do
                    if #possibleTargets == 0 then return castedAtLeastOnce end

                    local selectedTargetIndex = standardfighting.setTarget(monster, possibleTargets)
                    if selectedTargetIndex == 0 then return castedAtLeastOnce end

                    local selectedTarget = table.remove(possibleTargets, selectedTargetIndex)
                    if not firstAttackDone then
                        common.TurnTo(monster, selectedTarget.pos)
                        firstAttackDone = true
                    end
                    castSpellAt(selectedTarget)
                    remainingAttacks = remainingAttacks - 1
                    castedAtLeastOnce = true
                end
            end

            return castedAtLeastOnce
        end
        return false
    end

    return self
end