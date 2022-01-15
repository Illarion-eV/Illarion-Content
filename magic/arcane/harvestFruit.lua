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

local M = {}

-- Set a wear of 4 for trees that are harvested
-- When spell has JUS and Kah, and a gatherable tree is targeted, turn it into an ungathered tree with a wear of 4 while dropping the fruit around it
local fruitList = {
{fruit  = Item.apple , harvestable = 14, harvested = 11},
{fruit = Item.cherries, harvestable = 300, harvested = 299},
{fruit = Item.banana, harvestable = 3867, harvested = 3866},
{fruit = Item.orange, harvestable = 1195, harvested = 1193},
{fruit = Item.tangerine, harvestable = 3613, harvested = 3612},
{fruit = Item.berries, harvestable = 3743, harvested = 3742},
{fruit = Item.grapes, harvestable = 387, harvested = 386},
{fruit = Item.blackberry, harvestable = 3892, harvested = 3893}
}

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
    for _, item in pairs(targets.items) do
        local itemToHarvest = item
        if itemToHarvest:getData("nameEn") == "Holy Vine" then
            return
        end
        local isPlayerPlanted = itemToHarvest:getData("playerPlanted") ~= ""
        local amount = tonumber(itemToHarvest:getData("amount"))
            if not amount then
                amount = 10
                if isPlayerPlanted then
                    amount = 4
                end
                itemToHarvest:setData("amount",""..amount)
                world:changeItem(itemToHarvest)
            end
        local fruit
        local harvested
        for _, fruitType in pairs(fruitList) do
            if fruitType.harvestable == itemToHarvest.id then
                fruit = fruitType.fruit
                harvested = fruitType.harvested
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

        local resetAmount = 10
        if isPlayerPlanted then
            resetAmount = 4
        end
        itemToHarvest:setData("amount",""..resetAmount)
        world:changeItem(itemToHarvest)
        world:swap(itemToHarvest, harvested, 333)
    end
end

function M.checkIfHarvestFruit(user, targets, spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local Kah = runes.checkSpellForRuneByName("Kah", spell)
    if JUS and Kah then
        harvestFruit(user, targets)
    end
end


return M
