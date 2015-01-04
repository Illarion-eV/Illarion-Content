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
    local healAtOnce = 1
    local healRange = {1000, 2000}
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

        if params.hp ~= nil then
            if _isNumber(params.hp) then
                local hp = tonumber(params.hp)
                healRange = {hp, hp }
            elseif _isTable(params.hp) then
                local fromValue = params.hp.from or params.hp[1]
                local toValue = params.hp.to or params.hp[2]
                if _isNumber(fromValue) and _isNumber(toValue) then
                    healRange = {tonumber(fromValue), tonumber(toValue) }
                    if healRange[1] > healRange[2] then
                        error("Range for healed hitpoint was set but the from value is greater than the to value.")
                    end
                else
                    error("The healed hitpoints value was detected as table. How ever the from and to value for the " +
                          "range is missing.")
                end
            else
                error("The healed hitpoints was set to something. How ever it was not possible to detect what the input means.")
            end
        end

        if params.targetCount ~= nil then
            if _isNumber(params.targetCount) then
                healAtOnce = tonumber(params.targetCount)
                if healAtOnce < 1 then
                    error("The amount of targets for the healing spell was set to less then 1")
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
    end

    function self.cast(monster, enemy)
        if Random.uniform() <= probability then
            -- Look for my friends
            local otherMonsters = world:getMonstersInRangeOf(monster.pos, 8)
            if #otherMonsters == 0 then return false end

            -- Scan Monsters and select wounded
            local woundedMonsters = {}
            for _, checkMonster in pairs(otherMonsters) do
                if (checkMonster:increaseAttrib("hitpoints", 0) < 10000) then
                    table.insert(woundedMonsters, checkMonster)
                end
            end

            local performedSpell = false
            for _ = 1, healAtOnce do
                if #woundedMonsters == 0 then return performedSpell end

                -- Select monster to help
                local selectedMonsterIndex = Random.uniform(1, #woundedMonsters)
                local selectedMonster = woundedMonsters[selectedMonsterIndex]
                table.remove(woundedMonsters, selectedMonsterIndex)
                selectedMonster:increaseAttrib("hitpoints", Random.uniform(healRange[1], healRange[2]))

                if gfxId > 0 then world:gfx(gfxId, selectedMonster.pos) end
                if sfxId > 0 then world:makeSound(sfxId, selectedMonster.pos) end
                monster.movepoints = monster.movepoints - usedMovepoints;
                performedSpell = true
            end

            return performedSpell
        end
        return false
    end

    return self
end