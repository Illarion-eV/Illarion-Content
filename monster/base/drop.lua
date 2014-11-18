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

local function _isFunction(value)
    return type(value) == "function"
end

return function(params)
    local self = {}
    local groups = {}
    local defaultMonsterLevel

    if _isTable(params) then
        if _isNumber(params.monsterLevel) then
            defaultMonsterLevel = tonumber(params.monsterLevel)
        end
    end

    local function add(value)
        if not _isTable(value) then
            error("The value to be added to the drop definition is not set to a valid value.")
        end

        if _isFunction(value.dropGroup) then
            table.insert(self.groups, value)
        else
            error("The value added to the drop definition does not implement the expected function.")
        end
    end

    function self.dropItem(params)
        local self = {}
        if not _isTable(params) then
            error("Required parameters for drop items missing.")
        end

        local itemId
        if _isNumber(params.itemId) then
            itemId = tonumber(params.itemId)
        else
            error("Creating drop item failed. Parameter \"itemId\" is missing or contains a wrong type.")
        end

        local amountRange
        if params.amount == nil then
            amountRange = {1, 1}
        elseif _isNumber(params.amount) then
            local amountValue = tonumber(params.amount)
            amountRange = {amountValue, amountValue }
            if amountValue < 1 then
                error("The amount of a item was set to a value less than 0. That is just wrong.")
            end
        elseif _isTable(params.amount) then
            local fromValue = params.amount.from or params.amount[1]
            local toValue = params.amount.to or params.amount[2]
            if _isNumber(fromValue) and _isNumber(toValue) then
                amountRange = {tonumber(fromValue), tonumber(toValue) }
                if amountRange[1] > amountRange[2] then
                    error("Range for amount was set but the from value is greater than the to value.")
                elseif amountRange[1] < 1 then
                    error("The lower end of the amount range was set to a value less than 0. That is wrong.")
                end
            else
                error("The amount value was detected as table. How ever the from and to value for the range is missing.")
            end
        else
            error("The amount was set to something. How ever it was not possible to detect what the input means.")
        end

        local probability
        if _isNumber(params.probability) then
            probability = tonumber(params.probability)
            if probability <= 0 or probability > 1 then
                error("Propability value was found but is out of range: " + probability)
            end
        else
            error("The required propability for the drop of a item was not set to a legal value.")
        end

        local defaultQualityRange
        local defaultDurabilityRange
        if params.monsterLevel == nil then
            if defaultMonsterLevel == nil then
                defaultQualityRange = {4, 6}
                defaultDurabilityRange = {44, 66 }
            else
                defaultQualityRange = {math.max(defaultMonsterLevel - 1, 1), defaultMonsterLevel}
                defaultDurabilityRange = {math.max((defaultMonsterLevel - 1) * 11, 1), defaultMonsterLevel * 11}
            end
        elseif _isNumber(params.monsterLevel) then
            local level = tonumber(params.monsterLevel)
            if level < 1 or level > 9 then
                error("The level of the monster for that drop was set to a valid that is out of range:" + level)
            end
            defaultQualityRange = {math.max(level - 1, 1), level}
            defaultDurabilityRange = {math.max((level - 1) * 11, 1), level * 11}
        end

        local qualityRange
        if params.quality == nil then
            qualityRange = defaultQualityRange
        elseif _isNumber(params.quality) then
            local qualityValue = tonumber(params.quality)
            qualityRange = {qualityValue, qualityValue}
            if qualityValue < 1 or qualityValue > 9 then
                error("The quality value is out of range: " + qualityValue)
            end
        elseif _isTable(params.quality) then
            local fromValue = params.quality.from or params.quality[1]
            local toValue = params.quality.to or params.quality[2]
            if _isNumber(fromValue) and _isNumber(toValue) then
                qualityRange = {tonumber(fromValue), tonumber(toValue) }
                if qualityRange[1] > qualityRange[2] then
                    error("Range for quality was set but the from value is greater than the to value.")
                elseif qualityRange[1] < 1 or qualityRange[2] > 9 then
                    error("The range of the quality value exceeds the valid range.")
                end
            else
                error("The quality value was detected as table. How ever the from and to value for the range is missing.")
            end
        else
            error("The quality was set to something. How ever it was not possible to detect what the input means.")
        end

        local durabilityRange
        if params.durability == nil then
            durabilityRange = defaultDurabilityRange
        elseif _isNumber(params.durability) then
            local durabilityValue = tonumber(params.durability)
            durabilityRange = {durabilityValue, durabilityValue }
            if durabilityValue < 1 or durabilityValue > 99 then
                error("The durability value is out of range: " + durabilityValue)
            end
        elseif _isTable(params.durability) then
            local fromValue = params.durability.from or params.durability[1]
            local toValue = params.durability.to or params.durability[2]
            if _isNumber(fromValue) and _isNumber(toValue) then
                durabilityRange = {tonumber(fromValue), tonumber(toValue) }
                if durabilityRange[1] > durabilityRange[2] then
                    error("Range for durability was set but the from value is greater than the to value.")
                elseif durabilityRange[1] < 1 or durabilityRange[2] > 99 then
                    error("The range of the durability value exceeds the valid range.")
                end
            else
                error("The durability value was detected as table. How ever the from and to value for the range is missing.")
            end
        else
            error("The durability was set to something. How ever it was not possible to detect what the input means.")
        end

        local data
        if params.data ~= nil then
            if _isTable(params.data) then
                data = {}
                for key, value in pairs(params.data) do
                    if key == nil or value == nil then
                        error("Data table contains illegal key or value.")
                    end
                    if _isTable(key) or _isTable(value) then
                        error("The data table contains a array as key or value. That is not valid.")
                    end
                    data[tostring(key)] = tostring(value)
                end
                if #data == 0 then
                    data = nil
                end
            end
        end

        function self.dropItem(pos, randomValue)
            if (randomValue <= probability) then
                local amount = math.random(amountRange[1], amountRange[2])
                local qual = math.random(qualityRange[1], qualityRange[2]) * 100 + math.random(durabilityRange[1], durabilityRange[2])
                world:createItemFromId(itemId, amount, pos, true, qual, data)
                return true, randomValue - probability
            end
            return false, randomValue - probability
        end

        return self
    end

    function self.dropGroup()
        local self = {}
        local items = {}

        function self.add(value)
            if not _isTable(value) then
                error("The value to be added to the list of drop items is not set to a valid value.")
            end

            if _isFunction(value.dropItem) then
                table.insert(self.items, value)
            else
                -- Automatic population of the probability. The first item in the list gets 20%, the second 10% and
                -- every following entry gets 10%
                if value.probability == nil then
                    local itemsCount = #items
                    if itemsCount == 0 then
                        value.probability = 0.2
                    elseif itemsCount == 1 then
                        value.probability = 0.1
                    else
                        value.probability = 0.01
                    end
                end
                table.insert(self.items, M.dropItem(value))
            end
        end

        function self.dropGroup(pos)
            local randomValue = math.random()
            for _, item in pairs(items) do
                local dropped, randomValue = item.dropItem(pos, randomValue)
                if dropped then return end
            end
        end

        add(self)
        return self
    end

    function self.addMoneyDrop(level)
        local monsterLevel
        if not _isNumber(level) then
            if defaultMonsterLevel == nil then
                error("The value for the monster level is not set to a number and the default value is not set too.")
            else
                monsterLevel = defaultMonsterLevel;
            end
        else
            monsterLevel = tonumber(level)
        end
        if monsterLevel < 1 or monsterLevel > 9 then
            error("The value for the monster level is out of range: " + level)
        end

        -- Monsters at or below level 1 do not get any money drop
        if monsterLevel > 1 then
            local group = M.dropGroup()
            if monsterLevel == 2 then
                group.add{itemId = 3076, probability = 1, amount = {from = 10, to = 30}}
            elseif monsterLevel == 3 then
                group.add{itemId = 3076, probability = 1, amount = {from = 20, to = 60}}
            elseif monsterLevel == 4 then
                group.add{itemId = 3076, probability = 1, amount = {from = 30, to = 90}}
            elseif monsterLevel == 5 then
                group.add{itemId = 3076, probability = 1, amount = {from = 60, to = 180}}
            elseif monsterLevel == 6 then
                group.add{itemId = 3076, probability = 1, amount = {from = 180, to = 540}}
            elseif monsterLevel == 7 then
                group.add{itemId = 3077, probability = 1, amount = {from = 10, to = 30}}
            elseif monsterLevel == 8 then
                group.add{itemId = 3077, probability = 1, amount = {from = 30, to = 90}}
            elseif monsterLevel == 9 then
                group.add{itemId = 3077, probability = 1, amount = {from = 90, to = 270}}
            end
            add(group)
        end
    end

    function self.drop(pos)
        for _, group in pairs(groups) do
            group.dropGroup(pos)
        end
    end

    return self;
end