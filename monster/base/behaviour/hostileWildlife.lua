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

local aggroManager = ag.buildAggroManager{
    addAggroForTarget = function(monster, target)
        if character.IsPlayer(target) then
            local distance = monster:distanceMetric(target)
            if distance > 6 then
                return -20
            else
                return math.pow(6 - distance, 2)
            end
        end
        return 0
    end,
    addAggroForAttack = function(monster, attacker)
        local monsterHP = character.GetHP(monster)
        local attackerHP = character.GetHP(attacker)

        return 500 - attackerHP + monsterHP
    end,
    aggroReduction = 5
}

function M.addCallbacks(t)
    t = aggroManager.addCallbacks(t)

    local function reactOnAggro(monster, enemy)
        local enemyAggro = aggroManager.getAggro(monster, enemy)
        local absAggro = math.abs(enemyAggro)
        if absAggro < 20 then
            -- low aggro on the target. Ignore the target.
            monster:move(Random.uniform(0, 7), true)
            return true
        elseif absAggro < 100 then
            -- critical aggro, observe the target.
            monster:turn(common.GetDirection(monster.pos, enemy.pos))
            character.ChangeMovepoints(monster, -10)
            return true
        else
            -- aggro is high. Act on it.
            if enemyAggro > 0 then
                -- positive aggro. Engage!
                return false
            else
                -- negative aggro. Lets run for the hills.
                local enemyDir = common.GetDirection(monster.pos, enemy.pos)
                local revDir = (enemyDir + 4) % 8
                local vX, vY = common.GetDirectionVector(revDir)

                local d = math.min(1, 8 - monster:distanceMetric(enemy))

                monster.waypoints:clear()
                monster.waypoints:addWaypoint(position(monster.pos.x + vX * d, monster.pos.y + vY * d, monster.pos.z))
                monster:setOnRoute(true)
                return false
            end
        end
    end

    local oldEnemyOnSight = t.enemyOnSight
    t.enemyOnSight = function(monster, enemy)
        if oldEnemyOnSight ~= nil and oldEnemyOnSight(monster, enemy) then
            return true
        end

        return reactOnAggro(monster, enemy)
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