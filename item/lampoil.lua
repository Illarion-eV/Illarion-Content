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
local lights = require("item.lights")

local M = {}

local oilLamp = 92

local standingOilLamp = 395

local function isLampInEitherHand(user)

    local leftTool = user:getItemAt(Character.left_tool)
    local rightTool = user:getItemAt(Character.right_tool)

    if leftTool.id == oilLamp then
        return leftTool
    elseif rightTool.id == oilLamp then
        return rightTool
    else
        return false
    end

end

local function isLampInFront(user)
    local frontPos = common.GetFrontPosition(user)
    local potentialLamp = world:getItemOnField(frontPos)

    if potentialLamp and (potentialLamp.id == oilLamp or potentialLamp.id == standingOilLamp) then
        return potentialLamp
    end

    return false

end


function M.UseItem(user, sourceItem)

    local lamp = isLampInEitherHand(user) or isLampInFront(user)

    if lamp then
        if sourceItem:getType() == scriptItem.container then
            user:inform("Das Lampenöl muss sich in deinen Händen oder im Gürtel befinden, wenn du es benutzen möchtest.", "To use the lamp oil, it must be in your belt or hands.", Character.lowPriority)
        else
            lights.UseItem(user, lamp)
        end
    else
        user:inform("Du musst vor einer Öllampe stehen oder eine in deinen Händen beziehungsweise Gürtel haben, um etwas mit dem Lampenöl anfangen zu können.", "You need an unlit oil lamp in your hands, belt or in front of you to use the lamp oil with.", Character.lowPriority)
    end
end

return M
