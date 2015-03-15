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

-- This script controls the entire aggro management for monsters.

local M = {}

local function _isTable(value)
    return type(value) == "table"
end

local function _isFunction(value)
    return type(value) == "function"
end

local function _isNumber(value)
    return type(value) == "number"
end

local function decreaseAggro(aggroTable, aggroReduction, delta)
    for charId, aggro in pairs(aggroTable) do
        local newAggro = 0
        if aggro < 0 then
            newAggro = math.min(0, aggro + aggroReduction * delta)
        elseif aggro > 0 then
            newAggro = math.max(0, aggro - aggroReduction * delta)
        end
        if newAggro == 0 then
            aggroTable[charId] = nil;
        else
            aggroTable[charId] = newAggro;
        end
    end
end

function M.buildAggroManager(params)
    if not _isTable(params) then
        error("Parameters are required and expected to be a table.")
    end

    local addAggroForTarget = params.addAggroForTarget
    if not _isFunction(addAggroForTarget) then
        error("The addAggroForTarget function is required for the aggro manager to work properly")
    end

    local addAggroForAttack = params.addAggroForAttack
    if not _isFunction(addAggroForAttack) then
        error("The addAggroForAttack function is required for the aggro manager to work properly")
    end

    if not _isNumber(params.aggroReduction) then
        error("The aggro reduction value is set set.")
    end
    local aggroReduction = tonumber(params.aggroReduction)

    local maxAggro = 100
    if _isNumber(params.maxAggro) then
        maxAggro = tonumber(params.maxAggro)
    end

    local minAggro = 100
    if _isNumber(params.minAggro) then
        minAggro = tonumber(params.minAggro)
    end

    local lastAggroUpdate = -1
    local aggroTable = {}
    local manager = {}

    function manager.getAggro(monster, target)
        if aggroTable[monster.id] ~= nil then
            if aggroTable[monster.id][target.id] ~= nil then
                return aggroTable[monster.id][target.id]
            end
        end
        return 0
    end

    function manager.addAggro(monster, target, value)
        if aggroTable[monster.id] == nil then
            aggroTable[monster.id] = {}
        end

        local currentAggro = aggroTable[monster.id][target.id]
        if currentAggro == nil then
            currentAggro = 0
        end

        local candidateAggro = math.min(maxAggro, math.max(minAggro, currentAggro + value))

        if candidateAggro == 0 then
            aggroTable[monster.id][target.id] = nil
        else
            aggroTable[monster.id][target.id] = candidateAggro
        end

        target:inform("Your aggro from " .. monster.name .. " is now: " .. candidateAggro)

        return candidateAggro
    end

    function manager.addCallbacks(t)
        local orgSetTarget = t.setTarget
        t.setTarget = function(monster, candidateList)
            local result = 0
            if orgSetTarget ~= nil then
                result = orgSetTarget(monster, candidateList)
            end

            local currentUnixTime = world:getTime("unix")

            if aggroTable[monster.id] == nil then
                aggroTable[monster.id] = {}
            else
                local dt = 1
                if lastAggroUpdate > -1 then
                    dt = currentUnixTime - lastAggroUpdate
                end
                decreaseAggro(aggroTable[monster.id], aggroReduction, dt)
            end

            lastAggroUpdate = currentUnixTime

            local indexAndAggro = {}
            local highestAbsoluteAggro = 0
            local highestAggroIndex = 0
            for index, targetCandidate in pairs(candidateList) do
                local candidateAddAggro = addAggroForTarget(monster, targetCandidate)
                local candidateAggro = manager.addAggro(monster, targetCandidate, candidateAddAggro)

                indexAndAggro[index] = candidateAggro

                local absAggro = math.abs(candidateAggro)
                if absAggro > highestAbsoluteAggro then
                    highestAbsoluteAggro = absAggro;
                    highestAggroIndex = index;
                end
            end

            if highestAggroIndex ~= 0 then
                return highestAggroIndex
            else
                return result
            end
        end

        local orgOnAttacked = t.onAttacked
        t.onAttacked = function(monster, attacker)
            if orgOnAttacked ~= nil then
                orgOnAttacked(monster, attacker)
            end

            local candidateAddAggro = addAggroForAttack(monster, attacker)
            manager.addAggro(monster, attacker, candidateAddAggro)
        end

        local orgOnCasted = t.onCasted
        t.onCasted = function(monster, attacker)
            if orgOnCasted ~= nil then
                orgOnCasted(monster, attacker)
            end

            local candidateAddAggro = addAggroForAttack(monster, attacker)
            manager.addAggro(monster, attacker, candidateAddAggro)
        end

        local orgOnDeath = t.onDeath
        t.onDeath = function(monster)
            if orgOnDeath ~= nil then
                orgOnDeath(monster)
            end

            -- Cleanup
            aggroTable[monster.id] = nil;
        end

        return t
    end

    return manager
end

return M