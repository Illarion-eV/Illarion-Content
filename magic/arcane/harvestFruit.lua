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

local runes = require("magic.arcane.runes")
local fruitgathering = require("craft.gathering.fruitgathering")

local M = {}

-- Set a wear of 4 for trees that are harvested
-- When spell has JUS and KAH, and a gatherable tree is targeted, turn it into an ungathered tree with a wear of 4 while dropping the fruit around it
local fruitList = {}

for _, harvestItem in pairs(fruitgathering.HarvestItems) do
    table.insert(fruitList, {fruit = harvestItem.productId, harvestable = harvestItem.origin, harvested = harvestItem.nextItemId, amount = harvestItem.amount})
end

function M.increaseArea(targetPosition)
    local positionTable = {}
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y+1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x,targetPosition.y-1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y-1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y+1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x+1,targetPosition.y+1,targetPosition.z)})
    table.insert(positionTable, {position = position(targetPosition.x-1,targetPosition.y-1,targetPosition.z)})
    return positionTable
end

local function harvestFruit(user, targets)

    local resetAmount = 0

    for _, item in pairs(targets.items) do
        local itemToHarvest = item
        if itemToHarvest:getData("nameEn") == "Holy Vine" then
            return
        end
        local isPlayerPlanted = itemToHarvest:getData("playerPlanted") ~= ""
        local amount = tonumber(itemToHarvest:getData("amount"))
        local fruit
        local harvested
        for _, fruitType in pairs(fruitList) do
            if fruitType.harvestable == itemToHarvest.id then
                resetAmount = fruitType.amount
                fruit = fruitType.fruit
                harvested = fruitType.harvested
                if not amount then
                    amount = fruitType.amount
                    if isPlayerPlanted then
                        amount = math.max(1, math.floor(amount/2.5))
                    end
                    itemToHarvest:setData("amount",""..amount)
                    world:changeItem(itemToHarvest)
                end
            end
        end
        if not fruit then
            return
        end
        local dropPositions = M.increaseArea(item.pos)

        for i = 1, amount do
            for _, dropPos in pairs(dropPositions) do
                local dropPosition = dropPos.position
                if dropPosition ~= item.pos and amount > 0 then
                    local field = world:getField(dropPosition)
                    if field and field:isPassable() then
                        world:createItemFromId(fruit, 1, dropPosition, true, 333, {})
                        amount = amount-1
                    end
                end
            end
        end


        if isPlayerPlanted then
            resetAmount = math.max(1, math.floor(resetAmount/2.5))
        end
        itemToHarvest:setData("amount",""..resetAmount)
        world:changeItem(itemToHarvest)
        world:swap(itemToHarvest, harvested, 333)
    end
end

function M.checkIfHarvestFruit(user, targets, spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local KAH = runes.checkSpellForRuneByName("KAH", spell)
    if JUS and KAH then
        harvestFruit(user, targets)
    end
end


return M
