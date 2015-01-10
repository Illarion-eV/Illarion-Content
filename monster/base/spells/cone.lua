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

local function isCarryingShieldInSlot(char, slot)
    local item = char:getItemAt(slot)
    if item ~= nil then
        local weaponFound, weapon = world:getWeaponStruct(item.id)
        if weaponFound then
            return weapon.WeaponType == 14
        end
    end
    return false
end

local function isCarryingShield(char)
    return isCarryingShieldInSlot(char, Character.right_tool) or isCarryingShieldInSlot(char, Character.left_tool)
end

return function(params)
    local self = {}
    local damageRange = {1000, 2000}
    local attackRange = 5
    local angularAperture = 45
    local probability = 0.03
    local gfxId = 0
    local sfxId = 0
    local itemId = 0
    local itemQualityRange = {2, 5}
    local itemDurabilityRange = {11, 88}
    local itemProbability = 0.08
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

        if params.angularAperture ~= nil then
            if _isNumber(params.angularAperture) then
                angularAperture = tonumber(params.angularAperture)
                if angularAperture <= 0 or angularAperture >= 180 then
                    error("The angular aperture has to be greater 0 and less then 180.")
                end
            else
                error("The angular aperture of the spell was set to something, but not to a number.")
            end
        end

        if params.gfxId ~= nil then
            if _isNumber(params.gfxId) then
                gfxId = tonumber(params.gfxId)
                if gfxId <= 0 then
                    error("The gfx id for the spell was set to a illegal id.")
                end
            else
                error("The gfx id for the spell was set to something, but not to a number.")
            end
        else
            error("The cone spell requires a GFX id.")
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

        if params.itemProbability ~= nil then
            if _isNumber(params.itemProbability) then
                itemProbability = tonumber(params.itemProbability)
                if (itemProbability <= 0) or (itemProbability > 1) then
                    error("The item probability for the spell is set to a illegal value.")
                end
            else
                error("The item probability for the spell was set to something, but not to a number.")
            end
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
        error("The cone spells require parameters.")
    end

    local function attackField(pos)
        if gfxId > 0 then world:gfx(gfxId, pos) end
        if itemId > 0 and not common.isItemIdInFieldStack(itemId, pos) and Random.uniform() < itemProbability then
            local qual = Random.uniform(itemQualityRange[1], itemQualityRange[2]) * 100 +
                    Random.uniform(itemDurabilityRange[1], itemDurabilityRange[2])
            local item = world:createItemFromId(itemId, 1, pos, true, qual, nil)
            item.wear = 2
            world:changeItem(item)
        end

        if world:isCharacterOnField(pos) then
            local victim = world:getCharacterOnField(pos)
            local spellResistence = base.getSpellResistence(victim)
            local damage = Random.uniform(damageRange[1], damageRange[2]) * spellResistence

            base.dealMagicDamage(victim, damage)
        end
    end

    function self.getAttackRange()
        return attackRange
    end

    function self.cast(monster, enemy)
        if Random.uniform() <= probability then
            --So the cone is always a isosceles triangle. We take the attack range as the height of the triangle.
            --Best was to calculate it, is use calculate half of the triangle as right triangle and mirror it.

            --Turn to the target
            common.TurnTo(monster, enemy.pos)

            local angleInRad = math.rad(angularAperture / 2)
            local oppositeLeg = math.tan(angleInRad) * attackRange;

            local originPos = common.GetFrontPosition(monster, 1)
            local targetPos = common.GetFrontPosition(monster, attackRange)

            local lineLocations = {}
            --Calculate the tanget line using the common function for it. The length of the line is the
            --arm length * 2 + 1. Since our opposite leg is already half of the line, we reduce it by half of the
            --additional length (1) and get the ceiling value to get a nice value for it.
            local armLength = math.ceil(oppositeLeg - 0.5)
            if armLength < 1 then
                table.insert(lineLocations, targetPos)
            else
                common.CreateTangentLine(monster.pos, targetPos, armLength,
                    function(pos)
                        table.insert(lineLocations, pos)
                        return true
                    end)
            end

            --Now we have the line were our cone ends. Now we need to calculate lines that connect the origin with
            --all end points. We fill the table with the positions as keys to ensure that every position is only once
            --in there.
            local coneFields = {}
            for _, pos in pairs(lineLocations) do
               common.CreateLine(originPos, pos,
                   function(pos)
                       local field = world:getField(pos)
                       if field == nil then
                           return false
                       end
                       coneFields[pos] = true

                       if world:isCharacterOnField(pos) then
                           -- There is a character on this field.
                           local blockingChar = world:getCharacterOnField(pos)
                           if common.IsLookingAt(blockingChar, originPos) then
                               -- Character has to look to the direction of the cone to block it.
                               if isCarryingShield(blockingChar) then
                                   return false
                               end
                           end
                       end

                       -- The cone is blocked by tiles that became not passable due to items place on them
                       if world:isItemOnField(pos) then
                           local fieldItem = world:getItemOnField(pos)
                           if fieldItem:isLarge() then
                               return false
                           end
                       end
                       return true
                   end)
            end

            for pos, _ in pairs(coneFields) do
                attackField(pos)
            end

            if sfxId > 0 then world:makeSound(sfxId, originPos) end
            monster.movepoints = monster.movepoints - usedMovepoints
            return true
        end
        return false
    end

    return self
end