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

-- This is the monster behaviour script for mages.

local character = require("base.character")
local common = require("base.common")

local M = {}

local function _isTable(value)
    return type(value) == "table"
end

local function _isFunction(value)
    return type(value) == "function"
end

local function _isPlayerAtAdjazentTile(pos)
    for x = -1, 1 do
        for y = -1, 1 do
            if x ~= 0 or y ~= 0 then
                local checkPos = position(pos.x + x, pos.y + y, pos.z)
                if world:isCharacterOnField(checkPos) then
                    local char = world:getCharacterOnField(checkPos)
                    if character.IsPlayer(char) and not character.IsDead(char) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function isDistanceWeaponInSlot(char, slot)
    local item = char:getItemAt(slot)
    if item ~= nil then
        local weaponFound, weapon = world:getWeaponStruct(item.id)
        if weaponFound then
            return weapon.WeaponType == 7
        end
    end
    return false
end

-- Check if a character is a archer. Means that he has a distance weapon in either hand
local function _isArcher(char)
    return isDistanceWeaponInSlot(char, Character.right_tool) or isDistanceWeaponInSlot(char, Character.left_tool)
end

function M.addCallbacks(magic, t)
    if not _isTable(magic) then
        error("Creating the mage behaviour for monsters requires a reference to the monster magic instance.")
    end
    if not _isFunction(magic.getMaximalAttackDistance) then
        error("The instance of the monster magic does not contain the required getMaximalAttackDistance function")
    end
    if not _isTable(t) then
        error("Adding the callbacks for the monster magic requires a existing set of callbacks.")
    end

    local maximalAttackDistance = magic.getMaximalAttackDistance()

    local function isPossibleTarget(monster, target)
        if character.IsDead(target) then
            return false
        end

        if not monster:isInRange(target, maximalAttackDistance) then
            return false
        end

        local foundObstruction = false
        common.CreateLine(monster.pos, target.pos, function(currentPos)
            if currentPos == monster.pos then return true end
            if target.pos == currentPos then
                foundObstruction = false
                return false
            end

            if world:isCharacterOnField(currentPos) then
                foundObstruction = true
                return false
            end

            local field = world:getField(currentPos)
            local itemCount = field:countItems()
            for i = 0, itemCount - 1 do
                local possibleObstruction = field:getStackItem(i)
                if possibleObstruction:isLarge() then
                    foundObstruction = true
                    return false
                end
            end

            return true
        end)

        return not foundObstruction
    end

    local oldEnemyOnSight = t.enemyOnSight
    t.enemyOnSight = function(monster, enemy)
        if oldEnemyOnSight ~= nil and oldEnemyOnSight(monster, enemy) then
            return true
        end

        -- In case there is a player at a adjazent tile, allow the monster to beat him up.
        if _isPlayerAtAdjazentTile(monster.pos) then
            return false
        end

        local players = world:getPlayersInRangeOf(monster.pos, maximalAttackDistance)
        for _, player in pairs(players) do
            -- Check if there is a possible target in range that is NOT a archer. In case there are only archers
            -- go into close combat, as the archers are weaker this way.
            if isPossibleTarget(monster, player) and not _isArcher(player) then
                return true
            end
        end

        return false
    end

    return t
end

return M