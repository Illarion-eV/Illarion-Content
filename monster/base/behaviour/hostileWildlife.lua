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

-- This is the behaviour script for hostile wildlife.
-- This script utilizes the aggro manager and feeds it with some default values.

local common = require("base.common")
local character = require("base.character")
local ag = require("monster.base.behaviour.aggroManager")

local M = {}

local aggroManager
aggroManager = ag.buildAggroManager{
    addAggroForTarget = function(monster, target)
        if character.IsPlayer(target) then
            local distance = monster:distanceMetric(target)
            if distance > 6 then
                local currentAggro = aggroManager.getAggro(monster, target)
                if currentAggro > 0 then
                    return math.max(-25 - (20 * (distance - 6)), -currentAggro)
                end

                return 0
            elseif distance > 4 then
                return -15
            else
                return math.pow(6 - distance, 3)
            end
        end
        return 0
    end,
    addAggroForAttack = function(monster, attacker)
        local monsterHP = character.GetHP(monster)
        local attackerHP = character.GetHP(attacker)

        return 500 - (attackerHP / 10) + (monsterHP / 10)
    end,
    aggroReduction = 5,
    maxAggro = 500,
    minAggro = -200
}

local function doRandomMove(monster)
    if Random.uniform() < 0.15 then
        monster:move(Random.uniform(0, 7), true)
    else
        character.ChangeMovepoints(monster, -15)
    end
end

function M.addCallbacks(t)
    t = aggroManager.addCallbacks(t)

    local function reactOnAggro(monster, enemy)
        local enemyAggro = aggroManager.getAggro(monster, enemy)
        local absAggro = math.abs(enemyAggro)
        if absAggro < 20 then
            -- low aggro on the target. Ignore the target.
            doRandomMove(monster)
            return true
        elseif absAggro < 100 then
            -- critical aggro, observe the target.
            common.TurnTo(monster, enemy.pos)
            enemy:inform("Monster " .. monster.name .. " is watching you.")
            character.ChangeMovepoints(monster, -15)
            return true
        else
            -- aggro is high. Act on it.
            if enemyAggro > 0 then
                -- positive aggro. Engage!
                return false
            else
                -- negative aggro. Lets run for the hills.
                local enemyDir = common.GetDirection(enemy.pos, monster.pos)

                local runAwayDirection = -1
                for _, runDir in pairs({enemyDir, enemyDir - 1, enemyDir + 1}) do
                    local vX, vY = common.GetDirectionVector((runDir + 8) % 8)
                    local runAwayTarget = position(monster.pos.x + vX, monster.pos.y + vY, monster.pos.z)
                    local runAwayField = world:getField(runAwayTarget)
                    if runAwayField ~= nil and runAwayField:isPassable() then
                        runAwayDirection = runDir
                        break
                    end
                end

                if runAwayDirection == -1 then
                    -- No way to escape!
                    local distance = monster:distanceMetric(enemy)
                    if distance > 4 then
                        doRandomMove(monster)
                        return true
                    else
                        local aggroToAdd = math.min(0, math.pow(6 - distance, 4))
                        aggroManager.addAggro(monster, enemy, aggroToAdd)
                        common.TurnTo(monster, enemy.pos)
                        character.ChangeMovepoints(monster, -5)
                        return true
                    end
                else
                    monster:talk(Character.say, "Running away!", "Running away!")
                    monster:move(runAwayDirection, true)
                    common.TurnTo(monster, enemy.pos)
                    return true
                end
            end
        end
    end

    local oldEnemyOnSight = t.enemyOnSight
    t.enemyOnSight = function(monster, enemy)
        if oldEnemyOnSight ~= nil and oldEnemyOnSight(monster, enemy) then
            return true
        end

        if reactOnAggro(monster, enemy) then
            return true
        end

        if Random.uniform() < 0.03 then
            character.ChangeMovepoints(monster, -20)
            return true
        end

        return false
    end

    local oldEnemyNear = t.enemyNear
    t.enemyNear = function(monster, enemy)
        local enemyAggro = aggroManager.getAggro(monster, enemy)
        if enemyAggro == 0 then
            return false
        end

        if oldEnemyNear ~= nil and oldEnemyNear(monster, enemy) then
            return true
        end

        return reactOnAggro(monster, enemy)
    end

    return t
end

return M