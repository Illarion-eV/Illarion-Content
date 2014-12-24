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
local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

return function(params)
    local self = {}
    local monsterIds = {}
    local range = 5
    local minRange = 2
    local probability = 0.03
    local gfxId = 41
    local sfxId = 0
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

        if params.monsters ~= nil then
            if _isNumber(params.monsters) then
                monsterIds = {tonumber(params.hp)}
            elseif _isTable(params.monsters) then
                for _, id in pairs(params.monsters) do
                    if _isNumber(id) then
                        table.insert(monsterIds, tonumber(id))
                    else
                        error("Supplied monster ID is not a number.")
                    end
                end
            else
                error("The monster IDs for the spawn was set to something. No idea what.")
            end
        else
            error("The monsters that are supposed to be sommoned are not set.")
        end

        if params.range ~= nil then
            if _isNumber(params.range) then
                range = tonumber(params.range)
                if range <= 0 then
                    error("The range value for a warping spell was set to 0 or less.")
                end
            else
                error("The range value for the spell was set to something, but not to a number.")
            end
        end

        if params.minRange ~= nil then
            if _isNumber(params.minRange) then
                minRange = tonumber(params.minRange)
                if minRange <= 0 then
                    error("The minimal range value for a warping spell was set to 0 or less.")
                elseif minRange > range then
                    error("The minimal range value was set to a valid larger than the actual range.")
                end
            else
                error("The minimal range value for the spell was set to something, but not to a number.")
            end
        end

        if params.gfxId ~= nil then
            if _isNumber(params.gfxId) then
                gfxId = tonumber(params.gfxId)
            else
                error("The gfx id for the spell was set to something, but not to a number.")
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
        error("The summoning spell requires some parameters.")
    end

    function self.cast(monster, enemy)
        if Random.uniform() <= probability then
            local selectedMonsterIndex = math.random(1, #monsterIds)
            local selectedMonsterId = monsterIds[selectedMonsterIndex]

            local i = 0
            while i < 20 do
                local warpRange = (Random.uniform() * (range - minRange)) + minRange
                local direction = Random.uniform() * 2 * math.pi
                local x = math.floor(math.sin(direction) * warpRange + 0.5)
                local y = math.floor(math.cos(direction) * warpRange + 0.5)

                local spawnPos = position(monster.pos.x + x, monster.pos.y + y, monster.pos.z)

                if not world:isCharacterOnField(spawnPos) and world:getField(spawnPos) then
                    world:createMonster(selectedMonsterId, spawnPos, -usedMovepoints)
                    if gfxId > 0 then world:gfx(gfxId, monster.pos) end
                    if gfxId > 0 then world:gfx(gfxId, spawnPos) end
                    if sfxId > 0 then world:makeSound(sfxId, spawnPos) end
                    monster.movepoints = monster.movepoints - usedMovepoints
                    return true
                else
                    i = i + 1
                end
            end

            return false
        end
        return false
    end

    return self
end