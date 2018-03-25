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

local common = require("base.common")
local scheduledFunction = require("scheduled.scheduledFunction")

local parchment = 2745

local M = {}

function M.checkParchments()
    for i = 1, 10 do
        local exists, value = ScriptVars:find("shipmasterParchment_" .. i)
        if exists and value ~= "wasFound" then
            -- Awkward and lazy method of getting information out of the string.
            local breakAt = string.find(value, "/")
            local germanDescription = string.sub(value, 1, breakAt-1)
            value = string.sub(value, breakAt+1)
            breakAt = string.find(value, "/")
            local englishDescription = string.sub(value, 1, breakAt-1)
            value = string.sub(value, breakAt+1)
            breakAt = string.find(value, "/")
            local xCoordinate = tonumber(string.sub(value, 1, breakAt-1))
            value = string.sub(value, breakAt+1)
            breakAt = string.find(value, "/")
            local yCoordinate = tonumber(string.sub(value, 1, breakAt-1))
            local zCoordinate = tonumber(string.sub(value, breakAt+1))

            local checkPosition = position(xCoordinate, yCoordinate, zCoordinate)
            local parchmentIsThere = false

            if world:isItemOnField(checkPosition) then
                local checkItem = world:getItemOnField(checkPosition)
                if checkItem.id == parchment then
                    if checkItem:getData("descriptionEn") == englishDescription and checkItem:getData("descriptionDe") == germanDescription then
                        parchmentIsThere = true
                    end
                else
                    local theField = world:getField(checkPosition)
                    if theField:countItems() > 1 then
                        local itemProperties = {itemId = parchment, deleteAmount = 1, quality = false, data = {{dataKey = "shipmasterParchment", dataValue = i}, {dataKey = "descriptionDe", dataValue = germanDescription}, {dataKey = "descriptionEn", dataValue = englishDescription}}}
                        common.DeleteItemFromStack(checkPosition, itemProperties)
                    end
                end
            end

            if not parchmentIsThere then
                local newParchment = world:createItemFromId(parchment, 1, checkPosition, true, 333, {descriptionDe = germanDescription, descriptionEn = englishDescription, shipmasterParchment = i})
                newParchment.wear = 254
                world:changeItem(newParchment)
            end
        end
    end
end

function M.removeAll(user)
    for i = 1, 10 do
        local exists = ScriptVars:find("shipmasterParchment_" .. i)
        if exists then
             ScriptVars:remove("shipmasterParchment_" .. i)
        end
    end
    user:inform("All variables removed. Scripts will rot now.")
end

function M.whatWasFound(user)
    for i = 1, 10 do
        local exists = ScriptVars:find("shipmasterParchment_" .. i)
        if exists then
             user:inform("This parchment was found. Number: " .. i)
        end
    end
end

function M.parchmentWasMoved(theItem)
    local shipmasterData = tonumber(theItem:getData("shipmasterParchment"))
    if shipmasterData then
        local exists = ScriptVars:find("shipmasterParchment_" .. shipmasterData)
        if exists then
            ScriptVars:remove("shipmasterParchment_" .. shipmasterData)
        end
    end
end

function M.setParchment(user, sourceItem)
    local frontItem = common.GetFrontItem(user)
    if frontItem and frontItem.id == parchment then
        local freeScriptVar
        for i = 1, 10 do
            if not ScriptVars:find("shipmasterParchment_" .. i) then
                freeScriptVar = "shipmasterParchment_" .. i
                break
            end
        end

        if not freeScriptVar then
            user:inform("No free script Var. You already set 10 parchments")
            return
        end

        local germanDescription = frontItem:getdata("descriptionDe")
        local englishDescription = frontItem:getdata("descriptionDe")

        if germanDescription == "" or englishDescription == "" then
            user:inform("German and english description must not be empty. Abort")
            return
        end

        frontItem:setData("shipmasterParchment", freeScriptVar)
        frontItem.wear = 254
        world:changeItem(frontItem)

        local positionAsString = frontItem.pos.x .. "/" .. frontItem.pos.y .. "/" .. frontItem.pos.z

        local scriptVarValue = germanDescription .. "/" .. englishDescription .. "/" .. positionAsString

        ScriptVars:set(freeScriptVar, scriptVarValue)
        ScriptVars:save()

        scheduledFunction.registerFunction(1000, function() M.checkParchments() end)

        user:inform("Successfully added parchment")
    end
end

return M
