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

local propertyList = require("housing.propertyList")
local common = require("base.common")


local M = {}

--due to too many C levels issues, I had to put some utility here for housing

function M.checkOwner(item)

    local tenant = item:getData("tenantID")

    if tenant ~= "" then
        return tonumber(tenant)
    else
        return "Unowned"
    end

end

function M.getPropertyDeed(propertyName)
    for i = 1, #propertyList.propertyTable do
        if propertyName == propertyList.propertyTable[i][1] then
            local field = world:getField(propertyList.propertyTable[i][3])
            local itemsOnField = field:countItems()
            for i2 = 0, itemsOnField do
                local currentItem = field:getStackItem(itemsOnField-i2)
                if currentItem.id == 3772 or currentItem.id == 3773 then
                    return currentItem
                end
            end
        end
    end
end

function M.fetchPropertyName(user, pos)

    local direct

    if user then
        direct = user:getFaceTo()
    end

    local d = 1

    local vX, vY

    if user then
        vX, vY = common.GetDirectionVector(direct)
    end

    local x
    local y
    local z

    if pos == nil then
        x = user.pos.x + vX * d
        y = user.pos.y + vY * d
        z = user.pos.z
    else
        x = pos.x
        y = pos.y
        z = pos.z
    end
    for _, property in ipairs(propertyList.properties) do
        if x >= property.lower.x
        and x <= property.upper.x
        and y >= property.lower.y
        and y <= property.upper.y
        and z >= property.lower.z
        and z <= property.upper.z then
            return property.name
        end
    end
    return nil
end

return M
